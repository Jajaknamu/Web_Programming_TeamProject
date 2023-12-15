<!-- 회원가입 후 액션 페이지 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO,user.User" %>
<%@ page import="java.io.PrintWriter" %> 
<%@ page errorPage="web05_404error.jsp"  %>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="school" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="EUC-KR">
<title></title>
</head>
<body>
<!-- 아이디 세션 부여 -->
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어 있습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("history.back()");
			script.println("</script>");
		}
	
		if (user.getUserID() == null || user.getUserPassword() == null || user.getSchool() == null 
			 ) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				session.setAttribute("userID", user.getUserID());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
		}

	%>
</body>
</html>