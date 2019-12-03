<%@page import="javabean.Access_DB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javabean.Survey"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
	int scores[] = new int[5];
	Access_DB ac = new Access_DB();
	Survey sr = new Survey();
	
	sr.setId((String)session.getAttribute("id"));
	sr.setDate(Access_DB.getCurrentDate());
	for(int i=0; i<5; i++){
		int score = 0;
		for(int j=0; j<5; j++){
			score += Integer.parseInt(request.getParameter("sur" + i + "_" + j));
		}
		scores[i] = score;
	}
	
	sr.setScore0(scores[0]);
	sr.setScore1(scores[1]);
	sr.setScore2(scores[2]);
	sr.setScore3(scores[3]);
	sr.setScore4(scores[4]);
	sr.setText(request.getParameter("text"));
	
	ac.surveyWrite(sr);
	
	out.println("<script>");
	out.println("alert('정상적으로 제출 되었습니다.')");
	out.println("location.href='Container.jsp'");
	out.println("</script>");
%>
</body>
</html>