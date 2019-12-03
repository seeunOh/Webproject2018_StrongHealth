<%@page import="javabean.Access_DB"%>
<%@page import="javabean.Weather"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>



body{
width:1080px;
text-align:center;
}

#Maside{
height:100px;
width:190px;
font-size:25px;
background: #FF9595;
float:left;
color:white;
}

#weatherCanvas{
width:890px;
height:;
background: ;
float:right;
}


		#lifeCanvas{
		float:right;
		width:500px;
		height:386px;
		background-color: ;
		margin: 100px 0px 0px 0px;
		}
		
		#up { 
			float: left;
			width:500px;
			height: 160px;
			background-color: ;
			float:right;

		}
		#down {
			float: right;
			width: 500px;
			height: 170px;
			background-color: ;
		}
		#map {
			float: left;
			width:356px;
			height: 586px;
			background-image: url(img/korea_map.png);
			background-repeat: no-repeat;
			background-size: contain;
		}
		#map div{
			font-family: 굴림;
			font-weight: bolder;
			float: left;
			background-color: black;
			opacity: 0.7;
			border-radius: 100px;
			width: 45px;
			height: 45px;
			line-height: 45px;
			text-align: center;
			position: relative;
			color: white;
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
		margin: 0px;
		padding: 0px;
		width: 60px;
		height: 60px;
	}
	</style>
</head>
<body>
<div id=Maside>
	<p>오늘의 건강</p>
	</div>
	<% 
	ArrayList<javabean.Weather> city_list = new ArrayList<javabean.Weather>();
	Access_DB ac = new Access_DB();
	String city_names[] = {"강원", "서울", "인천", "경기", "충북", "충남", "세종", "대전", "경북", "대구",
	                      "전북", "경남", "울산", "광주", "부산", "전남", "제주"};

	for(int i=0; i< city_names.length; i++){
		city_list.add(ac.getWeather(city_names[i]));
	}
	ac.closeDB();
	%>
	<script type="text/javascript">
		function City_list(city_name, d_weather, t_weather, rain, humidity, dust, temp, flu, 
							e_disease, asthma, s_disease, frozen, f_poison){
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
					this.frozen = frozen;
					this.f_poison = f_poison;
				}
			var city_list = [];
	
			<%for(int i=0; i<city_names.length; i++){%>
				city_list.push(new City_list('<%=city_list.get(i).getCityName()%>', '<%=city_list.get(i).getdWeather()%>', '<%=city_list.get(i).gettWeahter()%>',
				<%=city_list.get(i).getPop()%>, <%=city_list.get(i).getHumidity()%>, <%=city_list.get(i).getDust()%>, <%=city_list.get(i).getSensory()%>, 
				'<%=city_list.get(i).getFlu()%>', '<%=city_list.get(i).getEyeDisease()%>', '<%=city_list.get(i).getAsthma()%>', '<%=city_list.get(i).getSkinDisease()%>',
				<%=city_list.get(i).getFrozen()%>, '<%=city_list.get(i).getFoodPoison()%>'));
			<%}%>
		
			function city_info(cityname){
				result = "<table class='table' style='width: 450px;' id=top_table><tr><td colspan='6'><h2>" + city_list[cityname].city_name + " 지역의 날씨 정보</h2></td></tr><tr><td>";
				if(city_list[cityname].d_weather == "맑음")
					result += "<img class='table_header' src='img/weather/sunny.png'>";
				else if(city_list[cityname].d_weather == "구름조금")
					result += "<img class='table_header' src='img/weather/cloudy1.png'>";
				else if(city_list[cityname].d_weather == "구름많음")
					result += "<img class='table_header' src='img/weather/cloudy2.png'>";
				else if(city_list[cityname].d_weather == "흐림")
					result += "<img class='table_header' src='img/weather/cloudy3.png'>";
				else if(city_list[cityname].d_weather == "비")
					result += "<img class='table_header' src='img/weather/rainy.png'>";
				else if(city_list[cityname].d_weather == "눈/비")
					result += "<img class='table_header' src='img/weather/rainy&snowy.png'>";
				else if(city_list[cityname].d_weather == "눈")
					result += "<img class='table_header' src='img/weather/snowy.png'>";
					result +="</td><td>";
				if(city_list[cityname].t_weather == "맑음")
					result += "<img class='table_header' src='img/weather/sunny.png'>";
				else if(city_list[cityname].t_weather == "구름조금")
					result += "<img class='table_header' src='img/weather/cloudy1.png'>";
				else if(city_list[cityname].t_weather == "구름많음")
					result += "<img class='table_header' src='img/weather/cloudy2.png'>";
				else if(city_list[cityname].t_weather == "흐림")
					result += "<img class='table_header' src='img/weather/cloudy3.png'>";
				else if(city_list[cityname].t_weather == "비")
					result += "<img class='table_header' src='img/weather/rainy.png'>";
				else if(city_list[cityname].t_weather == "눈/비")
					result += "<img class='table_header' src='img/weather/rainy&snowy.png'>";
				else if(city_list[cityname].t_weather == "눈")
					result += "<img class='table_header' src='img/weather/snowy.png'>";
					
				result +="</td><td><img class='table_header' src='img/mapTable_header/drop.png'/></td><td><img class='table_header' src='img/mapTable_header/humidity.png'/></td>" 
					+ "<td><img class='table_header' src='img/mapTable_header/sand.png'/></td><td><img class='table_header' src='img/mapTable_header/fever.png'/></td></tr>" 
					+ "<tr><td><b>오늘날씨</b></td><td><b>내일날씨</b></td><td><b>강수량</b></td><td><b>습도</b></td><td><b>미세먼지</b></td><td><b>체감온도</b></td></tr>" 
					+ "<tr><td>" + city_list[cityname].d_weather + "</td><td>" + city_list[cityname].t_weather + "</td><td>" + city_list[cityname].rain + "</td><td>" + city_list[cityname].humidity + "</td><td>" 
					+ city_list[cityname].dust + "</td><td>" + city_list[cityname].temp + "</td></tr>"
					+ "<tr><td colspan='6'><h2>" + city_list[cityname].city_name + " 지역의 생활지수 정보</h2></td></tr><tr><td><img class='table_header' src='img/mapTable_header/sick.png'/></td><td><img class='table_header' src='img/mapTable_header/eye-disease.png'/></td><td><img class='table_header' src='img/mapTable_header/inhaler.png'/></td>"
					+ "<td><img class='table_header' src='img/mapTable_header/allergic.png'/></td><td><img class='table_header' src='img/mapTable_header/apple.png'/></td><td><img class='table_header' src='img/mapTable_header/frozen.png'/></td></tr>" 
					+ "<tr><td><b>감기</b></td><td><b>눈병</b></td><td><b>천식</b></td><td><b>피부질환</b></td><td><b>식중독</b></td><td><b>동파</b></td></tr>"
					+ "<tr><td>" + city_list[cityname].flu + "</td><td>" + city_list[cityname].e_disease + "</td><td>" + city_list[cityname].asthma + "</td><td>" + city_list[cityname].s_disease + "</td><td>" + city_list[cityname].f_poison + "</td><td>" + city_list[cityname].frozen + "</td></tr>";
				document.getElementById("lifeCanvas").innerHTML = result;
			}
		</script>
		
		<div id=weatherCanvas>
		<div id=map>
			<div id=gw onmouseover="city_info(0);">강원</div>
			<div id=su onmouseover="city_info(1);">서울</div>
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
		
		<div id=lifeCanvas></div>
		</div>
		
		<img src="img/clothes.png" width=380 height=500>
		<img src="img/clothes2.png" width=380 height=500>
		</div>
		
		<script>
			city_info(1);
		</script>
</body>
</html>