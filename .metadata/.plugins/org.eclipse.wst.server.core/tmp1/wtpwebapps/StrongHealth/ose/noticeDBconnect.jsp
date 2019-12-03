<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%@ page import="java.sql.*" %>
<%

String dbURL = "jdbc:mysql://localhost:3306/mysql";
String driverName = "com.mysql.jdbc.Driver";
String id = "root";
String pw = "1234";

Class.forName(driverName);
Connection con = DriverManager.getConnection(dbURL, "root", "1234");
out.println("MySql 데이터베이스 mysql에 성공적으로 접속했습니다");

Statement stmt = con.createStatement();
ResultSet result = stmt.executeQuery("select * from notice_list");
con.close();
/*
while(result.next()){
	out.print(result.getString("id"));
	out.print(result.getString("num"));
	out.print(result.getString("name"));
	out.print(result.getString("title"));
	out.print(result.getString("dbdate"));
	out.print(result.getString("views"));
}
*/


%>
</body>
</html>