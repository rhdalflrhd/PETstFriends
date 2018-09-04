<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
</style>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#writeBtn').click(function() {
			alert($('#qnA_boardname').val())
			if ($('#qnA_title').val() == '')
				alert('제목을 입력해주세요.')
			else if ($('#qnA_content').val() == '')
				alert('내용을 입력해주세요.')
			else if ($('#qnA_boardname').val() == 1)
				alert('게시판을 선택해주세요.')
			else
				$("#writeForm").submit();
		})
	});
</script>
</head>
<body>
<%@ include file="/petst/header.jsp"%>
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
					<div style="border-bottom: 2px solid brown; width: 20%;">
					<div style="border-bottom: 5px solid #FFD232; width: 70%;">
					<h2>1:1문의</h2>
					</div>
					</div>
					<div style="height: 20px;"></div>
	
					<form class="form-horizontal contact-form" role="form"
						id="writeForm" method="post" action="writeQnA.do">
						<div>
							<select name="qnA_boardname" id="qnA_boardname"
								style="height: 27px;">
								<option value="1">게시판선택</option>
								<option value="2">모임게시판</option>
								<option value="3">자유게시판</option>
								<option value="4">팁게시판</option>
								<option value="5">기타문의</option>
							</select>
						</div>
						<br><br>
						<div class="form-group">
							<div class="col-md-12">
								<br><input type="text" class="form-control" id="qnA_title"
									name="qnA_title" placeholder="제목을 입력해주세요." style="cursor: text;">
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								내용
								<textarea class="form-control" rows="15" id="qnA_content"
									name="qnA_content"></textarea>
							</div>
						</div>
						<br>
						<div align="right" style="height: 30px;">
						<br><input type="button" value="문의하기" id="writeBtn">
						</div>
<!-- 						<button type="button" id="writeBtn">문의하기</button> -->
					</form>
				</div>
				<!--end leave comment-->

				<!-- 				</div> -->
			</div>
		</div>
	</div>
	<%@ include file="/petst/footer.jsp"%>
</body>
</html>