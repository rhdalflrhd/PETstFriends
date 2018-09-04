<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#btn').click(function(){
			if($('input:radio[name=report_reportReason]').is(':checked')==false){
				alert('신고사유를 선택해 주세요.')
			}
			else{
				var report_reportReason = $(":input:radio[name=report_reportReason]:checked").val();
				
				if(report_reportReason==4)
					report_reportReason = $('#reportEtc').val();
				$.ajax({
					type : 'POST',
					url : 'writeReport.do',
					data : {
						"report_boardname" : ${report_boardname },
						"report_boardno" : ${report_boardno },
						"report_userId" : ${report_userId },
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
		})
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
</head>
<body>
<div>
<!-- <form action="writeReport.do" id="report" enctype="multipart/form-data" method="post"> -->
<div>
사유 선택
</div>
<div>
<div style="display: inline-block; width: 10%; "></div>
<div style="display: inline-block; width: 70%;">
<input type="radio" value="성인/도박 등 불법 광고 및 스팸 활동" name="report_reportReason" class="report_reportReason">성인/도박 등 불법 광고 및 스팸 활동<br>
<input type="radio" value="바람직하지 않은 활동(광고, 도배, 욕설, 비방 등)" name="report_reportReason" class="report_reportReason">바람직하지 않은 활동(광고, 도배, 욕설, 비방 등)<br>
<input type="radio" value="자체 운영 원칙에 위배되는 활동" name="report_reportReason" class="report_reportReason">자체 운영 원칙에 위배되는 활동<br>
<input type="radio" value="4" name="report_reportReason" class="report_reportReason">
<textarea id="reportEtc" name="reportEtc" rows="2" cols="30" onfocus="if(this.value=='기타-한글 25자 이내로 입력해주세요.'){this.value=''}" 
onblur="if(this.value==''){this.value='기타-한글 25자 이내로 입력해주세요.'}">기타-한글 25자 이내로 입력해주세요.</textarea>
</div>
</div>
<div style="border-bottom: 1px soid gray; height: 10px;"></div>
<div style="display: inline-block;">
신고하기 전에 잠깐!
</div>
<div style="border-bottom: 1px soid gray; height: 10px;"></div>
<div style="display: inline-block;">
게시글로 인해 개인(단체)이 명예훼손(사생활침해/악성루머/허위사실 등) 피해를 입었거나 저작권을 침해 당한 경우에는 아래의 별도 창구를 통해 접수해 주시기 바랍니다.<br>
명예훼손 관련 게시중단 요청하기(정통망법 제 44조의 2에 의거)<br>
저작권 관련 게시중단 요청하기(저작권법 103조에 의거)<br>
</div>
<div style="height: 10px;"></div>
<input type="hidden" name="report_boardname" value="${report_boardname }">
<input type="hidden" name="report_boardno" value="${report_boardno }">
<input type="hidden" name="report_userId" value="${report_userId }">
<!-- </form> -->
<div align="center">
<button id="btn">신고하기</button>
</div>
</div>
</body>
</html>