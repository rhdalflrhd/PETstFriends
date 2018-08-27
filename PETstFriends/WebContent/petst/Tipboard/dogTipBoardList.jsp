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
    
	<title>강아지 꿀 TIP 게시판</title>
	   
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

  $('.ScrollCheck').click(function(event){

	  var scrollTarget = $('#scrollMsg').val();
	  var st = '#'+scrollTarget

   event.preventDefault();
   $('html,body').animate({scrollTop:$(st).offset().top}, 500);	
	})  
    
});
</script>

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
@import url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');

article {
	-webkit-flex: 3;
	-ms-flex: 3;
	flex: 3;
	background-color: #white;
	padding: 20px 10px;
}

table {
	width: 100%;
	background-color: transparent;
}
th {
	background-color: #CD853F;
	border: none;
	color: white;
}
th, td {
/* 	border: 1px gray solid; */
	text-align: center;
	padding: 8px;
	border-bottom: 1px solid #ddd;
}

tr:hover {
	background-color: #f5f5f5;
}

tr a:hover {
	color: #FF5050;
}

.button {
	float: right;
	padding: 10px;
}

h4,ul,li{
font-family: 'NanumSquareRound',sans-serif;
}
input::-ms-input-placeholder { color: #CD853F; }
input::-webkit-input-placeholder { color: #CD853F; } 
input::-moz-placeholder { color: #CD853F; }
.wrapper{
font-family: 'NanumSquareRound',sans-serif;
}
#footer{
font-family: 'NanumSquareRound',sans-serif;
}
.footer-widget-section{
font-family: 'NanumSquareRound',sans-serif;
}

.portfolio{

font-family: 'NanumSquareRound',sans-serif; font-weight: bold;"

}
tr a:hover {
	color: #FF5050;
}

.tipUserBoard {
	width: 1200px;
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
    <div class="container">
<!-- font-size: 24px; -->
        <div class="heading-text text-center text-uppercase" >
        <font style="font-family: 'NanumSquareRound',sans-serif; font-weight: bold; font-size: 50px; color:#8B5927;">
        강아지 꿀 TIP 게시판
        </font>&nbsp;<input type="button" value="글쓰기" onclick="location.href='DogWriteTipBoardForm.do'" style= " background-color:#CD853F; color:white; font-family: 'NanumSquareRound',sans-serif; font-size: 15px !important; font-weight:bold; height:40px; width: 80px; border:1; border-color:#CD853F; border-radius: 25px;" >
        </div>
        <br><br>
<article>
        <!-- ======================================================사용자 입력 Tip게시글 시작===================================================-->				
			<div class="search" align="center">
								<form action="dogTipBoardList.do" method="get">
																

							 <font style="font-family: 'NanumSquareRound',sans-serif; font-weight: bold; color:#D7A35D;">
								총 게시물 : ${dogTipBoardCount }개&nbsp;&nbsp;&nbsp;
     						   </font>							
									<label style="color: #CD853F">기간</label>&nbsp;&nbsp;
									<input type="date" name="startDate" min="2018-06-01" style="background-color:white; color:#CD853F; border:1; width: 150px;height:30px; border-color:#CD853F; border-radius:5px;">
									<label> ~ </label>
									<input type="date" name="endDate" max="2018-12-31" style="background-color:white; color:#CD853F; border:1; width: 150px; height:30px; border-color:#CD853F; border-radius:5px;">
									<select name="type"	style=" border:2; height:30px; border-color:#CD853F; border-radius:5px; width: 90px; padding: 5px;">
										<option value="0">선택</option>
										<option value="1">제목</option>
										<option value="2">내용</option>
										<option value="3">제목+내용</option>
										<option value="4">작성자</option>
									</select> 
									<input type="text" placeholder="검색하세요-"  name="keyword" style="background-color:white; color:#CD853F; font-family: 'NanumSquareRound',sans-serif; padding: 4px; width: 380px; border:1; border-color:#CD853F; border-radius: 5px;" >
									<input style="background-color: #CD853F; border: none; padding: 5px 10px;
									 border-radius: 5px; color: white; cursor: pointer;" type="submit" value="검색">									
								</form>
			</div>
							<br>
<!-- ================================================================================================================================================ -->
			<div class="portfolio">
				<c:forEach items="${dogTipBoardList }" var="tipboard" varStatus="i">
					<div id="${tipboard.tipBoard_boardno}" class="portfolio-item"
						style="width: 353px; height: 500px; border: 1px #F2F2F2 solid;">
						<div style="height: 285px; ">
						<c:if test="${empty tipboard.tipBoard_file}">
							<img src="./Boot/images/tipBoardNonImageCondition.png"
								alt="ocean" height="280px">
						</c:if>
						<c:if test="${not empty tipboard.tipBoard_file}">
							<img
								src="download.do?boardname=7&boardno=${tipboard.tipBoard_boardno}" height="280px">
							<br>
						</c:if>
						</div>
						<div class="form-group">
							<div class="col-md-2"
								style="text-align: left; height: 60px; ">
								<h6>
									<font
										style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; color: #8B5927;">
										제목</font>
								</h6>
							</div>
							<div class="col-md-7"
								style="text-align: left; height: 60px; ">
								<h5>
									<font
										style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; color: #8B5927;">
										${tipboard.tipBoard_title} </font>
								</h5>
							</div>
							<div class="col-md-3"
								style="text-align: left; height: 60px; ">
								<h6>
									<font
										style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; color: #8B5927;">
										조회수 ${tipboard.tipBoard_readCount} </font>
								</h6>
							</div>
						</div>
						<div style="display: inline-block; width:340px; height: 200px; padding-left: none; text-align: left; border: 1px #F2F2F2 solid;">
							<h5>
								<font
									style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; color: #8B5927;">
									${tipboard.tipBoard_content} </font>
							</h5>
						</div>
						<div class="img-overlay">
							<div class="portfolio-text">
								<h4>${tipboard.tipBoard_title}</h4>
								<a href="DogReadTipBoard.do?boardname=${tipboard.tipBoard_boardname}&boardno=${tipboard.tipBoard_boardno}">click</a>
								<!-- 해당게시글로 넘어가게 view.jsp만들고 난후 수정할것 -->
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- ================================================================================================================================================ -->
							
				<div class="numbers">
								<c:if test="${start != 1 }">
									<a href="dogTipBoardList.do?page=1&type=${type }&keyword=${keyword}&startDate=${startdate}
									&endDate=${enddate}">[처음]</a>
									<a href="dogTipBoardList.do?page=${start-1 }&type=${type }&keyword=${keyword}
									&startDate=${startdate}&endDate=${enddate}">[이전]</a>
								</c:if>
								<c:forEach begin="${start }" end="${end }" var="i">
									<c:choose>
										<c:when test="${i == current }">
										[${i }]
									</c:when>
										<c:otherwise>
											<a href="dogTipBoardList.do?page=${i }&type=${type }&keyword=${keyword}
											&startDate=${startdate}&endDate=${enddate}">[${i }]</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${end!=last }">
									<a href="dogTipBoardList.do?page=${end+1 }&type=${type }&keyword=${keyword}
									&startDate=${startdate}&endDate=${enddate}">[다음]</a>
									<a href="dogTipBoardList.do?page=${last }&type=${type }&keyword=${keyword}
									&startDate=${startdate}&endDate=${enddate}">[끝]</a>
								</c:if>
				</div>
							<br>
							<br>
				<div class="button">
								<input type="button" style="background-color: orange;" value="글쓰기"	 onclick="location.href='DogWriteTipBoardForm.do'">
				</div>
						</article>
										
	<br><br>			

			
     
			
			<div class="portfolio">
				<!--begin portfolio items-->
			<!-- ======================================================네이버 API결과 시작===================================================-->
				<c:forEach items="${DogEncycList1 }" var="e" varStatus="i">
					<div id="${e.encyc_title}" class="portfolio-item"
						style="width:353px; height: 450px; border: 1px #F2F2F2 solid;">
						<div style="height: 285px; ">
						<c:if test="${empty e.encyc_thumbnail}">
							<img src="./Boot/images/tipBoardNonImageCondition.png"
								alt="ocean">
						</c:if>
						<c:if test="${not empty e.encyc_thumbnail}">
							<img src="${e.encyc_thumbnail}" height="280px">
						</c:if>
						</div>
						<br>
						<div class="form-group">
							<div class="col-md-2"
								style="text-align: left; height: 40px; ">
							<font style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; color: #8B5927;">
							제목</font>
							</div>
							<div class="col-md-10" style="text-align: left; height: 40px; ">
			     			<font style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; color: #8B5927;">
							${e.encyc_title}</font>	
							</div>
						</div>
						<div style="display: inline-block; width:340px; height: 150px; padding-left: none; text-align: left; border: 1px #F2F2F2 solid;">
							<h5>
						<font style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; color: #8B5927;">
									${e.encyc_description} </font>
							</h5>
						</div>
						<div class="img-overlay">
							<div class="portfolio-text">
								<h4>${e.encyc_title}</h4>
								<a href="#"
									onclick="window.open('${e.encyc_link}','new','width=700, height=700, toolbar =no, menubar =no, lacation= no, resizable=no, scrollbars=yes, status=no, top='+((window.screen.height-700)/2)+',left='+((window.screen.width-700)/2));">click</a>
							</div>
						</div>
					</div>
				</c:forEach>	

			</div>
			<!--End portfolio item-->


			<div class="load-more text-center">
            <a href="#"> <i class="fa fa-refresh"></i> load more</a>
        </div>
    </div>

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
                        <a href="" class="back-to-top">Back to Top</a>
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