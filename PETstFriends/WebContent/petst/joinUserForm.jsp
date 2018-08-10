<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function() {

	$('#user_id').blur(function() { //닉네임 중복 검사
		$.ajax({
			method : 'GET',
			url : 'idCheck.do',
			data : {
				user_id : $('#user_id').val()
			},
			success : function(result) {
				alert("와라");
				if (result == true) {
					$('#user_idResult').html('사용가능한 id입니다.'); alert("좀 와라")
				} else {
					$('#user_idResult').html('사용 불가한 id입니다.');
					$(this).focus();
				}
			},
			error : function(xhrReq, status, error) {
				alert(error)
			}
		});
	});
});

//-----------------
	$('#user_nickname').blur(function() { //닉네임 중복 검사
		$.ajax({
			method : 'GET',
			url : 'NnCheck.do',
			data : {
				user_nickname : $('#user_nickname').val()
			},
			success : function(result) {
				alert("와라");
				if (result == true) {
					$('#user_nicknameResult').html('사용가능한 닉네임입니다.'); alert("좀 와라")
				} else {
					$('#user_nicknameResult').html('사용 불가한 닉네임입니다.');
					$(this).focus();
				}
			},
			error : function(xhrReq, status, error) {
				alert(error)
			}
		});
	});


</script>
</head>
<body>
	<center>
		<h1>
			<b><font color="gray">회원가입</font></b>
		</h1>
		<form action="">

			<b><font color="gray">${msg }</font></b>
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" id="user_id">
				<span id='user_idResult'></span>
						<input type="hidden" value="uncheck" id="user_idChecked">
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" id="user_pass"></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" id="user_pass2"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" id="user_name"></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input type="text" id="user_nickname">
						<span id='user_nicknameResult'></span><input
						type="hidden" value="uncheck" id="user_nicknameChecked"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" id="user_email">
						<button id="user_emailMult">중복확인</button> <span
						id='user_emailResult'></span><input type="hidden" value="uncheck"
						id="user_emailChecked"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" id="user_phone"></td>
				</tr>
				<tr>
					<td>반려동물 유무</td>
					<td><input type="radio" value="1" name="user_havePet">유
						<input type="radio" value="0" name="user_havePet">무</td>
				</tr>
				<tr>
					<td style="height: 3px"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button id=joinUser
							style="width: 80px; height: 28px; background-color: #FFE6E6; border: 1 solid white">가입하기</button>
						<input type="reset" value="다시입력"
						style="width: 80px; height: 28px; background-color: #FFE6E6; border: 1 solid white">
						<input type="button" value="뒤로가기"
						onclick="location.href='main.do'"
						style="width: 80px; height: 28px; background-color: #FFE6E6; border: 1 solid white">
					</td>
				</tr>
			</table>


		</form>
	</center>
</body>
</html>