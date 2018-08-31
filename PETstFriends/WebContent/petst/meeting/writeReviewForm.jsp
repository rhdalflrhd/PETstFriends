<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    	   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="js/naverEditor.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<table style="margin: auto; width: 1000px;"><tr><td height="100px;" style="font-size: 20px; padding-left: 50px;">
<input type="hidden" id="meeting_boardno" value="${meeting_boardno }">
제목 : <input type="text" id="title"style="width:600px; height:20px; padding-left: 20px;">
</td></tr>
<tr><td>
	<textarea name="ir1" id="ir1" rows="10" cols="100" style="width:100%; height:400px; display:none;"></textarea>
	<p align="center">
		<input type="button" onclick="location.href='meetingview.do?meeting_boardno=${meeting_boardno }&trigger=1'" style="font-size: 14pt" value="취소"/>
		<input type="button" onclick="submitContents(this);" style="font-size: 14pt" value="작성 완료" />
	</p>
</td></tr></table>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">
var oEditors = [];

// 추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "resources/editor/SmartEditor2Skin.html",	
	htParams : {
		bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : false,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : false,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
		//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
		fOnBeforeUnload : function(){
			//alert("완료!");
		}
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});
	
function submitContents(elClickedObj) {
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
	var title = $("#title").val();
	var content = $("#ir1").val();
	var boardno = $("#meeting_boardno").val();
		$.ajax({
			type : "get",
			url : "writeReviewMBC.do",
			data : {
				"meetingReview_title" : title,
				"meetingReview_content" : content,
				"meeting_boardno" : boardno
			},
			success : function(data){
				window.location.href="http://localhost:8080/PETstFriends/reviewView.do?meeting_boardno="+data.MeetingBoardReview[0].meeting_boardno+"&&meetingReview_no="+data.MeetingBoardReview[0].meetingReview_no
						
			},
			error : function(request){
				alert("에러 : "+request.status);
			}
		})
}
</script>
</body>
</html>