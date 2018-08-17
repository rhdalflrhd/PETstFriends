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
			<b><font color="gray">PW찾기</font></b>
		</h1>

		<h2>이메일 인증</h2>
		회원가입 시 등록한 이메일주소와 동일하여야 <br> 인증번호를 받을 수 있습니다. <br>
		
		<table>
			<tr>
				<td style="height: 3px"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button id=idFindBtn onclick="location.href='idFindForm.do'"
						style="width: 100px; height: 28px; background-color: #FFE6E6; border: 1 solid white">아이디찾기</button>
					<button id=pwFindBtn onclick="location.href='pwFindForm.do'"
						style="width: 100px; height: 28px; background-color: #FFE6E6; border: 1 solid white">비밀번호찾기</button>
				</td>
			</tr>
		</table>
		
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" id="user_id" name="user_id"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" id="user_name" name="user_name"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="user_email" id="user_email">
					
			</tr>
			
		</table>

		<table>
			<tr>
				<td style="height: 3px"></td>
			</tr>
			<tr>
				<td colspan="4" align="center">

					<button id=findBtn
						style="width: 80px; height: 28px; background-color: #FFE6E6; border: 1 solid white">확인</button>
				</td>
			</tr>
		</table>

	</center>
</body>
</html>