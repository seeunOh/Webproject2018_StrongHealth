<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- �ΰ����� �׸� -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>       
<form>
<table class="table table-striped">
    <tr>
     <td>����</td>
     <td><input type="text"  class="form-control" name="subject" value="[�亯]"></td>
    </tr>
    <tr>
     <td>�۳���</td>
     <td><textarea rows="10" name="content" class="form-control" id="text"></textarea></td>
    </tr>
     <tr> 
     <td colspan="2"  class="text-center">
      <input type="submit" value="��۾���Ϸ�" class="btn btn-success">
      <input type="reset" value="���" class="btn btn-warning">
      <input type="button"  class="btn btn-primary" onclick="location.href='BoardList.jsp'" value="��ü�ۺ���">
     </td>
    </tr>
</table>
</form>
</body>
</html>