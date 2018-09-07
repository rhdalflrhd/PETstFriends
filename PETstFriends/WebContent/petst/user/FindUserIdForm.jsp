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

<title>ID찾기</title>

<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">    
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">    
    <link rel="stylesheet" href="./Boot/css/bootstrap.min.css">
    <link rel="stylesheet" href="./Boot/css/font-awesome.min.css">
    <link rel="stylesheet" href="./Boot/css/animate.min.css">
    <link rel="stylesheet" href="./Boot/css/owl.carousel.css">
    <link rel="stylesheet" href="./Boot/css/owl.theme.css">
    <link rel="stylesheet" href="./Boot/css/slicknav.css">
    <link rel="stylesheet" href="./Boot/style.css">
    <link rel="stylesheet" href="./Boot/css/responsive.css">

    
   
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

   
<script type="text/javascript">

	$(document).ready(function() {

		$(document).on('click', '#findIdBtn', function() {
			var user_name = $('#user_name').val();
			var user_email = $('#user_email').val();

			var postData = {
				'user_name' : user_name,
				'user_email' : user_email
			};

			$.ajax({
				url : 'FindUserId.do',
				type : 'POST',
				data : postData,
// 				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				// 		        dataType : "json",
				success : function(postData) {
					if(postData == null)
						alert("없는아이디임")
					else
					window.location.href="FindUserIdConfirmForm.do?user_id="+postData;

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
			});
		});





		//-------------------------------------------------------------------------------------
		$(function() {
			var chk = -1;
			$("#auth_btn").click(function() { // 이메일 인증 받기 
				var authNum = "";

				$.ajax({
					method : 'GET',
					url : "emailAuth.do",
					data : {
						user_email : $('#user_email').val()
					},
					success : function(str) {
						authNum = str;
						alert("인증번호 전송완료.");
						//			             alert(authNum);

						$('#auth_btn2').click(function() {


							if ($('#user_authNum').val() == authNum) {
								alert("인증완료");
								$("#lab1").html("인증완료");
							} else {
								alert("인증실패");
								$("#lab1").html("<label>인증실패</label>");
							}

						});
					}
				});
			});
		});





	}) //레디
</script>
<style type="text/css">
    .bs-example{
    	margin: 10px;
    }
    .nav{
/*     display: table; */
    margin-left: auto;
    margin-right: auto;
    
    }

 
</style>
</head>
<body>
         <%@ include file="/petst/header.jsp" %>
    <!--header section end-->
    	<div class="wrapper">
		<div class="container">
		<br>
				<div style="border-bottom: 2px solid brown; width: 25%;">
               <div style="border-bottom: 5px solid #FFD232; width: 70%;">
               <h2>아이디 찾기</h2>
               </div>
               </div>
               <br>
    <center>

<div class="container1" style="display: inline-block; width:80%; height:550px;">
	    <div class="bs-example"  style=" border: 1px solid gray; border-top: none;">
	<ul class="nav nav-tabs navbar-" >
        <li  class="active" style="width: 50%"><a href="FindUserIdForm.do">아이디 찾기</a></li>
        <li style="width: 50%"><a href="FindUserPwForm.do">비밀번호 찾기</a></li>
	</ul>

<br>
<div class="container2" style="display: inline-table;width: 80%; height: 350px;">
<div class="container3" style="display: inline-block; width: 68%; height: 100px;">
<h2 align="left">이메일 인증</h2> <h5 align="left"> 회원가입 시 등록한 이메일주소와 동일하여야 <br> 인증번호를 받을 수 있습니다.</h5>
</div>
<br><br>
	<table class="table"  style="width: 50%; " align="center">
			<tr>
				<td align="right">* 이름&nbsp; </td>
				<td><input type="text"  id="user_name" name="user_name"  style="width: 90%"></td>
			</tr>
			<tr>
				<td align="right">* 이메일</td>
				<td><input type="text" name="user_email" id="user_email"  style="width:60%">
					<button type="button" id="auth_btn" style="width:30%">인증하기</button> <span id="email"></span><br>
					</td>
			</tr>
			<tr>
				<td align="right">* 인증번호</td>
				<td><input type="text" id="user_authNum" name="user_authNum"  style="width: 40%">
					<button type="button" id="auth_btn2"  style="width:50%" >확인</button> <span id="lab1"></span>
				</td>
				</tr>
<tr>
<td></td>
<td></td>
</tr>

		</table>
		<table>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td colspan="4" align="center">

					<button id=findIdBtn
						style="width: 80px; height: 28px;  border: 1 solid white">확인</button>
				</td>
			</tr>
		</table>
		</div>
		</div>
</div>



	</center>
			</div>
		<!-- container끝 -->
	</div>
	<!-- wrapper끝 -->
	<!-- <footer> -->
   <%@ include file="/petst/footer.jsp" %>
    <!--footer end-->

</div>
		
<!-- js files -->
<script type="text/javascript" src="./Boot/js/modernizr-2.6.2.min.js"></script>
<script type="text/javascript" src="./Boot/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="./Boot/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./Boot/js/smoothscroll.js"></script>
<script type="text/javascript" src="./Boot/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="./Boot/js/imagesloaded.pkgd.js"></script>
<script type="text/javascript" src="./Boot/js/isotope.2.2.2min.js"></script>
<script type="text/javascript" src="./Boot/js/jquery.fitvids.js"></script>
<script type="text/javascript" src="./Boot/js/jquery.stickit.min.js"></script>
<script type="text/javascript" src="./Boot/js/jquery.slicknav.js"></script>
<script type="text/javascript" src="./Boot/js/scripts.js"></script>


</body>
</html>