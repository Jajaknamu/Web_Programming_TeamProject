<!-- 게시글 수정 후 액션 페이지 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>
<%@ page import="java.io.PrintWriter"%> 
<%
request.setCharacterEncoding("EUC-KR");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/heml; charset="EUC-KR">
<title></title>
</head>
<body>
<!-- 아이디 세션 부여 -->
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'Login.jsp'");
		script.println("</script>");
	}
	
	UserDAO userDAO = new UserDAO();
	int level = userDAO.getUserLevel(userID);
	
	if (level == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('관라자만 사용가능합니다.')");
		script.println("location.href = 'view.jsp'");
		script.println("</script>");
	}
	else{
		//Bbs bbs = new Bbs();
		//int bbsID = bbs.getBbsID();
		BbsDAO bbsDAO = new BbsDAO();
		int result = bbsDAO.writeComment(3, request.getParameter("comment"));
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'view.jsp'");
		script.println("</script>");
		
	}
	
	%>
</body>
</html>