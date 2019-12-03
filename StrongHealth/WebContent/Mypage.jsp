<%@page import="javabean.Survey"%>
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
<!-- Step 1) Load D3.js -->
<script src="https://d3js.org/d3.v5.min.js"></script>
<!-- Step 2) Load billboard.js with style -->
<script src="billboard.js"></script>
<!-- Load with base style -->
<link rel="stylesheet" href="billboard.css">
<!-- Or load different theme style -->
<link rel="stylesheet" href="insight.css">
</head>
<body>
<style>


	#box {
	padding: 0px;
	margin: 0px;
	width: 530px;
	display: inline-block;
	vertical-align: middle;
	}
	/*
	#mypageContent{
	width:1080px;
	background: #FFEAEA;
	}
	
	#CategoryAxis table{
	
	
	}
	#CategoryAxis th,td{
	border-bottom: 1px solid #A6A6A6;
	padding: 5px;
	border-collapse: collapse;
	}
*/
</style>

<%
	request.setCharacterEncoding("EUC-KR");
	if(session.getAttribute("id") == null){
		out.println("<script>");
		out.println("alert('로그인한 사용자만 이용할 수 있습니다.')");
		out.println("location.href ='Container.jsp'");
		out.println("</script>");
	}
	
	int day = -7;
	Access_DB ac  = new Access_DB();
	ArrayList<Survey> sl = ac.getSurveys((String)session.getAttribute("id"), day);
	ArrayList<Survey> slm = ac.getSurveyMean(sl);
	ArrayList<Survey> sla = ac.getSurveysAll(day);
	if(sla != null){
		sla = ac.getSurveyMean(sla);
	}

%>

<h1><em>Mypage</em></h1>
<div id='box'>
<div id="GaugeChart"></div></div>
<div id='box'>
<div id="radar"></div></div>
<br><br>
<br><br>
<div id="CategoryAxis"></div>


<%
	if(session.getAttribute("authority") != null){
		if(sla != null){
			if(!session.getAttribute("authority").equals("member")){
				out.println("<h3>최근 " + Math.abs(day) + "일 간의 평균 회원 정보</h3>");
				String table = "<table class='table table-striped'><tr><td>아이디</td><td>이름</td><td>주소</td><td>핸드폰번호</td><td>이메일</td><td>운동</td><td>식습관</td><td>음주</td><td>흡연</td><td>스트레스</td><td>합계</td><td>비고</td></tr>";
				for(int i=0; i< sla.size(); i++){
					Survey sr = sla.get(i);
					table += "<tr><td>" + sr.getId() + "</td><td>" + ac.getIdToName(sr.getId()) + "</td><td>" + ac.getIdToAddress(sr.getId()) + "</td><td>"  + ac.getIdToPhone(sr.getId()) + "</td><td>" + 
							 ac.getIdToEmail(sr.getId()) + "</td><td>" + sr.getScore0() + "</td><td>" + sr.getScore1() + "</td><td>" + sr.getScore2() + "</td><td>" + sr.getScore3() + "</td><td>" + sr.getScore4() +
							 "</td><td>" + sr.getScore_sum() + "</td><td>";
					if(sr.getScore_sum() >= 20)
						table += "<img style='width: 20px; height: 20px;' src='img/mypage/green_light.png'></td></tr>";
					else if(sr.getScore_sum() >= 15)
						table += "<img style='width: 20px; height: 20px;' src='img/mypage/yellow_light.png'></td></tr>";
					else
						table += "<img style='width: 20px; height: 20px;' src='img/mypage/red_light.png'></td></tr>";
				}
				table += "</table>";
				out.println(table);
			}	
		}
	}
%>
<p>&nbsp</p>
</body>

<script>
var chart = bb.generate({
	  data: {
	    columns: [
		["합계", <%
		 		out.println((slm != null? slm.get(0).getScore_sum() : 0) * 4);
				out.println();
		 %>]
	    ],
	    type: "gauge",
	    onclick: function(d, i) {
		console.log("onclick", d, i);
	   },
	    onover: function(d, i) {
		console.log("onover", d, i);
	   },
	    onout: function(d, i) {
		console.log("onout", d, i);
	   }
	  },
	  gauge: {
		  label: {
			  format: function (value, ratio) {return value >= 80 ? ("건강\n" + (value/4) + "점") : value >= 60 ? ("관심\n" + (value/4) + "점") : ("주의\n" + (value/4) + "점");},
			  extents: function (value, isMax) {return (isMax ? "25점" : "0점");}
		  }
	  },
	  color: {
	    pattern: [
	      "#FF0000",
		  "#FFFF00",
		  "#00FF00",
	    ],
	    threshold: {
	      values: [
	        60,
	        80,
	        100
	      ]
	    }
	  },
	  size: {
		    height: 250
		},
	  bindto: "#GaugeChart"
	});
	
var chart = bb.generate({
  data: {
    columns: [
    	<%
		String data = "['합계', ";
		
		for(int i=0; i<sl.size(); i++){
			Survey sr = sl.get(i);
			data += sr.getScore_sum() + ", ";
		}
		data += "]";
		out.println(data);
		%>
    ]
  },
  axis: {
    x: {
      type: "category",
      categories: [
      	<%
			for(int i=0; i<sl.size(); i++){
				Survey sr = sl.get(i);
				String ca = "";
				ca += "'" + sr.getDate().substring(5,7) + "월 " +  sr.getDate().substring(8,10) + "일', ";
				out.println(ca);
			}
		%>
      ]
    },
    y: {
    	max: 24,
    	min: 1
    }
  },
  size: {
	  width: 1080
  },
  bindto: "#CategoryAxis"
});


var chart = bb.generate({
    bindto: "#radar",
    data: {
        type: "radar",
        x: "x",
        columns: [
        	["x", "운동", "식습관", "음주", "흡연", "스트레스"],
        	<%
        		for(int i=0; i<sl.size(); i++){
        			Survey sr = sl.get(i);
        			String row = "";
        			row +="['" + sr.getDate().substring(5,7) + "월 " +  sr.getDate().substring(8,10) + "일" +"', " + sr.getScore0() + ", " + sr.getScore1() + ", " + sr.getScore2() + ", " + sr.getScore3() + ", " + sr.getScore4() + "],";
        			out.println(row);
        		}
        	
        	%>
        ]
    },
    radar: {
        axis: {
          max: 5
        },
        level: {
          depth: 5
        }
      }
});
</script>

</html>