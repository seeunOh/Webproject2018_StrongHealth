<%@page import="javabean.Member"%>
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
	Member mb = ac.getMember(request.getParameter("id"));
	

	if(session.getAttribute("authority") == null){
		out.println("<script>");
		out.println("alert('로그인후 이용 할 수 있습니다.')");
		out.println("location.href='Container.jsp'");
		out.println("</script>");
	}
%>
<h2>회원정보 수정</h2>

<table class='table table-striped'>
<form action="Management_handle.jsp" method="post">
	<tr><td>아이디 : </td><td><input  class="form-control" type="text" id="id" name="id" readonly></td></tr>
	<tr><td>페스워드 : </td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<td><input class="form-control" type="text" id="password" name="password" required></td></tr>
	<tr><td>성별 : </td><td><label><input type="radio" value="남자" name="sex" required/>남자</label>
			<label><input type="radio" value="여자" name="sex" required/>여자</label><br></td></tr>
	<tr><td>생년월일 : </td><td><input class="form-control" type="text" id="birth" name="birth" required></td></tr>
	

	<% 
		if(session.getAttribute("authority") != null){
			if(session.getAttribute("authority").equals("admin"))
				out.println("<tr><td>권한 : </td><td><input class='form-control' type='text' id='authority' name='authority' required placeholder='admin, staff, member'></td></tr>");
			else
				out.println("<input type='hidden' id='authority' name='authority' required placeholder='admin, staff, member'>");
		}
	%>
	<tr><td>주소 : </td><td><input class="form-control" type="text" id="address" name="address" required></td></tr>
	<tr><td>핸드폰 번호 : </td><td><input class="form-control" type="text" id="phone" name="phone" required></td></tr>
	<tr><td>이메일 : </td><td><input class="form-control" type="email" id="email" name="email"></td></tr>
		
	<tr><td colspan='2'><input class='btn btn-primary' type="submit" value="전송"/><button class='btn btn-warning' onclick='move("Container.jsp?selected_page=management");'>돌아가기</button></td></tr>
</form>
</table>
	
<script>
	document.getElementById('id').value = '<%=mb.getId() %>';
	document.getElementById('password').value = '<%=mb.getPassword() %>';
	document.getElementById('birth').value = '<%=mb.getBirth() %>';
	document.getElementById('authority').value = '<%=mb.getAuthority() %>';
	document.getElementById('address').value = '<%=mb.getAddress() %>';
	document.getElementById('phone').value = '<%=mb.getPhone() %>';
	document.getElementById('email').value = '<%=mb.getEmail() == null ? "" : mb.getEmail() %>';
</script>
</html>