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

	




	}) //레디
</script>
</head>
<body>
	<center>
		<h1>
			<b><font color="gray">ID/PW찾기</font></b>
		</h1>
		
		<h2>이메일 인증</h2>
		회원가입 시 등록한 이메일주소와 동일하여야 인증번호를 
		받을 수 있습니다.

		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" id="user_name" name="user_name"></td>
			</tr>
			<tr>
					<td>이메일</td>
					<td><input type = "text"   name  = "user_email"   id ="user_email">
						<button type="button" id="auth_btn">인증하기</button>
						 <span id = "email"></span><br>
						
						</tr>
						<tr>
						<td>인증번호</td>
						<td><input type="text" id="user_authNum" name="user_authNum" >
							<button type="button" id="auth_btn2">확인</button>
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
						style="width: 80px; height: 28px; background-color: #FFE6E6; border: 1 solid white">로그인</button>
					<button onclick="location.href='joinUserForm.do'"
						style="width: 80px; height: 28px; background-color: #FFE6E6; border: 1 solid white">회원가입</button>
					<button onclick="location.href='main.do'"
						style="width: 80px; height: 28px; background-color: #FFE6E6; border: 1 solid white">메인</button>

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
						style="width: 90px; height: 28px; background-color: #FFE6E6; border: 1 solid white">ID/PW찾기</button>
		
		
		</td>
		</tr>
		
		</table>
	</center>
</body>
</html>