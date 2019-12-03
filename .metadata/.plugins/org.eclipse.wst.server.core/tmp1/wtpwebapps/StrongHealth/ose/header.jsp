<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style>


body{
font-family: 나눔바른펜;
}

#header{
width:1080px;
height:28px;
background:#FFEAEA;
}
#log{
float:right;
width:200px;
line-height: 1.7em;
}

#log a {
font-size:16px;
color: black;
text-decoration:none; 
}

#log a:hover {
text-decoration:underline;
}


#nav{
width:1080px;
height:180px;
}
#logo{
float:left;
width:200px;

}
#search{
width:720px;
height:100px;
float:right;
}
#TM{
width:1080px;
height:46.5px;
border-top:1px solid red; border-bottom:1px solid red; 
font-size:22px;
text-align:center;
margin:10px 0px 10px 0px;

}

#TM ul {
   list-style: none;
   padding:0px 0;
   margin: 0px;
   
}
#TM ul li {
   float : left;
   line-height : 2.2em;
   position : relative;
   width:150px;
   padding: 0px 15px 0px 15px;
}  

.menuLink { 
   text-decoration:none;
   display: block;
   width: 150px;
   color:black;
}
.submenu {
   position: absolute;
   display:none;
   overflow:hidden;
   background-color:black;
	opacity:0.7;
	font-size:15px;
}
.topmenu:hover .submenu{
   display:block;
}

.submenu a {
   text-decoration : none;
   color : white;
}



</style>


</head>
<body>


<div id = header>
<%
	if(session.getAttribute("id") == null){
		out.println("<div id=log><a href='Container.jsp?selected_page=login'>LOGIN</a><span> | </span><a href='Container.jsp?selected_page=join'>JOIN</a><span> | </span><a href='login'>MYPAGE</a></div>"); // MYPAGE는 삭제가 필요함.
	}
	else{
		out.println("<div id=log><a herf=''>" + session.getAttribute("name") + " 님" + "</a><span> | </span><a href='Logout.jsp'>LOGOUT</a><span> | </span><a href='Container.jsp?selected_page=mypage'>MYPAGE</a></div>");
	}
		
%>
</div>


 
<div id = TM>
<ul>
<li>&nbsp</li>
 <li class="topmenu"><a class="menuLink" href="Container.jsp?selected_page=today">오늘의 건강</a>
 	<ul class="submenu">
     <li class="submenuLink"><a href="#">식습관 생활</a></li>
     <li class="submenuLink"><a href="#">생활 습관</a></li>
     <li class="submenuLink"><a href="#">추천 음악</a></li>
   </ul>
 </li>
 <li class="topmenu"><a class="menuLink" href="#">건강설문</a>
   <ul class="submenu">
     <li class="submenuLink"><a href="불의도시.html">알코올 자가진단</a></li>
     <li class="submenuLink"><a href="#">흡연 자가진단</a></li>
     <li class="submenuLink"><a href="#">스마트폰 자가진단</a></li>
   </ul>
 </li>
 <li class="topmenu"><a class="menuLink" href="#">헬스케어</a>
   <ul class="submenu">
     <li class="submenuLink"><a href="#">맞춤영양식단</a></li>
     <li class="submenuLink"><a href="#">스트레칭</a></li>
     <li class="submenuLink"><a href="#">명상음악</a></li>
   </ul>
</li>
 <li class="topmenu"><a class="menuLink" href="#">자료실</a>
 	<ul class="submenu">
     <li class="submenuLink"><a href="#">건강신문</a></li>
     <li class="submenuLink"><a href="#">&nbsp</a></li>
     <li class="submenuLink"><a href="#">&nbsp</a></li>
   </ul>
 </li>
 <li class="topmenu"><a class="menuLink" href="Container.jsp?selected_page=notice">커뮤니티</a>
  <ul class="submenu">
   <li class="submenuLink"><a href="Container.jsp?selected_page=notice">공지사항</a></li>
   <li class="submenuLink"><a href="Container.jsp?selected_page=qna">Q&A</a></li>
   <li class="submenuLink"><a href="Container.jsp?selected_page=music">music</a></li>
  </ul>
</li>
</ul>
</div>
 
 
<div id=nav>
<div id=logo><a href="Container.jsp"><img src="img/logo.PNG" width=250 height=170/></a></div>
<p>&nbsp</p>
<div id = search><p>연관검색어 | 하루식단   스트레칭   자료실   추천도서   알코올자가진단   맞춤영양식단</p>
<input type="text" size=80> <input type="button" value="검색"></div>
</div> 


</body>
</html>