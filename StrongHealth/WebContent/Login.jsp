<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<style>
	

		#container{
			width: 400px;
			height:400px;
		}
		#container img{
			margin-left: auto;
			margin-right: auto;
			display: block;
		}
		#id_area, #password_area {
			width: 400px;
			height: 60px;
		}

		#container input {
			position: relative;
			display: block;
			width: 377px;
			height: 34px;
			top: 10px;
			bottom: 0px;
			left: 10px;
			right: 0px;
			font-size: 18px;
		}
		#sub{
			text-align: center;
		}
		#sign_button {
			text-decoration: none;
			color: gray;
		}
		#submit{
			background-color: #FF8383;
			color: white;
			font-size: 20px;
			height: 60px;
			border: 0px;
			width: 380px;
			margin: 10px 0;
		}
		
#canvas{
width:400px;
height:340px;
text-align:center;
margin:0px 0px 10px 380px;
border: 1px solid black;
float:left;
}

	</style>
</head>
<body>
	<%
	if(session.getAttribute("id") != null)
		response.sendRedirect("Container.jsp");
	%>
<div id=canvas>
	<div id="container">
		<h1><em>Log in</em></h1>
		<hr>
		<form method="post" action="Login_check.jsp">
			<div id="id_area">
					<input id="id_field" name="id" type="text" placeholder=" 아이디" required>

			</div>
			<div id="password_area">
					<input id="password_field" name="password" type="password" placeholder=" 비밀번호" required>

			</div>
			<input id="submit" type="submit" value="로그인">
		</form>
		
		<br><hr>
		<div id="sub"><a id="sign_button" href="Container.jsp?selected_page=join">회원가입</a></div>
	</div>
</div>
</body>

</html>