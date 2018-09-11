<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
    <link rel="stylesheet" href="./Boot/css/weather-icons.css">
    <link rel="stylesheet" href="./Boot/css/weather-icons-wind.css">
   	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">  
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {

		var lonnum;
		var latnum;
		
		var randomnum = makeRandom(1, 8);
// 		alert(randomnum);
		
		function makeRandom(min, max){
		    var RandVal = Math.random() * (max- min) + min;
		    return Math.floor(RandVal);
		}
		
		//서울  37.566535,126.97796919999996
		//경기도 37.41379999999999,127.51829999999995
		//강원도 37.8228,128.15549999999996
		//충청도  36.562294,126.95410700000002
		//경상도 35.8059055,128.98767410000005
		//전라도 35.356425,126.95410700000002
		//제주도33.4890113,126.49830229999998
		//서울특별시: 37.566535,126.97796919999996
		//부산광역시 :35.1795543,129.07564160000004
		//인천광역시 :37.4562557,126.70520620000002
		//대구광역시 : 35.8714354,128.601445
		//대전광역시 : 36.3504119,127.38454750000005
		//광주광역시 : 35.1595454,126.85260119999998
		//울산광역시 : 35.5383773,129.31135960000006
		//제주도33.4890113,126.49830229999998
		
		switch (randomnum) {
		case 1:
			lonnum = "126.97796919999996";//서울
			latnum = "37.566535";
			break;
		case 2:
			lonnum = "129.07564160000004";//부산
			latnum = "35.1795543";
			break;
		case 3:
			lonnum = "126.70520620000002";//인천
			latnum = "37.4562557";
			break;
		case 4:
			lonnum = "128.601445";//대구
			latnum = "35.8714354";
			break;
		case 5:
			lonnum = "127.38454750000005";//대전
			latnum = "36.3504119";
			break;
		case 6:
			lonnum = "126.85260119999998";//광주
			latnum = "35.1595454";
			break;
		case 7:
			lonnum = "129.31135960000006";//울산
			latnum = "35.5383773";
			break;
		case 8:
			lonnum = "126.49830229999998";//제주
			latnum = "33.4890113";
			break;
		default:
			lonnum = "126.97796919999996";//서울
			latnum = "37.566535";
		}
		
// 		alert("lon: "+lonnum+", "+"lat: "+latnum);
		
		var today = new Date();
		var week = new Array('일', '월', '화', '수', '목', '금', '토');
		var year = today.getFullYear();
		var month = today.getMonth() + 1;
		var day = today.getDate();
		var hours = today.getHours();
		var minutes = today.getMinutes();
		$('#weather-date').html(month + "." + day + ". (" + week[today.getDay()] + ")");

		//// 	$('#WT').on('click',function WT_func(){

		$.ajax({
			type : "GET",
			crossDomain : true,
	// 		url : "https://api2.sktelecom.com/weather/current/minutely",//분당날씨 요청할때.
			url : "https://api2.sktelecom.com/weather/summary",
			dataType : "json",
			async : false,
			data : {
				lon : lonnum,
				lat : latnum,
				stnid : "",
				version : 2
			},
			headers : {
				"appkey" : "281378b4-b2fb-4dd6-bbe6-5642ef236bba",
				"Accept" : "application/json",
				"Content-Type" : "application/json; charset=UTF-8"
			},
			beforeSend : function() {},
			success : function(result) {

				//		===========================================분별	
				// 			alert(result);
				//  		 var sky = result.weather.minutely[0].sky.name;
				//  		 var temperature = result.weather.minutely[0].temperature.tc;
				//  		 var temperature2 =result.weather.minutely[0].temperature.tmin;
				//  		 var city = result.weather.minutely[0].station.name;
				//  		 temperature = Math.floor(temperature);
				//  		 temperature2 = Math.floor(temperature2);

				//  		 $('#weather-t').html(temperature+" ℃");
				//  		 $('#weather-tmin').html(temperature2+" ℃");
				//  		 $('#weather-state-text').html(sky);
				//  		 $('#weather-city').html(city);		

				//		===========================================간편( 오늘 내일 내일모래)	

				var city = result.weather.summary[0].grid.city; //시(특별,광역), 도
				var country = result.weather.summary[0].grid.country; //시, 군, 구
				var village = result.weather.summary[0].grid.village; //읍, 면, 동

				var todaySky = result.weather.summary[0].today.sky.name;
				var todaySkyCode = result.weather.summary[0].today.sky.code;
				var todayTempmax = result.weather.summary[0].today.temperature.tmax;
				var todayTempmin = result.weather.summary[0].today.temperature.tmin;

				var tmrSky = result.weather.summary[0].tomorrow.sky.name;
				var tmrSkyCode = result.weather.summary[0].tomorrow.sky.code;
				var tmrTempmax = result.weather.summary[0].tomorrow.temperature.tmax;
				var tmrTempmin = result.weather.summary[0].tomorrow.temperature.tmin;

				var datSky = result.weather.summary[0].dayAfterTomorrow.sky.name;
				var datSkyCode = result.weather.summary[0].dayAfterTomorrow.sky.code;
				var datTempmax = result.weather.summary[0].dayAfterTomorrow.temperature.tmin;
				var datTempmin = result.weather.summary[0].dayAfterTomorrow.temperature.tmin;

				$('.CurrCity').html(city);
				$('#country').html(country);
				$('#village').html(village);
				$('#todaySky').html("오늘: " + todaySky);
				$('#todayMax').html("최고기온: " + todayTempmax + " ℃");
				$('#todayMin').html("최저기온: " + todayTempmin + " ℃");

				$('#tmrSky').html("내일: " + tmrSky);
				$('#tmrMax').html("최저기온: " + tmrTempmax + " ℃");
				$('#tmrMin').html("최고기온:  " + tmrTempmin + " ℃");

				$('#datSky').html("내일모래:  " + datSky);
				$('#datMax').html("최고기온: " + datTempmax + " ℃");
				$('#datMin').html("최저기온: " + datTempmin + " ℃");

// 				하늘상태 코드명 SKY_D01:맑음,wi-day-sunny
// 				 SKY_D02구름조금, wi-cloud
// 				 SKY_D03:구름많음,wi-cloudy
// 				 SKY_D04:흐림, wi-fog
// 				SKY_D05:비, wi-rain
// 				SKY_D06:눈,wi-snowflake-cold
// 				 SKY_D07:비 또는 눈  wi-rain-mix	
				var one ="wi wi-day-sunny";
				var two ="wi wi-cloud";
				var three ="wi wi-cloudy";
				var four ="wi wi-fog";
				var five ="wi wi-rain";
				var six ="wi wi-snowflake-cold";
				var seven ="wi wi-rain-mix";


				if(todaySkyCode=="SKY_D01"){
					 $('#todaySkyImage').attr('class',one);
					 $('#todaySkyImage2').attr('class',one);
					 
				}else if(todaySkyCode=="SKY_D02"){
					$('#todaySkyImage').attr('class',two);
					$('#todaySkyImage2').attr('class',two);
					
				}else if(todaySkyCode=="SKY_D03"){
					$('#todaySkyImage').attr('class',three);
					$('#todaySkyImage2').attr('class',three);
					
				}else if(todaySkyCode=="SKY_D04"){
					$('#todaySkyImage').attr('class',four);
					$('#todaySkyImage2').attr('class',four);
					
				}else if(todaySkyCode=="SKY_D05"){
					$('#todaySkyImage').attr('class',five);
					$('#todaySkyImage2').attr('class',five);
					
				}else if(todaySkyCode=="SKY_D06"){
					$('#todaySkyImage').attr('class',six);
					$('#todaySkyImage2').attr('class',six);	
					
				}else if(todaySkyCode=="SKY_D07"){
					$('#todaySkyImage').attr('class',seven);
					$('#todaySkyImage2').attr('class',seven);
					
				}else{
					
				}
				

				if(tmrSkyCode=="SKY_M01"){
					 $('#tmrSkyImage').attr('class',one);
				}else if(tmrSkyCode=="SKY_M02"){
					$('#tmrSkyImage').attr('class',two);
				}else if(tmrSkyCode=="SKY_M03"){
					$('#tmrSkyImage').attr('class',three);
				}else if(tmrSkyCode=="SKY_M04"){
					$('#tmrSkyImage').attr('class',four);
				}else if(tmrSkyCode=="SKY_M05"){
					$('#tmrSkyImage').attr('class',five);
				}else if(tmrSkyCode=="SKY_M06"){
					$('#tmrSkyImage').attr('class',six);
				}else if(tmrSkyCode=="SKY_M07"){
					$('#tmrSkyImage').attr('class',seven);
				}else{
					
				}
				

				if(datSkyCode=="SKY_M01"){
					 $('#datSkyImage').attr('class',one);
				}else if(datSkyCode=="SKY_M02"){
					$('#datSkyImage').attr('class',two);
				}else if(datSkyCode=="SKY_M03"){
					$('#datSkyImage').attr('class',three);
				}else if(datSkyCode=="SKY_M04"){
					$('#datSkyImage').attr('class',four);
				}else if(datSkyCode=="SKY_M05"){
					$('#datSkyImage').attr('class',five);
				}else if(datSkyCode=="SKY_M06"){
					$('#datSkyImage').attr('class',six);
				}else if(datSkyCode=="SKY_M07"){
					$('#datSkyImage').attr('class',seven);
				}else{
					
				}
				
			},
			complete : function() {},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});


		// 	});	

	});
</script>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
@import	url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');
ul, li {
	font-family: 'NanumSquareRound', sans-serif;
}
.container{
	font-family: 'NanumSquareRound', sans-serif;
}
.main-menu{
	font-family: 'NanumSquareRound', sans-serif;
}
body {
	font-family: 'NanumSquareRound', sans-serif;
/* 	color: #CD853F; */
}
</style>	
</head>
<body>
    <header id="header">
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
									class="fa fa-angle-down"></i>
							</a>
								<ul class="sub-menu">
									<li><a href="dogFreeBoardList.do">강아지</a></li>
									<li><a href="catFreeBoardList.do">고양이</a></li>
									<li><a href="rabbitFreeBoardList.do">토끼</a></li>
									<li><a href="etcFreeBoardList.do">기타</a></li>
								</ul></li>

							<li class="menu-item-has-children"><a href="">펫프정보 <i
                                        class="fa fa-angle-down"></i></a>
                                    <ul class="sub-menu">
                                        <li class="menu-item-has-children"><a href="">강아지<i
                                                class="fa fa-angle-right"></i></a>
                                            <ul class="sub-menu">
                                                <li><a href="dogInfoSquareSpecies.do">강아지 종정보</a></li>
                                                <li><a href="TipBoardList.do?tipBoard_boardname=7">강아지 Tip</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children"><a href="">고양이<i
                                                class="fa fa-angle-right"></i></a>
                                            <ul class="sub-menu">
                                                <li><a href="CatInfoSquareSpecies.do">고양이 종정보</a></li>
                                                <li><a href="TipBoardList.do?tipBoard_boardname=8">고양이 Tip</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children"><a href="">토끼<i
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
	    <div class="wrapper">

    <!--slider section start-->
    <div class="slider-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="home-carousel">
                        <div class="home-slider">
                            <img src="Boot/images/home-2.jpg" alt="">

                            <div class="home-overlay text-center">
                                <p>November 21, 2015 | Lifestyle</p>

                                <h2>
                                    A Theme Beyond Your Imagination
                                </h2>
                                <a href="#" class="btn read-more text-uppercase">Read More</a>
                            </div>
                        </div>
                        <div class="home-slider">
                            <img src="Boot/images/home-3.jpg" alt="">

                            <div class="home-overlay text-center">
                                <p>November 21, 2015 | Lifestyle</p>

                                <h2>
                                    A Theme Beyond Your Imagination
                                </h2>
                                <a href="#" class="btn read-more text-uppercase">Read More</a>
                            </div>
                        </div>
                        <div class="home-slider">
                            <img src="Boot/images/home-3.jpg" alt="">

                            <div class="home-overlay text-center">
                                <p>November 21, 2015 | Lifestyle</p>

                                <h2>
                                    A Theme Beyond Your Imagination
                                </h2>
                                <a href="#" class="btn read-more text-uppercase">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--slider section end-->

    <!--promo box start-->
    <div class="promo-box text-uppercase text-center">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="single-promo-box" id="meetingbox0">               
                          
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="single-promo-box" id="meetingbox1">                     
                            
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="single-promo-box" id="meetingbox2">

                    </div>
                </div>
            </div>
        </div>
    </div>


</div>
<!--   <footer id="footer"> -->
<%@ include file="/petst/footer.jsp" %>

</body>
</html>