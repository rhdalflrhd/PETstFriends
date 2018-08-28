<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Rubel Miah">

<!-- favicon icon -->
<link rel="shortcut icon" href="assets/images/favicon.png">

<title>About M</title>

<!-- common css -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/animate.min.css">
<link rel="stylesheet" href="assets/css/owl.carousel.css">
<link rel="stylesheet" href="assets/css/owl.theme.css">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="assets/css/responsive.css">

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
		location.href='deleteNoticeBoard.do?notice_boardno='+${notice_boardno};
	}
	else{
	}
})
// onclick="location.href='deleteNoticeBoard.do?notice_boardno=${notice_boardno}'" 
});
</script>
</head>
<body>
<%@ include file="/petst/header.jsp"%>
	<div class="wrapper">
		<!--main content start-->
		<div class="main-content" style="border-bottom: 1px solid gray;">
			<div class="container" style="background: white; border-left: 1px solid gray; border-top: 1px solid gray;">
				<div class="row">

					<div style="width: 20%; display: inline-block; float: left;">
						<div>
							<div>
							<h4>고객센터</h4>
							<div class="sub">공지사항</div>
							<div class="sub">자주하는 질문</div>
							<div class="sub">1:1문의</div>
							</div>
						</div>
					</div>

					<div class="col-md-8 col-sm-8" style="border-left: 1px solid gray; width: 80%; display: inline-block;">

						<h2 style="text-align: center;">
							${noticeBoard.notice_title }
						</h2>
						<div style="display: inline-block; height: 20px; width: 48%;">
							작성일 : ${noticeBoard.notice_writeDate }
							</div>
							<div style="display: inline-block; height: 20px; width: 48%; text-align: right;">
								조회수 : ${noticeBoard.notice_readCount }
								</div>
	<div style="border-bottom: 1px solid red; height: 5px;"></div>
	<div style="height: 20px;"></div>
						<div class="post-thumb">${noticeBoard.notice_content }</div>


							<div class="text-center" style="text-align: right;">
<%-- 							<c:if test="${admin_check != null}"> --%>
								<input type="button" id="deleteBtn" value="삭제하기">
								<input type="button" value="수정하기" 
								onclick="location.href='modifyNoticeBoardForm.do?notice_boardno=${noticeBoard.notice_boardno }&page=${page }&type=${type }&keyword=${keyword }&numb=${numb }'">
<%-- 								</c:if> --%>
								<input type="button" value="목록으로" 
								onclick="location.href='showNoticeList.do?page=${page }&type=${type }&keyword=${keyword }&numb=${numb }'">
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