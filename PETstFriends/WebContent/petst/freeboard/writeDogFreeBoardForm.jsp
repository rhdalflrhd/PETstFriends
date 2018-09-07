<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Rubel Miah">

<!-- favicon icon -->
<link rel="shortcut icon" href="./Boot/images/favicon.png">

<title>Dog-square</title>

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

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="./naverEditor/WebContent/resources/editor/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<style type="text/css">
#title {
	font-family: 'Merriweather', serif;
	font-size: 14px;
	font-weight: 700;
	line-height: 60px;
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
			if($('#freeBoard_title').val().replace(/ /g, '') == "" ){
			    alert('제목을 입력해주세요.');
			}else{
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
		<div class="container">
			<br>
			<div style="border-bottom: 2px solid brown; width: 25%;">
				<div style="border-bottom: 5px solid #FFD232; width: 70%;">
					<h2>펫프 Write !</h2>
				</div>
			</div>
			<div style="height: 500px; width: 90%;">

				<form action="writeDogFreeBoard.do" method="post"
					id="insertBoardFrm" enctype="multipart/form-data">
					<div style="height: 20px;"></div>
					<table class="table">
						<tr>
							<th style="background-color: #EBC680">제목</th>
							<td class="title"><input type="text" name="freeBoard_title"
								id="freeBoard_title" maxlength="100" style="width: 74%;"
								class="txt" value=""></td>
						</tr>
						<tr>
							<th style="background-color: #bebebe; align-items: baseline;">내용</th>
							<td colspan="2"><textarea name="editor" id="editor"
									style="width: 99%; height: 350px; border: none;"></textarea></td>
						</tr>
					</table>

					<div style="height: 10px;"></div>
					<div align="center"></div>
				</form>
			</div>
			<center>
				<input type="button" id="insertBoard" value="등록" />
			</center>
		</div>
		<!-- container끝 -->
	</div>
	<!-- wrapper끝 -->
	<%@ include file="/petst/footer.jsp"%>

</body>
</html>