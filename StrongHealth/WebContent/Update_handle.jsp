<%@page import="javabean.Article"%>
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
	Article article = new Article();
	
	article.setArticle_number(request.getParameter("article_number"));
	article.setArticle_name(request.getParameter("article_name"));
	article.setText(request.getParameter("text"));
	article.setLink(request.getParameter("link"));
	article.setQna_category(request.getParameter("qna_category"));
	ac.updateArticle(article);
	
	out.println("<script>");
	out.println("alert('게시글의 내용이 수정 되었습니다.')");
	out.println("location.href='Container.jsp?selected_page=" + request.getParameter("category") + "'");
	out.println("</script>");
%>
</body>
</html>