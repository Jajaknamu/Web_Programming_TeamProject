<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.*, bbs.BbsDAO, bbs.Bbs, user.User, user.UserDAO" %>
<%@ page errorPage="web05_404error.jsp"  %>
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
    <!-- 로그인한 아이디에 세션 확인 -->
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
			if (userID == null) { //로그인 안되어있으면 로그인 버튼 보임
			%>                     
        <div class="">
        	<a class="btn btn-primary mx-1 mt-2" href="Login.jsp">로그인</a>
        	<a class="btn btn-outline-dark  mx-1 mt-2" href="Write.jsp">글쓰기</a>
        </div> 
            <%
			} else{//로그인 되어 있으면 로그아웃 버튼 보임
			%>
				<a class="btn btn-primary mx-1 mt-2" href="logoutAction.jsp">로그아웃</a>
				<a class="btn btn-outline-dark  mx-1 mt-2" href="Write.jsp">글쓰기</a>
			<%
			}
            %>
		</div>
	</div>
</nav>
        <!-- Page Header-->
        <header class="masthead" style="background-image: url('assets/img/crowd.png')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h1>Univ.OPEN</h1>
                            <span class="subheading">다양한 학교가 참여하여 학교의 불만을 이야기하고 해결한다.</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Main Content-->
        <section id="container">
            <div class="content">
                <h1 style = "margin-bottom : 20px;">모든 청원 목록</h1>
                          <% UserDAO userDAO = new UserDAO();
                          BbsDAO bbsDAO = new BbsDAO();
                ArrayList<Bbs> list = bbsDAO.getList(1);
                ArrayList<User> school = userDAO.SchoolList();
              	%>
                    <article>
                        <div class = "article">
                        	<table>
                        	<%for(int i = 0; i < list.size(); i++) {%>
                        	
                        		<tr>
                        			<td><span class = "topic" style = "display:block;">
                                	청원
                            			</span>
                            		</td>
                        			<td><a style = "text-decoration: none;" class = "text" href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>">
                        			<%=list.get(i).getBbsTitle() %></a></td>
                        		</tr>
                        		<%} %>
                        	</table>
                            </div>
                            <a class="mybutton" href="main.jsp">더보기</a>
                    </article>          
            </div>
            
            <aside id="right">
		    <div style = "margin-right : 50px;">
		        <div class="fading-side-menu" data-spy="affix" data-offset-top="350">
		            <h5>참여 학교</h5><hr class="no-margin">
		            호서대학교<br>
		            선문대학교<br>
		            <%for(int i = 0; i < school.size(); i++){ System.out.println("출력");%>
		            
		            <table>
		            	<tr>
		            		<td>
		            			<a class = "text">
		                    		<span class="fa fa-angle-double-right text-primary"></span>
		                    		<%=school.get(i).getSchool()%>
		                    	</a>
		                    </td>
		            	</tr>
		            	<%} %>
		            </table>
		        </div>
		        <br>
		        </div>
            </aside>
        </section>
        <!-- Footer-->
        <footer class="border-top">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <ul class="list-inline text-center">
                            <li class="list-inline-item">
                                <a href="main.jsp">
                                    <span class="fa-stack fa-lg">
                                        <i class="fas fa-circle fa-stack-2x"></i>
                                        <i class="fab fa-twitter fa-stack-1x fa-inverse"></i>
                                    </span>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a href="main.jsp">
                                    <span class="fa-stack fa-lg">
                                        <i class="fas fa-circle fa-stack-2x"></i>
                                        <i class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
                                    </span>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a href="main.jsp">
                                    <span class="fa-stack fa-lg">
                                        <i class="fas fa-circle fa-stack-2x"></i>
                                        <i class="fab fa-github fa-stack-1x fa-inverse"></i>
                                    </span>
                                </a>
                            </li>
                        </ul>
                        <div class="small text-center text-muted fst-italic">Copyright &copy; 웹 프로그래밍 3조</div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        
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
