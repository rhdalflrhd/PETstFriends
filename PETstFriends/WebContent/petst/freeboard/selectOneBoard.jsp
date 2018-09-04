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
		  var boardno = ${freeBoard.freeBoard_boardno};
		  var boardname = ${freeBoard.freeBoard_boardname};
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
	var listsize = ${listsize}%3;
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
						commentStr +='<tr><td class="reTD"></td><td><i class="fa fa-level-up fa-rotate-90"></i>&nbsp;닉네임'
						+fList[i].freeComments_nickname+'</td>'
					}
					commentStr += '<td class="btnTD">날짜'+fList[i].freeComments_writeDate+'</td></tr><tr">';
					if(fList[i].freeComments_commentno == fList[i].freeComments_parent){
						commentStr += '<td colspan="2" style="text-align: left;">';
					}else{
						commentStr +='<td class="reTD"></td><td>';
					}
					if(fList[i].freeComments_content != null){
						commentStr +=fList[i].freeComments_content +'</td><td class="btnTD">';
						if(data.user_idCheck!=null){
							commentStr +='<button value="'+fList[i].freeComments_parent +'&'+fList[i].freeComments_nickname+'" class="reComBtn">답글</button>';
							if(fList[i].freeComments_content !=null && fList[i].freeComments_userId==data.user_idCheck){
								commentStr += '<button value="'+fList[i].freeComments_commentno+'" class="modifyComBtn">수정</button><button value="'
								+fList[i].freeComments_commentno+'&'+fList[i].freeComments_parent
								+'"class="deleteComBtn">삭제</button>';
							}
							}
					}
					else{
						commentStr += '이미 삭제된 댓글입니다.' +'</td><td class="btnTD">';
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
					+'<li><a class="pagingFun"page='+(comment_start-1)+'>[이전]</a></li>';
				}
				for(var i = comment_start; i <= comment_end; i++){
					if(i == comment_current)
						paginStr +='<li><a page='+i+' class="pagingFun" style="background-color: #FFD232;">['+i+']</a></li>';
					else
						paginStr +='<li><a page='+i+' class="pagingFun">['+i+']</a></li>';
				}
				if(comment_end < comment_last){
					paginStr +='<li><a class="pagingFun" page='+(comment_end+1) +'>[다음]</a></li>'
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
				+ '</p><p align="left"><textarea id="rereply_content" rows="3" cols="120" name="rereply_content"></textarea>'
				+'</p><button class="rereply_save" name="rereply_save"'
				+' value='+freeComments_parent+'&'+freeComments_nickname
				+'>댓글 등록</button></div></td></tr><tr></tr>';
		tr.after(tableStr);
	})
	
	//답글 등록시
	$(document).on('click', '.rereply_save', function(){
		var freeComments_info = $(this).val();
		var freeArray = freeComments_info.split('&');
		var freeComments_parent  = freeArray[0];
		var freeComments_nickname='';
		for(var i = 1; i <freeArray.length; i++)
			freeComments_nickname += freeArray[i];
		var freeComments_content = '<a>'+freeComments_nickname+'</a> '+$('#rereply_content').val();//내용
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
		var nick = '';
		if(td.eq(0).text()==''){
			alert('d')
			var comment_content = td.eq(1).text();
			var str = comment_content;
			alert(str)
			var strArr = str.split(' ');
			nick =strArr[0]+' ';
		}
		else
			var comment_content = td.eq(0).text();
		nick = nick.trim();
		comment_content = comment_content.replace(nick, "");
		alert(nick)
		alert(comment_content)
		comment_content=comment_content.trim();
		alert(comment_content)
		tr.empty();
		var tableStr ='';
		tableStr +='<td colspan=3><div><textarea class="modi_content" style="text-align=left;" rows="3" cols="120" name="modi_content">'
			+comment_content+'</textarea>'
			+'</p><button class="reply_modi" name="reply_modi"	style="background-color: #CD853F; color: white;'
			+'font-size: 15px; font-weight: bold; border: 1; border-color: #CD853F; border-radius: 5px;"'
			+'value="'+'<a>'+nick+'</a>'+freeComments_commentno+'">수정하기</button></div></td>';
		tr.after(tableStr);
	})
	
	//댓글 수정하기
	$(document).on('click', '.reply_modi', function(){
		var str = $(this).val();
		var strArr = str.split('</a>');
		var nick = strArr[0]+'</a>';
		var freeComments_commentno=str.replace(nick,"");
		var freeComments_parent = '';//답글주인의 닉네임
		var freeComments_content = nick+' '+$('.modi_content').val();
// 		alert(freeComments_content)
// 		alert(freeComments_commentno)
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
.rereply_save {
	background-color: #CD853F;
	color: white;
	font-size: 15px;
	font-weight: bold;
	border: 1;
	border-color: #CD853F;
	border-radius: 5px;
}
table{
 border-collapse: collapse;
width: 100%;
}
tr:nth-child(odd)  { 
  border-top : 1px dashed gray;
}
tr:nth-child(1)  { 
 border-top : none; 
}
th, td{
text-align: left;
padding : 10px;
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
.reTD{
width: 10%;
}
.btnTD{
width: 20%;
}
a{
color : #BDBDBD;
cursor: pointer;
}
.reComBtn, .modifyComBtn, .deleteComBtn{
border: 0;
/* opacity: 0.5; */
background : #00ff0000;
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
										test="${freeBoard.freeBoard_userId eq user_idCheck}">
										<a class="s-facebook"
											onclick="location.href='DogModifyFormTipBoard.do?boardname=${freeBoard.freeBoard_boardname}&boardno=${freeBoard.freeBoard_boardno}'">
											수정하기 </a>
									</c:if></li>
								<li><a class="s-google-plus"
									onclick="location.href='dogTipBoardList.do'">목록으로</a></li>
								<li><a class="s-twitter" onclick="history.back();">뒤로가기</a></li>
								<li><c:if
										test="${freeBoard.freeBoard_userId eq user_idCheck}">
										<form
											action="dogDeleteTipBoard.do?boardname=${freeBoard.freeBoard_boardname}
								&boardno=${freeBoard.freeBoard_boardno}"
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
										총 좋아요 수 <span id='like_cnt'>${freeBoard.freeBoard_LikeCount}</span>
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
						<div class="bottom-comment" style="background-color: #FAFAFA;">
						<div>
						<table id="commentTable" style="border: none;">
								<c:forEach items="${commentList }" var="comment">
									<tr style="border-bottom: none;">
										<c:if
											test="${comment.freeComments_commentno == comment.freeComments_parent}">
											<td colspan="2">
												닉네임${comment.freeComments_nickname}
											</td>
										</c:if>
										<c:if
											test="${comment.freeComments_commentno != comment.freeComments_parent}">
											<td class="reTD"></td>
											<td>
												<div style="display: inline-block;"></div>
												<i class="fa fa-level-up fa-rotate-90 fa-1x"></i>&nbsp;닉네임${comment.freeComments_nickname}
											</td>
										</c:if>
										<td class="btnTD">날짜${comment.freeComments_writeDate }</td>
									</tr>
									<tr>
										<c:if
											test="${comment.freeComments_commentno == comment.freeComments_parent}">
											<td colspan="2"><c:if
													test="${comment.freeComments_content ==null}">
											삭제된 댓글입니다.
											</c:if> 
											<c:if test="${comment.freeComments_content !=null}">
											${comment.freeComments_content }
											</c:if></td>
										</c:if>
										<c:if
											test="${comment.freeComments_commentno != comment.freeComments_parent}">
											<td class="reTD"></td>	
											<td>
												${comment.freeComments_content }</td>
										</c:if>
										<td class="btnTD"><c:if test="${user_idCheck != null }">
												<button
													value="${comment.freeComments_parent }&${comment.freeComments_nickname}"
													class="reComBtn">답글</button>
											</c:if> <c:if
												test="${comment.freeComments_content !=null &&
											comment.freeComments_userId eq user_idCheck}">
												<button value="${comment.freeComments_commentno}"
													class="modifyComBtn">수정</button>
												<button
													value="${comment.freeComments_commentno}&${comment.freeComments_parent}"
													class="deleteComBtn">삭제</button>
											</c:if></td>
									</tr>
								</c:forEach>
							</table>
							</div>
							<ul class="pagination">
								<!-- 			스타트 엔드 페이지는 페이지값 보고!  -->
								<c:if test="${comment_start != 1 }">
								
									<li><a class="pagingFun" page=1>[처음]</a></li>
									<li><a class="pagingFun" page=${comment_start-1 }>[이전]</a></li>
								</c:if>
								<c:forEach begin="${comment_start }" end="${comment_end }"
									var="i">
									<c:choose>
										<c:when test="${i == comment_current }">
											<li><a style="background-color: #FFD232;">[${i }]</a></li>
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
<div style="height: 30px;"></div>
						<c:if test="${user_idCheck != null }">
							<div id="testComment" class="top-comment"
								style="border: 1px solid #eeeeee; background-color: #E1B771;">
								<!--top comment-->

								<img src="./Boot/images/comment.jpg" class="pull-left">
								<%-- 							<h3 align="left">닉네임: ${user_idCheck}</h3> --%>
								<p align="left" style="font-size: 16px;">닉네임:
									${freeBoard_nickname}</p>
								<p align="left">
									<textarea id="reply_content" rows="3" cols="120"
										name="reply_content" placeholder="댓글을 입력하세요."></textarea>
								</p>
								<button class="reply_save" name="reply_save"
									style="background-color: #CD853F; color: white; font-family: 'NanumSquareRound', sans-serif; font-size: 15px; font-weight: bold; border: 1; border-color: #CD853F; border-radius: 5px;"
									value=0>댓글 등록</button>

							</div>
						</c:if>
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