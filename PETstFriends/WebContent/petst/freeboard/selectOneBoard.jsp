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

<center>
<h1><b><font color="gray">게시글</font></b></h1>
		<br>
		<table border="1">

			<tr style="color: white;" bgcolor="#bebebe">
				<th>글번호</th>
				<th>제 목</th>
					<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>

			</tr>

			<tr align="center" style="font-family: 'monaco';" bgcolor="white">
				<td>${FreeBoard.freeBoard_boardno }</td>
				<td>${FreeBoard.freeBoard_title }</td>
				<td>${FreeBoard.freeBoard_nickname }</td>
				<td>${FreeBoard.freeBoard_writeDate }</td>
				<td>${FreeBoard.freeBoard_readCount }</td>

<%-- 				<td><a href="download.do?num=${board.num }">${board.file }</a></td> --%>
			</tr>

			<tr>
				<td style="color: white" bgcolor="#FFD2D2" align="center" colspan="7">
					내용</td>
			</tr>

			<tr>
				<td align="center" colspan="7" height="500">
				${FreeBoard.freeBoard_content }</td>
			</tr>

			<tr>
				<td colspan="7" align="right"><input type="button" value="수정하기" 
				style="width:500 font-family: 'monaco'; background-color: #FFE6E6; border: 1 solid white"
					onclick="location.href='modifyForm.do?num=${board.num}&page=${page }&type=${type }&keyword=${keyword }&startDate=${startDate}&endDate=${endDate}'">
				<input type="button" value="삭제하기"
				style="width:500 font-family: 'monaco'; background-color: #FFE6E6; border: 1 solid white"
					onclick="location.href='deleteForm.do?num=${board.num }&page=${page }&type=${type }&keyword=${keyword }&startDate=${startDate}&endDate=${endDate}'">
			<input type="button" value="게시판으로"
			style="width:500 font-family: 'monaco'; background-color: #FFE6E6; border: 1 solid white"
					onclick="location.href='boardList.do?page=${page }&type=${type }&keyword=${keyword }&startDate=${startDate}&endDate=${endDate}'"></td>
			</tr>

		</table>

	</center>
	


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