<!-- ���� ������ -->
<%@ page errorPage="web05_404error.jsp"  %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
<!doctype html>
<html>
<head> 

<!-- ��Ʈ��Ʈ�� -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<!-- ��Ʈ��Ʈ�� css�߰��ϱ� -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<!-- Ŀ���� css�߰��ϱ� -->
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
        /* div#wrap { background: red; } ����Ʈ ��ü�� ���δ� div */
        a{text-decoration:none; color : black} /* a �±׷� ��ũ ���� �� ���� ������ */
        
        /* ���� / �α��� / �۾��� �κ�*/
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
		
		/* Ȩ / �б��� / ���� / ���� */
        nav#nav { background:black; }
        nav#nav ul { margin:0; padding:0; list-style:none; } /* ����Ʈ �տ� . ������ ������ �ǹ� */
        nav#nav ul li { padding:10px; display:inline-block; } /* row�� ���� */
        
        /* ���� ���̵�ٿ� ���� */
        /*section#container { background:azure; }*/
        section#container::after { content:""; display:block; clear:both; }
        
        /* ���� */ 
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
        
        /* ������ ���̵�� */
        aside#right {width:15%; float:right; }
        
        /* ���� ���̵�� */
        aside#left {width : 15%; float : left;}
        
        /* �Ʒ��� */
        footer#footer {clear:both;}
       
        div#warp, header#header, nav#nav,
        section#container, div.content, aside#aside,
        footer#footer { padding:10px; } /* �ش� �±��� id�� padding�� 10px ���� */
        
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
<!-- ���̵� ���� �ο� -->
<%
	String userID = null;
	if (session.getAttribute("userID") != null)
		userID = (String) session.getAttribute("userID");
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}  
	%>

<!-- ��ܹ� �ΰ�� �޴��� -->
        <nav class="navbar navbar-expand-lg navbar-light">
	<div class="container px-4 px-lg-5">
	<a class="navbar-brand" href="main.jsp">OPEN</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
	</button>
	
		<div id="navbar" class="collapse navbar-collapse">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="Proceeding.jsp">������</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="Finish.jsp">����</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="#">�����Խ���</a></li>
                    </ul>                  
        <%
			if (userID == null) {
			%>                      
        <div class="">
        	<a class="btn btn-primary mx-1 mt-2" href="Login.jsp">�α���</a>
        	<a class="btn btn-outline-dark  mx-1 mt-2" href="Write.jsp">�۾���</a>
        </div> 
            <%
			} else{
			%>
				<a class="btn btn-primary mx-1 mt-2" href="logoutAction.jsp">�α׾ƿ�</a>
				<a class="btn btn-outline-dark  mx-1 mt-2" href="Write.jsp">�۾���</a>
			<%
			}
            %>     
		</div>
	</div>
</nav>

<!-- ī�װ� �� �� �����-->
    <ul align= "center" class="nav nav-tabs nav justify-content-center" id="myTab" role="tablist">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="allMenu-tab" data-bs-toggle="tab" data-bs-target="#allMenu-tab-pane" type="button" role="tab" aria-controls="allMenu-tab-pane" aria-selected="true">��ü</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="Dormitory-tab" data-bs-toggle="tab" data-bs-target="#Dormitory-tab-pane" type="button" role="tab" aria-controls="Dormitory-tab-pane" aria-selected="false">�����</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="school_Life-tab" data-bs-toggle="tab" data-bs-target="#school_Life-tab-pane" type="button" role="tab" aria-controls="school_Life-tab-pane" aria-selected="false">�б���Ȱ</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="school_Bus-tab" data-bs-toggle="tab" data-bs-target="#school_Bus-tab-pane" type="button" role="tab" aria-controls="school_Bus-tab-pane" aria-selected="false">����</button>
  </li>
</ul>



<div class="tab-content" id="myTabContent">

  <div class="tab-pane fade show active" id="allMenu-tab-pane" role="tabpanel" aria-labelledby="allMenu-tab" tabindex="0">
  <div class="container">
  <br>
  <br>
 
<!-- ī�װ� : ��ü -->
	<h1 class="text-center">��ü</h1>
	
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				
				<tbody>
				<!-- �Խñۼ� �迭�� ��Ƽ� ���� -->
			<%
					BbsDAO bbsDAO = new BbsDAO();
					ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
					for (int i = 0; i < list.size(); i++) {
					%>	
								
	<div class="card bg-light mt-3">
		<div class="card-header bg-light">
			<div class="row">
			<div class="col-8 text-left"><%= list.get(i).getUserSchool()%>&nbsp;<small><%= list.get(i).getBbsKategorie()%></small></div>
			<div class="col-4 text-right">
					
				</div>		
			</div>
		</div>
		
		<div class="card-body">
			<h5 class="card-title">
			<a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>">
				<%= list.get(i).getBbsTitle() %>&nbsp;</a></h5>
				<%= list.get(i).getBbsContent()%>
			<div class="row">
			</div>
		</div>
	</div>
<%
	}
%>
				</tbody>
			</table>
			<!-- �Խñ� �������� ������ �ѱ�°� -->
			<%
			if (pageNumber != 1) {
			%>
			<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>"
				class="btn btn-success btn-arraw-left">����</a>
			<%
			}
			if (bbsDAO.nextPage(pageNumber + 1)) {
			%>
			<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>"
				class="btn btn-success btn-arraw-left">����</a>
			<%
			}
			%>

		</div>
	</div>

</div>  
</div>

<!-- ī�װ� : ����� -->
<div class="tab-pane fade" id="Dormitory-tab-pane" role="tabpanel" aria-labelledby="Dormitory-tab" tabindex="0"> 
  
  <div class="container">
      <div class="row">
        <div class="col-12">
        <br>
        <br>
        <!-- ī�װ� ���� -->
          <h1 class="text-center">�����</h1>
        </div>
      </div>
    </div>
</div>
<!-- ī�װ� : �б���Ȱ -->
  <div class="tab-pane fade" id="school_Life-tab-pane" role="tabpanel" aria-labelledby="school_Life-tab" tabindex="0"> 
  
  <div class="container">
      <div class="row">
        <div class="col-12">
        <br>
        <br>
        <!-- ī�װ� ���� -->
         <h1 class="text-center">�б���Ȱ</h1>
	
        </div>
      </div>
    </div>
</div>

<!-- ī�װ� : ���� -->
  <div class="tab-pane fade" id="school_Bus-tab-pane" role="tabpanel" aria-labelledby="school_Bus-tab" tabindex="0"> 
  
  <div class="container">
      <div class="row">
        <div class="col-12">
         	<br>
        	<br>
        	<!-- ī�װ� ���� -->
        	<h1 class="text-center">����</h1>

        </div>
      </div>
    </div> 
</div>

</div>


<footer class="border-top">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="small text-center text-muted fst-italic" style = "margin-top : 40px;">Copyright &copy; �� ���α׷��� 3��</div>
                    </div>
                </div>
            </div>
        </footer>

<!-- ��Ʈ��Ʈ�� -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>

<!-- ��Ʈ��Ʈ�� �ڹٽ�ũ��Ʈ �߰��ϱ� -->
<script src="./js/bootstrap.min.js"></script>
<!-- �������� �ڹٽ�ũ��Ʈ �߰��ϱ� -->
<script src="./js/jquery.min.js"></script>
<!-- ���� �ڹٽ�ũ��Ʈ �߰��ϱ� -->
<script src="./js/popper.js"></script>

</body>
</html>