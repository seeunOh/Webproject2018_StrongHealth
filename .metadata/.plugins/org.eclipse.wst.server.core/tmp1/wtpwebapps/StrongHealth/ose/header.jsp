<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style>


body{
font-family: �����ٸ���;
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
		out.println("<div id=log><a href='Container.jsp?selected_page=login'>LOGIN</a><span> | </span><a href='Container.jsp?selected_page=join'>JOIN</a><span> | </span><a href='login'>MYPAGE</a></div>"); // MYPAGE�� ������ �ʿ���.
	}
	else{
		out.println("<div id=log><a herf=''>" + session.getAttribute("name") + " ��" + "</a><span> | </span><a href='Logout.jsp'>LOGOUT</a><span> | </span><a href='Container.jsp?selected_page=mypage'>MYPAGE</a></div>");
	}
		
%>
</div>


 
<div id = TM>
<ul>
<li>&nbsp</li>
 <li class="topmenu"><a class="menuLink" href="Container.jsp?selected_page=today">������ �ǰ�</a>
 	<ul class="submenu">
     <li class="submenuLink"><a href="#">�Ľ��� ��Ȱ</a></li>
     <li class="submenuLink"><a href="#">��Ȱ ����</a></li>
     <li class="submenuLink"><a href="#">��õ ����</a></li>
   </ul>
 </li>
 <li class="topmenu"><a class="menuLink" href="#">�ǰ�����</a>
   <ul class="submenu">
     <li class="submenuLink"><a href="���ǵ���.html">���ڿ� �ڰ�����</a></li>
     <li class="submenuLink"><a href="#">�� �ڰ�����</a></li>
     <li class="submenuLink"><a href="#">����Ʈ�� �ڰ�����</a></li>
   </ul>
 </li>
 <li class="topmenu"><a class="menuLink" href="#">�ｺ�ɾ�</a>
   <ul class="submenu">
     <li class="submenuLink"><a href="#">���㿵��Ĵ�</a></li>
     <li class="submenuLink"><a href="#">��Ʈ��Ī</a></li>
     <li class="submenuLink"><a href="#">�������</a></li>
   </ul>
</li>
 <li class="topmenu"><a class="menuLink" href="#">�ڷ��</a>
 	<ul class="submenu">
     <li class="submenuLink"><a href="#">�ǰ��Ź�</a></li>
     <li class="submenuLink"><a href="#">&nbsp</a></li>
     <li class="submenuLink"><a href="#">&nbsp</a></li>
   </ul>
 </li>
 <li class="topmenu"><a class="menuLink" href="Container.jsp?selected_page=notice">Ŀ�´�Ƽ</a>
  <ul class="submenu">
   <li class="submenuLink"><a href="Container.jsp?selected_page=notice">��������</a></li>
   <li class="submenuLink"><a href="Container.jsp?selected_page=qna">Q&A</a></li>
   <li class="submenuLink"><a href="Container.jsp?selected_page=music">music</a></li>
  </ul>
</li>
</ul>
</div>
 
 
<div id=nav>
<div id=logo><a href="Container.jsp"><img src="img/logo.PNG" width=250 height=170/></a></div>
<p>&nbsp</p>
<div id = search><p>�����˻��� | �Ϸ�Ĵ�   ��Ʈ��Ī   �ڷ��   ��õ����   ���ڿ��ڰ�����   ���㿵��Ĵ�</p>
<input type="text" size=80> <input type="button" value="�˻�"></div>
</div> 


</body>
</html>