
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
		session.invalidate(); //현재 이 페이지의 접속한 회원의 세션을 빼앗는다.
	%>
	<script>
		location.href = 'main.jsp';
	</script>
</body>
</html>