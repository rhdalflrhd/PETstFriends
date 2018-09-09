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


</script>
</head>
<body>
<!--        <header id="header"> -->
         <%@ include file="/petst/header.jsp" %>
    <!--header section end-->
    	<div class="wrapper">
		<div class="container">
		<br>
<!-- 		게시글 3개 -->
		<div style="border-bottom: 2px solid brown; width: 22%;">
               <div style="border-bottom: 5px solid #FFD232; width: 70%;">
               <h2>ID 확인</h2>
               </div>
               </div>
	<center>


<div style="width: 900px; height: 300px;">
<div style=" width:700px; height:20px;"></div>
<div style="border-top: 2px solid #dcdcdc; width: 900px;">
</div>
<div style=" width:700px; height:30px;"></div>
		<h2><font style="color: hotpink"> ${user_name }</font> &nbsp; 회원님 !</h2>
		<div style="border: 2px solid #dcdcdc; width:700px;height: 80px;"> 
		<div style="width: 700px;height: 30px;"> 
		
		</div>
		아이디 &nbsp;: &nbsp;<b> ${user_id } </b> &nbsp;&nbsp; (가입일 &nbsp;: &nbsp; ${user_joinDate }) 
		</div>
		<div style=" width:700px; height:30px;"></div>
	
		
		
		
		
	
<table>
			<tr>
				<td style="height: 3px"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button onclick="location.href='loginForm.do'"
						style="width: 100px; height: 28px; border: 1 solid white">로그인</button>
					<button id=pwFindBtn onclick="location.href='FindUserPwForm.do'"
						style="width: 100px; height: 28px; border: 1 solid white">비밀번호찾기</button>
				</td>
			</tr>
		</table>
		<div style=" width:700px; height:30px;"></div>
		<div style="border-bottom: 2px solid #dcdcdc; width: 900px;">
		
			</div>
		<span id="user_idList"></span>

	</center>
<!-- <footer> -->
   <%@ include file="/petst/footer.jsp" %>
    <!--footer end-->

</div>
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