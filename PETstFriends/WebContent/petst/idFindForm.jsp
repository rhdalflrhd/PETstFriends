<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">

	$(document).ready(function() {

		
		//-------------------------------------------------------------------------------------
		//�̸�������
		$(function () {
			   var chk = -1;
			$("#auth_btn").click(function () {   // �̸��� ���� �ޱ� 
			    var authNum = "";
			    
			    $.ajax({
			    	method : 'GET',
			    	url : "emailAuth.do",
			        data : {
			        	
			        	user_email : $('#user_email').val()
			        	
			        },
			        success : function (str) {
			            authNum = str;
			            alert("������ȣ ���ۿϷ�.");
//			             alert(authNum);
			            
			            $('#auth_btn2').click(function(){
			            	
			            
			            if( $('#user_authNum').val()==authNum){
			                alert("�����Ϸ�");
			                $("#lab1").html("�����Ϸ�");
			            }else{
			                alert("��������");
			                $("#lab1").html("<label>��������</label>");
			            }
			            
			        });
			         }
			    
			});
			});
			});
	




	}) //����
</script>
</head>
<body>
	<center>
		<h1>
			<b><font color="gray">IDã��</font></b>
		</h1>

		<h2>�̸��� ����</h2>
		ȸ������ �� ����� �̸����ּҿ� �����Ͽ��� <br> ������ȣ�� ���� �� �ֽ��ϴ�. <br>
		
		<table>
			<tr>
				<td style="height: 3px"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button id=idFindBtn
						style="width: 100px; height: 28px; background-color: #FFE6E6; border: 1 solid white">���̵�ã��</button>
					<button id=pwFindBtn onclick="location.href='pwFindForm.do'"
						style="width: 100px; height: 28px; background-color: #FFE6E6; border: 1 solid white">��й�ȣã��</button>
				</td>
			</tr>
		</table>
		
		<table>
			<tr>
				<td>�̸�</td>
				<td><input type="text" id="user_name" name="user_name"></td>
			</tr>
			<tr>
				<td>�̸���</td>
				<td><input type="text" name="user_email" id="user_email">
					<button type="button" id="auth_btn">�����ϱ�</button> <span id="email"></span><br>
			</tr>
			<tr>
				<td>������ȣ</td>
				<td><input type="text" id="user_authNum" name="user_authNum">
					<button type="button" id="auth_btn2">Ȯ��</button> <span id="lab1"></span>
				</td>
		</table>

		<table>
			<tr>
				<td style="height: 3px"></td>
			</tr>
			<tr>
				<td colspan="4" align="center">

					<button id=findBtn
						style="width: 80px; height: 28px; background-color: #FFE6E6; border: 1 solid white">Ȯ��</button>
				</td>
			</tr>
		</table>

	</center>
</body>
</html>