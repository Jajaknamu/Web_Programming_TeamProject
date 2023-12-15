<!-- 글 쓰고 난 후 액션페이지 -->
<%@ page errorPage="web05_404error.jsp"  %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("EUC-KR");
%> 
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
<jsp:setProperty name="bbs" property="userSchool" />
<jsp:setProperty name="bbs" property="bbsKategorie" />

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
	} else {
		if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back");
			script.println("</script>");
		} else {
			BbsDAO bbsDAO = new BbsDAO();
			int result = bbsDAO.write(bbs.getBbsTitle(), userID , bbs.getBbsContent(),bbs.getUserSchool(),bbs.getBbsKategorie());
			if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글쓰기에 실패했습니다.')");
		script.println("history.back");
		script.println("</script>");
			} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'Proceeding.jsp'");
		script.println("</script>");
			}
		}
	}
	%>
</body>
</html>