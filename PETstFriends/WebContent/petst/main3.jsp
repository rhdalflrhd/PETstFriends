<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="keywords" content=" ">
    <meta name="author" content="ShapedTheme">

    <!-- favicon icon -->
    <link rel="shortcut icon" href="Boot/images/favicon.png">

    <!-- common css -->
    <link rel="stylesheet" href="Boot/css/bootstrap.min.css">
    <link rel="stylesheet" href="Boot/css/font-awesome.min.css">
    <link rel="stylesheet" href="Boot/css/animate.min.css">
    <link rel="stylesheet" href="Boot/css/owl.carousel.css">
    <link rel="stylesheet" href="Boot/css/owl.theme.css">
    <link rel="stylesheet" href="Boot/css/owl.transitions.css">
    <link rel="stylesheet" href="Boot/css/slicknav.css">
    <link rel="stylesheet" href="Boot/style.css">
    <link rel="stylesheet" href="Boot/css/responsive.css">
 <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- HTML5 shim and Respond.js IE9 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="Boot/js/html5shiv.js"></script>
    <script src="Boot/js/respond.js"></script>
    <![endif]-->

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

@import	url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');

h3 {
	font-family: 'NanumSquareRound', sans-serif;
	
}

#footer {
	font-family: 'NanumSquareRound', sans-serif;
}

.footer-widget-section {
	font-family: 'NanumSquareRound', sans-serif;
}
#s1{
 height: 100%;
 width:100%;
 cursor: pointer;
}

</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {

// 		var lonnum;
// 		var latnum;
		
// 		var randomnum = makeRandom(1, 8);
// // 		alert(randomnum);
		
// 		function makeRandom(min, max){
// 		    var RandVal = Math.random() * (max- min) + min;
// 		    return Math.floor(RandVal);
// 		}
		
// 		//서울  37.566535,126.97796919999996
// 		//경기도 37.41379999999999,127.51829999999995
// 		//강원도 37.8228,128.15549999999996
// 		//충청도  36.562294,126.95410700000002
// 		//경상도 35.8059055,128.98767410000005
// 		//전라도 35.356425,126.95410700000002
// 		//제주도33.4890113,126.49830229999998
// 		//서울특별시: 37.566535,126.97796919999996
// 		//부산광역시 :35.1795543,129.07564160000004
// 		//인천광역시 :37.4562557,126.70520620000002
// 		//대구광역시 : 35.8714354,128.601445
// 		//대전광역시 : 36.3504119,127.38454750000005
// 		//광주광역시 : 35.1595454,126.85260119999998
// 		//울산광역시 : 35.5383773,129.31135960000006
// 		//제주도33.4890113,126.49830229999998
		
// 		switch (randomnum) {
// 		case 1:
// 			lonnum = "126.97796919999996";//서울
// 			latnum = "37.566535";
// 			break;
// 		case 2:
// 			lonnum = "129.07564160000004";//부산
// 			latnum = "35.1795543";
// 			break;
// 		case 3:
// 			lonnum = "126.70520620000002";//인천
// 			latnum = "37.4562557";
// 			break;
// 		case 4:
// 			lonnum = "128.601445";//대구
// 			latnum = "35.8714354";
// 			break;
// 		case 5:
// 			lonnum = "127.38454750000005";//대전
// 			latnum = "36.3504119";
// 			break;
// 		case 6:
// 			lonnum = "126.85260119999998";//광주
// 			latnum = "35.1595454";
// 			break;
// 		case 7:
// 			lonnum = "129.31135960000006";//울산
// 			latnum = "35.5383773";
// 			break;
// 		case 8:
// 			lonnum = "126.49830229999998";//제주
// 			latnum = "33.4890113";
// 			break;
// 		default:
// 			lonnum = "126.97796919999996";//서울
// 			latnum = "37.566535";
// 		}
		
// // 		alert("lon: "+lonnum+", "+"lat: "+latnum);
		
// 		var today = new Date();
// 		var week = new Array('일', '월', '화', '수', '목', '금', '토');
// 		var year = today.getFullYear();
// 		var month = today.getMonth() + 1;
// 		var day = today.getDate();
// 		var hours = today.getHours();
// 		var minutes = today.getMinutes();
// 		$('#weather-date').html(month + "." + day + ". (" + week[today.getDay()] + ")");

// 		//// 	$('#WT').on('click',function WT_func(){

// 		$.ajax({
// 			type : "GET",
// 			crossDomain : true,
// 	// 		url : "https://api2.sktelecom.com/weather/current/minutely",//분당날씨 요청할때.
// 			url : "https://api2.sktelecom.com/weather/summary",
// 			dataType : "json",
// 			async : false,
// 			data : {
// 				lon : lonnum,
// 				lat : latnum,
// 				stnid : "",
// 				version : 2
// 			},
// 			headers : {
// 				"appkey" : "281378b4-b2fb-4dd6-bbe6-5642ef236bba",
// 				"Accept" : "application/json",
// 				"Content-Type" : "application/json; charset=UTF-8"
// 			},
// 			beforeSend : function() {},
// 			success : function(result) {

// 				//		===========================================분별	
// 				// 			alert(result);
// 				//  		 var sky = result.weather.minutely[0].sky.name;
// 				//  		 var temperature = result.weather.minutely[0].temperature.tc;
// 				//  		 var temperature2 =result.weather.minutely[0].temperature.tmin;
// 				//  		 var city = result.weather.minutely[0].station.name;
// 				//  		 temperature = Math.floor(temperature);
// 				//  		 temperature2 = Math.floor(temperature2);

// 				//  		 $('#weather-t').html(temperature+" ℃");
// 				//  		 $('#weather-tmin').html(temperature2+" ℃");
// 				//  		 $('#weather-state-text').html(sky);
// 				//  		 $('#weather-city').html(city);		

// 				//		===========================================간편( 오늘 내일 내일모래)	

// 				var city = result.weather.summary[0].grid.city; //시(특별,광역), 도
// 				var country = result.weather.summary[0].grid.country; //시, 군, 구
// 				var village = result.weather.summary[0].grid.village; //읍, 면, 동

// 				var todaySky = result.weather.summary[0].today.sky.name;
// 				var todaySkyCode = result.weather.summary[0].today.sky.code;
// 				var todayTempmax = result.weather.summary[0].today.temperature.tmax;
// 				var todayTempmin = result.weather.summary[0].today.temperature.tmin;

// 				var tmrSky = result.weather.summary[0].tomorrow.sky.name;
// 				var tmrSkyCode = result.weather.summary[0].tomorrow.sky.code;
// 				var tmrTempmax = result.weather.summary[0].tomorrow.temperature.tmax;
// 				var tmrTempmin = result.weather.summary[0].tomorrow.temperature.tmin;

// 				var datSky = result.weather.summary[0].dayAfterTomorrow.sky.name;
// 				var datSkyCode = result.weather.summary[0].dayAfterTomorrow.sky.code;
// 				var datTempmax = result.weather.summary[0].dayAfterTomorrow.temperature.tmin;
// 				var datTempmin = result.weather.summary[0].dayAfterTomorrow.temperature.tmin;

// 				$('.CurrCity').html(city);
// 				$('#country').html(country);
// 				$('#village').html(village);
// 				$('#todaySky').html("오늘: " + todaySky);
// 				$('#todayMax').html("최고기온: " + todayTempmax + " ℃");
// 				$('#todayMin').html("최저기온: " + todayTempmin + " ℃");

// 				$('#tmrSky').html("내일: " + tmrSky);
// 				$('#tmrMax').html("최저기온: " + tmrTempmax + " ℃");
// 				$('#tmrMin').html("최고기온:  " + tmrTempmin + " ℃");

// 				$('#datSky').html("내일모래:  " + datSky);
// 				$('#datMax').html("최고기온: " + datTempmax + " ℃");
// 				$('#datMin').html("최저기온: " + datTempmin + " ℃");

// // 				하늘상태 코드명 SKY_D01:맑음,wi-day-sunny
// // 				 SKY_D02구름조금, wi-cloud
// // 				 SKY_D03:구름많음,wi-cloudy
// // 				 SKY_D04:흐림, wi-fog
// // 				SKY_D05:비, wi-rain
// // 				SKY_D06:눈,wi-snowflake-cold
// // 				 SKY_D07:비 또는 눈  wi-rain-mix	
// 				var one ="wi wi-day-sunny";
// 				var two ="wi wi-cloud";
// 				var three ="wi wi-cloudy";
// 				var four ="wi wi-fog";
// 				var five ="wi wi-rain";
// 				var six ="wi wi-snowflake-cold";
// 				var seven ="wi wi-rain-mix";


// 				if(todaySkyCode=="SKY_D01"){
// 					 $('#todaySkyImage').attr('class',one);
// 					 $('#todaySkyImage2').attr('class',one);
					 
// 				}else if(todaySkyCode=="SKY_D02"){
// 					$('#todaySkyImage').attr('class',two);
// 					$('#todaySkyImage2').attr('class',two);
					
// 				}else if(todaySkyCode=="SKY_D03"){
// 					$('#todaySkyImage').attr('class',three);
// 					$('#todaySkyImage2').attr('class',three);
					
// 				}else if(todaySkyCode=="SKY_D04"){
// 					$('#todaySkyImage').attr('class',four);
// 					$('#todaySkyImage2').attr('class',four);
					
// 				}else if(todaySkyCode=="SKY_D05"){
// 					$('#todaySkyImage').attr('class',five);
// 					$('#todaySkyImage2').attr('class',five);
					
// 				}else if(todaySkyCode=="SKY_D06"){
// 					$('#todaySkyImage').attr('class',six);
// 					$('#todaySkyImage2').attr('class',six);	
					
// 				}else if(todaySkyCode=="SKY_D07"){
// 					$('#todaySkyImage').attr('class',seven);
// 					$('#todaySkyImage2').attr('class',seven);
					
// 				}else{
					
// 				}
				

// 				if(tmrSkyCode=="SKY_M01"){
// 					 $('#tmrSkyImage').attr('class',one);
// 				}else if(tmrSkyCode=="SKY_M02"){
// 					$('#tmrSkyImage').attr('class',two);
// 				}else if(tmrSkyCode=="SKY_M03"){
// 					$('#tmrSkyImage').attr('class',three);
// 				}else if(tmrSkyCode=="SKY_M04"){
// 					$('#tmrSkyImage').attr('class',four);
// 				}else if(tmrSkyCode=="SKY_M05"){
// 					$('#tmrSkyImage').attr('class',five);
// 				}else if(tmrSkyCode=="SKY_M06"){
// 					$('#tmrSkyImage').attr('class',six);
// 				}else if(tmrSkyCode=="SKY_M07"){
// 					$('#tmrSkyImage').attr('class',seven);
// 				}else{
					
// 				}
				

// 				if(datSkyCode=="SKY_M01"){
// 					 $('#datSkyImage').attr('class',one);
// 				}else if(datSkyCode=="SKY_M02"){
// 					$('#datSkyImage').attr('class',two);
// 				}else if(datSkyCode=="SKY_M03"){
// 					$('#datSkyImage').attr('class',three);
// 				}else if(datSkyCode=="SKY_M04"){
// 					$('#datSkyImage').attr('class',four);
// 				}else if(datSkyCode=="SKY_M05"){
// 					$('#datSkyImage').attr('class',five);
// 				}else if(datSkyCode=="SKY_M06"){
// 					$('#datSkyImage').attr('class',six);
// 				}else if(datSkyCode=="SKY_M07"){
// 					$('#datSkyImage').attr('class',seven);
// 				}else{
					
// 				}
				
// 			},
// 			complete : function() {},
// 			error : function(request, status, error) {
// 				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
// 			}
// 		});
			var randomnum = 3;
			var randomnum2 = 1; //1:애견카페 2:애묘카페 3.호텔 4.공원 5:놀이터
			var todaySkyCode = 'SKY_D02';
			var imgSlide = function(){
				if(todaySkyCode=='SKY_D01' || todaySkyCode =='SKY_D02'){
					randomnum2 = Math.floor(Math.random() * 3) + 1;
					if(randomnum2<=2)
						$("#s1").attr("src","Boot/images/slider/fallcafe.jpg");	
// 					else//호텔사진
// 						$("#s1").attr("src","Boot/images/slider/fallcafe.jpg");	
				}
				else{
					randomnum2 = Math.floor(Math.random() * 3) + 3;
					if(randomnum2==4)
					$('#s1').attr('src','Boot/images/slider/dailyStroll.png');
				}
			}
			imgSlide();
			
			$(document).on('click', '#s1', function(){
				location.href='checkPlace.do?randomnum='+randomnum+'&todaySkyCode='+randomnum+'&randomnum2='+randomnum2;
			})
		// 	});	
	});
</script>
<style type="text/css">
/* IMG { */
/* 	MAX-WIDTH: 100%; */
/* 	WIDTH: 1500PX; */
/* 	MAX-HEIGHT: 100%; */
/* 	HEIGHT: 600PX; */
/* } */
</style>

</head>
<body>

<div class="wrapper">
    <!-- pre-loader-->
    <div class="preloader">
        <div class="spinner">
            <div class="double-bounce1"></div>
            <div class="double-bounce2"></div>
        </div>
    </div>
    <!--header section start-->
    <%
		boolean a = false;//어드민 이면     ture
		boolean b = false;//회원 이면 true
		if (session.getAttribute("user_id") != null && session.getAttribute("adminCheck") != null) {//아이디가 있고 어드민 있으므로 어드민
			a = true;
		} else if (session.getAttribute("user_id") != null) {
			b = true;
		}
		;
		pageContext.setAttribute("a", a);
		pageContext.setAttribute("b", b);
	%>
    <header id="header">
	
	
	<div class="main-logo text-center" style="background-color: white">

		<div class="container">
			<div class="menu-item-has-children" align="right">
				<c:choose>
					<c:when test="${a }">
						<a style="cursor: pointer;color: brown; font-size: 15px;"
						href="logout.do">로그아웃</a>
					</c:when>
					<c:when test="${b}">
						<a style="cursor: pointer;color: brown; font-size: 15px;"
						href="showNoticeList.do">고객센터</a>
						<a style="cursor: pointer;color: brown; font-size: 15px;"
						href="logout.do">로그아웃</a>
						<a style="cursor: pointer;color: brown; font-size: 15px;"
						href="userPwCheck.do">마이페이지</a>
						<a style="cursor: pointer;color: brown; font-size: 15px;"
						href="#">쪽지함</a>
					</c:when>
					<c:otherwise>
						<a style="cursor: pointer; color: brown; font-size: 15px;"
						href="showNoticeList.do">고객센터</a>
						<a style="cursor: pointer; color: brown; font-size: 15px;"
						href="loginForm.do">로그인</a>
						<a style="cursor: pointer; color: brown; font-size: 15px;"
						href="joinUserForm.do">회원가입</a>
					</c:otherwise>
				</c:choose>

			</div>
		</div>

		<h1>
			<a href="main.do"><img src="./Boot/images/petstlogo_2.PNG" style="" alt="Ocean"></a>
		</h1>
	</div>

		<div class="container">

			<div class="row">
				<div class="col-md-12">
					<div class="main-menu text-uppercase">
						<ul id="menu">

							<li><a href="main.do">첫 화면으로</a></li>
							<li class="menu-item-has-children"><a href="meeting.do">펫프 모여라 </a></li>
							
							<li class="menu-item-has-children"><a href="#">펫프 광장 <i
									class="fa fa-angle-down"></i></a>
								<ul class="sub-menu">
									<li><a href="dogFreeBoardList.do">강아지</a></li>
									<li><a href="catFreeBoardList.do">고양이</a></li>
									<li><a href="rabbitFreeBoardList.do">토끼</a></li>
									<li><a href="etcFreeBoardList.do">기타</a></li>
								</ul></li>

							<li class="menu-item-has-children"><a >펫프정보 <i
                                        class="fa fa-angle-down"></i></a>
                                    <ul class="sub-menu">
                                        <li class="menu-item-has-children"><a >강아지<i
                                                class="fa fa-angle-right"></i></a>
                                            <ul class="sub-menu">
                                                <li><a href="dogInfoSquareSpecies.do">강아지 종정보</a></li>
                                                <li><a href="TipBoardList.do?tipBoard_boardname=7">강아지 Tip</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children"><a >고양이<i
                                                class="fa fa-angle-right"></i></a>
                                            <ul class="sub-menu">
                                                <li><a href="CatInfoSquareSpecies.do">고양이 종정보</a></li>
                                                <li><a href="TipBoardList.do?tipBoard_boardname=8">고양이 Tip</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children"><a >토끼<i
                                                class="fa fa-angle-right"></i></a>
                                            <ul class="sub-menu">
                                                <li><a href="RabbitInfoSquareSpecies.do">토끼 종정보</a></li>
                                                <li><a href="TipBoardList.do?tipBoard_boardname=9">토끼 Tip</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>

							<li><a href="checkHospital.do">병원</a></li>
							<li class="menu-item-has-children"><a href="checkPlace.do">플레이스</a>
							<li><a href="shoppingList.do">펫프쇼핑비교</a></li>
							<li class="menu-item-has-children"><a href="#">
							<span id="weather-date"></span>&nbsp;<i id="todaySkyImage" class=""></i><span id="CurrCity" class="CurrCity"></span> 날씨
							<i class="fa fa-angle-down"></i>
							</a>
								<ul class="sub-menu">
									<li><a href="#"><span id="todaySky"></span><i id="todaySkyImage2" class=""></i><br><span id="todayMax"></span><br><span id="todayMin"></span></a></li>
									<li><a href="#"><span id="tmrSky"></span><i id="tmrSkyImage" class=""></i><br><span id="tmrMax"></span><br><span id="tmrMin"></span></a></li>
									<li><a href="#"><span id="datSky"></span><i id="datSkyImage" class=""></i><br><span id="datMax"></span><br><span id="datMin"></span></a></li>
								</ul></li>													
							<c:if test="${a }">
								<li class="menu-item-has-children"><a href="">관리자 메뉴<i
										class="fa fa-angle-down"></i></a>
									<ul class="sub-menu">

										<li class="menu-item-has-children"><a href="showNoticeList.do">고객센터 관리
										</a>
										<li class="menu-item-has-children"><a href="">회원관리 <i
												class="fa fa-angle-right"></i>
										</a>
											<ul class="sub-menu">
												<li><a href="#">회원관리</a></li>
												<li><a href="#">쪽지</a></li>
											</ul></li>

										<li class="menu-item-has-children"><a href="#">게시판관리 <i
												class="fa fa-angle-right"></i>
										</a>
											<ul class="sub-menu">
												<li><a href="showReportList.do">신고글 보기</a></li>
												<li><a href="showMalList.do">말머리 추가삭제</a></li>
											</ul></li>
									</ul></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	    </header>
    <!--header section end-->
<br><br>
<center>
    <!--slider section start-->
    <div class="slider-section" align="center">
        <div class="container" align="center">
            <div class="row" align="center">
                <div align="center">
                    <div class="home-carousel" align="center" style=" background: rgba(255,255,255,0.2);">
                        <div class="home-slider" style="width: 1140px; height:600px;">
 								<img src="Boot/images/slider/homeslide1.jpg" alt="" style="height: 100%;width:100%">
                        </div>
                        <div class="home-slider" style="width: 1140px; height:600px;">
 								<img src="Boot/images/slider/homeslide2.jpg" alt="" style="height: 100%;width:100%" >
                        </div>
                        <div class="home-slider" style="width: 1140px; height:600px;">
 								<img src="Boot/images/slider/petpeSquare.png" alt="" style="height: 100%;width:100%; cursor:pointer" 
 								onclick="location.href='dogFreeBoardList.do'">
                        </div>
                        <div class="home-slider" style="width: 1140px; height:600px;">
 								<img id="s1" src="Boot/images/slider/fallcafe.jpg" alt="" style="height: 100%;width:100%;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--slider section end-->
</center>

    <!--promo box start-->
    <div class="promo-box text-uppercase text-center">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="single-promo-box">
                        <a href="about-us-1.html">
                            <img src="Boot/images/promo-box.png" alt="">

                            <div class="overlay">
                                <h3 class="promo-title"><span>About Us</span></h3>
                            </div>


                        </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="single-promo-box">
                        <a href="portfolio.html">
                            <img src="Boot/images/promo-box.png" alt="">

                            <div class="overlay">

                                <h3 class="promo-title"><span>portfolio</span></h3>
                            </div>


                        </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="single-promo-box">
                        <a href="portfolio.html">
                            <img src="Boot/images/promo-box.png" alt="">

                            <div class="overlay">

                                <h3 class="promo-title"><span>Lifestyle</span></h3>
                            </div>


                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--promo box end-->

    <!--footer start-->
    <footer id="footer">
		<div class="footer-widget-section" >
			<div class="container">
			<div class="row" >
					<div class="col-md-4">
						<div class="footer-widget">
							<div class="about-me-img">
								<h3 style="font-weight: bold;">&nbsp;ABOUT SITE</h3>
								<a href="main.do">
								<img src="./Boot/images/UUU.png" alt="ocean"></a>
							</div>

							<div>This site is a community of comapnion You can get
								information about place where you can go with your pet and talk
								to people over the Internet. This site also provides an
								opportunity to meet with other people.</div>
							<br>
						</div>
					</div>
					<div class="col-md-4">
						<div class="footer-widget">
							<div class="about-me-img">
								<h3 style="font-weight: bold;">&nbsp;CONTACT US</h3>
								<div>
									서울 특별시 종로구 PETstFriends<br> Tel . 02. 000. 0000 월-금(10:00
									- 19:00)<br> Email. bitcamp@petstfriends.co.kr
								</div>
							</div>
						</div>

					</div>
					<div class="col-md-4">
						<div class="footer-widget">
							<h3>
								<br>
							</h3>
							<div>
								PETst FRIENDS | 대표이사 김가은<br> 서울 특별시 종로구 PETstFriends<br>
								개인정보관리책임자 박용준
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		        <div class="footer-copy-right">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        &copy; 2018 <a href="main.do">PETstFriends</a>, All rights reserved.
                    </div>
                    <div class="col-md-6">
                        <a href="" class="back-to-top">Back to Top</a>
                    </div>
                </div>
            </div>
        </div>
	</div>
        

    <!--footer end-->
  <script type="text/javascript" src="Boot/js/modernizr-2.6.2.min.js"></script>
<script type="text/javascript" src="Boot/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="Boot/js/bootstrap.min.js"></script>
<script type="text/javascript" src="Boot/js/smoothscroll.js"></script>
<script type="text/javascript" src="Boot/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="Boot/js/imagesloaded.pkgd.js"></script>
<script type="text/javascript" src="Boot/js/isotope.2.2.2min.js"></script>
<script type="text/javascript" src="Boot/js/jquery.fitvids.js"></script>
<script type="text/javascript" src="Boot/js/jquery.stickit.min.js"></script>
<script type="text/javascript" src="Boot/js/jquery.slicknav.js"></script>
<script type="text/javascript" src="Boot/js/scripts.js"></script>
</body>
</html>