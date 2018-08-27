<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Rubel Miah">
<link rel="shortcut icon" href="./assets/images/favicon.png">

<title>로그인</title>

<link rel="stylesheet" href="./assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./assets/css/font-awesome.min.css">
<link rel="stylesheet" href="./assets/css/animate.min.css">
<link rel="stylesheet" href="./assets/css/owl.carousel.css">
<link rel="stylesheet" href="./assets/css/owl.theme.css">
<link rel="stylesheet" href="./assets/css/slicknav.css">
<link rel="stylesheet" href="./assets/style.css">
<link rel="stylesheet" href="./assets/css/responsive.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

<style type="text/css">
.login-form {
	width: 400px;
	margin: 20px auto;
}

.login-form form {
	margin-bottom: 15px;
	background: #f7f7f7;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}

.login-form h2 {
	margin: 0 0 15px;
}

.login-form .hint-text {
	color: #777;
	padding-bottom: 20px;
	text-align: center;
}

.form-control, .btn {
	min-height: 40px;
	border-radius: 2px;
}

.login-btn {
	font-size: 15px;
	font-weight: bold;
}

.or-seperator {
	margin: 20px 0 10px;
	text-align: center;
	border-top: 1px solid #ccc;
}

.or-seperator i {
	padding: 0 10px;
	background: #f7f7f7;
	position: relative;
	top: -11px;
	z-index: 1;
}

.social-btn .btn {
	margin: 10px;
	font-size: 15px;
	text-align: center;
	line-height: 24px;
	width: 250px;
	height: 40px;
}

.social-btn .btn i {
	float: left;
	margin: 4px 15px 0 5px;
	min-width: 20px;
}

.input-group-addon .fa {
	font-size: 20px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {

	$('#loginBtn').click(function() {

		$.ajax({
			type : "POST",
			url : "login.do",
			data : {
				"user_id" : $('#user_id').val(),
				"user_pass" : $('#user_pass').val()
			},
			success : function(result) {
				if (result == true) {
					alert("로그인성공");
					window.location.href = "main.do";
				} else {
					alert("로그인실패");
				}
			},
			error : function(jqXHR, exception) {
		alert(error)
			}
		}) //ajax



	}) //로그인버튼




}) //레디


</script>
</head>
<body>
	<center>
		<%@ include file="/petst/header.jsp"%>

		<h1>
			<b><font color="gray">게시글 쓰기</font></b>
		</h1>
		<form action="WriteFreeBoard.do" enctype="multipart/form-data" method="post">
			<table>
				<tr>
					<td>제목 :</td>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<td style="height: 2px;"></td>
				</tr>
				<tr>
					<td>비번 :</td>
					<td><input type="password" name="pass"></td>
				</tr>
				<tr>
					<td style="height: 2px;"></td>
				</tr>
				<tr>
					<td>이름 :</td>
					<td><input type="text" name="name" value="${user_id }"
						readonly="readonly"></td>
				</tr>
				<tr>
					<td style="height: 2px;"></td>
				</tr>
				<tr>
					<td>이메일 :</td>
					<td><input type="text" name="email" value="${user_email }"
						readonly="readonly"></td>
				</tr>
				<tr>
					<td style="height: 3px;"></td>
				</tr>
				<tr>
					<td>첨부파일 :</td>
					<td><input type="file" name="ufile"></td>
				</tr>
			</table>
			<br>내용 <br>
			<textarea rows="20" cols="50" name="content"></textarea>
			<br>
			<br> <input type="submit" value="글쓰기 "
				style="width: 80px; height: 28px; font-family: 'monaco'; background-color: #FFE6E6; border: 1 solid white">
			<input type="button" value="뒤로가기"
				style="width: 80px; height: 28px; background-color: #FFE6E6; border: 1 solid white"
				onclick="location.href='boardList.do'">
		</form>


	</center>

	<br>
	<br>
	<!-- <footer> -->
	<%@ include file="/petst/footer.jsp"%>
	<!--footer end-->



	<script type="text/javascript" src="./assets/js/modernizr-2.6.2.min.js"></script>
	<script type="text/javascript" src="./assets/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="./assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./assets/js/smoothscroll.js"></script>
	<script type="text/javascript" src="./assets/js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="./assets/js/imagesloaded.pkgd.js"></script>
	<script type="text/javascript" src="./assets/js/isotope.2.2.2min.js"></script>
	<script type="text/javascript" src="./assets/js/jquery.fitvids.js"></script>
	<script type="text/javascript" src="./assets/js/jquery.stickit.min.js"></script>
	<script type="text/javascript" src="./assets/js/jquery.slicknav.js"></script>
	<script type="text/javascript" src="./assets/js/scripts.js"></script>
</body>
</html>