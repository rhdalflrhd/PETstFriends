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
    
	<title>꿀 TIP 게시글 한개 보기 페이지 </title>
	   
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
   <link  rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
   
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>    
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>   
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
	
// 		alert("likeCheckFunction들어옴");
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
			
			 if (confirm("로그인이 필요합니다. 로그인하시겠습니까?") == true){    //확인
				alert("로그인페이지로 이동합니다.");
				document.location.href = "loginForm.do";
			 }else{   //취소
			     return false;
			 }
						
		});
	
	
	
		$('.btn-example').click(function(){
	        var $href = $(this).attr('href');
	        layer_popup($href);
	    });
	    function layer_popup(el){

	        var $el = $(el);        //레이어의 id를 $el 변수에 저장
	        var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

	        isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

	        var $elWidth = ~~($el.outerWidth()),
	            $elHeight = ~~($el.outerHeight()),
	            docWidth = $(document).width(),
	            docHeight = $(document).height();

	        // 화면의 중앙에 레이어를 띄운다.
	        if ($elHeight < docHeight || $elWidth < docWidth) {
	            $el.css({
	                marginTop: -$elHeight /2,
	                marginLeft: -$elWidth/2
	            })
	        } else {
	            $el.css({top: 0, left: 0});
	        }

	        $el.find('a.btn-layerClose').click(function(){
	            isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
	            return false;
	        });

	        $('.layer .dimBg').click(function(){
	            $('.dim-layer').fadeOut();
	            return false;
	        });

	    }	
		
		$('.imgSelect').click(function(e) {
	    var divTop = e.clientY - 40; //상단 좌표 위치 안맞을시 e.pageY
	    var divLeft = e.clientX; //좌측 좌표 위치 안맞을시 e.pageX 
	    var serial = $(this).attr("serial");
	    var idx = $(this).attr("idx");
	    
	    $('#divView').empty().append(
	    '<div style="position:absolute;top:5px;right:5px"><span id="close" style="cursor:pointer;font-size:1.5em" title="닫기">X</span> </div><br><a href="?serial=' + serial + '">serial</a><BR><a href="?idx=' + idx + '">idx</a>');
	   
	    $('#divView').css({
	     "top": divTop 
	    ,"left": divLeft 
	    , "position": "absolute"
	     }).show(); 
	    	
	    $('#close').click(function(){document.getElementById('divView').style.display='none'});
	    	 
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

h6,h4,h3,h2,h1,h5{
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

.pop-layer .pop-container {
  padding: 20px 25px;
}

.pop-layer p.ctxt {
  color: #666;
  line-height: 25px;
}

.pop-layer .btn-r {
  width: 100%;
  margin: 10px 0 20px;
  padding-top: 10px;
  border-top: 1px solid #DDD;
  text-align: right;
}

.pop-layer {
  display: none;
  position: absolute;
  top: 50%;
  left: 50%;
  width: 410px;
  height: auto;
  background-color: #fff;
  border: 5px solid #3571B5;
  z-index: 10;
}

a.btn-layerClose {
  display: inline-block;
  height: 25px;
  padding: 0 14px 0;
  border: 1px solid #304a8a;
  background-color: #3f5a9d;
  font-size: 13px;
  color: #fff;
  line-height: 25px;
}

a.btn-layerClose:hover {
  border: 1px solid #091940;
  background-color: #1f326a;
  color: #fff;
}

#divView {
 position:absolute;
 display:none;
 background-color:#ffffff;
 border:solid 2px #d0d0d0;
 width:350px;
 height:150px;
 padding:10px; }

.gogoCss {
    color: #b4b4b4;
    margin: 0 7px;
    font-size: 12px;
}
.gogoCss :hover {
    color: #FFD232;
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
							<!-- 							 <span class="comment"> -->
							<%-- 							 <a class="imgSelect">♥작성자:  ${tipboard.tipBoard_userId} </a> --%>
							<!-- 							 </span>	 -->
							<a href="#layer1" class="btn-example">♥ 작성자:
								${tipboard.tipBoard_userId} </a>
							<div id="layer1" class="pop-layer">
								<div class="pop-container">
									<div class="pop-conts">
										<!--content //-->
										<p class="ctxt mb20">
											<h2>${tipboard.tipBoard_userId} 님의 회원정보</h2><br> 
							<a class="gogoCss" onclick="location.href='CertainMemberWrites.do?memberid=${tipboard.tipBoard_userId}'">
											* 해당회원이 쓴 게시글 보러가기</a><br>
											
											<a class="gogoCss" href="#">
											* 해당회원에게 쪽지보내기</a><br>																		
											<br>
											(저거 커서대면 색깔이 바뀌던 아니면 예쁘게 버튼을 만들던 해야하고 뜨는위치는.
											바로 글작성자 옆에 떠야함 지금처럼 중앙가운데에 뜨면 안됨.
											모달창 스럽게 팝업창 디자인도 노란색이라던가 우리 이미지에 맞게)
										</p>

										<div class="btn-r">
											<a href="#" class="btn-layerClose">Close</a>
										</div>
										<!--// content-->
									</div>
								</div>
							</div>
							<span class="date"><i class="fa fa-clock-o"></i> <fmt:formatDate
									value="${tipboard.tipBoard_writeDate}" pattern="yyyy년 MM월 dd일" />
							</span> <span class="cat"><i class="fa fa-folder-open-o"></i>
							<c:if test="${tipboard.tipBoard_boardname eq '7'}">
								강아지 tip 정보
								</c:if> <c:if test="${tipboard.tipBoard_boardname eq '8'}">
								고양이 tip 정보
								</c:if> <c:if test="${tipboard.tipBoard_boardname eq '9'}">
								토끼 tip 정보
								</c:if> </span> <span class="comment"><i class="fa fa-comment-o"></i><a
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
								<a class="s-twitter"
									href="writeReportForm.do?report_boardname=${tipboard.tipBoard_boardname}&report_boardno=${tipboard.tipBoard_boardno}&report_userId=${tipboard.tipBoard_userId}"
									data-toggle="modal" data-target="#myModal"> 글신고 </a>
									<div id="myModal" class="modal fade">
										<div class="modal-dialog" style="background: white;">
											<div class="modal-header">
												<!-- 닫기(x) 버튼 -->
												<button type="button" class="close" data-dismiss="modal">닫기ⓧ</button>
												<!-- header title -->
											</div>
											<div class="modal-body">
												<div class="modal-content">
													<!-- Content will be loaded here from "remote.php" file -->
												</div>
											</div>

										</div>
									</div>
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