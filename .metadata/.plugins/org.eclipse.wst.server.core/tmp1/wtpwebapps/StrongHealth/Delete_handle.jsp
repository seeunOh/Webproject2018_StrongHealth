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

	if(session.getAttribute("id") == null){
		out.println("<script>");
		out.println("alert('���� �����Ҽ� �ִ� ������ �����ϴ�.')");
		out.println("location.href='Container.jsp?'");
		out.println("</script>");
	}
	else{
		if(request.getParameter("authority").equals("admin") && session.getAttribute("authority").equals("admin")){
			ac.commentsDelete(request.getParameter("article_number"));
			ac.articleDelete(request.getParameter("article_number"));
			out.println("<script>");
			out.println("alert('�Խñ��� ���� �Ǿ����ϴ�.')");
			out.println("location.href='Container.jsp?selected_page=" + request.getParameter("category") + "'");
			out.println("</script>");
		}
		else if(request.getParameter("authority").equals("member")){
			if(session.getAttribute("authority").equals("admin")){
				ac.commentsDelete(request.getParameter("article_number"));
				ac.articleDelete(request.getParameter("article_number"));	
				out.println("<script>");
				out.println("alert('�Խñ��� ���� �Ǿ����ϴ�.')");
				out.println("location.href='Container.jsp?selected_page=" + request.getParameter("category") + "'");
				out.println("</script>");
			}
			else if(session.getAttribute("id").equals(request.getParameter("id"))){
				ac.commentsDelete(request.getParameter("article_number"));
				ac.articleDelete(request.getParameter("article_number"));
				out.println("<script>");
				out.println("alert('�Խñ��� ���� �Ǿ����ϴ�.')");
				out.println("location.href='Container.jsp?selected_page=" + request.getParameter("category") + "'");
				out.println("</script>");
			}
			else {
				out.println("<script>");
				out.println("alert('���� �����Ҽ� �ִ� ������ �����ϴ�.')");
				if(request.getParameter("category").equals("notice"))
					out.println("location.href='Container.jsp?selected_page=notice_read&article_number=" + request.getParameter("article_number") + "'");
				else if(request.getParameter("category").equals("qna"))
					out.println("location.href='Container.jsp?selected_page=qna_read&article_number=" + request.getParameter("article_number") + "'");
				out.println("</script>");
			}
		}
		out.println("<script>");
		out.println("alert('���� �����Ҽ� �ִ� ������ �����ϴ�.')");
		out.println("location.href='Container.jsp?'");
		out.println("</script>");
	}
	
	
%>
</body>
</html>