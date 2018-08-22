<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Rubel Miah">
     <link rel="shortcut icon" href="./assets/images/favicon.png">
<title>탈퇴 비번확인</title>

  <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="./assets/css/animate.min.css">
    <link rel="stylesheet" href="./assets/css/owl.carousel.css">
    <link rel="stylesheet" href="./assets/css/owl.theme.css">
    <link rel="stylesheet" href="./assets/css/slicknav.css">
    <link rel="stylesheet" href="./assets/style.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">

</head>
<style>
.layer{
  position:absolute;
  top:50%; 
  left:40%; 
  width:400px;
  height:300px;
  background:;
  margin:-50px 0 0 -50px;
}
</style>
<script type="text/javascript">

$(document).ready(function() {

	$('#loginBtn').click(function() {

		$.ajax({
			type : "GET",
			url : "login.do",
			data : {
				"user_id" : $('#user_id').val(),
				"user_pass" : $('#user_pass').val()
			},
			success : function(result) {
				if (result == true) {
					alert("로그인성공");
					window.location.href = "main.do";
				} else {
					alert("로그인실패");

				}
			},
			error : function(jqXHR, exception) {
				if (jqXHR.status === 0) {
					alert('Not connect.\n Verify Network.');
				} else if (jqXHR.status == 400) {
					alert('Server understood the request, but request content was invalid. [400]');
				} else if (jqXHR.status == 401) {
					alert('Unauthorized access. [401]');
				} else if (jqXHR.status == 403) {
					alert('Forbidden resource can not be accessed. [403]');
				} else if (jqXHR.status == 404) {
					alert('Requested page not found. [404]');
				} else if (jqXHR.status == 500) {
					alert('Internal server error. [500]');
				} else if (jqXHR.status == 503) {
					alert('Service unavailable. [503]');
				} else if (exception === 'parsererror') {
					alert('Requested JSON parse failed. [Failed]');
				} else if (exception === 'timeout') {
					alert('Time out error. [Timeout]');
				} else if (exception === 'abort') {
					alert('Ajax request aborted. [Aborted]');
				} else {
					alert('Uncaught Error.n' + jqXHR.responseText);
				}
			}
		}) //ajax



	}) //로그인버튼




}) //레디



//----------------------------------------------------------------------------------------
</script>

<body>
<div class="wrapper">
<!--  ------------------------------------------------------------------------------------------- -->
       <header id="header">
        <div class="main-logo text-center">
            <h1><a href="#"><img src="./assets/images/petstlogo_2.PNG" alt="Ocean"></a></h1>
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
                                                <li><a href="#">강아지 Tip</a></li>
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
                                <li><a href="./assets/contact.html">contact</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!--header section end------------------------------------------------------------------------------------------- -->
<center>
	<div class="mt20"   ></div>
<div class="memberout-wrap"  style="border: 1px solid orange; height: 850px; width: 850px;" >
<center>
		<h1>
			<b><font color="gray">로그인</font></b>
		</h1>



		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" id="user_id" name="user_id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="user_pass" name="user_pass"></td>
			</tr>
		</table>

		<table>
			<tr>
				<td style="height: 3px"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">

					<button id=loginBtn
						style="width: 80px; height: 28px; background-color: #FFE6E6; border: 1 solid white">로그인</button>
					<button onclick="location.href='joinUserForm.do'"
						style="width: 80px; height: 28px; background-color: #FFE6E6; border: 1 solid white">회원가입</button>
					<button onclick="location.href='main.do'"
						style="width: 80px; height: 28px; background-color: #FFE6E6; border: 1 solid white">메인</button>

				</td>
				
		
			</tr>

		</table>
		<table>
		<tr>
				<td style="height: 3px"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
		
		<button onclick="location.href='FindUserIdForm.do'"
						style="width: 90px; height: 28px; background-color: #FFE6E6; border: 1 solid white">ID/PW찾기</button>
		
		
		</td>
		</tr>
		
		</table>
	</center>
			
		</div>
		</center>

	</div>
	
<!-- ------------------------------------------------------------------------------------------- -->

 <footer id="footer">

        <div class="footer-widget-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <aside class="footer-widget">
                            <div class="about-me-img"><img src="./assets/images/UUU.png" alt="ocean"></div>
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
    <!--footer end------------------------------------------------------------------------------------------- -->

	<script type="text/javascript" src="./assets/js/modernizr-2.6.2.min.js"></script>
<script type="text/javascript" src="./assets/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="./assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./assets/js/smoothscroll.js"></script>
<script type="text/javascript" src="./assets/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="./assets/js/imagesloaded.pkgd.js"></script>
<script type="text/javascript" src="./assets/js/isotope.2.2.2min.js"></script>
<script type="text/javascript" src="./assets/js/jquery.fitvids.js"></script>
<script type="text/javascript" src="./assets/js/jquery.stickit.min.js"></script>
<script type="text/javascript" src="./assets/js/jquery.slicknav.js"></script>
<script type="text/javascript" src="./assets/js/scripts.js"></script>


</body>
</html>