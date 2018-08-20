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


</script>
</head>
<body>
	<center>
		<h1>
			<b><font color="gray">ID확인</font></b>
		</h1>

		<h2>~~회원님</h2>
		${user_name }
		
		
		
	
<table>
			<tr>
				<td style="height: 3px"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button onclick="location.href='loginForm.do'"
						style="width: 100px; height: 28px; background-color: #FFE6E6; border: 1 solid white">로그인하기</button>
					<button id=pwFindBtn onclick="location.href='pwFindForm.do'"
						style="width: 100px; height: 28px; background-color: #FFE6E6; border: 1 solid white">비밀번호찾기</button>
				</td>
			</tr>
		</table>
		<span id="user_idList"></span>

	</center>
</body>
</html>