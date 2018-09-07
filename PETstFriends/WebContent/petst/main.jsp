<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="keywords" content=" ">
    <meta name="author" content="ShapedTheme">

    <!-- favicon icon -->
    <link rel="shortcut icon" href="./Boot/images/favicon.png">

    <title>Maindd</title>

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


    <!-- HTML5 shim and Respond.js IE9 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="assets/js/html5shiv.js"></script>
    <script src="assets/js/respond.js"></script>
    <![endif]-->

</head>
<body>
<%@ include file="/petst/header.jsp" %>
<div class="wrapper">

    <!--slider section start-->
    <div class="slider-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="home-carousel">
                        <div class="home-slider">
                            <img src="./Boot/images/PETstFriends.jpg" alt="">

                        </div>
                        <div class="home-slider">
                            <img src="./Boot/images/home-2.jpg" alt="">

                            <div class="home-overlay text-center">
                                <p>November 21, 2015 | Lifestyle</p>

                                <h2>
                                    A Theme Beyond Your Imagination
                                </h2>
                                <a href="#" class="btn read-more text-uppercase">Read More</a>
                            </div>
                        </div>
                        <div class="home-slider">
                            <img src="./Boot/images/home-3.jpg" alt="">

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

    
    
    
 <script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>   
	<script type="text/javascript">
// $(document).ready(function() {
// 	$.ajax({
// 		type : "get",
// 		url : "showmain.do",
// 		dataType : "json",
// 		async: false,
// 		contentType : "application/json; charset=UTF-8",
// 		success : function(data){
// 		for(var io = 0; io<3; io++){
// 			var proPic=data.meetingBoard[io].meetingBoard_proPic;
// 			if(proPic==null){
// 				proPic=1;
// 			}
// 			var spilt = data.meetingBoard[io].meetingBoard_place.split('/');
// 			var place1 = spilt[0];
// 			var place2 = spilt[1]; 
// 			$('#meetingbox'+(io)).append(
// 					//사진크기 400 / 350
// 				 "<a href=\"meetingview.do?meeting_boardno="+data.meetingBoard[io].meeting_boardno+"\"><img src=\"img/"+proPic+"\"><div class=\"overlay\">"+
// 		                    "<h3 class=\"promo-title\" style=\"color: white; \"><span style=\"top: 30px\">모&nbsp임&nbsp명 :<br>"+data.meetingBoard[io].meetingBoard_title+
// 		                    "<br><br>모임 장소 :<br>"+place1+"<br>"
// 		                    +place2+"<br><br>모&nbsp임&nbsp일 :<br>"+data.meetingBoard[io].meetingBoard_startMeetingDate.substring(0,10)+
// 		                    "</span></h3></div></a>");
                        

		                 
// 		} 

// 		},
// 		error : function(request){
// 			alert("에러 : "+request.status);
// 		}
// 	})
// })
	</script>
    <!--promo box end-->


</div>
<!--   <footer id="footer"> -->
<%@ include file="/petst/footer.jsp" %>
    <!--footer end-->
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