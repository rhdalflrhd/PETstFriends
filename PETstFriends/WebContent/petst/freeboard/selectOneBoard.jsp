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

<title>자유 게시글 한개 보기 페이지</title>

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
$(document).ready(function(){
	var numb = 3;//나중에 바꾸기????????
	
	
	//----------------------------------------------------글삭제
	$('#tblbutton').on('click',	function removeCheck() {

		 if (confirm("정말 삭제하시겠습니까?") == true){    //확인
			alert("해당 글에대한 삭제처리가 완료됐습니다.");
		     document.removefrm.submit();
		 }else{   //취소
		     return false;
		 }
		});	
	
	
// 	//------------------------------------------------------좋아요 기능
	$('#likeCheckFunction').on('click',	function like_func(){
	
		alert("likeCheckFunction들어옴");
		  var boardno = ${tipboard.tipBoard_boardno};
		  var boardname = ${tipboard.tipBoard_boardname};
		  var userid = $('#user_idCheck').val();
		  console.log("boardno, boardname, userid : " + boardno +","+ boardname+","+userid );
		  
		  $.ajax({
		    url: "insertLikesFreeBoard.do",
		    type: "GET",
		    cache: false,
		    dataType: "json",
		    data: 'boardno=' +boardno+ '&boardname=' +boardname,
		    success: function(data) {
		    	
		    alert(data.mm);
		      var msg = data.mm;
// 		      msg += data.mm;
		      alert(msg);
		      
		      var like_msg='';
		      if(data.like_check == 0){
		        like_msg = "좋아요 누르기";
		      } else {
		        like_msg = "좋아요 취소하기";
		      }      

		      $('#like_msg').html(like_msg);
		      $('#like_cnt').html(data.like_cnt);
		    },
		    error: function(request, status, error){
		      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		  });//ajax끝
		  
		});
	//--------------------------------로그인안하고 좋아요 누를시
		$('#loginNeedLike').on('click',	function login_need(){
			alert("로그인이 필요합니다. 로그인하시겠습니까?");
		});

//=================댓글

var comment_start = ${comment_start}
	var comment_end = ${comment_end }
	var comment_current = ${comment_current}
	var comment_last = ${comment_last}
	var boardno = ${freeBoard.freeBoard_boardno};
	var boardname = ${freeBoard.freeBoard_boardname};
	var comment_finalpage = ${comment_current};
	var comment_page = ${comment_current};
	var user_idCheck = ${user_idCheck}
	var listsize = ${listsize}%3
	//댓글 리스트 불러오기
	var cPaging = function(){

		$.ajax({
			type : 'GET',
			url : 'freeCommentList.do',
			data : {
				"comment_page" : comment_page,
				"freeBoard_boardname" : boardname, 
				"freeBoard_boardno" : boardno
			},
			dataType : 'json',
			success : function(data) {
				var fList = JSON.parse(data.freeCommentList);
				comment_current = comment_page;
				var commentList = data;
				var commentStr = '';
				for(var i in fList){
					if(fList[i].freeComments_commentno == fList[i].freeComments_parent){
						commentStr +='<tr><td colspan="2" style="text-align: left;">닉네임'+fList[i].freeComments_nickname+'</td>'
					}else{
						commentStr +='<tr><td colspan="2" style="text-align: left;"><div style="width: 10%;display: inline-block;"></div>닉네임'
						+fList[i].freeComments_nickname+'</td>'
					}
					commentStr += '<td>날짜'+fList[i].freeComments_writeDate+'</td></tr><tr style="border-bottom: 1px solid black;">';
					if(fList[i].freeComments_commentno == fList[i].freeComments_parent){
						commentStr += '<td colspan="2" style="text-align: left;">';
					}else{
						commentStr +='<td colspan="2" style="text-align: left;"><div style="width: 10%; display: inline-block;"></div>';
					}
					if(fList[i].freeComments_content != null){
						commentStr +=fList[i].freeComments_content +'</td>';
					}
					else{
						commentStr += '이미 삭제된 댓글입니다.' +'</td>';
					}
					commentStr +='<td><button value="'+fList[i].freeComments_parent +'&'+fList[i].freeComments_nickname+'" class="reComBtn">답글</button>';
					if(fList[i].freeComments_content !=null && fList[i].freeComments_userId==user_idCheck){
						commentStr += '<button value="'+fList[i].freeComments_commentno+'" class="modifyComBtn">수정</button><button value="'
						+fList[i].freeComments_commentno+'&'+fList[i].freeComments_parent
						+'"class="deleteComBtn">삭제</button>';
					}
					commentStr += '</td></tr>'
						 
				}
				$('#commentTable').empty();
				$('#commentTable').append(commentStr);
				comment_end = data.comment_end;
				comment_current = data.comment_current;
				comment_last = data.comment_last;
				comment_start = data.comment_start;
				var paginStr='';
				if(comment_start != 1){
					paginStr += '<li><a class="pagingFun" page='+1+'>[처음]</a></li>'
					+'<li><a class="pagingFun"page='+comment_start+1+'>[이전]</a></li>';
				}
				for(var i = comment_start; i <= comment_end; i++){
					if(i == comment_current)
						paginStr +='<li><a page='+i+' class="pagingFun" style="background-color: yellow;">['+i+']</a></li>';
					else
						paginStr +='<li><a page='+i+' class="pagingFun">['+i+']</a></li>';
				}
				if(comment_end < comment_last){
					paginStr +='<li><a class="pagingFun" page='+comment_end+1 +'>[다음]</a></li>'
					+'<li><a class="pagingFun" page='+comment_last+'>[끝]</a></li>'
				}
				$('.pagination').empty();
				$('.pagination').append(paginStr);

			},
			error : function(xhrReq, status, error) {
				alert(error)
			}
	});
	}
	
	//다른 페이지 클릭시
	$(document).on('click', '.pagingFun', function(){
		comment_page = $(this).attr("page");
		cPaging();
		event.preventDefault();
		});
	
	//답글달기 클릭시
	$(document).on('click', '.reComBtn', function(){
		var tr = $(this).parent().parent();
		var str = $(this).val();
		var strArr = str.split('&');
		var freeComments_parent = strArr[0];//패런트넘
		var freeComments_nickname = '';//답글주인의 닉네임
		for(var i = 1; i<strArr.length; i++)
			freeComments_nickname +=strArr[i];
		var tableStr = '';
		tableStr +='<tr><td colspan=3><div><img src="./Boot/images/comment.jpg" class="pull-left"><p align="left" style="font-size: 16px;">'
				+'<i class="fa fa-level-up fa-rotate-90"></i> @'+freeComments_nickname
				+ '</p><p align="left"><textarea id="rereply_content" rows="3" cols="120" name="rereply_content">@'+freeComments_nickname+'</textarea>'
				+'</p><button class="rereply_save" name="rereply_save"	style="background-color: #CD853F; color: white;'
				+'font-size: 15px; font-weight: bold; border: 1; border-color: #CD853F; border-radius: 5px;" value='+freeComments_parent
				+'>댓글	등록</button></div></td></tr>';
		tr.after(tableStr);
	})
	
	//답글 등록시
	$(document).on('click', '.rereply_save', function(){
		var freeComments_content = $('#rereply_content').val();//내용
		var freeComments_parent = $(this).val();
		$.ajax({
			type : 'GET',
			url : 'writefreeComment.do',
			data : {
				"freeComments_content" : freeComments_content,
				"freeComments_parent" : freeComments_parent,
				"freeBoard_boardname" : boardname, 
				"freeBoard_boardno" : boardno
			},
			success : function(data) {
				listsize++;
				cPaging();
			},
			error : function(xhrReq, status, error) {
				alert(error)
			}
		});	
	});
	
	//그냥 댓글 달때
	$(document).on('click', '.reply_save', function(){
		var freeComments_content = $('#reply_content').val();//내용
		var freeComments_parent = 0;
		$('#reply_content').val('');
		$.ajax({
			type : 'GET',
			url : 'writefreeComment.do',
			data : {
				"freeComments_content" : freeComments_content,
				"freeComments_parent" : freeComments_parent,
				"freeBoard_boardname" : boardname, 
				"freeBoard_boardno" : boardno
			},
			success : function(data) {
				listsize++;
				if(listsize > numb){
					comment_finalpage = comment_finalpage+1;
					listsize= listsize%3;
				}
				alert(listsize+"리사");
				alert(comment_finalpage+"파이널")
				comment_page = comment_finalpage;
				cPaging();
			},
			error : function(xhrReq, status, error) {
				alert(error)
			}
		});	
	});
	//댓글 삭제시
	$(document).on('click', '.deleteComBtn', function(){
		var str = $(this).val();
		var strArr = str.split('&');
		var freeComments_commentno = strArr[0];//패런트넘
		var freeComments_parent = '';//답글주인의 닉네임
		for(var i = 1; i<strArr.length; i++)
			freeComments_parent +=strArr[i];
		$.ajax({
			type : 'GET',
			url : 'deletefreeComment.do',
			data : {
				"freeComments_commentno" : freeComments_commentno,
				"freeComments_parent" : freeComments_parent
			},
			success : function(data) {
				listsize--;
				if(listsize < 1){
					comment_finalpage = comment_finalpage-1;
					comment_page = comment_page-1;
					listsize=3;
				}
				alert(comment_page+"페이지현재")
				cPaging();
			},
			error : function(xhrReq, status, error) {
				alert(error)
			}
		});	
	});
	//댓글 수정폼
	$(document).on('click', '.modifyComBtn', function(){
		var freeComments_commentno = $(this).val();
		var tr = $(this).parent().parent();
		var td = tr.children();
		var comment_content = td.eq(1).text();
		var tableStr='';
		tr.empty();
		tableStr +='<td colspan=3><div><textarea class="modi_content" rows="3" cols="120" name="modi_content">'
			+comment_content+'</textarea>'
			+'</p><button class="reply_modi" name="reply_modi"	style="background-color: #CD853F; color: white;'
			+'font-size: 15px; font-weight: bold; border: 1; border-color: #CD853F; border-radius: 5px;"'
			+'value="'+freeComments_commentno+'">수정하기</button></div></td>';
		tr.after(tableStr);
	})
	
	//댓글 수정하기
	$(document).on('click', '.reply_modi', function(){
// 		alert($('.modi_content').val())
// 		alert($(this).val())
		var freeComments_content = $('.modi_content').val();
		var freeComments_commentno = $(this).val();
		$.ajax({
			type : 'GET',
			url : 'updatefreeComment.do',
			data : {
				"freeComments_commentno" : freeComments_commentno,
				"freeComments_content" : freeComments_content
			},
			success : function(data) {
				cPaging();
			},
			error : function(xhrReq, status, error) {
				alert(error)
			}
		});	
	})
	
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

#commentTable {
	padding: 20px;
}

td {
	/* 	border: 1px gray solid; */
	/* 	text-align: center; */
	padding: 20px;
}

h4 {
	font-family: 'NanumSquareRound', sans-serif;
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

.
.wrapper {
	font-family: 'NanumSquareRound', sans-serif;
}

#footer {
	font-family: 'NanumSquareRound', sans-serif;
}

.footer-widget-section {
	font-family: 'NanumSquareRound', sans-serif;
}

.main-content {
	position: relative;
	left: 22%;
	margin-left: -375px;
	text-align: center;
}
/* .decoration a, input{ */
/*     color: #FFD232; */
/*     border: 1px solid #FFD232; */
/*     border-radius: 5px; */
/*     font-family: 'NanumSquareRound',sans-serif; */
/*     font-size: 14px; */
/*     height: 20px; */
/*     width: 130px; */
/*    	position:relative;  */
/* } */
.chooseYourDesc a {
	color: #fff;
	background-color: #FFD232;
	border: 1px solid #FFD232;
	border-radius: 5px;
	font-family: 'NanumSquareRound', sans-serif;
	font-size: 15px !important;
	font-weight: bold;
	height: 35px;
	width: 130px;
	line-height: 35px;
	padding: 0;
	margin-right: 5px;
}

.chooseYourDesc a:hover {
	color: #fff;
	border: 1px solid #d2d2d2;
	background-color: #d2d2d2;
}
</style>
</head>
<body>
	<%@ include file="/petst/header.jsp"%>
	<center>
		<br> <br> <br>
		<div class="wrapper">

			<!--main content start-->
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-sm-12">

						<article class="post" style="border: 1px solid #eeeeee;">
						<header class="entry-header text-center">
						<h2 class="entry-title"
							style="font-family: 'NanumSquareRound', sans-serif;">
							<c:if test="${empty freeBoard.freeBoard_title}">
								"제목 없음"
								</c:if>
							<c:if test="${not empty freeBoard.freeBoard_title}">
								${freeBoard.freeBoard_title}
								</c:if>
						</h2>

						<div class="entry-meta">
							<span class="date"><i class="fa fa-clock-o"></i> <fmt:formatDate
									value="${freeBoard.freeBoard_writeDate}"
									pattern="yyyy년 MM월 dd일" /> </span> <span class="cat"><i
								class="fa fa-folder-open-o"></i> <c:if
									test="${freeBoard.freeBoard_boardname eq '3'}">
								개 자유게시판
								</c:if> <c:if test="${freeBoard.freeBoard_boardname eq '4'}">
								고양이 자유게시판
								</c:if> <c:if test="${freeBoard.freeBoard_boardname eq '5'}">
								토끼 자유게시판
								</c:if> </span> <span class="comment"><i class="fa fa-comment-o"></i><a
								href="">3 Comments(코멘트게시판이랑합칠것)</a></span>
						</div>
						</header>

						<div class="entry-content">
							${freeBoard.freeBoard_content} <br> <br>
						</div>

						<div class="social-share">
							<ul class="text-center">
								<li><c:if
										test="${tipboard.tipBoard_userId eq user_idCheck}">
										<a class="s-facebook"
											onclick="location.href='DogModifyFormTipBoard.do?boardname=${tipboard.tipBoard_boardname}&boardno=${tipboard.tipBoard_boardno}'">
											수정하기 </a>
									</c:if></li>
								<li><a class="s-google-plus"
									onclick="location.href='dogTipBoardList.do'">목록으로</a></li>
								<li><a class="s-twitter" onclick="history.back();">뒤로가기</a></li>
								<li><c:if
										test="${tipboard.tipBoard_userId eq user_idCheck}">
										<form
											action="dogDeleteTipBoard.do?boardname=${tipboard.tipBoard_boardname}
								&boardno=${tipboard.tipBoard_boardno}"
											name="removefrm" method="post">
											<a class="s-google-plus" id="tblbutton"
												onclick="removeCheck()">글 삭제</a>
										</form>
									</c:if></li>
								<li><a class="s-pinterest"> <c:choose>
											<c:when
												test="${user_idCheck ne null and freeLikes_SessionuserlikeCheck eq '0'}">
												<button type="button" id="likeCheckFunction"
													class="btn send-btn"
													style="border-radius: 5px; height: 40px;">
													<span id='like_msg'>좋아요누르기</span> <i class="fa fa-heart"
														style="color: #FF895A;"></i>
												</button>

											</c:when>
											<c:when
												test="${user_idCheck ne null and freeLikes_SessionuserlikeCheck eq '1'}">
												<button type="button" id="likeCheckFunction"
													class="btn send-btn"
													style="border-radius: 5px; height: 40px;">
													<span id='like_msg'>좋아요 취소하기</span> <i class="fa fa-heart"
														style="color: #FF895A;"></i>
												</button>
											</c:when>
											<c:otherwise>
												<button type="button" id="loginNeedLike"
													class="btn send-btn"
													style="border-radius: 5px; height: 40px;">좋아요를
													누르려면 로그인이 필요합니다.</button>
											</c:otherwise>
										</c:choose>
								</a></li>
								<li>
									<button type="button"
										style="background: none; color: #FFD232; border-color: #FFD232; border-radius: 5px; text-transform: uppercase; transition: all .4s; height: 40px;">
										총 좋아요 수 <span id='like_cnt'>${tipboard.tipBoard_LikeCount}</span>
										Likes
									</button>
								</li>
							</ul>
						</div>

						</article>
						<div class="top-comment" style="border: 1px solid #eeeeee;">
							<!--top comment-->
							<img src="./Boot/images/comment.jpg" class="pull-left">
							<h4
								style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold;">글쓴이
								: ${tipboard.tipBoard_userId}</h4>

							<p>저기 이미지도 사용자 프로필사진이나 키우는 펫 프로필 사진 들어가게 여기에는 자기소개 내지는 그런게
								들어가야함.ㅎㅎ</p>
							<br> <br>
						</div>

						<br> <br>
						<div class="bottom-comment">
							<table id="commentTable" style="padding: 20px; text-align: left;">
								<c:forEach items="${commentList }" var="comment">
									<tr class="line">
										<c:if
											test="${comment.freeComments_commentno == comment.freeComments_parent}">
											<td colspan="2">
												<!-- 											style="text-align: left;" -->
												닉네임${comment.freeComments_nickname}
											</td>
										</c:if>
										<c:if
											test="${comment.freeComments_commentno != comment.freeComments_parent}">
											<td colspan="2">
												<div style="width: 10%; display: inline-block;"></div>
												닉네임${comment.freeComments_nickname}
											</td>
										</c:if>
										<td>날짜${comment.freeComments_writeDate }</td>
									</tr>
									<tr style="border-bottom: 1px solid black;">
										<c:if
											test="${comment.freeComments_commentno == comment.freeComments_parent}">
											<td colspan="2"><c:if
													test="${comment.freeComments_content ==null}">
											삭제된 댓글입니다.
											</c:if> <c:if test="${comment.freeComments_content !=null}">
											${comment.freeComments_content }
											</c:if></td>
										</c:if>
										<c:if
											test="${comment.freeComments_commentno != comment.freeComments_parent}">

											<td colspan="2"><div
													style="width: 10%; display: inline-block;"></div>
												${comment.freeComments_content }</td>
										</c:if>
										<td>
											<button
												value="${comment.freeComments_parent }&${comment.freeComments_nickname}"
												class="reComBtn">답글</button> <c:if
												test="${comment.freeComments_content !=null &&
											comment.freeComments_userId eq user_idCheck}">
												<button value="${comment.freeComments_commentno}"
													class="modifyComBtn">수정</button>
												<button
													value="${comment.freeComments_commentno}&${comment.freeComments_parent}"
													class="deleteComBtn">삭제</button>
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</table>



							<ul class="pagination">
								<!-- 			스타트 엔드 페이지는 페이지값 보고!  -->
								<c:if test="${comment_start != 1 }">
									<li><a class="pagingFun" page=1>[처음]</a></li>
									<li><a class="pagingFun" page=${comment_start+1 }>[이전]</a></li>
								</c:if>
								<c:forEach begin="${comment_start }" end="${comment_end }"
									var="i">
									<c:choose>
										<c:when test="${i == comment_current }">
											<li><a>[${i }]</a></li>
										</c:when>
										<c:otherwise>
											<li><a page=${i } onclick="return false;"
												class="pagingFun"> [${i }]</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${end < last}">
									<li><a class="pagingFun"
										onclick="commentPage(${comment_end+1 })">[다음]</a></li>
									<li><a class="pagingFun"
										onclick="commentPage(${comment_last })">[끝]</a></li>
								</c:if>
							</ul>

						</div>

						<div id="testComment" class="top-comment"
							style="border: 1px solid #eeeeee; background-color: #E1B771;">

							<table border="1" width="1200px" id="reply_area">
								<tr reply_type="all" style="display: none">
									<!-- 뒤에 댓글 붙이기 쉽게 선언 -->
									<td colspan="4"></td>
								</tr>
								<!-- 댓글이 들어갈 공간 -->
								<c:forEach var="replyList" items="${replyList}"
									varStatus="status">
									<tr
										reply_type="<c:if test="${replyList.depth == '0'}">main</c:if><c:if test="${replyList.depth == '1'}">sub</c:if>">
										<!-- 댓글의 depth 표시 -->
										<td width="820px"><c:if test="${replyList.depth == '1'}"> → </c:if>${replyList.reply_content}
										</td>
										<td width="100px">${replyList.reply_writer}</td>
										<td width="100px"><input type="password"
											id="reply_password_${replyList.reply_id}"
											style="width: 100px;" maxlength="10" placeholder="패스워드" /></td>
										<td align="center"><c:if test="${replyList.depth != '1'}">
												<button name="reply_reply" parent_id="${replyList.reply_id}"
													reply_id="${replyList.reply_id}">댓글</button>
												<!-- 첫 댓글에만 댓글이 추가 대댓글 불가 -->
											</c:if>
											<button name="reply_modify"
												parent_id="${replyList.parent_id}"
												r_type="<c:if test="${replyList.depth == '0'}">main</c:if><c:if test="${replyList.depth == '1'}">sub</c:if>"
												reply_id="${replyList.reply_id}">수정</button>
											<button name="reply_del"
												r_type="<c:if test="${replyList.depth == '0'}">main</c:if><c:if test="${replyList.depth == '1'}">sub</c:if>"
												reply_id="${replyList.reply_id}">삭제</button></td>
									</tr>
								</c:forEach>
							</table>

							<!--top comment-->
							<img src="./Boot/images/comment.jpg" class="pull-left">
							<%-- 							<h3 align="left">닉네임: ${user_idCheck}</h3> --%>
							<p align="left" style="font-size: 16px;">닉네임: ${user_idCheck}</p>
							<p align="left">
								<textarea id="reply_content" rows="3" cols="120"
									name="reply_content" placeholder="댓글을 입력하세요."></textarea>
							</p>
							<button class="reply_save" name="reply_save"
								style="background-color: #CD853F; color: white; font-family: 'NanumSquareRound', sans-serif; font-size: 15px; font-weight: bold; border: 1; border-color: #CD853F; border-radius: 5px;"
								value=0>댓글 등록</button>
						</div>
						<!--top comment end-->
						<br> <br>

					</div>
					<!--  <div class="col-md-8 col-sm-7">의 끝 -->

				</div>
				<!-- row div 끝 -->
			</div>
			<!--컨테이너 div 끝-->
		</div>
	</center>
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