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
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		Member mb = ac.login(id, password);
			
		if(mb==null){
			out.println("<script>");
			out.println("alert('�α��ο� ���� �Ͽ����ϴ�. ���̵�� ��й�ȣ�� Ȯ�����ּ���.')");
			out.println("location.href='Container.jsp?selected_page=login'");
			out.println("</script>");
		}
		else{
			out.println("�α��� ����");
			session.setAttribute("id", mb.getId());
			session.setAttribute("password", mb.getPassword());
			session.setAttribute("name", mb.getName());
			session.setAttribute("sex", mb.getSex());
			session.setAttribute("birth", mb.getBirth());
			session.setAttribute("authority", mb.getAuthority());
			session.setAttribute("address", mb.getAddress());
			session.setAttribute("phone", mb.getPhone());
			session.setAttribute("email", mb.getEmail());
			response.sendRedirect("Container.jsp");
		}
		ac.closeDB();
	%>
</body>
</html>