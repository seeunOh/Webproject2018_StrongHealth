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

#foodcontent{
width:900px;
height:1300px;
background: #FFEAEA;
float:right;
}

#aside{
height:100px;
width:180px;
font-size:28px;
background: #FF9595;
float:left;
color:white;
}
</style>

<script>
function next(){
}

</script>
</head>
<body>

<div id=aside>
<p>추천 건강푸드</p>
</div>

<%
int cnt=0;
String image[][] = {{"rnlfl","qmffnqpfl","shrck","xhakxh","qmfhzhffl","dkahsem"},
		{"todtjs","todtjs","todtjs","todtjs","todtjs","todtjs"}};
String title[] = {"귀리","블루베리","녹차","토마토","브로콜리","토마토"};
String content[] = {"효능: 심장질환예방, 콜레스테롤수치 낮춤, 다이어트,변비예방",
		"효능: 시력보호, 체내나트륨조절", 
		"효능: 항산화효과, 집중력향상", 
		"효능: 혈압 낮춤, 심혈관질환 예방",
		"효능: 비타민C 多, 피부미용에 도움",
		"효능: 알츠하이머병 예방, 배변활동 다이어트에 도움"	
};
%>

<div id=foodcontent>
<h2>슈퍼푸드</h2>
<table border=0>
<%
for(int i=0; i<6; i=i+2){
	//out.print("<tr><td><td><img src=\"img/shrck.png\" width=400 height=280/></td><td>aa</td></tr>");
	out.print("<tr><td><img src=img/"+ image[cnt][i] +".png width=400 height=280/><h3>"+title[i]+"</h3><p>"+content[i]+
			"</p></td><td><img src=img/"+ image[cnt][i+1] +".png width=400 height=280/><h3>"+title[i+1]+"</h3><p>"+content[i+1]+"</p></td></tr>");
}
%>
</table>
<!-- 
<tr>
<td><img src="img/<% out.print(image[0]); %>.png" width=400 height=280/>
<h3>귀리</h3>
<p>효능: 심장질환예방, 콜레스테롤수치 낮춤, 다이어트,변비예방</p>
</td>
<td><img src="img/qmffnqpfl.png" width=400 height=280/>
<h3>블루베리</h3>
<p>효능: 시력보호, 체내나트륨조절</p>
</td>
</tr>
<tr>
<td><img src="img/shrck.png" width=400 height=280/>
<h3>녹차</h3>
<p>효능: 항산화효과, 집중력향상</p>
</td>
<td><img src="img/xhakxh.png" width=400 height=280/>
<h3>토마토</h3>
<p>효능: 혈압 낮춤, 심혈관질환 예방</p>
</td>
</tr>
<tr>
<td><img src="img/qmfhzhffl.png" width=400 height=280/>
<h3>브로콜리</h3>
<p>효능: 비타민C 多, 피부미용에 도움</p>
</td>
<td><img src="img/dkahsem.png" width=400 height=280/>
<h3>아몬드</h3>
<p>효능: 알츠하이머병 예방, 배변활동 다이어트에 도움</p>
</td>
</tr>
</table>

<input style='float:right;' type=button value="다음" onClick = "next()">
 -->
 



</div>
</body>
</html>