<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style>

body{
width:1080px;
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

#notice_canvas{
width:880px;
height:800px;
float:left;
border: 1px solid black;
}

#notice{
width:780px;
height:750px;
text-align:center;
margin:0px 0px 10px 40px;
}
</style>


</head>

<body>

<%@ include file="header.jsp" %>

<div id=aside>
<ul>
<li><h3>커뮤니티</h3></li>
<li style="color: white;"><n>공지사항</n></li>
<li>Q&A</li>
<li>SNS</li>
</ul>
</div>

<div id=notice_canvas>
	<div id=notice>
	<h2><em>notice</em></h2>

	<table border=1 width=780>
	<tr>
	<td width=50>글번호 </td>
	<td width=100>이름</td>
	<td width=400>제목</td>
	<td width=100>날짜</td>
	<td width=100>조회수 </td>
	</tr>
	
	<%@ page import="java.sql.*" %>
<%
String dbURL = "jdbc:mysql://localhost:3306/mysql";
String driverName = "com.mysql.jdbc.Driver";
String id = "root";
String pw = "1234";

Class.forName(driverName);
Connection con = DriverManager.getConnection(dbURL, "root", "1234");

Statement stmt = con.createStatement();
ResultSet result = stmt.executeQuery("select * from notice_list");

while(result.next()){
	%>	
<table border=1>	
	<tr>
		<td width=50><%= result.getString("num") %></td>
		<td width=100><%= result.getString("name") %></td>
		<td width=400><%= result.getString("title") %></td>
		<td width=100><%= result.getString("dbdate") %></td>
		<td width=100><%= result.getString("views") %></td>
	</tr>
	</table>				
	<%	
	}
con.close();
%>	
	</table>
	
	<table width=780>
	<tr><td><input type=button value="글쓰기" OnClick="window.location='board_write.jsp'"></td></tr>
	</table>
	
	</div>
</div>

<%@ include file="footer.html" %>

</body>
</html>