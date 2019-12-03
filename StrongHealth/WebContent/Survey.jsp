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


<style>

body{
width:1080px;
text-align:center;
}

#aside{
height:100px;
width:180px;
font-size:28px;
background: #FF9595;
float:left;
color:white;
}

#surveyContent{
float:right;
width:900px;
heigth:500px;
background:#FFEAEA;
}
#surveyContent table{
text-align:left;
margin:0px 0px 0px 120px;
}


</style>



</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
	if(session.getAttribute("id") == null){
		out.println("<script>");
		out.println("alert('로그인한 사용자만 이용할 수 있습니다.')");
		out.println("location.href ='Container.jsp'");
		out.println("</script>");
	}
%>
<div id=aside><p style='margin:30px 0px 0px 0px;'>설문지</p>
</div>
<div id=surveyContent>
<img src="img/survey.png" width=80 height=80/>
<form action="Survey_handle.jsp" method="post">
<%
	String question[][] ={{"1. 평소 활기차게 걷기, 자전거타기, 등산 등 규칙적인 운동을 한다.", "2. 매일 30분 이상 운동을 한다.", "3. 당신의 직업은 활동적인 편이다.", "4. 당신의 직업은 활동적인 편이다.", "5. 일정 체중을 유지하려고 노력한다."},
						{"1. 매일 규칙적인 아침을 먹는다.", "2. 식사는 언제나 적당량을 먹는다.", "3. 흰 쌀밥 보다는 잡곡밥을 즐겨 먹는다.", "4. 과일을 매일 먹는다.", "5. 신선한 야채를 매일 먹는다."},
						{"1. 술을 일주일에 3번 이하로 마신다.", "2. 술을 한번 마시면 5잔 이하로 마신다.", "3. 음주 때문에 일상생활에 지장을 받은적이 없다.", "4. 술을 마신것에 대해 후회한 적이 없다.", "5. 술을 마실때 빈속에 마시지 않는다."},
						{"1. 담배를 하루에 10개비 이하로 피운다.", "2. 기상후 1시간 이내에 담배를 피우지 않는다.", "3. 금연구역에서 흡연을 참는 것이 쉽다.", "4. 담배를 습관적으로 피우지 않는다.", "5. 당장 담배가 없어도 주변사람의 담배를 빌려 피운적이 없다."},
						{"1. 최근 매우 긴장되거나 불안하지 않다.", "2. 사소한 일로 기분이 동요되지 않는다.", "3. 사소한 일에 신경질적이지 않다.", "4. 소모감, 무기력감을 느끼지 않는다.", "5. 화가 나면 자신의 감정을 억제할 수 없다."}};
	String item[] = {"운동", "식습관", "음주", "흡연", "스트레스"};


	for(int i=0; i<question.length; i++){
		String row= "<p><details><summary>" + item[i] + "</summary><table>";
		for(int j=0; j<question[i].length; j++){
			row += "<tr><td width=550>" + question[i][j] + "</td>";
			row += "<td><label><input type='radio' id='sur"+i + "_" + j + "' name='sur"+i + "_" + j + "' value='1' required>예</label>&nbsp;&nbsp;&nbsp;<label><input type='radio' id='sur"+i + "_" + j + "' name='sur"+i + "_" + j + "' value='0'>아니오</label></td></tr>";
		}
		row+="</table></details></p>";
		out.println(row);
	}
%>
<textarea rows="4" class="form-control" name="text" id="text" style="margin-left: 10%; width:80%; height:100%" placeholder="특이사항이나 상담받고 싶은 내용이 있다면 여기에적어주세요!! 본 사이트에 가입된 건강관리사분들이 답변을 드림니다."></textarea>
<input type="submit" value="제출" class="btn btn-success">
<input type="reset" value="초기화" class="btn btn-warning">
</form>
</div>
</body>
</html>