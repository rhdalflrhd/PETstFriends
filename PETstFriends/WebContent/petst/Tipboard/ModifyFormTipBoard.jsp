<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Rubel Miah">

    <!-- favicon icon -->
    <link rel="shortcut icon" href="./Boot/images/favicon.png">
    
	<title>강아지 꿀 TIP 수정페이지</title>
	   
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
    
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
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
			bUseVerticalResizer : true,
			// 모드 탭(Editor | HTML | TEXT) 사용 여부
			bUseModeChanger : true,
		},
		fOnAppLoad : function(){
			//예제 코드
			var a = '${notice.notice_content}'; 
			obj.getById["editor"].exec("PASTE_HTML", [a]);//이거다!
		},
	});
	//전송버튼
	$("#modify-btn").click(function() {
		if($('#tipBoard_title').val().replace(/ /g, '') == "" ){
		    alert('제목을 입력해주세요.');
		}else{
		//id가 smarteditor인 textarea에 에디터에서 대입
		obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
		//폼 submit
		$("#modifyTipBoardFrm").submit();
		}
	});
});
</script>

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

@import
	url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css')
	;

table {
	width: 100%;
	background-color: transparent;
}

th, td {
	/* 	border: 1px gray solid; */
	text-align: center;
	padding: 8px
}

ul, li {
	font-family: 'NanumSquareRound', sans-serif;
}

input::-ms-input-placeholder {
	color: #CD853F;
}

input::-webkit-input-placeholder {
	color: #CD853F;
}

input::-moz-placeholder {
	color: #CD853F;
}

.wrapper {
	font-family: 'NanumSquareRound', sans-serif;
}

#footer {
	font-family: 'NanumSquareRound', sans-serif;
}

.footer-widget-section {
	font-family: 'NanumSquareRound', sans-serif;
}

.write-btn {
	font-family: 'NanumSquareRound', sans-serif;
	font-weight: bold;
	height: 34px;
	width: 130px;
	 background-color:#CD853F;
	/*     margin: 30px 0; */
	/*     padding: 20px; */
	color:white;
	border: 1px solid #eeeeee;
	border-radius: 0;
	/*     text-transform: uppercase; */
	/*     transition: all .4s; */
	font-size: 16px;
	line-height: 34px;
	padding: 0;
	margin: 0;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
	border:1; border-color:#CD853F; border-radius: 5px;" >
	
}

#filebox label {
	display: inline-block;
/* 	padding: .5em .75em; */
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

#filebox input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
</style>	
</head>
<body>
<%@ include file="/petst/header.jsp"%>
<div class="wrapper">
    <!--main content startd-->
		<div class="main-content">
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-sm-12">
					<article class="post" style="border: 1px solid #eeeeee;">
						<!-- end bottom comment-->
						<center>
							<div class="leave-comment"
								style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; ">
								<!--leave comment-->
								<div class="heading-text text-center text-uppercase">
									<font
										style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; font-size: 50px; color: #8B5927;">
						<c:if test="${tipboard.tipBoard_boardname eq '7'}">
							강아지
						</c:if> 
						<c:if test="${tipboard.tipBoard_boardname eq '8'}">
						고양이
						</c:if>
						<c:if test="${tipboard.tipBoard_boardname eq '9'}">
						토끼
						</c:if>
										꿀 TIP 수정하기 아이디는 </font>
								</div>
								<br>
								<br>
								<form action="ModifyTipBoard.do"	method="post" enctype="multipart/form-data" class="form-horizontal contact-form" id="modifyTipBoardFrm">
									<div class="form-group">
										<div class="col-md-4">
											<input type="text" class="form-control"
												id="tipBoard_nickname" name="tipBoard_nickname"
												value="닉네임: ${tipboard.tipBoard_nickname}" readonly="readonly">
										</div>
										<div class="col-md-5">
											<input type="text" class="form-control" id="tipBoard_title"
												name="tipBoard_title" placeholder="제목:  ${tipboard.tipBoard_title}">
										</div>
										<div class="col-md-3">
											<jsp:useBean id="toDay" class="java.util.Date" />
											<input type="text" class="form-control"
												id="tipBoard_writeDate" name="tipBoard_writeDate"
												value="작성일:  <fmt:formatDate value="${tipboard.tipBoard_writeDate}" pattern="yyyy-MM-dd" />"
												readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-4">
										<div align="left" style="padding-top: 14px; position: relative; background-color:#eeeeee; border: 1px solid #c8c8c8;border-radius:5px;">
										&nbsp;&nbsp;&nbsp;미리보기로 보여질 썸네일사진을 등록하세요:
										</div> 

										</div>									
										<div class="col-md-8">
											<input type="file" class="form-control"
												id="tipBoard_contentPic" name="tipBoard_contentPic"
												placeholder="미리보기로 보여질 썸네일사진을 등록하세요">
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-4">
										<div align="left" style="padding-top: 14px; position: relative; background-color:#eeeeee; border: 1px solid #c8c8c8;border-radius:5px;">
										&nbsp;&nbsp;&nbsp;첨부하실 Youtube URL을 입력하세요:
										</div> 

										</div>
										<div class="col-md-8">
											<input type="text" class="form-control"
												id="tipBoard_YoutubeUrl" name="tipBoard_YoutubeUrl"
												placeholder="${tipboard.tipBoard_YoutubeUrl}">
										</div>
									</div>
									
									<div class="form-group">
										<div class="col-md-12">
											<textarea name="editor" id="editor" class="form-control"
												rows="30" style="background-color: white;">
												${tipboard.tipBoard_content}
												</textarea>
										</div>
									</div>			 
									<input type="hidden"
										id="tipBoard_boardname" name="tipBoard_boardname"
										value="${tipboard.tipBoard_boardname}" /> 
									<input type="hidden"
										id="tipBoard_boardno" name="tipBoard_boardno"
										value="${tipboard.tipBoard_boardno}" />
									<input type="hidden"
										id="tipBoard_userId" name="tipBoard_userId"
										value="${tipboard.tipBoard_userId}" />
									<input type="hidden"
										id="tipBoard_readCount" name="tipBoard_readCount"
										value="${tipboard.tipBoard_readCount}" />
									<input type="hidden"
										id="tipBoard_LikeCount" name="tipBoard_LikeCount"
										value="${tipboard.tipBoard_LikeCount}" />

								</form>
							</div>
							<div class="social-share">
                            <ul class="text-center">
                                <li><a class="s-facebook"><input type="submit" value="글 수정" class="write-btn" id="modify-btn"></a> </li>
                                <li><a class="s-twitter" ><input type="button" value="목록으로"  class="write-btn" onclick="location.href='TipBoardList.do?tipBoard_boardname=${tipboard.tipBoard_boardname}'"></a></li>
                                <li><input type="button" value="뒤로가기"  class="write-btn"  onclick="history.back();"></li>
                            </ul>
                        	</div>	
							<!--end leave comment-->
						</center>
						</article>
					</div>
				</div>
			</div>
		</div>
		<!--main content end-->

</div>
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