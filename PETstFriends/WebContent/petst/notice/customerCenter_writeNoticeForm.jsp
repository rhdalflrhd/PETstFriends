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
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="./naverEditor/WebContent/resources/editor/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<style type="text/css">
#title {
	font-family: 'Merriweather', serif;
	font-size: 14px;
	font-weight: 700;
	line-height: 64px;
	padding: 0 22px;
	letter-spacing: 0.5px;
	color: #666666;
}
</style>
</head>
<script type="text/javascript">
	$(function() {
		//전역변수
		var obj = [];
		//스마트에디터 프레임생성
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : obj,
			elPlaceHolder : "editor",
			sSkinURI : "./naverEditor/WebContent/resources/editor/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부
				bUseModeChanger : true,
			}
		});
		//전송버튼
		$("#insertBoard").click(function() {
			if ($('#notice_title').val().replace(/ /g, '') == "") {
				alert('제목을 입력해주세요.');
			} else {
				//id가 smarteditor인 textarea에 에디터에서 대입
				obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
				//폼 submit
				$("#insertBoardFrm").submit();
			}
		});
	});
</script>
<body>
		<%@ include file="/petst/header.jsp"%>
		<div class="wrapper">
			<div class="main-content">
				<div class="container" style="background: white;">
					<div class="col-md-4 col-sm-5"
						style="display: inline-block; width: 20%;">
						<div class="widget">
							<h2>고객센터</h2>
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
					<h2>공지사항</h2>
					</div>
					</div>
					<br>
						<div style="height: 900px;  background-color: white;" align="center">
							
							<form action="writeNoticeBoard.do" method="post"
								id="insertBoardFrm" enctype="multipart/form-data">
								<span id="title"> 제목 :</span> <input type="text"
									id="notice_title" name="notice_title"
									style="width: 500px; height: 50px; cursor: text; color: black;">

								<div style="height: 20px;"></div>
								<div style="border: #eeeeee;">
									<textarea name="editor" id="editor"
										style="width: 850px; height: 600px; background-color: white;">
									</textarea>
									<div style="height: 10px;"></div>
									<br><br>
									<div align="right">
										<input type="button" id="insertBoard" value="등록">
										<input type="button" id="insertBoard" value="목록으로" onclick="location.href='showNoticeList.do'">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/petst/footer.jsp"%>
</body>
</html>