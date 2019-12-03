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
width:200px;
font-size:25px;
background:red;
float:left;
}

#aside ul{
list-style: none;
}

#notice{
width:880px;
height:800px;
background:blue;
float:left;
}
 
 
   
</style>



</head>
<body>
<%@ include file="header.jsp" %>
<div id=aside>
<ul>
<li><h3>커뮤니티</h3></li>
<li>공지사항</li>
<li>Q&A</li>
<li>SNS</li>
</ul>
</div>

<div id=notice>


</div>


</body>
</html>