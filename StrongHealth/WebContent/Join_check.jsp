<%@page import="javabean.Access_DB"%>
<%@page import="javabean.Member"%>
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
	if(ac.idCheck(request.getParameter("id"))){
		out.println("<script>");
		out.println("alert('아이디가 중복됩니다. 다른아이디로 다시 시도해주세요.');");
		out.println("location.href='Container.jsp?selected_page=join';");
		out.println("</script>");
	}
	else {
		Member mb = new Member();
		mb.setId(request.getParameter("id"));
		mb.setPassword(request.getParameter("password"));
		mb.setName(request.getParameter("name"));
		mb.setSex(request.getParameter("sex"));
		mb.setBirth(request.getParameter("birth"));
		mb.setAuthority("member");
		mb.setAddress(request.getParameter("address"));
		mb.setPhone(request.getParameter("phone"));
		mb.setEmail(request.getParameter("email"));
		ac.join(mb);
		mb = ac.login(mb.getId(), mb.getPassword());
		
		session.setAttribute("id", mb.getId());
		session.setAttribute("password", mb.getPassword());
		session.setAttribute("name", mb.getName());
		session.setAttribute("sex", mb.getSex());
		session.setAttribute("birth", mb.getBirth());
		session.setAttribute("authority", mb.getAuthority());
		session.setAttribute("address", mb.getAddress());
		session.setAttribute("phone", mb.getPhone());
		session.setAttribute("email", mb.getEmail());
		out.println("<script>");
		out.println("alert('" + mb.getName() + "님 정상적으로 회원가입 되었습니다.');");
		out.println("location.href='Container.jsp'");
		out.println("</script>");
	}
	ac.closeDB();
%>

</body>
</html>