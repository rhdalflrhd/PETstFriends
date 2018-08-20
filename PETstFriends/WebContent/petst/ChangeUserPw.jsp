<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
		<h1>
			<b><font color="gray">PW찾기</font></b>
		</h1>

		<h2>새로운 비밀번호로 변경하세요!</h2>
		- 비밀번호는 8~20자의 영문소문자, 숫자, 특수문자를 조합하여 사용 할 수 있습니다. <br>
		- 특수문자를 추가하여 비밀번호를 사용하시면 비밀번호의 안전도가 높아져요. <br>

<!-- 			--------------------------------------------------------------- -->
<br>
<table>
			<tr>
				<td>새 비밀번호</td>
				<td><input type="text" id="user_pass" name="user_pass"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="text" name="user_pass2" id="user_pass2">
			</tr>
			</table>

<!-- 			--------------------------------------------------------------- -->
			<table>
			<tr>
				<td style="height: 3px"></td>
			</tr>
			<tr>
				<td colspan="4" align="center">

					<button  onclick="location.href='loginForm.do'"
						style="width: 100px; height: 28px; background-color: #FFE6E6; border: 1 solid white">확인</button>
				</td>
			</tr>
		
</table>
</center>
</body>
</html>