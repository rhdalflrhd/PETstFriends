<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Rubel Miah">

<!-- favicon icon -->
<link rel="shortcut icon" href="./Boot/images/favicon.png">

<title>회원 신고 페이지ㅎㅎ</title>
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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$('#btn').click(function(){
			alert('ddd')
			if($('input:radio[name=report_reportReason]').is(':checked')==false){
				alert('신고사유를 선택해 주세요.')
			}
			else{
				reportfun();
			}
		})
		
		var reportfun = function(){
			var report_reportReason = $(":input:radio[name=report_reportReason]:checked").val();
			if(report_reportReason==4)
				report_reportReason = $('#reportEtc').val();
			$.ajax({
				type : 'POST',
				url : 'writeReport.do',
				data : {
					"report_boardname" : ${report_boardname },
					"report_boardno" : ${report_boardno },
					"report_userId" : $('#report_userId').val(),
					"report_reportReason" :  report_reportReason
				},
				success : function(data) {
					alert('신고되었습니다.');
					
				},
				error : function(xhrReq, status, error) {
					alert(error)
				}
			});
		}
		$('textarea[name=reportEtc]').keyup(function() {
	        // 텍스트영역의 길이를 체크
	        var textLength = $(this).val().length;
	        // 입력된 텍스트 길이를 #textCount 에 업데이트 해줌
	        $('#textCount').text(textLength);
	        // 제한된 길이보다 입력된 길이가 큰 경우 제한 길이만큼만 자르고 텍스트영역에 넣음
	        if (textLength > 25) {
	            $(this).val($(this).val().substr(0, 25));
	        }
	    });
	});
</script>
<style type="text/css">
 #btn{
 background-color: #CD853F; 
 color: white; 
 font-family: 'NanumSquareRound', sans-serif; 
 font-size: 15px !important; 
 font-weight: bold; 
 height: 40px; 
 width: 80px; 
 border: 1; 
 border-color: #CD853F; 
 border-radius: 10px;
 }
</style>
</head>
<body>
<br>
<center>
		<div class="wrapper">
			<!-- <form action="writeReport.do" id="report" enctype="multipart/form-data" method="post"> -->
			<div class="container">
				
				<div class="row">
					<div class="col-md-6 col-sm-5">
					<br><br>
					<article class="post" style="background:none; " >
						<font style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; font-size: 30px; color: #8B5927;">
											* 사유 선택
						</font>	<br><br>
						<div class="decoration" style="width: 300px; text-align: left; color: #8B5927; ">
							<input type="radio" value="성인/도박 등 불법 광고 및 스팸 활동"
								name="report_reportReason" class="report_reportReason">
								&nbsp;성인/도박 등 불법 광고 및 스팸 활동<br><br> 
							<input type="radio"
								value="바람직하지 않은 활동(광고, 도배, 욕설, 비방 등)" name="report_reportReason"
								class="report_reportReason">
								&nbsp;바람직하지 않은 활동(광고, 도배, 욕설, 비방 등)<br><br>
							<input type="radio" value="자체 운영 원칙에 위배되는 활동"
								name="report_reportReason" class="report_reportReason">
								&nbsp;자체운영 원칙에 위배되는 활동<br><br>
							<input type="radio" value="4"
								name="report_reportReason" class="report_reportReason">&nbsp;
							<textarea id="reportEtc" name="reportEtc" style="font-family: 'NanumSquareRound', sans-serif; border: 1px solid #8B5927;" rows="2" cols="30"
								onfocus="if(this.value=='기타-한글 25자 이내로 입력해주세요.'){this.value=''}"
								onblur="if(this.value==''){this.value='기타-한글 25자 이내로 입력해주세요.'}">기타-한글 25자 이내로 입력해주세요.</textarea>
						<br>
						<br>
						</div>
						<div class="entry-content" style="width: 300px; color:white; background-color: #EBC680; padding:10px;  border-radius: 10px; ">
						<br>
						<font style="font-family: 'NanumSquareRound', sans-serif; font-size: 15px; font-weight: bold;">
										신고하기 전에 잠깐!
						</font>											
						<br><br>
						
							게시글로 인해 개인(단체)이 명예훼손(사생활침해/악성루머/허위사실 등) 피해를 입었거나 저작권을 침해 당한 경우에는
							아래의 별도 창구를 통해 접수해 주시기 바랍니다.<br> 명예훼손 관련 게시중단 요청하기<br>(정통망법 제
							44조의 2에 의거)<br> 저작권 관련 게시중단 요청하기(저작권법 103조에 의거)<br>
							<br>
						</div>
						<div class="social-share">
							<ul class="text-center">
							<br>
								<li>
								<input type="hidden" name="report_boardname" value="${report_boardname }">
								<input type="hidden" name="report_boardno" value="${report_boardno }">
								<input type="hidden" name="report_userId" id="report_userId" value="${report_userId }">
								<button id="btn">신고하기</button>

								</li>
							<br>
							</ul>

						</div>
						</article>
					</div>
				</div>
			</div>
		</div>
		</center>
<!-- 	<script type="text/javascript" src="./Boot/js/modernizr-2.6.2.min.js"></script> -->
<!-- 	<script type="text/javascript" src="./Boot/js/jquery-1.11.3.min.js"></script> -->
<!-- 	<script type="text/javascript" src="./Boot/js/bootstrap.min.js"></script> -->
<!-- 	<script type="text/javascript" src="./Boot/js/smoothscroll.js"></script> -->
<!-- 	<script type="text/javascript" src="./Boot/js/owl.carousel.min.js"></script> -->
<!-- 	<script type="text/javascript" src="./Boot/js/imagesloaded.pkgd.js"></script> -->
<!-- 	<script type="text/javascript" src="./Boot/js/isotope.2.2.2min.js"></script> -->
<!-- 	<script type="text/javascript" src="./Boot/js/jquery.fitvids.js"></script> -->
<!-- 	<script type="text/javascript" src="./Boot/js/jquery.stickit.min.js"></script> -->
<!-- 	<script type="text/javascript" src="./Boot/js/jquery.slicknav.js"></script> -->
<!-- 	<script type="text/javascript" src="./Boot/js/scripts.js"></script> -->
</body>
</html>