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
<title>탈퇴 비번확인</title>

  <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="./assets/css/animate.min.css">
    <link rel="stylesheet" href="./assets/css/owl.carousel.css">
    <link rel="stylesheet" href="./assets/css/owl.theme.css">
    <link rel="stylesheet" href="./assets/css/slicknav.css">
    <link rel="stylesheet" href="./assets/style.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">

</head>
<style>
.layer{
  position:absolute;
  top:50%; 
  left:40%; 
  width:400px;
  height:300px;
  background:;
  margin:-50px 0 0 -50px;
}

</style>
<script type="text/javascript">


</script>

<body>

<div class="wrapper">
 
     <%@ include file="/petst/header.jsp" %>
    <!--header section end-->
<center>
	<div class="mt20"   ></div>
<div class="memberout-wrap"  style="border: 1px solid orange; height: 850px; width: 850px;" >
<center>
			<div class="layer">
				<div class="header">
					
					<p><strong>회원님!</strong><br />
												회원님의 안전한 정보보호를 위해 비밀번호를 입력해주시기 바랍니다.
											</p>
				</div>
				<div class="article">
					<div class="row-group">
						<span class="label">
												비밀번호
												</span>
						<div class="in">
							<form id="withdrawForm" name="withdrawForm">
														<input type="password" name="pwd" desc="비밀번호" required minLen="8" maxLen="20" class="input-text" title="현재 비밀번호를 입력해주세요." />
														<input onclick="withdrawConfirm()" type="button" class="btn4 type1" value="확인">
							<button ><a href = "usermain.do"></a>취소</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			
		</div>
		</center>
	</div>
	</center>

  <footer id="footer">
<%@ include file="/petst/footer.jsp" %>
     
    </footer>
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