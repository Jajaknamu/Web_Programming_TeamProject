<!-- 게시글 수정 후 액션 페이지 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
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
	
	Bbs bbs = new BbsDAO().getBbs(Integer.parseInt(request.getParameter("bbsID")));
	int bbsID = bbs.getBbsID();
	int bbsLikeCnt = bbs.getBbsLikeCnt();
	
	
	bbsLikeCnt++;
	
	BbsDAO bbsDAO = new BbsDAO();
	int result = bbsDAO.updateLikeCnt(bbsID,bbsLikeCnt);
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("location.href = 'view.jsp'");
	script.println("</script>");
			
	
	%>
</body>
</html>