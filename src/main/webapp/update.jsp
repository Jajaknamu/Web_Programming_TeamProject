<!-- �Խñ� ���� ������ -->
<%@ page errorPage="web05_404error.jsp"  %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<!DOCTYPE html>
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
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('�α����� �ϼ���.')");
		script.println("location.href = 'Login.jsp'");
		script.println("</script>");
	}
	int bbsID = 0;
	if(request.getParameter("bbsID") != null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if (bbsID ==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('��ȿ���� ���� ���Դϴ�.')");
		script.println("location.href = 'Proceeding.jsp'");
		script.println("</script>");
	}
	Bbs bbs = new BbsDAO().getBbs(bbsID);
	if(!userID.equals(bbs.getUserID())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('������ �����ϴ�.')");
		script.println("location.href = 'Proceeding.jsp'");
		script.println("</script>");
	}
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
	<div class="container">
		<div class="row">
			<form method="post" action="updateAction.jsp?bbsID=<%=bbsID%>">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">�Խ���
								���� ���</th>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="�� ����" name="bbsTitle" maxlength="50" value="<%=bbs.getBbsTitle() %>" ></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="�� ����"
									name="bbsContent" maxlength="2048" style="height: 350px;"<%=bbs.getBbsContent() %>></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="�� ����">

			</form>
		</div>
	</div>


</body>
</html>