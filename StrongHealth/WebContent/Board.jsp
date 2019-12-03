<%@page import="javabean.Article"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javabean.Access_DB"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script>
	function move(url){
		location.href=url;
	}
</script>


<style>

body{
width:1080px;
text-align:center;
}

#Caside{
height:600px;
width:200px;
font-size:25px;
background: #FF9595;
float:left;
color:white;
opacity:;
}

#but{
width:1080px;
heigth:40px;
}
#but a{
font-size:18px;
text-decoration:none;
color:black;
}

#Botable{
text-align:center;
height:600px;
margin:0px 0px 0px 200px;
font-size:17px;

}
#Botable a{
text-decoration:none;
color:black;
}
#Botable a:hover{
text-decoration:underline;
}

#Botable th,td{
border-bottom: 1px solid #A6A6A6;
padding: 5px;
border-collapse: collapse;
}
button{
background:white;
}


</style>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
	Access_DB ac = new Access_DB();
	String category = request.getParameter("category");
	ArrayList<Article> al = null;
	String write = "";
	
	if(category.equals("notice")){
		al = ac.getArticles(Access_DB.NOTICE);
		out.println("<h2><em>Notice</em></h2>");	
		write = "notice_write";
	}
	else if(category.equals("qna")){
		al = ac.getArticles(Access_DB.QNA);
		out.println("<h2><em>QnA</em></h2>");
		write = "qna_write";
	}
	else if(category.equals("music_manager")){
		al = ac.getArticles(Access_DB.MUSIC);
		out.println("<h2>Music</h2>");
		write = "music_write";		
		if(session.getAttribute("authority") == null){
			out.println("<script>");
			out.println("alert('관리자만 음악글을 관리할 수 있습니다.')");
			out.println("location.href ='Container.jsp?selected_page=music'");
			out.println("</script>");
		}
		else{
			if(!session.getAttribute("authority").equals("admin")){
				out.println("<script>");
				out.println("alert('관리자만 음악글을 관리할 수 있습니다.')");
				out.println("location.href ='Container.jsp?selected_page=music'");
				out.println("</script>");
			}
		}
	}
	
	int page_number = 0;
	double number_of_article = 10.0;
	int max_article = al.size();
	int max_page = (int)(Math.ceil(max_article/number_of_article)) - 1;

	if(request.getParameter("page_number") != null) {
		page_number = Integer.parseInt(request.getParameter("page_number"));
	}

%>



<div id=Caside>
<p style='margin:30px 0px 0px 0px;'>커뮤니티</p>
</div>

<div id=Botable>
<table class='table table-striped'>
<tr><td>글번호</td><td>이름</td><td>제목</td><td>날짜</td><td>조회수</td></tr>
<script>
	function move(url){
		location.href=url;
	}
</script>

<%
	String row = "";	
	int cnt =0;
	for(int i=max_article-1-(page_number*(int)number_of_article); i>=0; i--){
		if(cnt == number_of_article)
			break;
		row += "<tr><td width=90>" + al.get(i).getArticle_number().substring(1) + "</td><td width=100>" + ac.getIdToName(al.get(i).getId()) + "</td><td width=800>" + 
				"<a href='Container.jsp?selected_page=";
		if(category.equals("notice"))
			row += "notice_read";
		else if(category.equals("qna"))
			row += "qna_read";
		else if(category.equals("music_manager")){
			row += "music_read";
		}
		row += "&article_number=" + al.get(i).getArticle_number() + "'>" + 
				al.get(i).getArticle_name() + "</a></td><td width=200>" + al.get(i).getDatetime().substring(0, 11) + "</td><td width=100>" + al.get(i).getViews() + "</td></tr>";
		cnt++;	
	}
	out.println(row);
%>	
</table>
<input class='btn btn-primary pull-right' type="button" value="글쓰기" onclick='move("Container.jsp?selected_page=<%=write %>");'>
<input class="btn btn-danger" type="button" value="<<이전" onclick='move("Container.jsp?selected_page=<%=category %>&page_number=<%=(page_number - 1 == -1 ? 0 : page_number-1) %>");'>
<input class="btn btn-danger" type="button" value="다음>>" onclick='move("Container.jsp?selected_page=<%=category %>&page_number=<%=(page_number == max_page ? max_page : page_number + 1) %>");'>


</div>


<div id = but>
<p></p>
</div>
</body>
</html>