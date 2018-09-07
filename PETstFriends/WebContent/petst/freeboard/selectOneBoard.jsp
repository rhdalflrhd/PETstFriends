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
    <link rel="shortcut icon" href="./Boot/images/favicon.png">

<title>About M</title>

	    <!-- common css -->
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">    
    <link rel="stylesheet" href="./Boot/css/bootstrap.min.css">
    <link rel="stylesheet" href="./Boot/css/font-awesome.min.css">
    <link rel="stylesheet" href="./Boot/css/animate.min.css">
    <link rel="stylesheet" href="./Boot/css/owl.carousel.css">
    <link rel="stylesheet" href="./Boot/css/owl.theme.css">
    <link rel="stylesheet" href="./Boot/css/slicknav.css">
    <link rel="stylesheet" href="./Boot/style.css">
    <link rel="stylesheet" href="./Boot/css/responsive.css">
   <link  rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 

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
				location.href = 'dogDeleteFreeBoard.do?freeBoard_boardname=' + ${freeBoard.freeBoard_boardname}+'&freeBoard_boardno='+ ${freeBoard.freeBoard_boardno };				
				freeBoard
			} else {
			}
		})
		// onclick="location.href='deleteNoticeBoard.do?notice_boardno=${notice_boardno}'" 
	});
</script>
</head>
<body>

	<%@ include file="/petst/header.jsp"%>

	<center>
		<h1>
			<b><font color="gray">게시글</font></b>
		</h1>
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
				<td>${freeBoard.freeBoard_boardno }</td>
				<td>${freeBoard.freeBoard_title }</td>
				<td>${freeBoard.freeBoard_nickname }</td>
				<td>${freeBoard.freeBoard_writeDate }</td>
				<td>${freeBoard.freeBoard_readCount }</td>

				<%-- 				<td><a href="download.do?num=${board.num }">${board.file }</a></td> --%>
			</tr>

			<tr>
				<td style="color: white" bgcolor="#FFD2D2" align="center"
					colspan="7">내용</td>
			</tr>

			<tr>
				<td align="center" colspan="7" height="500" width="1000">
					${freeBoard.freeBoard_content }</td>
			</tr>

			<tr>
											
				<td colspan="7" align="right">
		<c:if test="${freeBoard.freeBoard_userId eq user_idCheck}">
						<input type="button" value="수정하기"
							onclick="location.href='dogModifyFreeBoardForm.do?freeBoard_boardno=${freeBoard.freeBoard_boardno}&freeBoard_boardname=${freeBoard.freeBoard_boardname }'">

					</c:if> <input type="button" value="목록"
					onclick="location.href='dogFreeBoardList.do'"> <input type="button"
					value="뒤로" onclick="history.back();" /> <c:if
						test="${freeBoard.freeBoard_userId eq user_idCheck}">
						<form
							action="dogDeleteFreeBoard.do?freeBoard_boardname=${freeBoard.freeBoard_boardname}&freeBoard_boardno=${freeBoard.freeBoard_boardno}'"
							name="removefrm" method="post">
							<input type="button" value="삭제"  id="deleteBtn" onclick="removeCheck()" >
						</form>
					</c:if> 
			</td>
			</tr>

		</table>

	</center>

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