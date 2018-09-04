<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Rubel Miah">

<!-- favicon icon -->
<link rel="shortcut icon" href="assets/images/favicon.png">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<!-- HTML5 shim and Respond.js IE9 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="assets/js/html5shiv.js"></script>
    <script src="assets/js/respond.js"></script>
    <![endif]-->
<style type="text/css">
.sub{
border-bottom: 1px solid red;
padding-left: 15px;
padding-top: 10px;
font-size: 17px;
}
h4{
text-align: center; 
font-size: 30px;
background: white;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function() {
$('#deleteBtn').click(function(){
	var result = confirm('삭제하시겠습니까?');
	if(result){
		location.href='deleteOftenQnA.do?oftenQnA_boardno='+${oftenQnA.oftenQnA_boardno};
	}
	else{
	}
})
});
</script>
</head>
<body>
<%@ include file="/petst/header.jsp"%>
	<div class="wrapper">
		<!--main content start-->
		<div class="wrapper">
		<div class="main-content">
			<div class="container" style="background: white;">
				<div class="col-md-4 col-sm-5"
					style="display: inline-block; width: 20%;">
					<div class="widget">
						<h3>고객센터</h3>
						<ul>
							<li><a href="showNoticeList.do">공지사항</a></li>
							<li><a href="showOftenQnAList.do">자주하는 질문</a></li>
							<li><a href="qnA.do">1:1 문의</a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-8 col-sm-8"
					style="border-left: 1px solid gray; width: 80%; display: inline-block;">
						<h2 style="text-align: center;">
							${oftenQnA.oftenQnA_title }
						</h2>
						<div style="display: inline-block; height: 20px; width: 48%;">
							작성일 : ${oftenQnA.oftenQnA_writeDate }
							</div>
							<div style="display: inline-block; height: 20px; width: 48%; text-align: right;">
								조회수 : ${oftenQnA.oftenQnA_readCount }
								</div>
	<div style="border-bottom: 1px solid red; height: 5px;"></div>
	<div style="height: 20px;"></div>
						<div class="post-thumb">${oftenQnA.oftenQnA_content }</div>


							<div class="text-center" style="text-align: right;">
<%-- 							<c:if test="${admin_check != null}"> --%>
								<input type="button" id="deleteBtn" value="삭제하기">
								<input type="button" value="수정하기" 
								onclick="location.href='modifyOftenQnAForm.do?oftenQnA_boardno=${oftenQnA.oftenQnA_boardno }'">
<%-- 								</c:if> --%>
								<input type="button" value="목록으로" 
								onclick="location.href='showOftenQnAList.do'">
							</div> 
							<div style="height: 20px;"></div>
					</div>


				</div>
			</div>
		</div>
		<!--main content end-->


	</div>


	<!-- js files -->
	<script type="text/javascript" src="assets/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/smoothscroll.js"></script>
	<script type="text/javascript" src="assets/js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="assets/js/jquery.fitvids.js"></script>
	<script type="text/javascript" src="assets/js/jquery.stickit.min.js"></script>
	<script type="text/javascript" src="assets/js/scripts.js"></script>
		<%@ include file="/petst/footer.jsp"%>

</body>
</html>