<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h2><em>notice</em></h2>

	<table border=1 width=780>
	<tr>
	<td width=50>�۹�ȣ </td>
	<td width=100>�̸�</td>
	<td width=400>����</td>
	<td width=100>��¥</td>
	<td width=100>��ȸ�� </td>
	</tr>
	<%
	int i=0;
	for(i=0;i<10;i++){
		out.write("<tr>");
		out.write("<td>"+i+"</td>");
		out.write("<td>������</td>");
		out.write("<td>����</td>");
		out.write("<td>2018/11/28</td>");
		out.write("<td>1</td>");
	}
	%>	
	</table>
	
	<table width=780>
	<tr><td><input type=button value="�۾���" OnClick="window.location='board_write.jsp'"></td></tr>
	</table>


</body>
</html>