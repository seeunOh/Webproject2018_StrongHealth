<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>


		#aside{
			float: left;
			width: 380px;
			height: 640px;
		}
		#notice{
			width: 280px;
			height: 600px;
			left:50px;
			border: 2px solid #8CC457;
		
		}
		#result{
			float: right;
			width: 350px;
			height: 640px;
			background-color: #8CC457;
		}
		
		#map_background {
			width: 1080px;
		}
		#left{
			float: right;
			width: 330px;
			height: 270px;			
			/*background-color: red;*/
			background-image: url(img/memo4.png);
		}
		#right {
			float: right;
			width: 330px;
			height: 270px;
			/*background-color: #8CC457;*/
			background-image: url(img/memo4.png);
		}
		#map {
			float: left;
			width: 33%;
			height: 586px;
			background-image: url(img/korea_map.png);
			background-repeat: no-repeat;
			background-size: contain;
		}
		#map div{
			font-family: 한컴 고딕;
			font-weight: bolder;
			float: left;
			background-color: black;
			opacity:0.7;
			border-radius: 100px;
			width: 45px;
			height: 45px;
			line-height: 45px;
			text-align: center;
			position: relative;
/*			border: red outset 7px;*/
			color: white;
			font-size:14px;
		}
		#gw {
			left: 210px;
			top: 80px;
		}
		#su {
			left: 50px;
			top: 115px;
		}
		#ic {
			left: -50px;
			top: 105px
		}
		#gg {
			left: px;
			top: 140px;
		}
		#cb{
			left: -20px;
			top: 190px;
		}
		#cn {
			left: -175px;
			top: 210px;
		}
		#se {
			left: -175px;
			top: 195px;
		}
		#dj {
			left: 120px;
			top: 200px;
		}
		#gb {
			left: 200px;
			top: 200px;
		}
		#dg {
			left: 140px;
			top: 260px;
		}
		#jb {
			left: -30;
			top: 270px;
		}
		#gn {
			left: 20px;
			top: 320px;
		}
		#us {
			left: 75px;
			top: 290px
		}
		#gj {
			left: -190px;
			top: 330px;
		}
		#bs {
			left: 280px;
			top: 290px;
		}
		#jn {
			left: 30px;
			top: 350px;
		}
		#jj {
			left: -35px;
			top: 450px;
		}
		
		.table_header {
			width: 64px;
			height: 64px;
			display: block;
			margin-left: auto;
			margin-right: auto;
		}
		#right_table {
			position: relative;
			top: 50%;
			margin: 0 auto;
			margin-top: -100px;
		}
		#left_table {
			position: relative;
			top: 50%;
			margin: 0 auto;
			margin-top: -100px;
		}
	</style>
</head>
<body>	
	<% 
	// 객체를 생성 하며 초기값을 넣어 준다. 객체를 배열로 관리해도 괜찮을것 같다.
	ArrayList<javabean.City_info> city_list = new ArrayList<javabean.City_info>();
	String city_names[] = {"강원", "서울", "인천", "경기", "충북", "충남", "세종", "대전", "경북", "대구",
	                      "전북", "경남", "울산", "광주", "부산", "전남", "제주"};
	for(int i=0; i<city_names.length; i++){
		city_list.add(new javabean.City_info(city_names[i]));
	}
	%>
	<div id=map_background>
		<script type="text/javascript">
			function City_list(city_name, d_weather, t_weather, rain, humidity, dust, temp, flu, 
								e_disease, asthma, s_disease, uv, f_poison){
				this.city_name = city_name;
				this.d_weather = d_weather;
				this.t_weather = t_weather;
				this.rain = rain;
				this.humidity = humidity;
				this.dust = dust;
				this.temp = temp;
				this.flu = flu;
				this.e_disease = e_disease;
				this.asthma = asthma;
				this.s_disease = s_disease;
				this.uv = uv;
				this.f_poison = f_poison;
			}
			var city_list = [];
			<%for(int i=0; i<city_names.length; i++){%>
				city_list.push({city_name: "<%=city_list.get(i).getCity_name()%>", d_weather: <%=city_list.get(i).getD_weather()%>,
					t_weather:<%=city_list.get(i).getT_weather()%>, rain:<%=city_list.get(i).getRain()%>, humidity:<%=city_list.get(i).getHumidity()%>,
					dust:<%=city_list.get(i).getDust()%>, temp:<%=city_list.get(i).getTemp()%>, flu:<%=city_list.get(i).getFlu()%>, 
					e_disease:<%=city_list.get(i).getE_disease()%>, asthma:<%=city_list.get(i).getAsthma()%>, s_disease:<%=city_list.get(i).getS_disease()%>,
					uv:<%=city_list.get(i).getUv()%>, f_poison:<%=city_list.get(i).getF_poison()%>})
			<%}%>
	

			
			function city_info(cityname){
			/*	result_rigth = "<table border=0 id=right_table><tr><th>오늘날씨</th><th>내일날씨</th><th><img class='table_header' src='img/mapTable_header/drop.png'/>강수량</th></tr>" + 
				"<tr><td>" + city_list[cityname].city_name + "</td><td>" + city_list[cityname].t_weather + "</td><td>" + city_list[cityname].rain + "</td></tr>";
				result_rigth +=  "<tr><th><img class='table_header' src='img/mapTable_header/humidity.png'/>습도</th><th><img class='table_header' src='img/mapTable_header/sand.png'/>미세먼지</th><th><img class='table_header' src='img/mapTable_header/fever.png'/>체감온도</th></tr>" + 
				"<tr><td>" + city_list[cityname].humidity + "</td><td>" + city_list[cityname].dust + "</td><td>" + city_list[cityname].temp + "</td></tr>";
				document.getElementById("right").innerHTML = result_rigth;
				result_left = "<table border='' id=left_table><tr><th><img class='table_header' src='img/mapTable_header/sick.png'/>감기지수</th><th><img class='table_header' src='img/mapTable_header/eye-disease.png'/>눈병지수</th><th><img class='table_header' src='img/mapTable_header/inhaler.png'/>천식지수</th></tr>" + 
				"<tr><td>" + city_list[cityname].flu + "</td><td>" + city_list[cityname].e_disease + "</td><td>" + city_list[cityname].asthma + "</td></tr>";
				result_left +=  "<tr><th><img class='table_header' src='img/mapTable_header/allergic.png'/>피부질환지수</th><th><img class='table_header' src='img/mapTable_header/sunblock.png'/>자외선지수</th><th><img class='table_header' src='img/mapTable_header/apple.png'/>식중독지수</th></tr>" + 
				"<tr><td>" + city_list[cityname].s_disease + "</td><td>" + city_list[cityname].uv + "</td><td>" + city_list[cityname].f_poison + "</td></tr>";
				document.getElementById("left").innerHTML = result_left;*/
				
				result_rigth = "<table border=0 id=right_table><tr><th>오늘날씨</th><th>내일날씨</th><th><img class='table_header' src='img/mapTable_header/drop.png'/>강수량</th></tr>" + 
				"<tr><td>" + city_list[cityname].city_name + "</td><td>" + city_list[cityname].t_weather + "</td><td>" + city_list[cityname].rain + "</td></tr>";
				
				result_rigth +=  "<tr><th>&nbsp</th><th>&nbsp</th><th>&nbsp</th></tr>";
				
				result_rigth +=  "<tr><th><img class='table_header' src='img/mapTable_header/humidity.png'/>습도</th><th><img class='table_header' src='img/mapTable_header/sand.png'/>미세먼지</th><th><img class='table_header' src='img/mapTable_header/fever.png'/>체감온도</th></tr>" + 
				"<tr><td>" + city_list[cityname].humidity + "</td><td>" + city_list[cityname].dust + "</td><td>" + city_list[cityname].temp + "</td></tr>";
				document.getElementById("right").innerHTML = result_rigth;
				
				result_left = "<table border=0 id=left_table><tr><th><img class='table_header' src='img/mapTable_header/sick.png'/>감기지수</th><th><img class='table_header' src='img/mapTable_header/eye-disease.png'/>눈병지수</th><th><img class='table_header' src='img/mapTable_header/inhaler.png'/>천식지수</th></tr>" + 
				"<tr><td>" + city_list[cityname].flu + "</td><td>" + city_list[cityname].e_disease + "</td><td>" + city_list[cityname].asthma + "</td></tr>";
				
				result_left +=  "<tr><th>&nbsp</th><th>&nbsp</th><th>&nbsp</th></tr>";
				
				result_left +=  "<tr><th><img class='table_header' src='img/mapTable_header/allergic.png'/>피부질환지수</th><th><img class='table_header' src='img/mapTable_header/sunblock.png'/>자외선지수</th><th><img class='table_header' src='img/mapTable_header/apple.png'/>식중독지수</th></tr>" + 
				"<tr><td>" + city_list[cityname].s_disease + "</td><td>" + city_list[cityname].uv + "</td><td>" + city_list[cityname].f_poison + "</td></tr>";
				
				document.getElementById("left").innerHTML = result_left;
				
				
			}
		</script>
		
		
		<div id=aside>
			<div id=notice>
			<p>&nbsp</p>
			<em>NOTICE</em>
			
			<h5>2018 춘천마임축제 일정 안내</h5></a2>
			<h5>2018 춘천마임축제 티켓 구매 및 할인 안내</h5>
			<h5>2018 춘천마임축제 티켓 구매 및 할인 안내</h5>
			<h5>2018 춘천마임축제 티켓 구매 및 할인 안내</h5>
			<h5>2018 춘천마임축제 티켓 구매 및 할인 안내</h5>
			<h5>2018 춘천마임축제 티켓 구매 및 할인 안내</h5>
			<h5>2018 춘천마임축제 티켓 구매 및 할인 안내</h5>
			<h5>2018 춘천마임축제 티켓 구매 및 할인 안내</h5>
			<h5>2018 춘천마임축제 티켓 구매 및 할인 안내</h5>
			<h5>2018 춘천마임축제 티켓 구매 및 할인 안내</h5>
			<h5>2018 춘천마임축제 티켓 구매 및 할인 안내</h5>
			<h5>2018 춘천마임축제 티켓 구매 및 할인 안내</h5>
			<h5>2018 춘천마임축제 티켓 구매 및 할인 안내</h5>
			</div>	
		</div>
		

		<div id=map>
			<div id=gw onmouseover="city_info(0);">강원</div>
			<div id=su onmouseover="city_info(1);" onloadeddata="city_info(1);">서울</div>
			<div id=ic onmouseover="city_info(2);">인천</div>
			<div id=gg onmouseover="city_info(3);">경기</div>
			<div id=cb onmouseover="city_info(4);">충북</div>
			<div id=cn onmouseover="city_info(5);">충남</div>
			<div id=se onmouseover="city_info(6);">세종</div>
			<div id=dj onmouseover="city_info(7);">대전</div>
			<div id=gb onmouseover="city_info(8);">경북</div>
			<div id=dg onmouseover="city_info(9);">대구</div>
			<div id=jb onmouseover="city_info(10);">전북</div>
			<div id=gn onmouseover="city_info(11);">경남</div>
			<div id=us onmouseover="city_info(12);">울산</div>
			<div id=gj onmouseover="city_info(13);">광주</div>
			<div id=bs onmouseover="city_info(14);">부산</div>
			<div id=jn onmouseover="city_info(15);">전남</div>
			<div id=jj onmouseover="city_info(16);">제주</div>
		</div>
		<div id=right></div>
		<!-- <div id=blank></div> -->
		<div id=left></div>
	</div>
</body>
</html>