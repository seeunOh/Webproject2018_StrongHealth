<%@page import="javabean.Comment"%>
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
	if(session.getAttribute("authority") == null){
		out.println("<script>");
		out.println("alert('로그인을 하신 후 글을 남길수 있습니다.')");
		out.println("location.href='Container.jsp?selected_page=qna_read&article_number=" + request.getParameter("article_number") +"'");
		out.println("</script>");
	}else{
		Access_DB ac = new Access_DB();
		Comment cm = new Comment();
		cm.setArticle_number(request.getParameter("article_number"));
		cm.setId(request.getParameter("id"));
		cm.setText(request.getParameter("text"));
		cm.setDatetime(Access_DB.getCurrentDateTime());
		cm.setComment_number(ac.getNextCommentNumber(cm.getArticle_number()));
		ac.commentWrite(cm);
		out.println("<script>");
		out.println("location.href='Container.jsp?selected_page=qna_read&article_number=" + request.getParameter("article_number") +"'");
		out.println("</script>");
	}
%>

</body>
</html>