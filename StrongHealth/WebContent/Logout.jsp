<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	session.invalidate();
	out.println("<script>");
	out.println("alert('로그아웃 되었습니다.')");
	out.println("location.href='Container.jsp'");
	out.println("</script>");
%>
</body>
</html>