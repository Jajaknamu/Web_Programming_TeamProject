<!-- �Խñ� ���� �� �׼� ������ -->

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
<!-- ���̵� ���� �ο� -->
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('�α����� �ϼ���.')");
		script.println("location.href = 'Login.jsp'");
		script.println("</script>");
	}
	
	UserDAO userDAO = new UserDAO();
	int level = userDAO.getUserLevel(userID);
	
	if (level == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('�����ڸ� ��밡���մϴ�.')");
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