<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	
	<style>
		#container{
			width:600px;
			height:560px;
		}
		#container img{
			width: 70px;
			margin-left: auto;
			margin-right: auto;
			display: block;
		}
		#name_area, #id_area, #password_area, #sex_area, #birth_area {
			border: px gray solid;
			margin: 20px 10px; 
			height: 40px;
			font-size: 18px;
			color: gray;
		}		
		#item {
			border: px violet solid;
			width: 120px;
			height: 40px;
			line-height: 40px;
			display: inline-block;
		}
		#in_name, #in_id, #in_password, #in_sex, #in_birth {
			border: px green solid;
			display: inline-block;
			width: 247px;
			height: 40px;
			line-height: 40px;
		}
		#in_sex {
			text-align: center;
		}
		#text {
			width: 244px;
			height: 37px;
			font-size: 18px;
		}
		#sub{
			text-align: center;
			font-size: 25px;
		}
		#login_button {
			text-decoration: none;
			color: gray;
		}
		#submit {			
			background-color: #FF3636;
			color: white;
			font-size: 20px;
			height: 60px;
			border: 0px;
			width: 380px;
			margin: 10px 0;
		}
		


#canvas{
width:600px;
height:540px;
text-align:center;
margin:0px 0px 10px 240px;
border: 1px solid black;
float:left;
}

#aside{
height:80px;
width:1080px;
font-size:30px;
float:left;
text-align:center;

}
		
		
	</style>
</head>

<body>

<%@ include file="header.jsp" %>

<div id=aside>
<p>-------------------회원가입-------------------</p>
</div>
<div id=canvas>
	<div id="container">
		<a href=""><img alt="log" src="img/mapTable_header/allergic.png"></a>
		<hr>
		<form action="" method="post">
		<div id="name_area">
			<div id="item">이름</div>
			<div id="in_name"><input id="text" type="text" name="name" required/></div>
		</div>
		<div id="id_area">
			<div id="item">아이디</div>
			<div id="in_id"><input id="text" type="text" name="id" required/></div>
		</div>
		<div id="password_area">
			<div id="item">비밀번호</div>
			<div id="in_password"><input id="text" type="password" name="password" required/></div>
		</div>
		<div id="sex_area">
			<div id="item">성별</div>
			<div id="in_sex">
				<label><input type="radio" value="male" name="sex" required/>남자</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label><input type="radio" value="female" name="sex" required/>여자</label>
			</div>
		</div>
		<div id="birth_area">
			<div id=item>생년월일</div>
			<div id=in_birth><input id="text" type="text" name="birth" required placeholder="  ex) 991212"></div>
		</div>
		<input id="submit" type="submit" value="회원가입">	
		</form>
	<hr>
		<div id="sub"><a id="login_button" href="Login.jsp">로그인</a></div>
	</div>
</div>
<%@ include file="footer.html" %>
</body>
</html>