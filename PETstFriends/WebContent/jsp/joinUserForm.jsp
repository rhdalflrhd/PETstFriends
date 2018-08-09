<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="joinUser.do">
${msg }
<table>
<tr>
<td>아이디</td>
<td><input type="text" name="user_id"></td>
</tr>
<tr>
<td>비밀번호</td>
<td><input type="password" name="user_pw" ></td>
</tr>
<tr>
<td>비밀번호</td>
<td><input type="password" name="user_pwc"></td>
</tr>
<tr>
<td>이름</td>
<td><input type="text" name="user_name"></td>
</tr>
<td>닉네임</td>
<td><input type="text" name="user_nickname"></td>
</tr>
<td>프로필</td>
<td><input type="text" name="user_proPic"></td>
</tr>
<tr>
<td>이메일</td>
<td><input type="text" name="user_email"></td>
</tr>
<tr>
<td>전화번호</td>
<td><input type="text" name="user_phone"></td>
</tr>
<tr>
<td>반려동물 유무</td>
<td><input type="radio" value="1" name="user_havePet">유 
<input type="radio" value="0" name="user_havePet" >무
</td>
</tr>
<tr><td style="height: 3px"></td></tr>
<tr>
<td colspan="2" align="center"><input type="submit" value="가입하기" style="width:80px;height:28px; background-color: #FFE6E6; border: 1 solid white">
<input type="reset" value="다시입력"
style="width:80px;height:28px; background-color: #FFE6E6; border: 1 solid white">
<input type="button" value="뒤로가기" onclick="location.href='main.do'"
	style="width:80px;height:28px; background-color: #FFE6E6; border: 1 solid white">
</td>
</tr>
</table>


</form>

</body>
</html>