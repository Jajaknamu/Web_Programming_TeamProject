<!-- 로그인 후 액션 페이지 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page errorPage="web05_404error.jsp"  %>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" /> 
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
</head>
<body>
<!-- 아이디 세션 부여 -->
	<% 
	String userID = null;
	String userPassword = null;
	
	if(request.getParameter("userID") != null){
		userID = request.getParameter("userID");
	}
	if(request.getParameter("userPassword") != null){
		userPassword = request.getParameter("userPassword");
	}
	if(userID == null || userPassword == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(userID, userPassword);
	if(result == 1){
		session.setAttribute("userID", userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
		script.close();
		return;
	}else if(result == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}else if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}else if(result == -2){;
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류가 발생했습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	%>
</body>
</html>