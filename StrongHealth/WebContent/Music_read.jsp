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
		String delete_url = "'Delete_handle.jsp?article_number=" + article.getArticle_number()+ "&category=" + article.getCategory() + "&id=" + article.getId() + "&authority=" 
							+ ac.getidToAuthority(article.getId()) + "'";
	%>

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
     <td>링크</td>
     <td style="text-align: left;"><%=article.getLink() %></td>
    </tr>
     <tr> 
     <td colspan="2"  class="text-center">
	<% 
		if(session.getAttribute("authority") != null){
			if(session.getAttribute("authority").toString().equals("admin")){
				out.println("<input class='btn btn-danger' type='button' value='글삭제' onclick=\"move(" + delete_url + ");\"/>");
				out.println("<input class='btn btn-primary' type='button' value='글수정' onclick=\"move('Container.jsp?selected_page=music_update&article_number="+ request.getParameter("article_number") + "');\"/>");
			}
		}
	%>
	      <input type="button" value="취소" class="btn btn-warning" onclick='move("Container.jsp?selected_page=music_manager");'>
     </td>
    </tr>
</table>
</body>
</html>