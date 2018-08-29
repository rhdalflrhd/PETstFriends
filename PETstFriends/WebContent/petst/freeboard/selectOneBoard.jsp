<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Rubel Miah">

    <!-- favicon icon -->
    <link rel="shortcut icon" href="./Boot/images/favicon.png">
    
	<title>자유게시판</title>
	   
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
	$('#tblbutton').on('click',	function removeCheck() {

		 if (confirm("정말 삭제하시겠습니까?") == true){    //확인
			alert("해당 글에대한 삭제처리가 완료됐습니다.");
		     document.removefrm.submit();
		 }else{   //취소
		     return false;
		 }
		});	
	
	
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
		    	
		    alert(data.mm);
		      var msg = data.mm;
//		      msg += data.mm;
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
.main-content{
	position:relative; 
	left:22%; 
	margin-left:-375px;

 	text-align:center;
}
</style>
</head>
<body>

<div class="wrapper">

    <!--main content start-->
		<div class="main-content">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-sm-7">

						<article class="post" style="border: 1px solid #eeeeee;">
						<header class="entry-header text-center">
						<h2 class="entry-title">
							<a href="#"> <c:if test="${empty freeBoard.freeBoard_title}">
								"제목 없음"
								</c:if> <c:if test="${not empty freeBoard.freeBoard_title}">
								${freeBoard.freeBoard_title}
								</c:if>
							</a>
						</h2>

						<div class="entry-meta">
							<span class="date"><i class="fa fa-clock-o"></i> <fmt:formatDate
									value="${freeBoard.freeBoard_writeDate}" pattern="yyyy년 MM월 dd일" />
							</span> <span class="cat"><i class="fa fa-folder-open-o"></i><a
								href=""> <c:if test="${freeBoard.freeBoard_boardname eq '3'}">
								개 자유게시판
								</c:if> <c:if test="${freeBoard.freeBoard_boardname eq '4'}">
								고양이 자유게시판
								</c:if> <c:if test="${freeBoard.freeBoard_boardname eq '5'}">
								토끼 자유게시판
								</c:if>
							</a></span> <span class="comment"><i class="fa fa-comment-o"></i><a
								href="">3 Comments(코멘트게시판이랑합칠것)</a></span>
						</div>
						</header>

<!-- 						<div class="post-thumb"> -->
<%-- 							<c:if test="${empty freeBoard.freeBoard_file}"> --%>
<!-- 								<img src="./Boot/images/noAttachedFile.png" alt="ocean"> -->
<%-- 							</c:if> --%>
<%-- 							<c:if test="${freeBoard.freeBoard_file}"> --%>
<!-- 								<img -->
<%-- 									src="download.do?boardname=7&boardno=${tipboard.tipBoard_boardno}"> --%>
<!-- 								<br> -->
<%-- 							</c:if> --%>
<!-- 						</div> -->

						<div class="entry-content">
							${freeBoard.freeBoard_content} <br> <br>
						</div>

						<div class="decoration">

							<!-- 세션에서 접속중인 userid와 해당게시글의 userid가 같으면 수정하기 버튼과 글삭제 버튼이 보여짐 -->
							<c:if test="${freeBoard.freeBoard_userid eq user_idCheck}">
								<a
									onclick="location.href='DogModifyFormTipBoard.do?boardname=${tipboard.tipBoard_boardname}&boardno=${tipboard.tipBoard_boardno}'">수정하기</a>
							</c:if>
							<a onclick="location.href='dogTipBoardList.do'">목록으로</a> <a
								onclick="history.back();">뒤로가기</a>
							<c:if test="${tipboard.tipBoard_userId eq user_idCheck}">
								<form
									action="dogDeleteTipBoard.do?boardname=${tipboard.tipBoard_boardname}&boardno=${tipboard.tipBoard_boardno}"
									name="removefrm" method="post">
									<a id="tblbutton" onclick="removeCheck()">글 삭제</a>
								</form>
							</c:if>
							
							<!--  좋아요  -->
							<div class="LikesDiv">
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
						</div>
						<!-- decoration div 끝 -->
						<div class="social-share">
							<span class="social-share-title">Share This</span>
							<ul class="text-center">
								<li><a class="s-facebook" href=""><i
										class="fa fa-facebook"></i></a></li>
								<li><a class="s-google-plus" href=""><i
										class="fa fa-heart"></i></a>
										</li>
								<li><a class="s-twitter" href=""><i
										class="fa fa-twitter"></i></a></li>
								<li><a class="s-google-plus" href=""><i
										class="fa fa-google-plus"></i></a></li>
								<li><a class="s-linkedin" href=""><i
										class="fa fa-linkedin"></i></a></li>
								<li><a class="s-instagram" href=""><i
										class="fa fa-instagram"></i></a></li>
								<li><a class="s-pinterest" href=""><i
										class="fa fa-pinterest-p"></i></a></li>
								<li><a class="s-email" href=""><i
										class="fa fa-envelope-o"></i></a></li>
							</ul>
						</div>

						</article>
						<div class="top-comment" style="border: 1px solid #eeeeee;">
							<!--top comment-->
							<img src="./Boot/images/comment.jpg" class="pull-left" alt="">
							<h4>Rubel Miah</h4>

							<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr,
								sed diam nonumy hello ro mod tempor invidunt ut labore et dolore
								magna aliquyam erat.</p>
						</div>
						<!--top comment end-->
						<div class="row">
							<!--blog next previous-->
							<div class="col-md-6">
								<div class="single-blog-box">
									<a href="#"> <img src="./Boot/images/blog-next.jpg" alt="">

										<div class="overlay">

											<div class="promo-text">
												<p>
													<i class="fa fa-angle-left"></i>Previous Post
												</p>
												<h5>Rubel is doing Cherry theme</h5>
											</div>
										</div>


									</a>
								</div>
							</div>
							<div class="col-md-6">
								<div class="single-blog-box">
									<a href="#"> <img src="./Boot/images/blog-next.jpg" alt="">

										<div class="overlay">
											<div class="promo-text">
												<p>
													next Post<i class="fa fa-angle-right"></i>
												</p>
												<h5>Rubel is doing Cherry theme</h5>

											</div>

										</div>


									</a>
								</div>
							</div>
						</div>
						<!--blog next previous end-->
						<br>
						<br>
						<!-- end bottom comment-->
						<div class="leave-comment">
						
					<table border="1" width="1200px" id="reply_area">
   				<tr reply_type="all"  style="display:none"><!-- 뒤에 댓글 붙이기 쉽게 선언 -->
   					<td colspan="4"></td>
   				</tr>
	   			<!-- 댓글이 들어갈 공간 -->
	   			<c:forEach var="replyList" items="${replyList}" varStatus="status">
					<tr reply_type="<c:if test="${replyList.depth == '0'}">main</c:if><c:if test="${replyList.depth == '1'}">sub</c:if>"><!-- 댓글의 depth 표시 -->
			    		<td width="820px">
			    			<c:if test="${replyList.depth == '1'}"> → </c:if>${replyList.reply_content}
			    		</td>
			    		<td width="100px">
			    			${replyList.reply_writer}
			    		</td>
			    		<td width="100px">
			    			<input type="password" id="reply_password_${replyList.reply_id}" style="width:100px;" maxlength="10" placeholder="패스워드"/>
			    		</td>
			    		<td align="center">
			    			<c:if test="${replyList.depth != '1'}">
			    				<button name="reply_reply" parent_id = "${replyList.reply_id}" reply_id = "${replyList.reply_id}">댓글</button><!-- 첫 댓글에만 댓글이 추가 대댓글 불가 -->
			    			</c:if>
			    			<button name="reply_modify" parent_id = "${replyList.parent_id}" r_type = "<c:if test="${replyList.depth == '0'}">main</c:if><c:if test="${replyList.depth == '1'}">sub</c:if>" reply_id = "${replyList.reply_id}">수정</button>
			    			<button name="reply_del" r_type = "<c:if test="${replyList.depth == '0'}">main</c:if><c:if test="${replyList.depth == '1'}">sub</c:if>" reply_id = "${replyList.reply_id}">삭제</button>
			    		</td>
			    	</tr>
			    </c:forEach>
   			</table>
   			<table border="1" width="1200px" bordercolor="#46AA46">
   				<tr>
   					<td width="500px">
						이름: ${tipboard.tipBoard_userId}
<%-- 						<input type="text" id="reply_writer" name="reply_writer" value="${tipboard.tipBoard_userId}" readonly="readonly"> --%>
<!-- 						패스워드: <input type="password" id="reply_password" name="reply_password" style="width:170px;" maxlength="10" placeholder="패스워드"/> -->
						<button id="reply_save" name="reply_save">댓글 등록</button>
					</td>
   				</tr>
   				<tr>
   					<td>
   						<textarea id="reply_content" name="reply_content" rows="4" cols="50" placeholder="댓글을 입력하세요."></textarea>
   					</td>
   				</tr>
   			</table>
							<!--leave comment-->
							<h4>Leave a reply</h4>
							<br>
							<br>
							<form class="form-horizontal contact-form" role="form"
								method="post" action="#">
								<div class="form-group">
									<div class="col-md-12">
										<input type="text" class="form-control" id="name" name="name"
											placeholder="Name">
									</div>
								</div>
								<br>
								<br>
								<div class="form-group">
									<div class="col-md-12">
										<input type="email" class="form-control" id="email"
											name="email" placeholder="Email">
									</div>
								</div>
								<br>
								<br>
								<div class="form-group">
									<div class="col-md-12">
										<input type="text" class="form-control" id="subject"
											name="subject" placeholder="Website url">
									</div>
								</div>
								<br>
								<div class="form-group">
									<div class="col-md-12">
										<textarea class="form-control" rows="6" name="message"
											placeholder="Write Massage"></textarea>
									</div>
								</div>
								<br>
								<br>
								<button type="button" class="btn send-btn">Post Comment</button>
							</form>
						</div>
						<!--end leave comment-->

					</div>
					<!--  <div class="col-md-8 col-sm-7">의 끝 -->

				</div>
				<!-- row div 끝 -->
			</div>
			<!--컨테이너 div 끝-->
		</div>
		<!--main content end-->

</div>


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