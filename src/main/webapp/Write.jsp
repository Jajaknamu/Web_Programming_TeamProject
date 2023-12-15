<!-- 글 쓰는 페이지 -->
<%@ page errorPage="web05_404error.jsp"  %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html lang="en">
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
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="styles.css" rel="stylesheet" />


        <style>
        
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
	        /*section#container { background:azure; }*/
	        section#container::after { content:""; display:block; clear:both; }
	        
	        /* 본문 */ 
	        div.content {width:65%; float:left; margin-left : 36px; }
	        .article
			{
				padding : 10px;
				margin-right : 5px;
				position : relative;
				display : flex;
			}
	
			.article .topic
			{
				margin-right : 5px;
				display: block;
			    border: 1px solid #d4d4d4;
			    vertical-align: middle;
			    box-sizing: border-box;
			    white-space: nowrap;
			    color : #808080;
			    height: 19px;
  				width: 29px;
  				font-size : small;
  				margin-bottom : 13px;
			}
	
	        .text
			{
	            overflow: hidden;
	            text-overflow: ellipsis;
	            display : -webkit-box;
	            -webkit-line-clamp: 1;
	            -webkit-box-orient: vertical;
	            margin-bottom : 10px;
			}
			
	        
	        /* 오른쪽 사이드바 */
	        aside#right { width:15%; float:right; margin-right : 10px; margin-top : 15px;}
	        
	        
	        /* 왼쪽 사이드바 */
	        aside#left { width : 15%; float : left; margin-left : 15px;}
	        .sidebar{
				top: 0;
				left: 0;
				width: auto;
				padding: 20px 0;
				transition: all 0.5s ease;   
			}
			.ca-li { list-style:none; padding-left:0px;}
			.sidebar ul li a{
			    display: block;
			    padding: 13px 30px;
			    border-bottom: 1px solid #e9e9e9;
			    /*color: rgb(241, 237, 237);
			    font-size: 16px;*/
			    position: relative;
			    width : auto;
			}
			.sidebar ul li a .ca-icon{
			    color: #dee4ec;
			    width: 30px;
			    display: inline-block;
			}
			.sidebar ul li a:hover,
			.sidebar ul li a.active{
			    color: #e9e9e9;
			    background: #808080;
			    border-right: 1px solid #3f3f3f;
			}
			.sidebar ul li a:hover .icon,
			.sidebar ul li a.active .icon{
			    color: #e9e9e9;
			}
						
			.sidebar ul li a:hover:before,
			.sidebar ul li a.active:before{
			    display: block;
			}	
        </style>
        
        <meta charset="EUC-KR" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>청원 사이트</title>
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="styles.css" rel="stylesheet" />
    </head>
    
<body>
<!-- 아이디 세션 부여 -->
	<%
	String userID = null;
	if (session.getAttribute("userID") != null)
		userID = (String) session.getAttribute("userID");
	%>
	<!-- Navigation-->
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
	
	<div class="container">
		<div class="row">
			<form method="post" action="writeAction.jsp">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3"
								style="background-color: #eeeeee; text-align: center;">
								글쓰기</th>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
							<td><input type="text" class="form-control" placeholder="학교명" name="userSchool" maxlength="50"></td>
							<td><input type="text" class="form-control" placeholder="카테고리" name="bbsKategorie" maxlength="20"></td>
							
						</tr>
						<tr >
							<td colspan="3"><textarea class="form-control" placeholder="글 내용"
									name="bbsContent" maxlength="2048" style="height: 350px; "></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="완료">
			</form>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>