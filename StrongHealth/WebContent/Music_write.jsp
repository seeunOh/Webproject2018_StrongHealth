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
	if(session.getAttribute("authority") == null){
		out.println("<script>");
		out.println("alert('�����ڸ� ���Ǳ��� ����� �ֽ��ϴ�.')");
		out.println("location.href='Container.jsp?selected_page=notice'");
		out.println("</script>");
	}
	else{
		if(!session.getAttribute("authority").toString().equals("admin")){
			out.println("<script>");
			out.println("alert('�����ڸ� ���Ǳ��� ����� �ֽ��ϴ�.')");
			out.println("location.href='Container.jsp?selected_page=notice'");
			out.println("</script>");
		}
	}
%>

<h2>���Ǳ� ����</h2>
<form action="Write_handle.jsp" method="post">
<table class="table table-striped">
	<input type="hidden" name="category" id="category" value="music">
    <tr>
     <td>����</td>
     <td><input type="text" class="form-control" name="article_name" id="article_name" placeholder="������ �Է����ּ���."></td>
    </tr>
    <tr>
     <td>��ũ</td>
     <td><input type="text" class="form-control" name="link" id="link" placeholder="��ũ�� �Է����ּ���.">
     </tr>
     <tr> 
     <td colspan="2"  class="text-center">
      <input type="submit" value="����Ϸ�" class="btn btn-primary">
      <input type="button" value="���" class="btn btn-warning" onclick='move("Container.jsp?selected_page=music_manager");'>
     </td>
    </tr>
</table>
</form>
</body>
</html>