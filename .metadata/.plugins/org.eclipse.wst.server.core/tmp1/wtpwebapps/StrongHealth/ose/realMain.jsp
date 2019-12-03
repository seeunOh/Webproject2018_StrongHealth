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
width:1080px;

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
}

#notice{
width:300px;
height:450px;
margin:5px 0px 10px 60px;
text-align:center;
border: 1px solid red;
}

#not a{
text-decoration:none;
color:black;
}
#not a:hover{
text-decoration:underline;
}

.scale {
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.3s ease-in-out;   /* �ε巯�� ����� ���� �߰�*/
}

.scale:hover {
  transform: scale(1.2);
  -webkit-transform: scale(1.2);
  -moz-transform: scale(1.2);
  -ms-transform: scale(1.2);
  -o-transform: scale(1.2);
}

</style>

</head>
<body>
<div id = header>
	<div id=log><a href="Login.jsp">LOGIN</a><a> | </a><a href="Sign.jsp">JOIN</a><a> | </a><a href="login">MYPAGE</a></div>
</div>

 
<div id = TM>
<ul>
<li>&nbsp</li>
 <li class="topmenu"><a class="menuLink" href="#">������ �ǰ�</a>
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
 <li class="topmenu"><a class="menuLink" href="#">Ŀ�´�Ƽ</a>
  <ul class="submenu">
   <li class="submenuLink"><a href="community_notice.jsp">��������</a></li>
   <li class="submenuLink"><a href="#">Q&A</a></li>
   <li class="submenuLink"><a href="#">SNS</a></li>
  </ul>
</li>
</ul>
</div>
 
 
<div id=nav>
<div id=logo><a href="realMain.jsp"><img src="logo10.PNG" width=250 height=170/></a></div>
<p>&nbsp</p>
<div id = search><p>�����˻��� | �Ϸ�Ĵ�   ��Ʈ��Ī   �ڷ��   ��õ����   ���ڿ��ڰ�����   ���㿵��Ĵ�</p>
<input type="text" size=80> <input type="button" value="�˻�"></div>
</div> 

<div id=notice_canvas>
	<div id=notice>
	<h2><em>notice</em></h2>

	<%@ page import="java.sql.*" %>
<%
String dbURL = "jdbc:mysql://localhost:3306/mysql";
String driverName = "com.mysql.jdbc.Driver";
String id = "root";
String pw = "1234";

Class.forName(driverName);
Connection con = DriverManager.getConnection(dbURL, "root", "1234");

Statement stmt = con.createStatement();
ResultSet result = stmt.executeQuery("select * from notice_list");

while(result.next()){
	%>	
<table id=not>	
	<tr>
		<td width=270><a href ="#"><%= result.getString("title") %></a></td>
	</tr>
	</table>				
	<%	
	}
con.close();
%>
	</table>

	</div>
</div>


<div id=mainPhoto>
<h1>�ǰ� ����</h1>
<img class="scale" src="handwash.jpg" width=300 height=200/>
<img class="scale" src="stretching.png" width=300 height=200/>
<img class="scale" src="food.png" width=300 height=200/>
<img class="scale" src="vegetTip.png" width=300 height=200/>
<img class="scale" src="smarteye.png" width=300 height=200/>
<img class="scale" src="realfood.png" width=300 height=200/>
</div>

<div id=recomen>
<h2>�̹��� ��õ ����</h2>
<ul>
<li>�Ÿ�ں�ġ - °�� ������</li>
<li>���亥 - �ǾƳ�ҳ�Ÿ 21�� "��Ʈ��Ÿ��"</li>
<li>�Ÿ�ں�ġ - °�� ������</li>
<li>�Ÿ�ں�ġ - °�� ������</li>
<li>�Ÿ�ں�ġ - °�� ������</li>
<li>�Ÿ�ں�ġ - °�� ������</li>

</ul>
</div>

</body>
</html>