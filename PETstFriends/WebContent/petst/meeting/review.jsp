<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="assets/images/favicon.png">
<title>Insert title here</title>
</head>
    
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
	
	
<script type="text/javascript">
$(document).ready(function() {
	var temp =location.href.split("?")
	var data=temp[1].split("=")
	var no = data[1]
	$.ajax({
		type : "get",
		url : "showReviewMBC.do",
		data : {
			"meeting_boardno" : no 
		},
		dataType : "json",
		async: false,
		contentType : "application/json; charset=UTF-8",
		success : function(data){
		for(var io = 0; io<10; io++){
			$('#listTable>tbody:last').append(
					//사진크기 400 / 350
							"<tr><td style=\"cursor:pointer\" onclick=\"document.location.href='test.jsp?"+data.meetingReview[io].meetingReview_no+"'\">"+
							data.meetingReview[io].meetingReview_no+"</td>"+
							"<td style=\"cursor:pointer\" onclick=\"document.location.href='test.jsp?"+data.meetingReview[io].meetingReview_no+"'\">"+
							data.meetingReview[io].meetingReview_title+"</td>"+
							"<td>"+data.meetingReview[io].meetingReview_nickname+"</td>"+
							"<td>"+data.meetingReview[io].meetingReview_writeDate+"</td></tr>");
		} 
		},
		error : function(request){
			alert("에러 : "+request.status);
		}
	})
	
    $("#MOVE_TOP_BTN").click(function() {
        $('html, body').animate({
            scrollTop : 0
        }, 1000);
    });
	})
var num=10;
$(window).scroll(function(){
	        if($(window).scrollTop() > 200) {
	            $('#MOVE_TOP_BTN').fadeIn();
	           } else {
	            $('#MOVE_TOP_BTN').fadeOut();
	           }

		if($(window).scrollTop()+$(window).height()>$(document).height()-100&&stop==9){
			$.ajax({
				type : "get",
				url : "showReviewMBC.do",
				dataType : "json",
				contentType : "application/json; charset=UTF-8",
				success : function(data){
				       var number = [];
					for(var i = 0; i<10; i++){
				       if(num<data.count){
				    	   if(data.meetingReview[num].meetingReview_no!=null){
				    		   number[i]=num;
				    	   }else{
				    		   i--;
				    	   }
			    		   num++;
				       }}
					
				for(var io = 0; io<10; io++){
					$('#listTable>tbody:last').append(
							//사진크기 400 / 350
							"<tr><td style=\"cursor:pointer\" onclick=\"document.location.href='test.jsp?"+data.meetingReview[number[io]].meetingReview_no+"'\">"+
							data.meetingReview[number[io]].meetingReview_no+"</td>"+
							"<td style=\"cursor:pointer\" onclick=\"document.location.href='test.jsp?"+data.meetingReview[number[io]].meetingReview_no+"'\">"+
							data.meetingReview[number[io]].meetingReview_title+"</td>"+
							"<td>"+data.meetingReview[number[io]].meetingReview_nickname+"</td>"+
							"<td>"+data.meetingReview[number[io]].meetingReview_writeDate+"</td></tr>");
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


<body>

<center>
<div style="width: 80%">

	<input type="button" id="MOVE_TOP_BTN" value="TOP">

					<table id="listTable" width="1000px">
				
				      		<tbody></tbody>

				      </table>



</div>
	</center>