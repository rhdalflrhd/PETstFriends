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

	




	}) //����
</script>
</head>
<body>
	<center>
		<h1>
			<b><font color="gray">ID/PWã��</font></b>
		</h1>
		
		<h2>�̸��� ����</h2>
		ȸ������ �� ����� �̸����ּҿ� �����Ͽ��� ������ȣ�� 
		���� �� �ֽ��ϴ�.

		<table>
			<tr>
				<td>�̸�</td>
				<td><input type="text" id="user_name" name="user_name"></td>
			</tr>
			<tr>
					<td>�̸���</td>
					<td><input type = "text"   name  = "user_email"   id ="user_email">
						<button type="button" id="auth_btn">�����ϱ�</button>
						 <span id = "email"></span><br>
						
						</tr>
						<tr>
						<td>������ȣ</td>
						<td><input type="text" id="user_authNum" name="user_authNum" >
							<button type="button" id="auth_btn2">Ȯ��</button>
							 <span id = "lab1"></span>
						</td>
		</table>

		<table>
			<tr>
				<td style="height: 3px"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">

					<button id=loginBtn
						style="width: 80px; height: 28px; background-color: #FFE6E6; border: 1 solid white">�α���</button>
					<button onclick="location.href='joinUserForm.do'"
						style="width: 80px; height: 28px; background-color: #FFE6E6; border: 1 solid white">ȸ������</button>
					<button onclick="location.href='main.do'"
						style="width: 80px; height: 28px; background-color: #FFE6E6; border: 1 solid white">����</button>

				</td>
				
		
			</tr>

		</table>
		<table>
		<tr>
				<td style="height: 3px"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
		
		<button onclick="location.href='user_idpwFind.do'"
						style="width: 90px; height: 28px; background-color: #FFE6E6; border: 1 solid white">ID/PWã��</button>
		
		
		</td>
		</tr>
		
		</table>
	</center>
</body>
</html>