<%@page import="javabean.Comment"%>
<%@page import="java.util.ArrayList"%>
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
		ArrayList<Comment> cs = ac.getComments(request.getParameter("article_number"));
		String delete_url = "'Delete_handle.jsp?article_number=" + article.getArticle_number()+ "&category=" + article.getCategory() + "&id=" + article.getId() + "&authority=" 
							+ ac.getidToAuthority(article.getId()) + "'";
		String update_url = "'Container.jsp?selected_page=qna_update&article_number="+request.getParameter("article_number") + "'";
	%>
	
	<h2> Q&A </h2>
<table class="table table">
	<tr>
     <td>제목</td>
     <td style="text-align: left;"><%=article.getArticle_name() %></td>
    </tr>
    <tr>
     <td>작성자</td>
     <td style="text-align: left;"><%=ac.getIdToName(article.getId()) %></td>
    </tr>
    <tr>
     <td>날짜</td>
     <td style="text-align: left;"><%=article.getDatetime().substring(0, 20) %></td>
    </tr>
    <tr>
     <td>조회수</td>
     <td style="text-align: left;"><%=article.getViews() %></td>
    </tr>
    <tr>
     <td>내용</td>
     <td style="text-align: left; height: 300px;"><%=article.getText() %></td>
    </tr>
     <tr>
     <td colspan="2">덧&nbsp;&nbsp;글</td>
    </tr>
    <tr>
    <%
    	out.println("<td colspan='2'>");
		for(int i=0; i<cs.size();i++){
			out.println(cs.get(i).getId() + " : " + cs.get(i).getText());
			out.println("<br>");
		}
    	out.println("</td>");
	%>
    </tr>
     <tr>
     <td colspan="2">
	<form action="Comment_handle.jsp" method="post">
     	<input type="hidden" name="article_number" value="<%=article.getArticle_number() %>"/>
		<input type="hidden" name="id" value="<%=session.getAttribute("id") %>"/>
   		<input type="text" class="form-control" name="text" id="text" placeholder="덧글을 입력해주세요." style="width:90%; display: inline;">
    	<input class='btn btn-primary' type='submit' value='덧글쓰기' style="display: inline;">
	</form>
	</td>
    </tr>
	<tr>
     <td colspan="2"  class="text-center">
	<input class='btn btn-primary' type='button' value='글수정'  onclick="move(<%=update_url %>);">
	<input class='btn btn-danger' type='button' value='글삭제'  onclick="move(<%=delete_url %>);">      
	<input type="button" value="취소" class="btn btn-warning" onclick='move("Container.jsp?selected_page=qna");'>
     </td>
    </tr>
</table>
</body>
</html>