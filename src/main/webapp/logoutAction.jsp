
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page errorPage="web05_404error.jsp"  %>


<!DOCTYPE html>
<html>
<head> 
<meta http-equiv="Content-Type" content="text/heml; charset="EUC-KR">
<title></title>
</head>
<body>
	<%
		session.invalidate(); //���� �� �������� ������ ȸ���� ������ ���Ѵ´�.
	%>
	<script>
		location.href = 'main.jsp';
	</script>
</body>
</html>