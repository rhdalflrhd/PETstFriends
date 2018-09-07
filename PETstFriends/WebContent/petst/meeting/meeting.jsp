<%@page import="model.MeetingBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="assets/images/favicon.png">
<title>펫프 모여라 게시판</title>
<%@ include file="/petst/header.jsp" %>
</head>
    
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">    
    <link rel="stylesheet" href="./Boot/css/bootstrap.min.css">
    <link rel="stylesheet" href="./Boot/css/font-awesome.min.css">
    <link rel="stylesheet" href="./Boot/css/animate.min.css">
    <link rel="stylesheet" href="./Boot/css/owl.carousel.css">
    <link rel="stylesheet" href="./Boot/css/owl.theme.css">
    <link rel="stylesheet" href="./Boot/css/slicknav.css">
    <link rel="stylesheet" href="./Boot/style.css">
    <link rel="stylesheet" href="./Boot/css/responsive.css">
	
<script type="text/javascript">
$(document).ready(function() {
	stop;
	$.ajax({
		type : "get",
		url : "showMBC.do",
		dataType : "json",
		async: false,
		contentType : "application/json; charset=UTF-8",
		success : function(data){
		       var num=0;
		       var number = [];
			for(var i = 1; i<10; i++){
		       if(num<data.count){
		    	   if(data.meetingBoard[num].meeting_boardno!=null){
		    		   number[i]=num;
		    	   }else{
		    		   i--;
		    	   }
	    		   num++;
		       }}
			stop=9;
		for(var io = 1; io<10; io++){
			var proPic=data.meetingBoard[number[io]].meetingBoard_proPic;
			if(proPic==null){
				proPic=1;
			}
			if(io==1){
			 	$('#listTable>tbody:last').append("<tr>");}
			
			if(io!=1&&io%3==1){
			 	$('#listTable>tbody:last').append("</tr></td></tr><tr>");
			}
			var spilt = data.meetingBoard[number[io]].meetingBoard_place.split('/');
			var place1 = spilt[0];
			var place2 = spilt[1]; 
			$('#listTable>tbody:last').append(
					//사진크기 400 / 350
				 "<td><table>"+ 
				 "<tr><td><div class=\"portfolio-item development\"><img src=\"img/"+proPic+"\"><div class=\"img-overlay\"><div class=\"portfolio-text\">"+
		                    "<h4  style=\"color: white; text-align: left; padding-left: 30px\">모&nbsp임&nbsp명 : "+data.meetingBoard[number[io]].meetingBoard_title+
		                    "<br><br>모임 장소 : "+place1+"<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"
		                    +place2+"<br><br>모&nbsp임&nbsp일 : "+data.meetingBoard[number[io]].meetingBoard_startMeetingDate.substring(0,10)+
		                    "</h4><a href=\"meetingview.do?meeting_boardno="+data.meetingBoard[number[io]].meeting_boardno+"\">click</a></div></div></div></td></tr></table></td>");				
// 							제목 23자 제한 걸어야함						
				
		} 

		},
		error : function(request){
			alert("에러 : "+request.status);
		}
	})
	$('#keyword').keydown(function(key){
		if(key.keyCode ==13){
			var a = $('#keyword').val();
			alert(a)
			$('#search').trigger('click');
		}
	});
	$('#search').click(function(){
		stop=0;
        $('html, body').animate({
            scrollTop : 0
        }, 1000);
		$('#listTable>tbody').empty();
	 	var type = $('#type').val();
	 	var keyword = $('#keyword').val();
			$.ajax({
				type : "get",
				url : "showMBC.do",
				dataType : "json",
				async: false,
		 		data : {
		 		"type" : type,
		 		"keyword" : keyword
		 		},
				contentType : "application/json; charset=UTF-8",
				success : function(data){
				       var number = [];
	
					for(var num = 0; num<data.meetingBoard.length;num++){
						number[num+1]=num;
					}

					for(var io = 1; io<=data.meetingBoard.length; io++){
						var proPic=data.meetingBoard[number[io]].meetingBoard_proPic;
						if(proPic==null){
							proPic=1;
						}
						if(io==1){
						 	$('#listTable>tbody:last').append("<tr>");}
						
						if(io!=1&&io%3==1){
						 	$('#listTable>tbody:last').append("</tr></td></tr><tr>");
						}
						var spilt = data.meetingBoard[number[io]].meetingBoard_place.split('/');
						var place1 = spilt[0];
						var place2 = spilt[1];  
						$('#listTable>tbody:last').append(
								//사진크기 400 / 350		
												 "<td><table>"+ 
						 "<tr><td><div class=\"portfolio-item development\"><img src=\"img/"+proPic+"\"><div class=\"img-overlay\"><div class=\"portfolio-text\">"+
		                    "<h4  style=\"color: white; text-align: left; padding-left: 30px\">모&nbsp&nbsp 임&nbsp&nbsp 명 : "+data.meetingBoard[number[io]].meetingBoard_title+
		                    "<br><br>모임&nbsp 장소 : "+place1+"<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"
		                    +place2+"<br><br>모&nbsp&nbsp 임&nbsp&nbsp 일 : "+data.meetingBoard[number[io]].meetingBoard_startMeetingDate.substring(0,10)+
		                    "</h4><a href=\"meetingview.do?meeting_boardno="+data.meetingBoard[number[io]].meeting_boardno+"\">click</a></div></div></div></td></tr></table></td>");
						
					} 
					  
				},
				error : function(request){
					alert("에러 : "+request.status);
				}
			})
	})
    $("#MOVE_TOP_BTN").click(function() {
        $('html, body').animate({
            scrollTop : 0
        }, 1000);
    });
	})
var num=9;
$(window).scroll(function(){
	        if($(window).scrollTop() > 200) {
	            $('#MOVE_TOP_BTN').fadeIn();
	           } else {
	            $('#MOVE_TOP_BTN').fadeOut();
	           }

		if($(window).scrollTop()+$(window).height()>$(document).height()-150&&stop==9){
			$.ajax({
				type : "get",
				url : "showMBC.do",
				dataType : "json",
				contentType : "application/json; charset=UTF-8",
				success : function(data){
				       var number = [];
					for(var i = 1; i<10; i++){
				       if(num<data.count){
				    	   if(data.meetingBoard[num].meeting_boardno!=null){
				    		   number[i]=num;
				    	   }else{
				    		   i--;
				    	   }
			    		   num++;
				       }}
					
				for(var io = 1; io<10; io++){
					var proPic=data.meetingBoard[number[io]].meetingBoard_proPic;
					var nu = data.meetingBoard[number[io]].meetingBoard_place.length;
		            if(nu>12){
		            	nu="...";
		            }else{
		            	nu="";
		            }
					if(proPic==null){
						proPic=1;
					}
					if(io==1){
					 	$('#listTable>tbody:last').append("<tr>");}
					
					if(io!=1&&io%3==1){
					 	$('#listTable>tbody:last').append("</tr></td></tr><tr>");
					}
					var spilt = data.meetingBoard[number[io]].meetingBoard_place.split('/');
					var place1 = spilt[0];
					var place2 = spilt[1]; 
					$('#listTable>tbody:last').append(
							//사진크기 400 / 350
						 "<td><table>"+ 
						 "<tr><td><div class=\"portfolio-item development\"><img src=\"img/"+proPic+"\"><div class=\"img-overlay\"><div class=\"portfolio-text\">"+
		                    "<h4  style=\"color: white; text-align: left; padding-left: 30px\">모&nbsp&nbsp 임&nbsp&nbsp 명 : "+data.meetingBoard[number[io]].meetingBoard_title+
		                    "<br><br>모임&nbsp 장소 : "+place1+"<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"
		                    +place2+"<br><br>모&nbsp&nbsp 임&nbsp&nbsp 일 : "+data.meetingBoard[number[io]].meetingBoard_startMeetingDate.substring(0,10)+
		                    "</h4><a href=\"meetingview.do?meeting_boardno="+data.meetingBoard[number[io]].meeting_boardno+"\">click</a></div></div></div></td></tr></table></td>");
				} 
					  
				},
				error : function(request){
					alert("에러 : "+request.status);
				}
			})
		}
		})
</script>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
@import url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');

article {
	-webkit-flex: 3;
	-ms-flex: 3;
	flex: 3;
	background-color: #white;
}

th {
	border: none;
	color: white;
}
th, td {
	text-align: center;
}

tr a:hover {
	color: #FF5050;
}

.button {
	float: right;
}

h4,ul,li{
font-family: 'NanumSquareRound',sans-serif;
}
input::-ms-input-placeholder { color: #CD853F; }
input::-webkit-input-placeholder { color: #CD853F; } 
input::-moz-placeholder { color: #CD853F; }

</style>	


<body>
<h4 style="text-align: left; padding-left: 30px; color: white;" ></h4>
<center>
        <font style="font-family: 'NanumSquareRound',sans-serif; font-weight: bold; font-size: 50px; color:#8B5927;">
펫프 모여라 게시판
        </font>

        &nbsp;<input type="button" value="글쓰기" onclick="location.href='writeForm.do'" style= "background-color:#CD853F; color:white; font-family: 'NanumSquareRound',sans-serif; font-size: 15px !important; font-weight:bold; height:40px; width: 80px; border:1; border-color:#CD853F; border-radius: 25px;" >
                </center>
        <br><br>
        
	<select id="type" style="padding-left:5px; position: fixed; height:28px; right: 412px; bottom: 90px; z-index: 2;
	border:2; border-color:#CD853F; border-radius:5px; width: 90px; padding: 5px;">
	<option value="1">제목</option>
	<option value="2">내용</option>
	<option value="3">제목+내용</option>
	<option value="4">글쓴이</option>
	</select>

	<input type="text" id="keyword" style="width: 300px; position: fixed; right: 110px; height:25px; bottom: 90px; z-index: 1;
	background-color:white; color:#CD853F; font-family: 'NanumSquareRound',sans-serif; padding: 4px; border:1; 
	border-color:#CD853F; border-radius: 5px;">
	<button id = "search" style="position: fixed; height:25px; right: 60px; bottom: 90px; background-color: #CD853F; border: none; padding: 5px 10px;
									 border-radius: 5px; color: white;">검색</button>
	<button id="MOVE_TOP_BTN" style="position: fixed; right: 100px; bottom: 50px; background-color: #CD853F; border: none;
									 border-radius: 5px; color: white;">TOP</button>
<center>
<div style="width: 80%" align="center">



					<table id="listTable" width="100%">
				 <tr valign="top">
				    <td colspan="3">
				     <table width="1000"> 
				      <tr><td></td></tr></table>
				      		<tbody></tbody>

				      </table>



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