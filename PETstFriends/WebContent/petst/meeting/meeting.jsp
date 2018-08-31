<%@page import="model.MeetingBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="assets/images/favicon.png">
<title>Insert title here</title>
<%@ include file="/petst/header.jsp" %>
</head>
    
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
	
	
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
			 
			$('#listTable>tbody:last').append(
					//사진크기 400 / 350
				 "<td><table width=\"400\" height=\"370\">"+ 
				 "<tr><td colspan=\"4\" style=\"cursor:pointer\" onclick=\"document.location.href='meetingview.do?meeting_boardno="+
							data.meetingBoard[number[io]].meeting_boardno+
							"'\"><img src=\"assets/images/"+proPic+"\" width=\"400\" height=\"350\"></td></tr>"+
							"<tr><td height=\"40\ width=\"170\" style=\"cursor:pointer\" onclick=\"document.location.href='meetingview.do?meeting_boardno="+data.meetingBoard[number[io]].meeting_boardno+"'\">"+
							data.meetingBoard[number[io]].meetingBoard_title+"</td>"+
// 							제목 23자 제한 걸어야함
							"<td width=\"100\">"+data.meetingBoard[number[io]].meetingBoard_place.substring(0,12)+"...</th><td width=\"50\">"+
		 		            "모임일</td><td>"+
		 		            data.meetingBoard[number[io]].meetingBoard_startMeetingDate.substring(0,10)+"</td></td></tr>"+
							"</table></td>");
		} 
// 		"<img src="\"assets/images/"+proPic+"\" width=\"400\" height=\"350\">"
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
						 
						$('#listTable>tbody:last').append(
								//사진크기 400 / 350
							 "<td><table width=\"400\" height=\"370\">"+ 
							 "<tr><th colspan=\"4\" style=\"cursor:pointer\" onclick=\"document.location.href='meetingview.do?meeting_boardno="+
										data.meetingBoard[number[io]].meeting_boardno+
										"'\"><img src=\"assets/images/"+proPic+"\" width=\"400\" height=\"350\"></td></tr>"+
										"<tr><td height=\"40\ width=\"170\" style=\"cursor:pointer\" onclick=\"document.location.href='meetingview.do?meeting_boardno="+data.meetingBoard[number[io]].meeting_boardno+"'\">"+
										data.meetingBoard[number[io]].meetingBoard_title+"</td>"+
//			 							제목 23자 제한 걸어야함
										"<td width=\"100\">"+data.meetingBoard[number[io]].meetingBoard_place.substring(0,12)+"...</td><td width=\"50\">"+
					 		            "모임일</td><td>"+
					 		            data.meetingBoard[number[io]].meetingBoard_startMeetingDate.substring(0,10)+"</td></td></tr>"+
										"</table></td>");
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

		if($(window).scrollTop()+$(window).height()>$(document).height()-100&&stop==9){
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
					 
					$('#listTable>tbody:last').append(
							//사진크기 400 / 350
						 "<td><table width=\"400\" height=\"370\">"+ 
						 "<tr><th colspan=\"4\" style=\"cursor:pointer\" onclick=\"document.location.href='meetingview.do?meeting_boardno="+
									data.meetingBoard[number[io]].meeting_boardno+
									"'\"><img src=\"assets/images/"+proPic+"\" width=\"400\" height=\"350\"></td></tr>"+
									"<tr><td height=\"40\ width=\"170\" style=\"cursor:pointer\" onclick=\"document.location.href='meetingview.do?meeting_boardno="+data.meetingBoard[number[io]].meeting_boardno+"'\">"+
									data.meetingBoard[number[io]].meetingBoard_title+"</td>"+
//		 							제목 23자 제한 걸어야함
									"<td width=\"100\">"+data.meetingBoard[number[io]].meetingBoard_place.substring(0,12)+nu+"</td><td width=\"50\">"+
				 		            "모임일</td><td>"+
				 		            data.meetingBoard[number[io]].meetingBoard_startMeetingDate.substring(0,10)+"</td></td></tr>"+
									"</table></td>");
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

tr {
	text-align: center;
}

h2 {
	text-align: center
}
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
</style>


<body>
<div class="wrapper">
	<h2>펫프 모여라 게시판</h2>

	<select id="type" style="padding-left:5px; position: fixed; height:25px; right: 300px; bottom: 90px;">
	<option value="1">제목</option>
	<option value="2">내용</option>
	<option value="3">제목+내용</option>
	<option value="4">글쓴이</option>
	</select>
<!-- 	<textarea rows="1" id="keyword" style="width: 200px; position: fixed; right: 100px; height:25px; bottom: 90px; resize: none; border: 1px solid gray"></textarea> -->
	<input type="text" id="keyword" style="width: 200px; position: fixed; right: 100px; height:25px; bottom: 90px; border: 1px solid gray">
	<button id = "search" style="position: fixed; height:25px; right: 60px; bottom: 90px;">검색</button>
	<button id="MOVE_TOP_BTN" style="position: fixed; right: 100px; bottom: 50px;">TOP</button>
<center>
<div style="width: 80%">



					<table id="listTable" width="100%">
				 <tr valign="top">
				    <td colspan="3">
				     <table width="1200"> 
				      <tr><td></td></tr></table>
				      		<tbody></tbody>

				      </table>



</div>

	</center>
	</div>
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