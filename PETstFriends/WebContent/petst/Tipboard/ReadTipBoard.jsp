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
    
	<title>꿀 TIP 게시글 한개 보기 페이지!ㅎ</title>
	   
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
<script type="text/javascript">
$(document).ready(function(){
	
	examFunction();
	function examFunction(){
	var test ="${tipboard.tipBoard_YoutubeUrl}";
// 	youtubeId(test);
	function youtubeId(url) {
		console.log(url);
	    var tag = "";
	    if(url)  {
	        var regExp = /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/;
	        var matchs = url.match(regExp);
	        if (matchs) {
	            tag = matchs[7];
	        }
	        console.log(tag);		   
	        return tag;
	    }
	}
	 var result = youtubeId(test);
	 console.log(result);
	 var finytb ="http://www.youtube.com/embed/"+result+"?autoplay=1&loop=1&playlist="+result;
	 console.log(finytb);
	 $('#iframe').attr('src',finytb);
	}
	//----------------------------------------------------글삭제
	$('#tblbutton').on('click',	function removeCheck() {

		 if (confirm("정말 삭제하시겠습니까?") == true){    //확인
			alert("해당 글에대한 삭제처리가 완료됐습니다.");
		     document.removefrm.submit();
		 }else{   //취소
		     return false;
		 }
		});	
	
	
	//------------------------------------------------------좋아요 기능
	$('#likeCheckFunction').on('click',	function like_func(){
	
		alert("likeCheckFunction들어옴");
		  var boardno = ${tipboard.tipBoard_boardno};
		  var boardname = ${tipboard.tipBoard_boardname};
		  var userid = $('#user_idCheck').val();
		  console.log("boardno, boardname, userid : " + boardno +","+ boardname+","+userid );
		  
		  $.ajax({
		    url: "InsertLikesTipBoard.do",
		    type: "GET",
		    cache: false,
		    dataType: "json",
		    data: 'boardno=' +boardno+ '&boardname=' +boardname,
		    success: function(data) {
		    	
// 		    alert(data.mm);
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
h6,h4,h3,h2,h1,h5,{
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

..wrapper {
	font-family: 'NanumSquareRound', sans-serif;
}

#footer {
	font-family: 'NanumSquareRound', sans-serif;
}

.footer-widget-section {
	font-family: 'NanumSquareRound', sans-serif;
}
.main-content{
	position:relative; 
	left:22%; 
	margin-left:-375px;

 	text-align:center;
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

.chooseYourDesc a{
    color: #fff;
    background-color: #FFD232;
    border: 1px solid #FFD232;
    border-radius: 5px;
    font-family: 'NanumSquareRound',sans-serif;
    font-size: 15px !important;
    font-weight:bold; 
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
<br>
<br>
<br>
<div class="wrapper">  

    <!--main content start-->
			<div class="container">
<!-- 				<div align="right" class="chooseYourDesc"> -->
<!-- 					세션에서 접속중인 userid와 해당게시글의 userid가 같으면 수정하기 버튼과 글삭제 버튼이 보여짐 -->
<!-- 					<div align="right"class="col-md-7"> -->

<!-- 					</div> -->
<!-- 					<div align="right"class="col-md-3"> -->
<%-- 					<c:if test="${tipboard.tipBoard_userId eq user_idCheck}"> --%>
<%-- 						<a onclick="location.href='DogModifyFormTipBoard.do?boardname=${tipboard.tipBoard_boardname}&boardno=${tipboard.tipBoard_boardno}'"> --%>
<!-- 						&nbsp;&nbsp;수정하기&nbsp;&nbsp; -->
<!-- 						</a> -->
<%-- 					</c:if> --%>
<!--d 					<a onclick="location.href='dogTipBoardList.do'">&nbsp;&nbsp;목록으로&nbsp;&nbsp;</a> -->
<!-- 					<a onclick="history.back();">&nbsp;&nbsp;뒤로가기&nbsp;&nbsp;</a> -->
<!-- 					</div> -->
<!-- 					<div align="right"class="col-md-2"> -->
<%-- 					<c:if test="${tipboard.tipBoard_userId eq user_idCheck}"> --%>
<!-- 						<form -->
<%-- 							action="dogDeleteTipBoard.do?boardname=${tipboard.tipBoard_boardname}&boardno=${tipboard.tipBoard_boardno}" --%>
<!-- 							name="removefrm" method="post"> -->
<!-- 							<a id="tblbutton" onclick="removeCheck()" style="font-family: 'NanumSquareRound',sans-serif; font-size: 15px !important; font-weight:bold;  border:1; background-color:#CD853F;"> -->
<!-- 							&nbsp;&nbsp;글 삭제&nbsp;&nbsp;</a>  -->
<!-- 						</form> -->
<%-- 					</c:if>										 --%>
<!-- 					</div> -->
<!-- 				</div> -->
				<div class="row">
					<div class="col-md-12 col-sm-12">

						<article class="post" style="border: 1px solid #eeeeee;">
						<header class="entry-header text-center">
						<h2 class="entry-title" style="font-family: 'NanumSquareRound', sans-serif;">
							<a href="#"> <c:if test="${empty tipboard.tipBoard_title}">
								"제목 없음"
								</c:if> <c:if test="${not empty tipboard.tipBoard_title}">
								${tipboard.tipBoard_title}
								</c:if>
							</a>
						</h2>

						<div class="entry-meta">
							<input type="hidden" id="user_idCheck" name="user_idCheck"
								value="${user_idCheck}" /> 
							 <span class="comment">♥작성자:  ${tipboard.tipBoard_userId}</span>	
								<span class="date"><i
								class="fa fa-clock-o"></i> <fmt:formatDate
									value="${tipboard.tipBoard_writeDate}" pattern="yyyy년 MM월 dd일" />
							</span> <span class="cat"><i class="fa fa-folder-open-o"></i><c:if test="${tipboard.tipBoard_boardname eq '7'}">
								강아지 tip 정보
								</c:if> <c:if test="${tipboard.tipBoard_boardname eq '8'}">
								고양이 tip 정보
								</c:if> <c:if test="${tipboard.tipBoard_boardname eq '9'}">
								토끼 tip 정보
								</c:if>
							</span> <span class="comment"><i class="fa fa-comment-o"></i><a
								href="">3 Comments(코멘트게시판이랑합칠것)</a></span>
						</div>
						</header>
						<div class="entry-content" style="border: 1px solid #eeeeee;">
						<br>
							<h4 align="left" style="font-family: 'NanumSquareRound', sans-serif;">
							 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							 첨부된 동영상 <c:if test="${empty tipboard.tipBoard_YoutubeUrl}">: No video(없음)</c:if>
							</h4>
							<c:if test="${not empty tipboard.tipBoard_YoutubeUrl}">
							<iframe id="iframe" width="980" height="551" src="" frameborder="0" allowfullscreen></iframe>
							</c:if>
						<br><br>
						</div>
						<div class="entry-content" >
						<br><br>${tipboard.tipBoard_content}<br><br>			
						</div>
						<div class="decoration">
						</div>
						<!-- decoration div 끝 -->
						<div class="social-share">
							<ul class="text-center">
								<li><c:if
										test="${tipboard.tipBoard_userId eq user_idCheck}">
										<a class="s-facebook"
											onclick="location.href='ModifyFormTipBoard.do?boardname=${tipboard.tipBoard_boardname}&boardno=${tipboard.tipBoard_boardno}'">
											수정하기 </a>
									</c:if></li>
								<li><a class="s-google-plus" onclick="location.href='TipBoardList.do?tipBoard_boardname=${tipboard.tipBoard_boardname}'">목록으로</a></li>
								<li><a class="s-twitter" onclick="history.back();">뒤로가기</a></li>
								<li>
							<c:if test="${tipboard.tipBoard_userId eq user_idCheck}">
								<form
									action="DeleteTipBoard.do?boardname=${tipboard.tipBoard_boardname}&boardno=${tipboard.tipBoard_boardno}"
									id="removefrm"  name="removefrm" method="post">
									<a class="s-google-plus" id="tblbutton" onclick="removeCheck()">글 삭제</a>
								</form>
							</c:if>		
								</li>
								<li>
								<a class="s-pinterest">
								<c:choose>
									<c:when
										test="${user_idCheck ne null and tipLikes_SessionuserlikeCheck eq '0'}">
										<button type="button" id="likeCheckFunction"
											class="btn send-btn"
											style="border-radius: 5px; height: 40px;">
											<span id='like_msg'>좋아요누르기</span> <i class="fa fa-heart"
												style="color: #FF895A;"></i>
										</button>

									</c:when>
									<c:when
										test="${user_idCheck ne null and tipLikes_SessionuserlikeCheck eq '1'}">
										<button type="button" id="likeCheckFunction"
											class="btn send-btn"
											style="border-radius: 5px; height: 40px;">
											<span id='like_msg'>좋아요 취소하기</span> <i class="fa fa-heart"
												style="color: #FF895A;"></i>
										</button>

									</c:when>
									<c:otherwise>
										<button type="button" id="loginNeedLike" class="btn send-btn"
											style="border-radius: 5px; height: 40px;">좋아요를 누르려면
											로그인이 필요합니다.</button>
									</c:otherwise>
								</c:choose>
								</a>	
								</li>								
								<li>
								<button type="button"
									style="background: none; color:#FFD232; border-color: #FFD232; border-radius: 5px; text-transform: uppercase; transition: all .4s; height: 40px;">
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
							<br>
							<br>
						</div>

						<br> <br>
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
							<p align="left" style="font-size: 16px;">닉네임:
								${user_idCheck}</p>
							<p align="left">
								<textarea id="reply_content" rows="3" cols="120"
									name="reply_content" placeholder="댓글을 입력하세요."></textarea>
							</p>
							<button id="reply_save" name="reply_save"
								style="background-color: #CD853F; color: white; font-family: 'NanumSquareRound', sans-serif; font-size: 15px; font-weight: bold; border: 1; border-color: #CD853F; border-radius: 5px;">댓글
								등록</button>
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