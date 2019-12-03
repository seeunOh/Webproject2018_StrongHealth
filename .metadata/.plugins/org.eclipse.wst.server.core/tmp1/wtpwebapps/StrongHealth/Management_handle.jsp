<%@page import="javabean.Member"%>
<%@page import="javabean.Access_DB"%>
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
	request.setCharacterEncoding("EUC-KR");
	Access_DB ac = new Access_DB();
	Member mb = new Member();

	mb.setId(request.getParameter("id"));
	mb.setPassword(request.getParameter("password"));
	mb.setSex(request.getParameter("sex"));
	mb.setBirth(request.getParameter("birth"));
	mb.setAuthority(request.getParameter("authority"));
	mb.setAddress(request.getParameter("address"));
	mb.setPhone(request.getParameter("phone"));
	mb.setEmail(request.getParameter("email"));
	
	ac.memberUpdate(mb);
	
	out.println("<script>");
	out.println("alert('회원 정보가 수정되었습니다.')");
	out.println("location.href='Container.jsp?selected_page=management'");
	out.println("</script>");
%>
</body>
</html>