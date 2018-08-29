<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
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
		
		$('#deleteBtn').click(function(){
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
							<li><a href="">공지사항</a></li>
							<li><a href="">자주하는 질문</a></li>
							<li><a href="">1:1 문의</a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-8 col-sm-8"
					style="border-left: 1px solid gray; width: 80%; display: inline-block;">
					<h2>1:1 문의</h2>

					<h2 style="text-align: center;">${qnA.qnA_title }</h2>
					<div style="display: inline-block; height: 20px; width: 48%;">
						작성일 : ${qnA.qnA_writeDate }</div>
					<div style="border-bottom: 1px solid red; height: 5px;"></div>
					<div style="height: 20px;"></div>
					<div class="post-thumb">${qnA.qnA_content }</div>
					<div style="border: 1px solid red;"></div>
				
					<div class="leave-comment"
						style=" width: 100%;">
						<!--leave comment-->
								<div id="replyBox">
									<div class="form-group">
										<div class="col-md-12">
											<textarea class="form-control" rows="10" id="qnA_reply" style="width: 100%;"
												name="qnA_reply"></textarea>
										</div>
										<div style="width : 100%;" align="right">
									<button type="button" id="replyBtn">답하기</button>
									</div>
									</div>
								</div>
							<div id="replySucBox">
								<span id="replySpan">
								${qnA.qnA_reply }
								</span>
								<br>
								<button id="deleteCom">삭제하기</button>
								<button id="modifyCom">수정하기</button>
							</div>
						<div class="text-center" style="text-align: right;">
								<input type="button" id="deleteBtn" value="삭제하기">
								<input type="button" value="목록으로"
									onclick="location.href='showQnAList.do?page=${page }&boardname=${boardname }&type=${type }&keyword=${keyword }&numb=${numb }'">
							
							<!-- 						<input type="button" value="목록으로" -->
							<!-- 							onclick="location.href='showOftenQnAList.do'"> -->
							<!-- 							내가쓴 문의글로 가기???? -->

						</div>
						<div style="height: 20px;"></div>
					</div>


				</div>
			</div>
		</div>
		
		</div>
		<%@ include file="/petst/footer.jsp"%>
</body>
</html>