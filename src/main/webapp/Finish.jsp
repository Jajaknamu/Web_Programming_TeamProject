<!-- 마감 페이지 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page errorPage="web05_404error.jsp"  %>
<!doctype html>
<html>
<head>

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<!-- 부트스트랩 css추가하기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<!-- 커스텀 css추가하기 -->
<link rel="stylesheet" href="./css/custom.css">


<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>Login</title>
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="styles.css" rel="stylesheet" />
    <style>
        /* div#wrap { background: red; } 사이트 전체를 감싸는 div */
        a{text-decoration:none; color : black} /* a 태그로 링크 설정 시 밑줄 없어짐 */
        
        /* 제목 / 로그인 / 글쓰기 부분*/
        header#header {display : flex; padding : 10px;}
        header .action
		{
			margin-right : 10px;
			margin-top : 5px;
			display:inline-block;
			vertical-align:top;
		}
        header .action .btn_post
		{
			border-radius: 5px;
			background-color: #fff;
		}

		header .action .btn_sign
		{
			border-radius: 5px;
			background-color : #fff;
			color : #222;
		}
		
		/* 홈 / 학교별 / 진행 / 마감 */
        nav#nav { background:black; }
        nav#nav ul { margin:0; padding:0; list-style:none; } /* 리스트 앞에 . 같은게 없음을 의미 */
        nav#nav ul li { padding:10px; display:inline-block; } /* row로 나열 */
        
        /* 양쪽 사이드바와 본문 */
        /*section#container { background:azure; }*/
        section#container::after { content:""; display:block; clear:both; }
        
        /* 본문 */ 
        div.content {width:65%; float:left; margin-left : 10px; }
        .article
		{
			padding : 10px;
			position : relative;
			border-bottom : 1px solid #f5f5f5;
			float : left;
			display : flex;
		}

		.article .topic
		{
			margin-right : 5px;
			display: block;
		    border: 1px solid #d4d4d4;
		    vertical-align: middle;
		    line-height: 18px;
		    box-sizing: border-box;
		    white-space: nowrap;
		}
        
        /* 오른쪽 사이드바 */
        aside#right {width:15%; float:right; }
        
        /* 왼쪽 사이드바 */
        aside#left {width : 15%; float : left;}
        
        /* 아래쪽 */
        footer#footer {clear:both;}
       
        div#warp, header#header, nav#nav,
        section#container, div.content, aside#aside,
        footer#footer { padding:10px; } /* 해당 태그의 id의 padding이 10px 적용 */
        
.login-container{
    margin-top: 5%;
    margin-bottom: 5%;
    text-align : center;
}
.login-form-1{
    padding: 5%;
    box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
}
.login-form-1 h3{
    text-align: center;
    color: #333;
}
.login-form-2{
    padding: 5%;
    background: #0062cc;
    box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
}
.login-form-2 h3{
    text-align: center;
    color: #fff;
}
.login-container form{
    padding: 10%;
}
.btnSubmit
{
    width: 50%;
    border-radius: 1rem;
    padding: 1.5%;
    border: none;
    cursor: pointer;
}
.login-form-1 .btnSubmit{
    font-weight: 600;
    color: #fff;
    background-color: #0062cc;
}
.login-form-2 .btnSubmit{
    font-weight: 600;
    color: #0062cc;
    background-color: #fff;
}
.login-form-2 .ForgetPwd{
    color: #fff;
    font-weight: 600;
    text-decoration: none;
}
.login-form-1 .ForgetPwd{
    color: #0062cc;
    font-weight: 600;
    text-decoration: none;
}
	</style>
</head>

<body>
<!-- 아이디 세션 부여 -->
 <%
	String userID = null;
	if (session.getAttribute("userID") != null)
		userID = (String) session.getAttribute("userID");
	%>
	
<!-- 상단바 로고와 메뉴들 -->
        <nav class="navbar navbar-expand-lg navbar-light">
	<div class="container px-4 px-lg-5">
	<a class="navbar-brand" href="main.jsp">OPEN</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
	</button>
	
		<div id="navbar" class="collapse navbar-collapse">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="Proceeding.jsp">진행중</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="Finish.jsp">마감</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="#">자유게시판</a></li>
                    </ul>                  
        <%
			if (userID == null) {
			%>                      
        <div class="">
        	<a class="btn btn-primary mx-1 mt-2" href="Login.jsp">로그인</a>
        	<a class="btn btn-outline-dark  mx-1 mt-2" href="Write.jsp">글쓰기</a>
        </div> 
            <%
			} else{
			%>
				<a class="btn btn-primary mx-1 mt-2" href="logoutAction.jsp">로그아웃</a>
				<a class="btn btn-outline-dark  mx-1 mt-2" href="Write.jsp">글쓰기</a>
			<%
			}
            %>    
		</div>
	</div>
</nav>

<!-- 카테고리 별 탭 만들기-->
      <ul align= "center" class="nav nav-tabs nav justify-content-center" id="myTab" role="tablist">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">전체</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">기숙사</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">학교생활</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="disabled-tab" data-bs-toggle="tab" data-bs-target="#disabled-tab-pane" type="button" role="tab" aria-controls="disabled-tab-pane" aria-selected="false">통학</button>
  </li>
</ul>

<div class="tab-content" id="myTabContent">

  <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
  	<br>
  	<br>
  	<div class="container">
		  <h1 class="text-center">전체</h1>
		  
  	</div>
  </div>
  
  <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
  <br>
  <br>
  	 <div class="container">
  	 	<h1 class="text-center">기숙사</h1>
  	 </div>
  </div>
  
  <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">
  <br>
  <br>
  	 <div class="container">
  	 	<h1 class="text-center">학교생활</h1>
  	 </div>
  </div>
  
  
  <div class="tab-pane fade" id="disabled-tab-pane" role="tabpanel" aria-labelledby="disabled-tab" tabindex="0">
  <br>
  <br>
  	 <div class="container">
  	 	<h1 class="text-center">통학</h1>
  	 </div>
  </div>
  
  </div>

<footer class="border-top">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="small text-center text-muted fst-italic" style = "margin-top : 50px;">Copyright &copy; 웹 프로그래밍 3조</div>
                    </div>
                </div>
            </div>
        </footer>
	
<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>

<!-- 부트스트랩 자바스크립트 추가하기 -->
<script src="./js/bootstrap.min.js"></script>
<!-- 제이쿼리 자바스크립트 추가하기 -->
<script src="./js/jquery.min.js"></script>
<!-- 파퍼 자바스크립트 추가하기 -->
<script src="./js/popper.js"></script>


</body>
</html>