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
	String url = "Container.jsp?selected_page=qna_read&article_number="+article.getArticle_number();

	if(session.getAttribute("id") == null){
		out.println("<script>");
		out.println("alert('�α����� �ؾ� ���� ������ �� �ֽ��ϴ�.');");
		out.println("location.href='Container.jsp?selected_page=qna_read&article_number="+request.getParameter("article_number") + "';");
		out.println("</script>");
		
	}
	else {
		if(session.getAttribute("authority").equals("admin")){}
		else if(!article.getId().equals(session.getAttribute("id"))) {
			out.println("<script>");
			out.println("alert('������ �ۼ��� �۸� ������ ��  �ֽ��ϴ�.');");
			out.println("location.href='Container.jsp?selected_page=qna&article_number="+ request.getParameter("article_number") + "';");
			out.println("</script>");
		}
	}

%>
<h2>QnA ����</h2>

<form action="Update_handle.jsp" method="post">
<table class="table table-striped">
	<input type="hidden" name="category" id="category" value="qna">
	<input type="hidden" name="article_number" id="article_number" value="<%=article.getArticle_number() %>"/>
    <tr>
     <td>����</td>
     <td><input type="text" class="form-control" name="article_name" id="article_name" placeholder="������ �Է����ּ���."></td>
    </tr>
    <tr>
    	<td>���� ī�װ�</td>
    	<td><label><input type="radio" id="qna_category" name="qna_category" value="Ȩ������"> Ȩ������&nbsp;&nbsp;</label>
    		<label><input type="radio" id="qna_category" name="qna_category" value="�ǰ�����"> �ǰ�����&nbsp;&nbsp;</label>
    		<label><input type="radio" id="qna_category" name="qna_category" value="ȭ�����"> ȸ�����&nbsp;&nbsp;</label>
    		<label><input type="radio" id="qna_category" name="qna_category" value="��Ÿ"> ��Ÿ</label></td>
    </tr>
    <tr>
     <td>�۳���</td>
     <td><textarea rows="15" class="form-control" name="text" id="text" style="width:100%; height:100%" placeholder="������ �Է����ּ���."></textarea></td>
    </tr>
     <tr> 
     <td colspan="2"  class="text-center">
      <input type="submit" value="����Ϸ�" class="btn btn-success">
      <input type="button" value="���" class="btn btn-warning" onclick='move("<%=url %>");'>
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