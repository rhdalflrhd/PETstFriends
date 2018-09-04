<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
				bUseVerticalResizer : false,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부
				bUseModeChanger : false,
			},
			fOnAppLoad : function(){
				//예제 코드
				var a = '${notice.notice_content}'; 
				obj.getById["editor"].exec("PASTE_HTML", [a]);//이거다!
			},
		});
		//전송버튼
		$("#modifyBoard").click(function() {
			if($('#notice_title').val().replace(/ /g, '') == "" ){
			    alert('제목을 입력해주세요.');
			}else{
			//id가 smarteditor인 textarea에 에디터에서 대입
			obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
			//폼 submit
			$("#modifyBoardFrm").submit();
			}
		});
	});
</script>
<title>Insert title here</title>
</head>
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
		
		<div class="container" style="background: white;">
						<div style="border-bottom: 2px solid brown; width: 20%;">
					<div style="border-bottom: 5px solid #FFD232; width: 70%;">
					<h2>공지사항</h2>
					</div>
					</div>
					</div>
<!-- 					</div> -->
					<div style="height: 20px;"></div>
					<br><br>
					<div align="center">
			<form action="modifyNoticeBoard.do" method="post" id="modifyBoardFrm"
				enctype="multipart/form-data">
				
				<span id="title">
				제목 :</span> <input type="text" id="notice_title" name="notice_title" value="${notice.notice_title }"
					style="width: 500px; height: 50px; color: black; cursor: text;">
				
				<div style="height: 20px;"></div>
				<div style="border: red;">
				<textarea name="editor" id="editor"
					style="width: 850px; height: 600px; background-color: white;">
					
					
					</textarea>
					<input type="hidden" value="${notice_boardno }" name="notice_boardno">
					<input type="hidden" value="${keyword }" name="keyword">
					<input type="hidden" value="${page }" name="page">
					<input type="hidden" value="${numb }" name="numb">
					<input type="hidden" value="${type }" name="type">
				<div style="height: 10px;"></div>
				<br><br>
				<div align="right"><input type="button" id="modifyBoard" value="등록" />
				</div></div>
			</form>
		</div>
		</div>
		</div>
		</div>
		</div>
		
		    <%@ include file="/petst/footer.jsp"%>


</body>
</html>