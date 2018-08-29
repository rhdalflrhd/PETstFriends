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
    
	<title>강아지 꿀 TIP 수정페이지</title>
	   
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

#write-btn {
	font-family: 'NanumSquareRound', sans-serif;
	font-weight: bold;
	height: 34px;
	width: 130px;
	 background-color:#CD853F;
	/*     margin: 30px 0; */
	/*     padding: 20px; */
	color:white;
	border: 1px solid #eeeeee;
	border-radius: 0;
	/*     text-transform: uppercase; */
	/*     transition: all .4s; */
	font-size: 16px;
	line-height: 34px;
	padding: 0;
	margin: 0;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
	border:1; border-color:#CD853F; border-radius: 5px;" >
	
}

/* label { */
/* /*  	display: inline-block;  */
* /
	/* /*  	padding: .5em .75em;  */ * /
	/* 	color: #999; */
	/* 	font-size: inherit; */
	/* /*  	line-height: normal;  */ * /
	/* 	vertical-align: middle; */
	/* 	background-color: #fdfdfd; */
	/* 	cursor: pointer; */
	/* 	border: 1px solid #ebebeb; */
	/* 	border-bottom-color: #e2e2e2; */
	/* 	border-radius: .25em; */
	/* } */
	/* #tipBoard_contentPic { /* 파일 필드 숨기기 */ * /
	/* 	position: absolute; */
	/* 	width: 1px; */
	/* 	height: 1px; */
	/* 	padding: 0; */
	/* 	margin: -1px; */
	/* 	overflow: hidden; */
	/* 	clip: rect(0, 0, 0, 0); */
	/* 	border: 0; */
	/* } */ 

#filebox label {
	display: inline-block;
/* 	padding: .5em .75em; */
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

#filebox input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
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
		<div class="main-content">
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-sm-12">
						<!-- end bottom comment-->
						<center>
							<div class="leave-comment"
								style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; color: #CD853F;">
								<!--leave comment-->
								<div class="heading-text text-center text-uppercase">
									<font
										style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; font-size: 50px; color: #8B5927;">
										강아지 꿀 TIP 수정하기 </font>
								</div>
								<br>
								<br>
								<br>
								<br>

								<form action="DogModifyTipBoard.do"	method="post" class="form-horizontal contact-form">
									<div class="form-group">
										<div class="col-md-3">

											<input type="text" class="form-control"
												id="tipBoard_nickname" name="tipBoard_nickname"
												value="${tipboard.tipBoard_nickname}" readonly="readonly">
										</div>
										<div class="col-md-6">
											<input type="text" class="form-control" id="tipBoard_title"
												name="tipBoard_title" placeholder="${tipboard.tipBoard_title}">
										</div>
										<div class="col-md-3">
											<jsp:useBean id="toDay" class="java.util.Date" />
											<input type="text" class="form-control"
												id="tipBoard_writeDate" name="tipBoard_writeDate"
												value="<fmt:formatDate value="${tipboard.tipBoard_writeDate}" pattern="yyyy-MM-dd" />"
												readonly="readonly">
					</td>
										</div>
									</div>
									<br> <br>
									<div class="form-group">
										<div class="col-md-3">
											<c:if test="${empty tipboard.tipBoard_file}">No attached FIle</c:if>
											<c:if test="${not empty tipboard.tipBoard_file}">
												<input type="text" class="form-control" id="tipBoard_file"
													readonly="readonly" value="${tipboard.tipBoard_file}"
													name="tipBoard_file">
											</c:if>
										</div>
										<div class="col-md-3">
											<input type="text" class="form-control"
												id="tipBoard_contentPic" name="tipBoard_contentPic"
												value="${tipboard.tipBoard_contentPic}"  readonly="readonly">
										</div>
										<div class="col-md-6">
											<input type="text" class="form-control"
												id="tipBoard_YoutubeUrl" name="tipBoard_YoutubeUrl"
												placeholder="${tipboard.tipBoard_YoutubeUrl}">
										</div>
									</div>
									<br> <br>
									<div class="form-group">
										<div class="col-md-12">
											<textarea class="form-control" rows="15"
												id="tipBoard_content" name="tipBoard_content">
												${tipboard.tipBoard_content}
											</textarea>
										</div>
									</div>
									<input type="submit" value="글 수정" class="write-btn"
										id="write-btn"> 
									<input type="hidden"
										id="tipBoard_boardname" name="tipBoard_boardname"
										value="${tipboard.tipBoard_boardname}" /> 
									<input type="hidden"
										id="tipBoard_boardno" name="tipBoard_boardno"
										value="${tipboard.tipBoard_boardno}" />
									<input type="hidden"
										id="tipBoard_userId" name="tipBoard_userId"
										value="${tipboard.tipBoard_userId}" />
									<input type="hidden"
										id="tipBoard_readCount" name="tipBoard_readCount"
										value="${tipboard.tipBoard_readCount}" />
									<input type="hidden"
										id="tipBoard_LikeCount" name="tipBoard_LikeCount"
										value="${tipboard.tipBoard_LikeCount}" />

								</form>
							</div>
							<!--end leave comment-->
						</center>
					</div>
				</div>
			</div>
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