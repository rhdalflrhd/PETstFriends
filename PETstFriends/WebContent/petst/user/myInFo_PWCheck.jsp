<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Rubel Miah">
<link rel="shortcut icon" href="./assets/images/favicon.png">
<title>마이페이지 비번확인ㅎ</title>

<!-- common css -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<link rel="stylesheet" href="./Boot/css/bootstrap.min.css">
<link rel="stylesheet" href="./Boot/css/font-awesome.min.css">
<link rel="stylesheet" href="./Boot/css/animate.min.css">
<link rel="stylesheet" href="./Boot/css/owl.carousel.css">
<link rel="stylesheet" href="./Boot/css/owl.theme.css">
<link rel="stylesheet" href="./Boot/css/slicknav.css">
<link rel="stylesheet" href="./Boot/style.css">
<link rel="stylesheet" href="./Boot/css/responsive.css">

</head>
<style>
.layer {
	position: absolute;
	top: 50%;
	left: 40%;
	width: 400px;
	height: 300px;
	background:;
	margin: -50px 0 0 -50px;
}
body{

font-family: 'NanumSquareRound', sans-serif;
font-weight: bold; 


				
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#pwcheckBtn").click(function(){
		if($('#user_pass').val()=='${user_pass}'){
			$('#getUserIdFrm').submit();
		}else{
			alert('비밀번호가 틀립니다.')
		}
	
	});
	

	
});

</script>

<body>

	<div class="wrapper">

		<!--        <header id="header"> -->
		<%@ include file="/petst/header.jsp"%>
		<!--header section end-->

		<div class="mt20"></div>
		<br>
		<br>
		<p>
		<center>
			<div 
				style="background: rgba(255, 255, 255, 0.8); border: 1px solid #eeeeee;  height: 350px; width: 850px; border-radius: 25px;">

				<div >
					<div  style="color: #8B5927; font-family: 'NanumSquareRound', sans-serif; font-size: 15px !important; font-weight: bold;">
<br><br><br>
						<p>
							<strong>${user_id } 회원님!</strong><br /> 
							회원님의 안전한 정보보호를 위해<br>
							 비밀번호를 입력해주시기 바랍니다.
						</p>
					</div>
					<div class="article">
						<div class="row-group">
							<form action="getUserId.do" id="getUserIdFrm">
							<input type="hidden" value="${user_id }" name="user_id">
							</form>
							비밀번호: <input type="password" id="user_pass" name="user_pass" style="border-radius: 5px;" />
							<button id="pwcheckBtn"
								style="background-color: #CD853F; color: white; font-family: 'NanumSquareRound', sans-serif; font-size: 15px !important; font-weight: bold; width: 50px; height: 28px; border: 1; border-color: #CD853F; border-radius: 5px;">확인</button>

							<input type="button" value="취소"
								onclick="location.href='usermain.do'"
								style="background-color: #CD853F; color: white; font-family: 'NanumSquareRound', sans-serif; font-size: 15px !important; font-weight: bold; width: 50px; height: 28px; border: 1; border-color: #CD853F; border-radius: 5px;">
							
						</div>
					</div>
				</div>
			</div>
		</center>
	</div>




	<!--   <footer id="footer"> -->
	<%@ include file="/petst/footer.jsp"%>

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