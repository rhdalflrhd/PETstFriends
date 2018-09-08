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
button{
 margin: 0px 0px 0px 10px;
  text-decoration: none;
  border : 0;
	background-color : #dcdcdc;
   position: relative;
  float: right;
  padding: 0.438em 0.625em 0.438em 0.625em;
 line-height: 1.125em;
  cursor: pointer; 
  color: white;

}

</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var commentDis = function(){
			if(${qnA.qnA_reply == null }){
				$('#replyBox').css('display', 'inline');
				$('#replySucBox').css('display', 'none');
			}else{
				$('#replyBox').css('display', 'none');
				$('#replySucBox').css('display', 'inline');
			}
		}
		commentDis();
		var commentContent = '${qnA.qnA_reply}';
		$('#replyBtn').click(function(){
			var qnA_reply = $('#qnA_reply').val();
			commentContent = qnA_reply;
			$.ajax({
				type : 'GET',
				url : 'writeQnAComment.do',
				data : {
					"qnA_reply" : qnA_reply,
					"qnA_boardno" : ${qnA_boardno}
				},
				success : function(data) {
					$('#replySucBox').css('display', 'inline');
					$('#replySpan').append(qnA_reply);
					$('#qnA_reply').empty();
					$('#replyBox').css('display', 'none');
					
				},
				error : function(xhrReq, status, error) {
					alert(error)
				}
			});
		})
		
		$('#modifyCom').click(function(){
			alert(commentContent)
			$('#replyBox').css('display', 'inline');
			$('#replySpan').empty();
			$('#replySucBox').css('display', 'none');
			$('#qnA_reply').val(commentContent)
		})
		
		$('#deleteCom').click(function(){
			var result = confirm('삭제하시겠습니까?');
			if(result){
			$.ajax({
				type : 'GET',
				url : 'writeQnAComment.do',
				data : {
					"qnA_boardno" : ${qnA_boardno}
				},
				success : function(data) {
					$('#replyBox').css('display', 'inline');
					$('#replySpan').empty();
					$('#replySucBox').css('display', 'none');
					commentContent = '';
					$('#qnA_reply').val(commentContent);
				},
				error : function(xhrReq, status, error) {
					alert(error)
				}
			});
			}else{
			}
		})
		
		$('.deleteBtn').click(function(){
			var result = confirm('삭제하시겠습니까?');
			if(result){
				location.href='deleteQnABoard.do?qnA_boardno='+${qnA_boardno};
			}
			else{
			}
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
						<h3>공지사항</h3>
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
						<div style="border: 1px solid #eeeeee;">
						
					<h2 style="text-align: center;">${qnA.qnA_title }</h2>
					<div style="display: inline-block; height: 20px; width: 48%;">
						작성일 : ${qnA.qnA_writeDate }</div>
						<div style="display: inline-block; height: 20px; width: 48%;" align="right">
						글쓴이 : ${qnA.qnA_userId }</div>
					<div style="border-bottom: 1px solid #eeeeee; height: 5px;"></div>
					<div style="height: 20px;"></div>
					<div class="post-thumb">${qnA.qnA_content }</div>
					<div style="border: 1px solid #eeeeee;"></div>
				
					<div class="leave-comment" style="width: 100%; border: none;">
						<!--leave comment-->
						<div id="replyBox">
									<div class="form-group">
										<div class="col-md-12" style="display: inline-block; width: 100%; padding:0;">
											<textarea class="form-control" rows="5" id="qnA_reply"
												name="qnA_reply" style="margin:0"></textarea>
										</div>
										<div style="display: inline-block; width : 100%; padding: 0;">
										<br>
									<button type="button" id="replyBtn" style="width: 80px;">답하기</button>
									<button class="deleteBtn">글 삭제하기</button>
								
									<button onclick="location.href='showQnAList.do?page=${page }&boardname=${boardname }'
										+'&type=${type }&keyword=${keyword }&numb=${numb }'">글 목록으로</button>
									</div>
									</div>
								</div>
							<div id="replySucBox">
								<span id="replySpan">
								${qnA.qnA_reply }
								</span>
								<br>
								<button id="deleteCom">답변 삭제하기</button>
								<button id="modifyCom">답변 수정하기</button>
								<button class="deleteBtn">글 삭제하기</button>
						<button onclick="location.href='showQnAList.do?page=${page }&boardname=${boardname }'
							+'&type=${type }&keyword=${keyword }&numb=${numb }'">글 목록으로</button>
								<button type ="button" onclick="history.back();" >뒤로가기</button>
							<br>
							<br>
							</div>
							</div>
							</div>
				</div>
			</div>
		</div>
		
		</div>
		<%@ include file="/petst/footer.jsp"%>
</body>
</html>
