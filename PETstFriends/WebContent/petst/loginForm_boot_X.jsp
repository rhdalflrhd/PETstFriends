<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Rubel Miah">
    <!-- favicon icon -->
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
    
   
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

	
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
				if (jqXHR.status === 0) {
					alert('Not connect.\n Verify Network.');
				} else if (jqXHR.status == 400) {
					alert('Server understood the request, but request content was invalid. [400]');
				} else if (jqXHR.status == 401) {
					alert('Unauthorized access. [401]');
				} else if (jqXHR.status == 403) {
					alert('Forbidden resource can not be accessed. [403]');
				} else if (jqXHR.status == 404) {
					alert('Requested page not found. [404]');
				} else if (jqXHR.status == 500) {
					alert('Internal server error. [500]');
				} else if (jqXHR.status == 503) {
					alert('Service unavailable. [503]');
				} else if (exception === 'parsererror') {
					alert('Requested JSON parse failed. [Failed]');
				} else if (exception === 'timeout') {
					alert('Time out error. [Timeout]');
				} else if (exception === 'abort') {
					alert('Ajax request aborted. [Aborted]');
				} else {
					alert('Uncaught Error.n' + jqXHR.responseText);
				}
			}
		}) //ajax



	}) //로그인버튼




}) //레디


</script>
</head>
<body>
<!--        <header id="header"> -->
         <%@ include file="/petst/header.jsp" %>
    <!--header section end-->

<center>
		<h1>
			<b><font color="gray">로그인</font></b>
		</h1>
		
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" id="user_id" name="user_id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="user_pass" name="user_pass"></td>
			</tr>
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
		
		<button onclick="location.href='FindUserIdForm.do'"
						style="width: 90px; height: 28px; background-color: #FFE6E6; border: 1 solid white">ID/PW찾기</button>
		</td>
		</tr>
		</table>
	</center>
 <!-- <footer> -->
   <%@ include file="/petst/footer.jsp" %>
    <!--footer end-->

</div>
		
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