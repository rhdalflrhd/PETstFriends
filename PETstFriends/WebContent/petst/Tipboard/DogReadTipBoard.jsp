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
    
	<title>강아지 꿀 TIP 게시글 한개 보기 페이지</title>
	   
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
</style>	
</head>
<body>

<div class="wrapper">

    <!--header section start-->
    <header id="header">
        <div class="main-logo text-center">
            <h1><a href="#"><img src="./Boot/images/petstlogo_2.PNG" alt="Ocean"></a></h1>
<!--              <h1><a href="#"><img src="./Boot/images/header2.png" alt="Ocean"></a></h1>            -->
        </div>
        <div id="demo2">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="main-menu text-uppercase">
                            <ul id="menu">
                                <li><a href="index.html">메인</a></li>
                                <li class="menu-item-has-children"><a href="#">펫프모여라<i
                                        class="fa fa-angle-down"></i></a>
                                    <ul class="sub-menu">
                                        <li><a href="#">STANDARD POST</a></li>
                                        <li><a href="#">GALLERY POST</a></li>
                                        <li><a href="#"> VIDEO POST</a></li>
                                        <li><a href="#">AUDIO POST</a></li>
                                        <li><a href="#">TYPOGRAPHY</a></li>
                                        <li><a href="404.html">404 Page</a></li>

                                    </ul>
                                </li>
                                 <li class="menu-item-has-children"><a href="">펫프광장 <i
                                        class="fa fa-angle-down"></i></a>
                                    <ul class="sub-menu">
                                        <li><a href="#">강아지 광장</a></li>
                                        <li><a href="#">고양이 광장</a></li>
                                        <li><a href="#">토끼 광장</a></li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children"><a href="">펫프정보 <i
                                        class="fa fa-angle-down"></i></a>
                                    <ul class="sub-menu">
                                        <li class="menu-item-has-children"><a href="">강아지<i
                                                class="fa fa-angle-right"></i></a>
                                            <ul class="sub-menu">
                                                <li><a href="dogInfoSquareSpecies.do">강아지 종정보</a></li>
                                                <li><a href="dogTipBoardList.do">강아지 Tip</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children"><a href="">고양이<i
                                                class="fa fa-angle-right"></i></a>
                                            <ul class="sub-menu">
                                                <li><a href="CatInfoSquareSpecies.do">고양이 종정보</a></li>
                                                <li><a href="#">고양이 Tip</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children"><a href="">토끼<i
                                                class="fa fa-angle-right"></i></a>
                                            <ul class="sub-menu">
                                                <li><a href="RabbitInfoSquareSpecies.do">토끼 종정보</a></li>
                                                <li><a href="#">토끼 Tip</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="#">병원</a></li>
                                <li><a href="#">플레이스</a></li>
                                <li><a href="#">펫프쇼핑비교</a></li>
                                <li class="menu-item-has-children"><a href="#">templates <i
                                        class="fa fa-angle-down"></i></a>
                                    <ul class="sub-menu">
                                        <li><a href="testimonial.html">Testimonial</a></li>
                                        <li><a href="coming-soon.html">Coming Soon</a></li>
                                        <li><a href="about-us-1.html">About Us 1</a></li>
                                        <li><a href="about-us-2.html">About Us 2</a></li>
                                        <li><a href="about-me.html">About Me</a></li>
                                        <li><a href="portfolio.html">Portfolio</a></li>
                                        <li><a href="single-protfolio.html">Single Portfolio</a></li>
                                        <li><a href="service.html">Service</a></li>
                                        <li><a href="blog.html"> single Blog</a></li>
                                        <li><a href="404.html">404 Page</a></li>

                                    </ul>
                                </li>
                                <li><a href="./Boot/contact.html">contact</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!--header section end-->
    <!--main content start-->
    
    <!--main content start-->
		<div class="main-content">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-sm-7">

						<article class="post" style="border: 1px solid #eeeeee;">
						<header class="entry-header text-center">
						<h2 class="entry-title">
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
							<span class="date"><i class="fa fa-clock-o"></i> <fmt:formatDate
									value="${tipboard.tipBoard_writeDate}" pattern="yyyy년 MM월 dd일" />
							</span> <span class="cat"><i class="fa fa-folder-open-o"></i><a
								href=""> <c:if test="${tipboard.tipBoard_boardname eq '7'}">
								강아지 tip 정보
								</c:if> <c:if test="${tipboard.tipBoard_boardname eq '8'}">
								고양이 tip 정보
								</c:if> <c:if test="${tipboard.tipBoard_boardname eq '9'}">
								토끼 tip 정보
								</c:if>
							</a></span> <span class="comment"><i class="fa fa-comment-o"></i><a
								href="">3 Comments(코멘트게시판이랑합칠것)</a></span>
						</div>
						</header>

						<div class="post-thumb">
							<c:if test="${empty tipboard.tipBoard_file}">
								<img src="./Boot/images/noAttachedFile.png" alt="ocean">
							</c:if>
							<c:if test="${not empty tipboard.tipBoard_file}">
								<img
									src="download.do?boardname=7&boardno=${tipboard.tipBoard_boardno}">
								<br>
							</c:if>
						</div>

						<div class="entry-content">
							${tipboard.tipBoard_content} <br> <br>
						</div>

						<div class="decoration">

							<!-- 세션에서 접속중인 userid와 해당게시글의 userid가 같으면 수정하기 버튼과 글삭제 버튼이 보여짐 -->
							<c:if test="${tipboard.tipBoard_userId eq user_idCheck}">
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

		<!--footer start-->
    <footer id="footer">

        <div class="footer-widget-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <aside class="footer-widget">
                            <div class="about-me-img"><img src="./Boot/images/UUU.png" alt="ocean"></div>
                            <div class="about-me-content">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed
                                diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed
                                voluptua. At vero eos et accusam et justo duo dlores et ea rebum magna text ar koto din.
                            </div>
                            <div class="about-me-social">
                                <a href=""><i class="fa fa-facebook"></i></a>
                                <a href=""><i class="fa fa-twitter"></i></a>
                                <a href=""><i class="fa fa-google-plus"></i></a>
                                <a href=""><i class="fa fa-instagram"></i></a>
                                <a href=""><i class="fa fa-pinterest-p"></i></a>
                                <a href=""><i class="fa fa-linkedin"></i></a>
                            </div>
                        </aside>
                    </div>
                    <div class="col-md-4">
                        <aside class="footer-widget">
                            <h3 class="widget-title text-uppercase">Recent Posts</h3>

                            <div class="thumb-latest-posts">

                                <div class="media">
                                    <div class="media-body">
                                        <h4><a href="">A Responsive WordPress Theme for you</a></h4>

                                        <div class="entry-meta small">November 25, 2015</div>
                                    </div>
                                </div>

                                <div class="media">
                                    <div class="media-body">
                                        <h4><a href="">A Responsive WordPress Theme for you</a></h4>

                                        <div class="entry-meta small">November 25, 2015</div>
                                    </div>
                                </div>

                                <div class="media">
                                    <div class="media-body">
                                        <h4><a href="">A Responsive WordPress Theme for you</a></h4>

                                        <div class="entry-meta small">November 25, 2015</div>
                                    </div>
                                </div>

                            </div>
                        </aside>
                    </div>
                    <div class="col-md-4">
                        <aside class="footer-widget">
                            <h3 class="widget-title text-uppercase">Tag Clouds</h3>

                            <div class="tagcloud">
                                <a href="">Lifestyle</a>
                                <a href="">Food</a>
                                <a href="">Travel</a>
                                <a href="">Business</a>
                                <a href="">Story</a>
                                <a href="">Drinks</a>
                                <a href="">DIY</a>
                                <a href="">Tips</a>
                                <a href="">Theme</a>
                                <a href="">Plugin</a>
                                <a href="">WordPres</a>
                                <a href="">HTML</a>
                                <a href="">Bootstrap</a>
                            </div>
                        </aside>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer-copy-right">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        &copy; 2015 <a href="">Ocean</a>, Designed by <a href="">ShapedTheme</a> & Powered by <a
                            href="">WordPress</a>
                    </div>
                    <div class="col-md-6">
                        <a href="" class="back-to-top"><font style="font-family: 'NanumSquareRound',sans-serif; font-weight: bold; color:#CD853F;">Back to Top</font></a>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!--footer end-->

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