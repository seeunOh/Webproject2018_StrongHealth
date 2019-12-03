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
<!-- �ΰ����� �׸� -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
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
     <td>����</td>
     <td style="text-align: left;"><%=article.getArticle_name() %></td>
    </tr>
    <tr>
     <td>�ۼ���</td>
     <td style="text-align: left;"><%=ac.getIdToName(article.getId()) %></td>
    </tr>
    <tr>
     <td>��¥</td>
     <td style="text-align: left;"><%=article.getDatetime().substring(0, 20) %></td>
    </tr>
    <tr>
     <td>��ȸ��</td>
     <td style="text-align: left;"><%=article.getViews() %></td>
    </tr>
    <tr>
     <td>����</td>
     <td style="text-align: left; height: 300px;"><%=article.getText() %></td>
    </tr>
     <tr>
     <td colspan="2">��&nbsp;&nbsp;��</td>
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
   		<input type="text" class="form-control" name="text" id="text" placeholder="������ �Է����ּ���." style="width:90%; display: inline;">
    	<input class='btn btn-primary' type='submit' value='���۾���' style="display: inline;">
	</form>
	</td>
    </tr>
	<tr>
     <td colspan="2"  class="text-center">
	<input class='btn btn-primary' type='button' value='�ۼ���'  onclick="move(<%=update_url %>);">
	<input class='btn btn-danger' type='button' value='�ۻ���'  onclick="move(<%=delete_url %>);">      
	<input type="button" value="���" class="btn btn-warning" onclick='move("Container.jsp?selected_page=qna");'>
     </td>
    </tr>
</table>
</body>
</html>