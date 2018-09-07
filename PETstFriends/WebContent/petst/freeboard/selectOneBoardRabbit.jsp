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

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#deleteBtn').click(function() {
			var result = confirm('삭제하시겠습니까?');
			if (result == true) {
				alert("성공적으로 삭제되었습니다.")
				location.href = 'rabbitDeleteFreeBoard.do?freeBoard_boardno=' + $
				{
					freeBoard_boardno
				}
				;
			} else {
			}
		})
		// onclick="location.href='deleteNoticeBoard.do?notice_boardno=${notice_boardno}'" 
	});
</script>
</head>
<body>

	<%@ include file="/petst/header.jsp"%>
	<div class="wrapper">
		<div class="container">
		<br>
				<div style="border-bottom: 2px solid brown; width: 22%;">
               <div style="border-bottom: 5px solid #FFD232; width: 70%;">
               <h2>펫프광장</h2>
               </div>
               </div>
		<br>
				<br>
				<article> 
		<table class="table">

			<tr align="center" style="font-family: 'monaco';" bgcolor="white">
				<td style="width: 100px">${freeBoard.freeBoard_boardno }</td>
				<td style="width: 400px; text-align: left;">${freeBoard.freeBoard_title }</td>
					<td style="width: 100px">작성자 : ${freeBoard.freeBoard_nickname }</td>
				<td style="width: 100px">${freeBoard.freeBoard_writeDate }</td>
				<td style="width: 100px">조회수 : ${freeBoard.freeBoard_readCount }</td>
					<td  style="width: 100px">♥ ${freeBoard.freeBoard_LikeCount }</td>
				
			</tr>
			<tr>	
				<td align="left" colspan="7" height="200" width="700">
					${freeBoard.freeBoard_content }</td>					
			</tr>
	
			<tr>
											
				<td colspan="7" align="right"><br>
		<c:if test="${freeBoard.freeBoard_userId eq user_idCheck}">
						<input type="button" style="color: black;" value="수정하기"
							onclick="location.href='rabbitModifyFreeBoardForm.do?freeBoard_boardno=${freeBoard.freeBoard_boardno}&freeBoard_boardname=${freeBoard.freeBoard_boardname }'">

					</c:if> <input type="button"  style="color: black;" value="목록"
					onclick="location.href='rabbitFreeBoardList.do'"> 
					<input type="button"  style="color: black;"
					value="뒤로" onclick="history.back();" />
					 <c:if
 						test="${freeBoard.freeBoard_userId eq user_idCheck}">
						<form
 							action="rabbitDeleteFreeBoard.do?freeBoard_boardname=${freeBoard.freeBoard_boardname}&freeBoard_boardno=${freeBoard.freeBoard_boardno}'" 
 							name="removefrm" method="post"> 
						<input type="button" style="color: black;"  value="삭제"  id="deleteBtn" onclick="removeCheck()" > 
						</form>
 					</c:if>  
			</td> 
			</tr>

		</table>
</article>
</div>
</div>



	<%@ include file="/petst/footer.jsp"%>
	<!-- js files -->
	<script type="text/javascript" src="assets/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/smoothscroll.js"></script>
	<script type="text/javascript" src="assets/js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="assets/js/jquery.fitvids.js"></script>
	<script type="text/javascript" src="assets/js/jquery.stickit.min.js"></script>
	<script type="text/javascript" src="assets/js/scripts.js"></script>

</body>
</html>