<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- �ΰ����� �׸� -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
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
		out.println("alert('�α����� ����ڸ� �̿��� �� �ֽ��ϴ�.')");
		out.println("location.href ='Container.jsp'");
		out.println("</script>");
	}
%>
<div id=aside><p style='margin:30px 0px 0px 0px;'>������</p>
</div>
<div id=surveyContent>
<img src="img/survey.png" width=80 height=80/>
<form action="Survey_handle.jsp" method="post">
<%
	String question[][] ={{"1. ��� Ȱ������ �ȱ�, ������Ÿ��, ��� �� ��Ģ���� ��� �Ѵ�.", "2. ���� 30�� �̻� ��� �Ѵ�.", "3. ����� ������ Ȱ������ ���̴�.", "4. ����� ������ Ȱ������ ���̴�.", "5. ���� ü���� �����Ϸ��� ����Ѵ�."},
						{"1. ���� ��Ģ���� ��ħ�� �Դ´�.", "2. �Ļ�� ������ ���緮�� �Դ´�.", "3. �� �ҹ� ���ٴ� ������ ��� �Դ´�.", "4. ������ ���� �Դ´�.", "5. �ż��� ��ä�� ���� �Դ´�."},
						{"1. ���� �����Ͽ� 3�� ���Ϸ� ���Ŵ�.", "2. ���� �ѹ� ���ø� 5�� ���Ϸ� ���Ŵ�.", "3. ���� ������ �ϻ��Ȱ�� ������ �������� ����.", "4. ���� ���ŰͿ� ���� ��ȸ�� ���� ����.", "5. ���� ���Ƕ� ��ӿ� ������ �ʴ´�."},
						{"1. ��踦 �Ϸ翡 10���� ���Ϸ� �ǿ��.", "2. ����� 1�ð� �̳��� ��踦 �ǿ��� �ʴ´�.", "3. �ݿ��������� ���� ���� ���� ����.", "4. ��踦 ���������� �ǿ��� �ʴ´�.", "5. ���� ��谡 ��� �ֺ������ ��踦 ���� �ǿ����� ����."},
						{"1. �ֱ� �ſ� ����ǰų� �Ҿ����� �ʴ�.", "2. ����� �Ϸ� ����� ������� �ʴ´�.", "3. ����� �Ͽ� �Ű��������� �ʴ�.", "4. �Ҹ�, ����°��� ������ �ʴ´�.", "5. ȭ�� ���� �ڽ��� ������ ������ �� ����."}};
	String item[] = {"�", "�Ľ���", "����", "��", "��Ʈ����"};


	for(int i=0; i<question.length; i++){
		String row= "<p><details><summary>" + item[i] + "</summary><table>";
		for(int j=0; j<question[i].length; j++){
			row += "<tr><td width=550>" + question[i][j] + "</td>";
			row += "<td><label><input type='radio' id='sur"+i + "_" + j + "' name='sur"+i + "_" + j + "' value='1' required>��</label>&nbsp;&nbsp;&nbsp;<label><input type='radio' id='sur"+i + "_" + j + "' name='sur"+i + "_" + j + "' value='0'>�ƴϿ�</label></td></tr>";
		}
		row+="</table></details></p>";
		out.println(row);
	}
%>
<textarea rows="4" class="form-control" name="text" id="text" style="margin-left: 10%; width:80%; height:100%" placeholder="Ư�̻����̳� ���ް� ���� ������ �ִٸ� ���⿡�����ּ���!! �� ����Ʈ�� ���Ե� �ǰ�������е��� �亯�� �帲�ϴ�."></textarea>
<input type="submit" value="����" class="btn btn-success">
<input type="reset" value="�ʱ�ȭ" class="btn btn-warning">
</form>
</div>
</body>
</html>