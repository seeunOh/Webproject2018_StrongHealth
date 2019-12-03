<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style>

body{
font-family: 한컴 고딕;
text-align:center;
}

#board{
width:1080px;
}

#header{
width:1080px;
height:28px;
}

#log{
float:right;
width:200px;
line-height: 1.7em;
}

#log a {
font-size:17px;
color: black;
text-decoration:none; 
}

#log a:hover {
text-decoration:underline;
}

#TM{
width:1080px;
height:46.5px;
background: #8CC457;
font-size:19px;
}

#TM ul {
   list-style: none;
   padding:0px 0;
   margin: 0px;
}

#TM ul li {
   float : left;
   line-height : 2.5em;
   position : relative;
   width:150px;
}   

.menuLink { 
   text-decoration:none;
   display: block;
   width: 150px;
   color: white; 
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

a {
   text-decoration : none;
   color : white;
}

#nav{
width:1080px;
height:170px;
}
#logo{
float:left;
width:200px;
}
#search{
width:800px;
height:100px;
float:right;
}


</style>

</head>


<body>


<div id=board>
<div id = header>
	<div id=log><a href="login">LOGIN</a><a> | </a><a href="login">JOIN</a><a> | </a><a href="login">MYPAGE</a></div>
</div>


<div id = TM>
<ul>
 <li class="topmenu"><a class="menuLink" href="#">오늘의 건강</a>
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
 <li class="topmenu"><a class="menuLink" href="#">커뮤니티</a>
  <ul class="submenu">
   <li class="submenuLink"><a href="#">공지사항</a></li>
   <li class="submenuLink"><a href="#">Q&A</a></li>
   <li class="submenuLink"><a href="#">SNS</a></li>
  </ul>
</li>
</ul>
</div>
 
<div id=nav>
<div id=logo><img src="logo5.png" width=170 height=150/></div>
<p>&nbsp</p>
<div id = search><p>연관검색어 | 하루식단   스트레칭   자료실   추천도서</p>
<input type="text" size=80> <input type="button" value="검색"></div>
</div> 

</div>
</body>
</html>