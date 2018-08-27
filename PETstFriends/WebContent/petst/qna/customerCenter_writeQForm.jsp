<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="./naverEditor/WebContent/resources/editor/js/HuskyEZCreator.js"
	charset="utf-8"></script>
	<style type="text/css">
#title{
font-family: 'Merriweather', serif;
		font-size: 14px;
		font-weight: 700;
		line-height: 64px;
		padding: 0 22px;
	letter-spacing: 0.5px; 
		color: #666666;
}
</style>
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
				bUseModeChanger : true,
			}
		});
		//전송버튼
		$("#insertBoard").click(function() {
			if($('#oftenQnA_title').val().replace(/ /g, '') == "" ){
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
</head>
<body>
<center>
		<%@ include file="/petst/header.jsp"%>
		<div style="border: 1px solid red; height: 1000px; width: 45%; background-color: white;">
			<form action="writeOftenQnA.do" method="post" id="insertBoardFrm"
				enctype="multipart/form-data">
				<span id="title">
				제목 :</span> <input type="text" id="oftenQnA_title" name="oftenQnA_title"
					style="width: 500px; height: 50px;">
				
				<div style="height: 20px;"></div>
				<div style="border: red;">
				<textarea name="editor" id="editor"
					style="width: 700px; height: 700px; background-color: white;">
					
					
					</textarea>
				<div style="height: 10px;"></div>
				<div align="right"><input type="button" id="insertBoard" value="등록" />
				</div></div>
			</form>
		</div>
		    <%@ include file="/petst/footer.jsp"%>
	</center>

</body>
</html>