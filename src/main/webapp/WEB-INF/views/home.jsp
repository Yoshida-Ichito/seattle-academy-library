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
<script type="text/javascript">
//ロードが完了したらイベント開始
window.addEventListener('load', (event) => {
// モーダルやボタンの定義
const modal = document.getElementById('modal');
const okButton = document.getElementById('ok');
const cancelButton = document.getElementById('cancel');
const links = document.getElementById('tensai'); 

 console.log(links);
let targetHref;

// モーダル表示の関数定義
function showModal(event) {
  // イベントに対するデフォルトの動作を止める
  event.preventDefault();
  targetHref = event.currentTarget.href;
  // モーダルをblockに変えて表示
  modal.style.display = 'block';
  }

// モーダル非表示の関数定義
function hideModal() {
  modal.style.display = 'none';
  }

// OKボタンがクリックされたら
okButton.addEventListener('click', () => {
  window.location.href = targetHref;
});

// キャンセルボタンがクリックされたら
cancelButton.addEventListener('click', hideModal);
  modal.addEventListener('click', (event) => {
    if (event.target === modal) {
    hideModal();
    }
  });

  links.addEventListener('click', showModal);
  /* links.forEach(link => {
    link.addEventListener('click', showModal);
}); */
});
const toggler = document.querySelector(".toggle");

window.addEventListener("click", event => {
  if(event.target.className == "toggle" || event.target.className == "toggle") {
    document.body.classList.toggle("show-nav");
    document.getElementById("deleteconpo").classList.toggle("deleteclass")
  } else if (event.target.className == "overlay") {
    document.body.classList.remove("show-nav");
document.getElementById("deleteconpo").classList.toggle("deleteclass")
  }

});


//ドロワーのメニューをクリックしたら非表示
const hrefLink = document.querySelectorAll('.linkList li a');
console.log(hrefLink);
for (i = 0; i < hrefLink.length; i++) {
hrefLink[i].addEventListener("click", () => {
document.body.classList.remove("show-nav");
document.getElementById("deleteconpo").classList.toggle("deleteclass")
});
}
</script>
    <header>
        <div class="left">
            <img class="mark" src="resources/img/logo.png" />
            <div class="logo">Seattle Library</div>
        </div>
       <%--  <div class="right">
            <ul>
                li><a href="<%=request.getContextPath()%>/home" class="menu">Home</a></li>
                <li> <a id="tensai" href="#">ログアウト</a></li>
            </ul>
        </div> --%>
        
        <div id="modal" class="modal">
  <div class="modal-content">
    <p>このページを離れてもよろしいですか？</p>
    <div class="modal--btn__block">
      <a id="cancel">いいえ</a>
      <a href="<%=request.getContextPath()%>/" id="ok">はい</a>
    </div>
  </div>
</div>
    </header>
    
    <script type="text/javascript">
	/*  function radio_func(check, id) {
	 var status = new XMLHttpRequest();
	 status.open('PUT', "http://localhost:8080/SeattleLibrary/readStatuses?value="+check+"&bookId="+id+"");
	 status.send();
	 } */
	 

	 function radio_func(check,id) {
	     var status = new XMLHttpRequest();
	       status.open('POST',"http://localhost:8080/SeattleLibrary/readStatuses?value="+check+"&bookId="+id+"");
	        status.send();
	}

	 function shelf(){
		    console.log("10");
		    const arr = [];
		    let aaa=0;
		    const chk1 = document.getElementsByName("bookShelf");
		       console.log(chk1);
		    for (let i = 0; i < chk1.length; i++) {
		      if (chk1[i].checked) {
		       console.log(chk1[i].value+" "+i);
		           arr.push(chk1[i].value); 
		      }
		    }
		  
		         var status = new XMLHttpRequest();
		      
		             status.open('POST',"http://localhost:8080/SeattleLibrary/addShelf?bookId="+arr+"");
		             status.send();  
		    
		}

	/* // ロードが完了したらイベント開始
	 window.addEventListener('load', (event) => {
	 // モーダルやボタンの定義
	 const modal = document.getElementById('modal');
	 const okButton = document.getElementById('ok');
	 const cancelButton = document.getElementById('cancel');
	 const links = document.querySelectorAll('a');
	 let targetHref;

	 // モーダル表示の関数定義
	 function showModal(event) {
	   // イベントに対するデフォルトの動作を止める
	   event.preventDefault();
	   targetHref = event.currentTarget.href;
	   // モーダルをblockに変えて表示
	   modal.style.display = 'block';
	   }

	 // モーダル非表示の関数定義
	 function hideModal() {
	   modal.style.display = 'none';
	   }

	 // OKボタンがクリックされたら
	 okButton.addEventListener('click', () => {
	   window.location.href = targetHref;
	 });

	 // キャンセルボタンがクリックされたら
	 cancelButton.addEventListener('click', hideModal);
	   modal.addEventListener('click', (event) => {
	     if (event.target === modal) {
	     hideModal();
	     }
	   });

	   links.forEach(link => {
	     link.addEventListener('click', showModal);
	 });
	 }); */
		
 </script>
    <main>
        <h1>Home</h1>
        <a href="fortune">今日の運勢を占う</a>
        <form action="<%=request.getContextPath()%>/searched" method="get">
            <div class="flecs">
                <div class="search1">
                    <input id="sbox1" id="s" name="bookTitle" type="text" placeholder="タイトル名入力" />
                     <button id="sbtn1" type="submit"><i class="fas fa-search"></i></button>
                </div>
            </div>
        </form>
        <%-- <a href="<%=request.getContextPath()%>/addBook" class="btn_add_book">書籍の追加</a> 
         <a href="<%=request.getContextPath()%>/addFavBook" class="btn_add_book">お気に入りのみ</a> 
         <a href="<%=request.getContextPath()%>/loginBookShelf" class="btn_add_book">本棚</a> --%>
         <input type="button" form="form1" class="btn_add_book" value="本棚に追加" onclick="shelf()">
        <div class="content_body">
            <c:if test="${!empty resultMessage}">
                <div class="error_msg">${resultMessage}</div>
            </c:if>
            <div>
                <div class="booklist">
                    <c:forEach var="bookInfo" items="${BookList}">
                        <div class="books">
                         <div>
                         <form method="post" name="form1" id="form1" class="shelfCheck" action="addShelf">
                          <input type="checkbox" name="bookShelf" value="${bookInfo.bookId}"
                               id="shelfBtn">📚
                         </form>
                         </div>
                            <form method="get" class="book_thumnail" action="editBook">
                                <a href="javascript:void(0)" onclick="this.parentNode.submit();"> <c:if test="${empty bookInfo.thumbnail}">
                                        <c:if test="${bookInfo.readStatus.equals('1')}">
                                        <img class="book_noimgg" src="resources/img/noImg.png">
                                    </c:if>
                                    <c:if test="${bookInfo.readStatus.equals('2')}">
                                        <img class="book_noimg" src="resources/img/noImg.png">
                                    </c:if>
                                    <c:if test="${bookInfo.readStatus.equals('3')}">
                                        <img class="book_noimg" src="resources/img/noImg.png">
                                    </c:if>
                                    <c:if test="${bookInfo.readStatus == NULL}">
                                        <img class="book_noimg" src="resources/img/noImg.png">
                                    </c:if>
                                    </c:if> <c:if test="${!empty bookInfo.thumbnail}">
                                    <c:if test="${bookInfo.readStatus.equals('1')}">
                                        <img class="book_noimgg" src="${bookInfo.thumbnail}">
                                    </c:if>
                                    <c:if test="${bookInfo.readStatus.equals('2')}">
                                        <img class="book_noimg" src="${bookInfo.thumbnail}">
                                    </c:if>
                                    <c:if test="${bookInfo.readStatus.equals('3')}">
                                        <img class="book_noimg" src="${bookInfo.thumbnail}">
                                    </c:if>
                                    <c:if test="${bookInfo.readStatus == NULL}">
                                        <img class="book_noimg" src="${bookInfo.thumbnail}">
                                    </c:if>
                                    </c:if>
                                </a> <input type="hidden" name="bookId" value="${bookInfo.bookId}">
                            </form>
                            <ul>
                                <li class="book_title">${bookInfo.title}</li>
                                <li class="book_author">${bookInfo.author}(著)</li>
                                <li class="book_publisher">出版社：${bookInfo.publisher}</li>
                                <li class="book_publish_date">出版日：${bookInfo.publishDate}</li>
                                <li class="book_publish_date">ジャンル：${bookInfo.genre}</li>
                            </ul>
                            <div class="likeBtn">
                            <c:if test="${!(bookInfo.favorite.equals('like'))}">
                                <form method="GET" action="favorited" name="favorite">
                                    <p align="justify">                     
                                        <button class="btn btn-primary addtofavorite">🤍</button>
                                        <input type="hidden" name="bookId" value="${bookInfo.bookId}">
                                    </p>
                                </form>
                                </c:if><c:if test="${bookInfo.favorite.equals('like')}">
                                    <form method="GET" action="unliked" name="nonFavorite">
                                        <p align="justify">
                                             <button type="submit" class="btn btn-primary addtofavorite">❤️</button>
                                            <input type="hidden" name="bookId" value="${bookInfo.bookId}">
                                        </p>
                                    </form>
                                   </c:if>
                                   <c:if test="${bookInfo.readStatus.equals('1')}">
                                    <p>
                                        <input type="radio" name="site${bookInfo.bookId}" value="1" onchange="radio_func(this.value,${bookInfo.bookId})" checked>無 <input type="radio" name="site${bookInfo.bookId}" value="2" onchange="radio_func(this.value,${bookInfo.bookId})">貸出中 <input type="radio" name="site${bookInfo.bookId}" value="3" onchange="radio_func(this.value,${bookInfo.bookId})">有
                                    </p>
                                </c:if>
                                <c:if test="${bookInfo.readStatus.equals('2')}">
                                    <p>
                                        <input type="radio" name="site${bookInfo.bookId}" value="1" onchange="radio_func(this.value,${bookInfo.bookId})" >無 <input type="radio" name="site${bookInfo.bookId}" value="2" onchange="radio_func(this.value,${bookInfo.bookId})" checked>貸出中 <input type="radio" name="site${bookInfo.bookId}" value="3" onchange="radio_func(this.value,${bookInfo.bookId})">有
                                    </p>
                                </c:if>
                                <c:if test="${bookInfo.readStatus.equals('3')}">
                                    <p>
                                        <input type="radio" name="site${bookInfo.bookId}" value="1" onchange="radio_func(this.value,${bookInfo.bookId})" checked>無 <input type="radio" name="site${bookInfo.bookId}" value="2" onchange="radio_func(this.value,${bookInfo.bookId})">貸出中 <input type="radio" name="site${bookInfo.bookId}" value="3" onchange="radio_func(this.value,${bookInfo.bookId})"checked>有
                                    </p>
                                </c:if>
                                 <c:if test="${bookInfo.readStatus == NULL}">
                                    <p>
                                        <input type="radio" name="site${bookInfo.bookId}" value="1" onchange="radio_func(this.value,${bookInfo.bookId})" checked>無 <input type="radio" name="site${bookInfo.bookId}" value="2" onchange="radio_func(this.value,${bookInfo.bookId})">貸出中 <input type="radio" name="site${bookInfo.bookId}" value="3" onchange="radio_func(this.value,${bookInfo.bookId})"checked>有
                                    </p>
                                </c:if>
                               </div>
                          <input type="button" onclick="location.href='https://www.amazon.co.jp/s?k=${bookInfo.title}&ref=nb_sb_noss'" value="Amazonで見る">
                        </div>
                    </c:forEach>
                    <div class="overlay"></div>
  <nav class="nav">
    <div class="toggle">
      <span id="deleteconpo" class="toggler"></span>
    </div>
    <div class="logo">
      <a href="#">メニュー</a>
    </div>
    <ul class="linkList">
      <li><a  href="<%=request.getContextPath()%>/home" class="btn_add_book">Home</a></li>
      <li><a href="<%=request.getContextPath()%>/addBook" class="btn_add_book">書籍の追加</a></li>
      <li><a href="<%=request.getContextPath()%>/loginBookShelf" class="btn_add_book">秘密の本棚</a></li>
      <li> <a id="tensai" href="#" class="btn_add_book">ログアウト</a></li>
      <!-- <li><a href="#">Blog</a></li>
      <li><a href="#">Contact</a></li> -->
    </ul>
  </nav>
                    
                </div>
            </div>
    </main>
</body>
</html>