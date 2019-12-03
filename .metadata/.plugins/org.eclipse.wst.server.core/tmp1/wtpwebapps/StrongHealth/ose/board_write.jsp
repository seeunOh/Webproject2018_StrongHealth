<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<html>
<head>
<title>게시판 글쓰기</title>
</head>

<style>


body{
font-family: 나눔바른펜;
}

#canvas{
width:600px;
height:400px;
text-align:center;
margin:0px 0px 10px 350px;
border: 1px solid black;

}

#aside{
height:200px;
width:190px;
font-size:25px;
background: #FF8383;
float:left;
}

#aside ul{
list-style: none;
}


#write{
text-align:center;
width:600px;
padding:100px 20px 20px 350px;
background:yellow;
}
</style>

<body>

<div id=container>


<%@ include file="header.jsp" %>
<div id=aside>
<ul>
<li><h3>커뮤니티</h3></li> 
<li style="color:white;">공지사항</li>
<li>Q&A</li>
<li>SNS</li>
</ul>
</div>
<div id=canvas>
<a href="community_notice.jsp"><input style="float:left;" type=button value="뒤로"></a>

<h2>글작성</h2>
<table width=600 border=0 cellspacing=0 cellpadding=2>
	<tr>
		<td>이름</td>
		<td><input type=text name=dbname size=60 maxlength=50></td>
	</tr>
	<tr>
		<td>아이디</td>
		<td><input type=text name=dbemail size=60 maxlength=50></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type=text name=dbhomepage size=60 maxlength=50></td>
	</tr>
	<tr>
		<td><b>제목</b></td>
		<td><input type=text name=dbsubject size=60 maxlength=50></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea name=dbmemo cols=50 rows=10></textarea></td>
	</tr>
</table>
<table width=600 border=0 cellspacing=0 cellpadding=0>
	<tr>
		<td><input type=button value="등록"
			OnClick="window.location='board_write_insert.jsp'"></td>
	</tr>
</table>
</div>

<%@ include file="footer.html" %>
</body>
</html>