<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        	   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>펫프 모여라 후기게시판</title>
<%@ include file="/petst/header.jsp" %>
</head>
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">    
    <link rel="stylesheet" href="./Boot/css/bootstrap.min.css">
    <link rel="stylesheet" href="./Boot/css/font-awesome.min.css">
    <link rel="stylesheet" href="./Boot/css/animate.min.css">
    <link rel="stylesheet" href="./Boot/css/owl.carousel.css">
    <link rel="stylesheet" href="./Boot/css/owl.theme.css">
    <link rel="stylesheet" href="./Boot/css/slicknav.css">
    <link rel="stylesheet" href="./Boot/style.css">
    <link rel="stylesheet" href="./Boot/css/responsive.css">
<body>
<table align="center" width="1000px;" border="1" bordercolor="#CD853F"><tr><td>
<table style="min-height: 300px; width: 100%" align="center">
<tr><td width="100px;" height="60px;" style="font-size:30px; padding-left: 20px; padding-right: 30px; border-bottom: 1px solid #CD853F;">
${review.meetingReview_title }
</td><td height="20px;" style="padding-left:10px; text-align: left; font-size:16px;">
모임후기 게시판
</td><td width="150px;" height="20px;" style="font-size:16px; text-align: center;">
${review.meetingReview_writeDate }
</td></tr>
<tr><td colspan="3" height="20px;" style="font-size:20px; padding-left:30px; text-align: left;">
${review.meetingReview_nickname } user nickname
</td></tr>
<tr><td colspan="3" style="padding-left: 30px;">
${review.meetingReview_content }
</td></tr>
<tr><td colspan="3" height="100px">
						<div class="LikesDiv">
						
						
						        <button type="button" id="likeCheckFunction"
                                 class="btn send-btn"
                                 style="border-radius: 5px; height: 40px;">
                                		좋아요누르기 <i class="fa fa-heart"
                                    style="color: #FF895A;"></i>
                              </button>
						
						
						
						
						
						
								<c:choose>
									<c:when test="${user_idCheck ne null and tipLikes_SessionuserlikeCheck eq '0'}">
										<button type="button" id="likeCheckFunction"
											class="btn send-btn"
											style="border-radius: 5px; height: 40px;">
											<span id='like_msg'>좋아요누르기ㅎ</span> 
											<i class="fa fa-heart" style="color: red;"></i>
										</button>

									</c:when>
									<c:when test="${user_idCheck ne null and tipLikes_SessionuserlikeCheck eq '1'}">
										<button type="button" id="likeCheckFunction"
											class="btn send-btn"
											style="border-radius: 5px; height: 40px;">
											<span id='like_msg'>좋아요 취소하기</span> 
											<i class="fa fa-heart" style="color: red;"></i>
										</button>

									</c:when>
									<c:otherwise>
										<button type="button" id="loginNeedLike" class="btn send-btn"
											style="border-radius: 5px; height: 40px;">좋아요를 누르려면
											로그인이 필요합니다.</button>
									</c:otherwise>
								</c:choose>
								&nbsp;&nbsp;&nbsp;
								<button type="button"
									style="background: none; border-color: #FFD232; border-radius: 5px; text-transform: uppercase; transition: all .4s; height: 40px;">
									총 좋아요 수 <span id='like_cnt'>${tipboard.tipBoard_LikeCount}</span>
									Likes
								</button>

							</div>


</td></tr>
</table>
<table id="commentTable" border="1" width="100%" align="center">
<tr><td id="comment" style="padding-left: 20px">
댓글
</td></tr>
<c:forEach items="${comment}" var="comment">
<tr id="${comment.reviewComment_commentno}">
<td style="padding-left: 10px" colspan="1">
${comment.reviewComment_nickname }&nbsp <td colspan="2" style="width:100px; padding-left: 30px; font-size: 9px; font-style: gray;">${comment.reviewComment_writeDate }&nbsp&nbsp
<button id="recomment" value="${comment.reviewComment_commentno}/${comment.reviewComment_nickname }" style="cursor: pointer;">답글</button> 
<button id="recommentmodify" value="${comment.reviewComment_commentno}/${comment.reviewComment_content}">수정</button>
<button id="recommentdelete" value="${comment.reviewComment_commentno}/">삭제</button>
</td>
<tr id="modify${comment.reviewComment_commentno}"><td  style="padding-left: 30px; width: 900px;" colspan="3"> ${comment.reviewComment_content}</td>
</tr>
</c:forEach>
<tr style="text-align: center">
				<td width="100%" height="30px" colspan="3"><c:if test="${start ne 1 }">
						<a href="reviewView.do?meeting_boardno=${review.meeting_boardno }&meetingReview_no=${review.meetingReview_no }&page=1&tri=1">[처음]</a>
						<a href="reviewView.do?meeting_boardno=${review.meeting_boardno }&meetingReview_no=${review.meetingReview_no }&page=${start-1 }&tri=1">[이전]</a></c:if>
					<c:forEach begin="${start }" end="${end }" var="i">
						<c:if test="${i <= last}">
							<c:choose>
								<c:when test="${i == current  }">
								[${i }]
							</c:when>
								<c:otherwise>
									<a href="reviewView.do?meeting_boardno=${review.meeting_boardno }&meetingReview_no=${review.meetingReview_no }&page=${i }&tri=1">[${i }]</a>
								</c:otherwise>
							</c:choose>
						</c:if></c:forEach>
						<c:if test="${start+9 < last }">
						<a href="reviewView.do?meeting_boardno=${review.meeting_boardno }&meetingReview_no=${review.meetingReview_no }&page=${end+1 }&tri=1">[다음]</a>
						<a href="reviewView.do?meeting_boardno=${review.meeting_boardno }&meetingReview_no=${review.meetingReview_no }&page=${last }&tri=1">[끝]</a></c:if>
					</td></tr>

<tr><td style="padding-left: 20px" width="150px" height="100px">
댓글 내용
</td><td>
<textarea id="commentcontent" style="width: 650px; height: 95px; resize: none;"></textarea>
</td><td>
<button id="commentbtn"  style="width: 150px; height: 100px;">댓글 입력</button>

</td></tr>





</table>
</td></tr>
</table>
<center>
<table width="1000px"><tr><td width="1000px" align="right">
<input type="button" onclick="location.href='meetingview.do?meeting_boardno=${review.meeting_boardno }&trigger=1'"  value="목록">
<form action="modifyReviewForm.do" style="display: inline">
<input type="hidden" name="meeting_boardno" value="${review.meeting_boardno }">
<input type="hidden" name="meetingReview_no" value="${review.meetingReview_no }">
<input type="submit" value="수정">
</form>
<form action="deleteReviewMBC.do" style="display: inline">
<input type="hidden" name="meeting_boardno" value="${review.meeting_boardno }">
<input type="hidden" name="meetingReview_no" value="${review.meetingReview_no }">
<input type="submit" value="삭제">
</form>
</td></tr></table></center>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
	<script type="text/javascript">
	$(document).on('click', '#recommentmodifybtn', function(event) {
		var boardno = ${review.meeting_boardno };
		var reviewno = ${review.meetingReview_no}
		var commentno = $(this).attr('value');
	    var recommentcontent = $('#recommentmodifycontent'+commentno).val();
		$.ajax({
			type : "get",
			url : "commentModifyReviewMBC.do",
			data : {
				"meeting_boardno" : boardno,
				"reviewno" : reviewno,
				"reviewComment_commentno" : commentno,
				"reviewComment_content" : recommentcontent
			},
			success : function(data){
				window.location.href="http://localhost:8080/PETstFriends/reviewView.do?meeting_boardno="+data.boardno+"&meetingReview_no="+data.reviewno+"&tri=1"
			},
			error : function(request){
				alert("에러 : "+request.status);
			}
		})	
	});
	$(document).on('click', '#recommentdelete', function(event) {
		var boardno = ${review.meeting_boardno };
		var reviewno = ${review.meetingReview_no}
		var commentnonickname = $(this).attr('value');
		var spilt = commentnonickname.split('/');
		var commentno = spilt[0];
		$.ajax({
			type : "get",
			url : "commentDeleteReviewMBC.do",
			data : {
				"meeting_boardno" : boardno,
				"reviewno" : reviewno,
				"reviewComment_commentno" : commentno
			},
			success : function(data){
				window.location.href="http://localhost:8080/PETstFriends/reviewView.do?meeting_boardno="+data.boardno+"&meetingReview_no="+data.reviewno+"&tri=1"
			},
			error : function(request){
				alert("에러 : "+request.status);
			}
		})	
	});

	$(document).on('click', '#recommentbtn', function(event) {
		var boardno = ${review.meeting_boardno };
		var reviewno = ${review.meetingReview_no}
		var commentnonickname = $(this).attr('value');
		var spilt = commentnonickname.split('/');
		var commentno = spilt[0];
		var nickname = spilt[1];
		var recommentcontent = $('#recommentcontent'+commentno).val();
		$.ajax({
			type : "get",
			url : "commentWriteReviewMBC.do",
			data : {
				"meeting_boardno" : boardno,
				"reviewno" : reviewno,
				"reviewComment_commentno" : commentno,
				"reviewComment_nickname" : nickname,
				"reviewComment_content" : recommentcontent
			},
			success : function(data){
				window.location.href="http://localhost:8080/PETstFriends/reviewView.do?meeting_boardno="+data.boardno+"&meetingReview_no="+data.reviewno+"&tri=1"
			},
			error : function(request){
				alert("에러 : "+request.status);
			}
		})	
	})
	$(document).ready(function() {
		$(document).on('click', '#recommentmodify', function(event) {
			var recom = $(this).attr('value');
			var spilt = recom.split('/');
			var commentno = spilt[0];
			var content = spilt[1];
			var trid = "modify"+commentno;
			$('#'+trid+' *').remove();
			$('#'+trid).append(
		"<td style=\"padding-left: 20px;\" >답글 내용</td><td><textarea id=\"recommentmodifycontent"+commentno+"\" rows=\"6\" style=\"width: 100%; height: 50px; resize: none;\">"+
		content+"</textarea></td><td><button id=\"recommentmodifybtn\" value=\""+commentno+"\" style=\"width: 100px; height: 50px;\" >답글 입력</button></td>");
		})
		$(document).on('click', '#recomment', function(event) {
			var recom = $(this).attr('value');
			var spilt = recom.split('/');
			var commentno = spilt[0];
			$('#'+commentno+':last').after(
		"<tr><td style=\"padding-left: 20px;\" >답글 내용</td><td><textarea id=\"recommentcontent"+commentno+"\" rows=\"6\" style=\"width: 100%; height: 50px; resize: none;\">"+
		"</textarea></td><td><button id=\"recommentbtn\" value=\""+recom+"\" style=\"width: 100px; height: 50px;\" >답글 입력</button></td></tr>");
		})
		

		$('#commentbtn').click(function(){
			var boardno = ${review.meeting_boardno };
			var reviewno = ${review.meetingReview_no}
			var commentcontent = $('#commentcontent').val();
			$.ajax({
				type : "get",
				url : "commentWriteReviewMBC.do",
				data : {
					"meeting_boardno" : boardno,
					"reviewno" : reviewno,
					"reviewComment_content" : commentcontent
				},
				success : function(data){
					window.location.href="http://localhost:8080/PETstFriends/reviewView.do?meeting_boardno="+data.boardno+"&meetingReview_no="+data.reviewno+"&tri=1"
				},
				error : function(request){
					alert("에러 : "+request.status);
				}
			})	
		})
	})
	</script>
	
	<%@ include file="/petst/footer.jsp"%>
</body>
</html>