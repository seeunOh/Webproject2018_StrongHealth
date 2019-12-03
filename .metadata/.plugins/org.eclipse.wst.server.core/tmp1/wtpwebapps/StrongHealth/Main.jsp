<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="javabean.Article" %>
<%@page import="javabean.Access_DB"%>
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
text-align:center;
}

#mainPhoto{
width:670px;
height:750px;
float:right;
text-align:center;
}

#notice_canvas{
width:400px;
height:500px;
float:left;
}

#recomen{
width:300px;
height:250px;
float:left;
margin:0px 0px 0px 60px;
border: 1px solid red;
}

#notice{
width:300px;
height:450px;
margin:30px 0px 10px 60px;
text-align:center;
border: 1px solid red;
}


#mainNoticeCanvas{
width:540px;
height:500px;
background:red;
float:left;

}

#mainMusicCanvas{
width:540px;
height:500px;
background:blue;
float:right;
}


.scale {
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.3s ease-in-out;   
}

.scale:hover {
  transform: scale(1.2);
  -webkit-transform: scale(1.2);
  -moz-transform: scale(1.2);
  -ms-transform: scale(1.2);
  -o-transform: scale(1.2);
}



</style>
<script>


</script>

</head>
<body>

 
<div id=blankTemp style='width:1080px;'>&nbsp</div>
<div id=notice_canvas>
	<div id=notice>
	<h2><em>notice</em></h2>
	<%
		Access_DB ac = new Access_DB();
		ArrayList<Article> al = ac.getArticles(Access_DB.NOTICE);
		for(int i=0; i<al.size(); i++){
			out.println(al.get(i).getArticle_name() + "<br>");
		}
	%>
	</div>
</div>


<div id=mainPhoto>
<h1>건강 참고</h1>
<a href="Container.jsp?selected_page=healthcare_food"><img class="scale" src="img/superfood.png" width=300 height=200/></a>
<a href="Container.jsp?selected_page=music"><img class="scale" src="img/music.png" width=300 height=200/></a>
<a href="Container.jsp?selected_page=survey"><img class="scale" src="img/survey2.png" width=300 height=200/></a>
<a href="Container.jsp?selected_page=today"><img class="scale" src="img/lifeinfo.png" width=300 height=200/></a>
<a href=""><img class="scale" src="img/strech.png" width=300 height=200/></a>
<a href=""><img class="scale" src="img/healthnews.png" width=300 height=200/></a>
</div>

<div id=recomen>
<h2>이번주 추천 음악</h2>
<ul>
<%
	al = ac.getArticles(Access_DB.MUSIC);
	for(int i=0; i<al.size(); i++){
		out.println("<li>" + al.get(i).getArticle_name() + "</li>");
	}
%>

</ul>
</div>













<!-- 
<div id=mainImage>
<figure>
<img class="mySlides" src="img/superfood.png" width=500 height=300>
<img class="mySlides" src="img/music.png" width=500 height=300>
<img class="mySlides" src="img/Mclothes.PNG" width=500 height=300>
<img class="mySlides" src="img/strech.png" width=500 height=300>
<img class="mySlides" src="img/healthnews.png" width=500 height=300>
</figure>
</div>


<div id=mainContent>

<div id=mainNoticeCanvas>


</div>


<div id=mainMusicCanvas>

</div>

</div>
 -->



<!-- 
<%=session.isNew() %>

세션 ID (유일한 식별자) : <%= session.getId() %><br>
<% session.setMaxInactiveInterval(60*10); %>
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
 -->
</body>
</html>