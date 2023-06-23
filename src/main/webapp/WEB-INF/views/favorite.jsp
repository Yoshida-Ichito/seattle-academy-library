<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page contentType="text/html; charset=utf8"%>
<%@ page import="java.util.*"%>
<html>
<head>
<title>ホーム｜シアトルライブラリ｜シアトルコンサルティング株式会社</title>
<link href="<c:url value="/resources/css/reset.css" />" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+JP" rel="stylesheet">
<link href="<c:url value="/resources/css/default.css" />" rel="stylesheet" type="text/css">
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet" type="text/css">
</head>
<body class="wrapper">
    <header>
        <div class="left">
            <img class="mark" src="resources/img/logo.png" />
            <div class="logo">Seattle Library</div>
        </div>
        <div class="right">
            <ul>
                <li><a href="<%=request.getContextPath()%>/home" class="menu">Home</a></li>
                <li><a href="<%=request.getContextPath()%>/">ログアウト</a></li>
            </ul>
        </div>
    </header>
    <main>
        <h1>Home</h1>
        <form action="<%=request.getContextPath()%>/searched" method="get">
            <div class="flecs">
                <div class="search1">
                    <input id="sbox1" id="s" name="bookTitle" type="text" placeholder="タイトル名入力" />
                     <button id="sbtn1" type="submit"><i class="fas fa-search"></i></button>
                </div>
            </div>
        </form>
        <a href="<%=request.getContextPath()%>/addBook" class="btn_add_book">書籍の追加</a> 
         <a href="<%=request.getContextPath()%>/addFavBook" class="btn_add_book">お気に入りのみ</a> 
        <div class="content_body">
            <c:if test="${!empty resultMessage}">
                <div class="error_msg">${resultMessage}</div>
            </c:if>
            <div>
                <div class="booklist">
                    <c:forEach var="bookInfo" items="${BookList}">
                        <div class="books">
                            <form method="get" class="book_thumnail" action="editBook">
                                <a href="javascript:void(0)" onclick="this.parentNode.submit();"> <c:if test="${empty bookInfo.thumbnail}">
                                        <img class="book_noimg" src="resources/img/noImg.png">
                                    </c:if> <c:if test="${!empty bookInfo.thumbnail}">
                                        <img class="book_noimg" src="${bookInfo.thumbnail}">
                                    </c:if>
                                </a> <input type="hidden" name="bookId" value="${bookInfo.bookId}">
                            </form>
                            <ul>
                                <li class="book_title">${bookInfo.title}</li>
                                <li class="book_author">${bookInfo.author}(著)</li>
                                <li class="book_publisher">出版社：${bookInfo.publisher}</li>
                                <li class="book_publish_date">出版日：${bookInfo.publishDate}</li>
                            </ul>
                            <div class="likeBtn">
                            <c:if test="${!(bookInfo.favorite.equals('like'))}">
                                <form method="GET" action="favoriteded" name="favorite">
                                    <p align="justify">                     
                                        <button class="btn btn-primary addtofavorite">🤍</button>
                                        <input type="hidden" name="bookId" value="${bookInfo.bookId}">
                                    </p>
                                </form>
                                </c:if><c:if test="${bookInfo.favorite.equals('like')}">
                                    <form method="GET" action="unlikeded" name="nonFavorite">
                                        <p align="justify">
                                             <button type="submit" class="btn btn-primary addtofavorite">❤️</button>
                                            <input type="hidden" name="bookId" value="${bookInfo.bookId}">
                                        </p>
                                    </form>
                                   </c:if>
                                    <form name="form1">
      <input
        type="radio"
        name="color1"
        value="red"
        checked
        onclick="clickBtn1()"
      />
      未読
      <input type="radio" name="color1" value="blue" onclick="clickBtn1()" />
      既読中
      <input type="radio" name="color1" value="yellow" onclick="clickBtn1()" />
      既読
    </form>
    <!-- // <input type="button" value="ボタン" onclick="clickBtn1()" /> -->

    <script>
      function clickBtn1() {
        let str = "";
        const color1 = document.form1.color1;

        for (let i = 0; i < color1.length; i++) {
          if (color1[i].checked) {
            //(color1[i].checked === true)と同じ
            str = color1[i].value;
            break;
          }
        }
        
      }
    </script>
                            </div>
                            <%-- <form action="favorited" method="get">
                             <input type="hidden" name="bookId" value="${bookInfo.bookId}">
                              <button type="submit" id="fav-btn">❤️</button>
                             </form>
                              <form action="unliked" method="get">
                              <input type="hidden" name="bookId" value="${bookInfo.bookId}">
                              <button type="submit" id="unfav-btn">💔</button>
                            </form>< --%>
                          <input type="button" onclick="location.href='https://www.amazon.co.jp/s?k=${bookInfo.title}&ref=nb_sb_noss'" value="Amazonで見る">
                        </div>
                    </c:forEach>
                </div>
            </div>
    </main>
</body>
</html>