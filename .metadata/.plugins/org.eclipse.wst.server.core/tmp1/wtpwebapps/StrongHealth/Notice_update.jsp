<%@page import="javabean.Article"%>
<%@page import="javabean.Access_DB"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
	function move(url){
		location.href=url;
	}
</script>

</head>
<body> 
<% 
	request.setCharacterEncoding("EUC-KR");
	Access_DB ac = new Access_DB();
	Article article = ac.getArticle(request.getParameter("article_number"));
	String url = "Container.jsp?selected_page=notice_read&article_number="+article.getArticle_number();

	if(session.getAttribute("authority") == null){
		out.println("<script>");
		out.println("alert('관리자만 공지사항을 수정할 수 있습니다.')");
		out.println("location.href='Container.jsp?selected_page=notice'");
		out.println("</script>");
	}
	else{
		if(!session.getAttribute("authority").toString().equals("admin")){
			out.println("<script>");
			out.println("alert('관리자만 공지사항을 수정할 수 있습니다.')");
			out.println("location.href='Container.jsp?selected_page=notice'");
			out.println("</script>");
		}
	}

%>
<h2>공지사항 수정</h2>
<form action="Update_handle.jsp" method="post">
<table class="table table-striped">
	<input type="hidden" name="category" id="category" value="notice"/>
	<input type="hidden" name="article_number" id="article_number" value="<%=article.getArticle_number()%>"/>
    <tr>
     <td>제목</td>
     <td><input type="text" class="form-control" name="article_name" id="article_name" placeholder="제목을 입력해주세요."></td>
    </tr>
    <tr>
     <td>글내용</td>
     <td><textarea rows="15" class="form-control" name="text" id="text" style="width:100%; height:100%" placeholder="내용을 입력해주세요."></textarea></td>
    </tr>
     <tr> 
     <td colspan="2"  class="text-center">
      <input type="submit" value="쓰기완료" class="btn btn-success">
      <input type="button" value="취소" class="btn btn-warning" onclick='move("<%=url %>");'>
     </td>
    </tr>
</table>
</form>
<script>
	document.getElementById('article_name').value = '<%=article.getArticle_name() %>';
	document.getElementById('text').value = '<%=article.getText() %>';
</script>
</body>
</html>