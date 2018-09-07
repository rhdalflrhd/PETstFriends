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
    
	<title>미팅</title>
	   
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
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>    
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>   
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
				 "<tr><td colspan=\"4\" style=\"cursor:pointer\" onclick=\"document.location.href='meetingview.do?meeting_boardno="+
							data.meetingBoard[number[io]].meeting_boardno+
							"'\"><img src=\"assets/images/"+proPic+"\" width=\"400\" height=\"350\"></td></tr>"+
							"<tr><td height=\"40\ width=\"170\" style=\"cursor:pointer\" onclick=\"document.location.href='meetingview.do?meeting_boardno="+data.meetingBoard[number[io]].meeting_boardno+"'\">"+
							data.meetingBoard[number[io]].meetingBoard_title+"</td>"+
// 							제목 23자 제한 걸어야함
							"<td width=\"100\">"+data.meetingBoard[number[io]].meetingBoard_place.substring(0,12)+nu+"</th><td width=\"50\">"+
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
				       var nu = data.meetingBoard[number[io]].meetingBoard_place.length;
			            if(nu>12){
			            	nu="...";
			            }else{
			            	nu="";
			            }
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
							 "<tr><th colspan=\"4\" style=\"cursor:pointer\" onclick=\"document.location.href='test.jsp?"+
										data.meetingBoard[number[io]].meeting_boardno+
										"'\"><img src=\"assets/images/"+proPic+"\" width=\"400\" height=\"350\"></td></tr>"+
										"<tr><td height=\"40\ width=\"170\" style=\"cursor:pointer\" onclick=\"document.location.href='meetingview.do?meeting_boardno="+data.meetingBoard[number[io]].meeting_boardno+"'\">"+
										data.meetingBoard[number[io]].meetingBoard_title+"</td>"+
//			 							제목 23자 제한 걸어야함
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
select {
    width: 100px;
    height: 25px;
    padding-left: 5px;  
}
#keyword {
    width: 220px;
    height: 20px;
    padding-left: 5px;  
}
tr {
	text-align: center;
}

h2 {
	text-align: center
}
#MOVE_TOP_BTN {
    position: fixed;
    right: 6%;
    bottom: 50px;
    z-index: 999;
}
</style>
</head>
<body>
<%@ include file="/petst/header.jsp"%>
	<h2>펫프 모여라 게시판</h2>
<div align="right"  style="width: 88.7%; position: fixed">
	<select id="type" style="">
	<option value="1">제목</option>
	<option value="2">내용</option>
	<option value="3">제목+내용</option>
	<option value="4">글쓴이</option>
	</select>
	<input type="text" id = "keyword">
	<input type="button" id = "search" value="검색">
	</div>
	
<center>
<div style="width: 80%">

	<input type="button" id="MOVE_TOP_BTN" value="TOP">

					<table id="listTable" width="100%">
				 <tr valign="top">
				    <td colspan="3">
				     <table width="1200"> 
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