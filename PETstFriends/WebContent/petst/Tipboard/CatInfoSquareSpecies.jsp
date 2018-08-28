<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Rubel Miah">

    <!-- favicon icon -->
    <link rel="shortcut icon" href="./Boot/images/favicon.png">
    
	<title>고양이 종정보!</title>
	   
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

//     $(".scrollTest").click(function(event){            
//         event.preventDefault();
//         $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
// });
    
  $('.ScrollCheck').click(function(event){

	  var scrollTarget = $('#scrollMsg').val();
	  var st = '#'+scrollTarget
// 	  alert(st);
   event.preventDefault();
   $('html,body').animate({scrollTop:$(st).offset().top}, 500);
	
	})  
    
    
//     function ScrollCheck(event) {
//     	var scrollTarget = $('#scrollMsg').val();
//     	var st = '#'+scrollTarget;
//     	alert(st);
//         event.preventDefault();
//         $('html,body').animate({scrollTop:$(st).offset().top}, 500);
//     }
    
});
</script>

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
@import url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');
table {
	width: 100%;
	background-color: transparent;
}
th, td {
/* 	border: 1px gray solid; */
	text-align: center;
	padding: 8px
}

ul,li{
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
</style>	
</head>
<body>

<div class="wrapper">


    <div class="container">

        <h1 class="heading-text text-center text-uppercase">
        <font style="font-family: 'NanumSquareRound',sans-serif; font-weight: bold; color:#CD853F;">고양이 종 정보</font></h1>
        <center>
<p>
<br>
			<input type="text" placeholder="찾으실 종명을 검색하세요-" id="scrollMsg" name="scrollMsg" style= "background-color:white; color:#CD853F; font-family: 'NanumSquareRound',sans-serif;  font-size: 15px !important; font-weight:bold; height:50px; width: 500px; border:1; border-color:#CD853F; border-radius: 25px;">
			<input type="button" value="검색" class="ScrollCheck" style= " background-color:#CD853F; color:white; font-family: 'NanumSquareRound',sans-serif; font-size: 15px !important; font-weight:bold; height:50px; width: 80px; border:1; border-color:#CD853F; border-radius: 25px;" >
</p>
</center>
        <div class="portfolio"><!--begin portfolio items-->
		<c:forEach items="${CatEncycList }" var="e" varStatus="i">
            <div id="${e.encyc_title}" class="portfolio-item" style=" width: 260px; height: 260px; border: 1px #F2F2F2 solid;">          
            <c:if test="${empty e.encyc_thumbnail}"><h1>
			<font color="#F2F2F2" style="font-family: Georgia;">No-image</font></h1></c:if>
			<c:if test="${not empty e.encyc_thumbnail}">
			<img src="${e.encyc_thumbnail}"></c:if>
               <h4><font color="grey" style="font-family: Georgia; font-weight: bold;">${e.encyc_title}</font></h4>
                <div class="img-overlay">
                    <div class="portfolio-text">
                   <h4>${e.encyc_title}</h4>
                    <a href="#" onclick="window.open('${e.encyc_link}','new','width=700, height=700, toolbar =no, menubar =no, lacation= no, resizable=no, scrollbars=yes, status=no, top='+((window.screen.height-700)/2)+',left='+((window.screen.width-700)/2));">click</a>  
                    </div>
                </div>

            </div>     
        </c:forEach>
        </div><!--End portfolio item-->

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