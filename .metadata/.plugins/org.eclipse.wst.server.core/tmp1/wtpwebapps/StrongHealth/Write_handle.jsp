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
	
	String category = request.getParameter("category"); 
	int cat = -1;
	
	if(category.equals("notice")) {
		article.setArticle_number(ac.getNextArticleNumber(Access_DB.NOTICE));
		cat = Access_DB.NOTICE;
	}
	else if(category.equals("qna")) {
		article.setArticle_number(ac.getNextArticleNumber(Access_DB.QNA));
		article.setQna_category(request.getParameter("qna_category"));
		cat =Access_DB.QNA;
	}
	else if(category.equals("music")) {
		article.setArticle_number(ac.getNextArticleNumber(Access_DB.MUSIC));
		article.setLink(request.getParameter("link"));
		cat = Access_DB.MUSIC;
	}
	else {
		out.println("<script>");
		out.println("alert('오류 발생')");
		out.println("location.href='Notice.jsp'");
		out.println("</script>");
	}
	article.setCategory(category);
	article.setId((String)session.getAttribute("id"));
	article.setArticle_name(request.getParameter("article_name"));
	article.setText(request.getParameter("text"));	
	article.setDatetime(Access_DB.getCurrentDateTime());
	article.setViews(1);
	
	ac.articleWrite(cat, article);
	
	out.println("<script>");
	out.println("location.href='Container.jsp?selected_page=" + category + "'");
	out.println("</script>");
%>
</body>
</html>