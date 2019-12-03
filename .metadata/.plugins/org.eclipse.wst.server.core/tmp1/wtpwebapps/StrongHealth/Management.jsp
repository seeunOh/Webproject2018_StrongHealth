<%@page import="javabean.Member"%>
<%@page import="java.util.ArrayList"%>
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


<style>
body{
width:1080px;
heigth:;
text-align:center;
}
#memContent{
}

#memContent a{
text-decoration:none;
color: black;
}
#memContent a:hover{
text-decoration:underline;
}

</style>

</head>
<body>
<% 
	if(session.getAttribute("authority") == null){
		out.println("<script>");
		out.println("alert('로그인후 이용 할 수 있습니다.')");
		out.println("location.href='Container.jsp'");
		out.println("</script>");
	}
%>
<div id=memContent>
<h2>회원 관리</h2>
<%
	request.setCharacterEncoding("EUC-KR");
	Access_DB ac = new Access_DB();
	ArrayList<Member> ml = new ArrayList<Member>();
	if(session.getAttribute("authority") != null){
		if(session.getAttribute("authority").equals("admin"))
			ml = ac.getMembersAll();
		else{
			Member mb = ac.getMember((String)session.getAttribute("id"));
			ml.add(mb);
		}
	}
	
	int page_number = 0;
	double number_of_article = 20.0;
	int max_article = ml.size();
	int max_page = (int)(Math.ceil(max_article/number_of_article)) - 1;

	if(request.getParameter("page_number") != null) {
		page_number = Integer.parseInt(request.getParameter("page_number"));
	}
	
	String table="<table class=table table-stripted><tr><td>아이디</td><td>패스워드</td><td>이름</td><td>성별</td><td>생년월일</td><td>권한</td><td>주소</td><td>핸드폰번호</td><td>이메일</td><td>비고</td><tr>";
	
	int cnt = 0;
	for(int i=max_article-1-(page_number*(int)number_of_article); i>=0; i--){
		if(cnt == number_of_article)
			break;
		Member mb = ml.get(i);
		table += "<tr><td>" + mb.getId() + "</td><td>" + mb.getPassword() + "</td><td>" + mb.getName() + "</td><td>" + mb.getSex() + "</td><td>" + mb.getBirth() + "</td><td>" + 
		mb.getAuthority() + "</td><td>" + mb.getAddress() + "</td><td>" + mb.getPhone() + "</td><td>" + mb.getEmail() + "</td><td><a href='Container.jsp?selected_page=management_update&id="+ mb.getId() +"'>수정</a></td><tr>";
		cnt++;
	}
	table += "</table>";
	out.println(table);
%>

<p></p>
<%
	if(session.getAttribute("authority") != null){
		if(session.getAttribute("authority").equals("admin")){
			out.println("<a href='Container.jsp?selected_page=management&page_number=" + (page_number - 1 == -1 ? 0 : page_number-1) + "'><<이전</a>");
			out.println("<a href='Container.jsp?selected_page=management&page_number=" + (page_number == max_page ? max_page : page_number + 1) + "'>다음>></a>");
		}
	}
%>
</div>
</body>
</html>