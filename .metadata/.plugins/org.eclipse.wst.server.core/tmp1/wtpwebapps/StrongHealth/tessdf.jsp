<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>       
<form>
<table class="table table-striped">
    <tr>
     <td>제목</td>
     <td><input type="text"  class="form-control" name="subject" value="[답변]"></td>
    </tr>
    <tr>
     <td>글내용</td>
     <td><textarea rows="10" name="content" class="form-control" id="text"></textarea></td>
    </tr>
     <tr> 
     <td colspan="2"  class="text-center">
      <input type="submit" value="답글쓰기완료" class="btn btn-success">
      <input type="reset" value="취소" class="btn btn-warning">
      <input type="button"  class="btn btn-primary" onclick="location.href='BoardList.jsp'" value="전체글보기">
     </td>
    </tr>
</table>
</form>
</body>
</html>