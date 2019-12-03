<%@page import="java.util.Date"%>
<%@page import="javabean.Access_DB"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%=session.isNew() %>

세션 ID (유일한 식별자) : <%= session.getId() %><br>
<% session.setMaxInactiveInterval(60); %>
세션 MaxInactiveInterval (기본 세션 유지 시간) : <%= session.getMaxInactiveInterval() %><br>

<% 	
	long mseconds = session.getCreationTime();
	Date time = new Date(mseconds);
%>
세션 CreationTime (시각으로 다시 계산) : <%=time.toLocaleString() %>
<br>
id : <%=session.getAttribute("id") %><br>
password : <%=session.getAttribute("password") %><br>
name : <%=session.getAttribute("name") %><br>
sex : <%=session.getAttribute("sex") %><br>
birth : <%=session.getAttribute("birth") %><br>
authority : <%=session.getAttribute("authority") %><br>
address : <%=session.getAttribute("address") %><br>
phone : <%=session.getAttribute("phone") %><br>
email : <%=session.getAttribute("email") %><br>

</body>
</html>