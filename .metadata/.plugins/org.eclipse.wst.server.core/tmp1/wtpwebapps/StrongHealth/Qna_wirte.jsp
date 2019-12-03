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
	if(session.getAttribute("authority") == null){
		out.println("<script>");
		out.println("alert('로그인을 하신 후 글을 남길수 있습니다.')");
		out.println("location.href='Container.jsp?selected_page=qna'");
		out.println("</script>");
	}
%>
<h2>QnA 쓰기</h2>


<form action="Write_handle.jsp" method="post">
<table class="table table-striped">
	<input type=hidden name="category" id="category" value="qna">
    <tr>
     <td>제목</td>
     <td><input type="text" class="form-control" name="article_name" id="article_name" placeholder="제목을 입력해주세요."></td>
    </tr>
    <tr>
    	<td>질문 카테고리</td>
    	<td><label><input type="radio" id="qna_category" name="qna_category" value="홈페이지"> 홈페이지&nbsp;&nbsp;</label>
    		<label><input type="radio" id="qna_category" name="qna_category" value="건강관련"> 건강관련&nbsp;&nbsp;</label>
    		<label><input type="radio" id="qna_category" name="qna_category" value="화원등급"> 회원등급&nbsp;&nbsp;</label>
    		<label><input type="radio" id="qna_category" name="qna_category" value="기타"> 기타</label></td>
    </tr>
    <tr>
     <td>글내용</td>
     <td><textarea rows="15" class="form-control" name="text" id="text" style="width:100%; height:100%" placeholder="내용을 입력해주세요."></textarea></td>
    </tr>
     <tr> 
     <td colspan="2"  class="text-center">
      <input type="submit" value="쓰기완료" class="btn btn-success">
      <input type="button" value="취소" class="btn btn-warning" onclick='move("Container.jsp?selected_page=qna");'>
     </td>
    </tr>
</table>
</form>

</body>
</html>