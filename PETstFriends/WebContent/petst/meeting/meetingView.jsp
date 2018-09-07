<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page import="model.MeetingComment"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="model.MeetingBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
 


</script>
</head>
<style type="text/css">
#applybutton {
    width: 200px;
    height: 50px;
    padding-left: 5px;
}
#mask {  
    position:absolute;  
    z-index:9000;  
    background-color:#000;  
    display:none;  
    left:0;
    top:0;
} 
.window{
    display: none;
    position:absolute;  
    left:50%;
    top:50px;
    margin-left: -500px;
    width:1000px;
    height:500px;
    background-color:#FFF;
    z-index:10000;   
 }
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; font-size: 20px;}

</style>
<body>
<%MeetingBoard meeting = (MeetingBoard)request.getAttribute("meeting"); 
					String place = meeting.getMeetingBoard_place();
					StringTokenizer values = new StringTokenizer(place,"/");
					String place1 = values.nextToken();
					String place2 = values.nextToken();
					%>
<table border="1"  width="1000" align="center">
<tr><td>
<table border="1" width="400" height="350">
<tr><td id="proPic" colspan="2">
<img src ="${meeting.meetingBoard_proPic}" width="400" height="350">
</td></tr>
<tr><td height="30" width="120" align="center" id="name">
작성자 이름 </td><td> ${meeting.meetingBoard_userId}</td></tr>
<tr><td height="30" width="120" align="center" id="name">
작성자 연락처 </td><td>${meeting.meetingBoard_phone}</td></tr>
<tr><td height="30" width="120" align="center" id="name">
작성자 이메일 </td><td>${meeting.meetingBoard_email}
</td></tr>
</table>
</td><td>

<table border="1" width="600" height="400">
<tr><td colspan="2" id="title" height="50"  align="center"><h2>${meeting.meetingBoard_title}</h2></td></tr>
<tr><td width="120"  align="center">모임 기간</td><td id="meetingdate" height="50" style="padding-left: 20px">${meeting.meetingBoard_startMeetingDate } ~ ${meeting.meetingBoard_endMeetingDate }</td></tr>
<tr><td  width="120"  align="center">모임장소</td><td id="place" height="50" style="padding-left: 20px">					
					<%=place1%> <%=place2%>
					</td></tr>
<tr><td width="120"  align="center">신청기간</td><td id="acceptdate" height="50"  style="padding-left: 20px">${meeting.meetingBoard_startAcceptingDate } ~ ${meeting.meetingBoard_endAcceptingDate }</td></tr>
<tr><td  align="center">신청인원</td><td id="applyinone" height="50"></td></tr>
</table>
<div align="right"><button id="applybutton" style="height: 30">신청하기</button></div>
</td></tr>


<tr><td colspan="2">
<table border="1" width="1000" height= "400px">
<tr>
<td id="contentview" height="50" style="cursor: pointer;" align="center" onmousedown="fnMove('#content')">모임상세 정보</td>
<td id="mapview" height="50" style="cursor: pointer;" align="center" onmousedown="fnMove('#map')">지도 보기</td>
<td id="commentview" height="50" style="cursor: pointer;" align="center" onmousedown="fnMove('#comment')">댓글 보기</td>
<!-- <td id="applyview" height="50" style="cursor: pointer;">참여신청/취소 안내</td> -->
<td id="reviewview" height="50" align="center"><div id="mask"></div>
            <div class="window">
<!--                 <p style="width:1000px;height:500px;text-align:center;vertical-align:middle;"> -->
<!--                 팝업 내용 입력 //리뷰-->
                	  <table id="listTable" width="1000px" border="1">
				      		<tbody style="width:1000px;height:750px;text-align:center;vertical-align:middle;">
				      		</tbody>
				      </table>
<!--                 팝업내용 끝//리뷰 -->
                <p style="text-align:center; right:100px; bottom:-100px; position:absolute; background:#ffffff; padding:20px;">
                <a href="http://localhost:8080/PETstFriends/writeReviewForm.do?meeting_boardno=${meeting.meeting_boardno }">후기 작성</a></p>
                <p style="text-align:center; bottom:-100px; position: absolute; background:#ffffff; padding:20px;">
                <a href="#" class="close">닫기</a></p>
            </div>
	 <a href="#" class="openMask"  style="cursor: pointer;">모임후기</a>
<td width="200"></td>
</tr>
<tbody>
<tr><td id="content" colspan="5" height="200" style="padding-left: 20px">
${meeting.meetingBoard_content }
</td></tr><tr><td colspan="5">
<div id="map" style="width: 1000px; height: 450px;"></div>
</td></tr><tr><td id="comment" colspan="5" >
댓글!


<c:forEach items="${comment}" var="comment">
<tr>
<td colspan="4" width="100%"><input type="hidden" id="no" value="${comment.meetingComment_commentno}">
${comment.meetingComment_content}</td><td><button onclick=" ">댓글</button></td>
</tr>
</c:forEach>
<tr><td>
<form action="writeMBC.do">
<input type="text" id="commentcontent">
<input type="submit" value="입력">
</form>
</td></tr>
</tbody>

</table>


</td></tr>
</table>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Ne3L3fT_ARphRLHIt9DR&submodules=geocoder"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">
function wrapWindowByMask(){	 
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height();  
    var maskWidth = $(window).width();  
    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    $("#mask").css({"width":maskWidth,"height":maskHeight});  
    //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
    $("#mask").fadeIn(0);      
    $("#mask").fadeTo("slow",0.6);    
    //윈도우 같은 거 띄운다.
    $(".window").show();
}

function fnMove(se){
    var offset = $(se).offset();
    $('html, body').animate({scrollTop : offset.top}, 400);
}



$(document).ready(function() {

    //검은 막 띄우기
    $(".openMask").click(function(e){
        e.preventDefault();
        wrapWindowByMask();
    	var no = ${meeting.meeting_boardno };
    	$.ajax({
    		type : "get",
    		url : "showReviewMBC.do",
    		data : {
    			"meeting_boardno" : no 
    		},
    		dataType : "json",
    		contentType : "application/json; charset=UTF-8",
    		success : function(data){
    			alert(data.count)
    			alert(data.meetingReview[0].meetingReview_title)
    		for(var io = 0; io<data.count; io++){
    			$('#listTable>tbody:last').append(
    					//사진크기 400 / 350
    							"<tr><td width=\"100px\" height=\"50px\">"+
    							data.meetingReview[io].meetingReview_no+"</td>"+
    							"<td width=\"500px\" height=\"50px\" style=\"cursor:pointer\" onclick=\"document.location.href='meetingview.do?meeting_boardno="+
    									data.meetingBoard[io].meeting_boardno+"&meetingReview_no="+data.meetingReview[io].meetingReview_no+"'\">"+
    							data.meetingReview[io].meetingReview_title+"</td>"+
    							"<td>"+data.meetingReview[io].meetingReview_nickname+"</td>"+
    							"<td>"+data.meetingReview[io].meetingReview_writeDate+"</td></tr>");
    		} 
    		},
    		error : function(request){
    			alert("에러 : "+request.status);
    		}
    	})
    });

    //닫기 버튼을 눌렀을 때
    $(".window .close").click(function (e) {  
        //링크 기본동작은 작동하지 않도록 한다.
        e.preventDefault();  
        $("#mask, .window").hide();  
    });       

    //검은 막을 눌렀을 때
    $("#mask").click(function () {  
        $(this).hide();  
        $(".window").hide();  

    });      


var map = new naver.maps.Map("map", {
	    center: new naver.maps.LatLng(37.3595316, 127.1052133),
	    zoom: 10,
	    mapTypeControl: true
	});
	var infoWindow = new naver.maps.InfoWindow({
	    anchorSkew: true
	});
	map.setCursor('pointer');
	// result by latlng coordinate
	function searchAddressToCoordinate(address) {
	    naver.maps.Service.geocode({
	        address: address
	    }, function(status, response) {
	        if (status === naver.maps.Service.Status.ERROR) {
//	            return alert('Something Wrong!');
	        }

	        var item = response.result.items[0],
	            addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]',
	            point = new naver.maps.Point(item.point.x, item.point.y);

	            
	        infoWindow.setContent([
	                '<div style="padding:10px;min-width:200px;line-height:150%;">',
	                addrType +' '+ item.address +'<br />',
	                '</div>'
	            ].join('\n'));
	        map.setCenter(point);
	        infoWindow.open(map, point);
	    });
	}
  

	function initGeocoder() {
	    map.addListener('click', function(e) {
<%-- 	        searchCoordinateToAddress('<%=place1%>'); --%>
	    });

	    searchAddressToCoordinate('<%=place1%>');
	}

	naver.maps.onJSContentLoaded = initGeocoder;
});
</script>
</body>
</html>