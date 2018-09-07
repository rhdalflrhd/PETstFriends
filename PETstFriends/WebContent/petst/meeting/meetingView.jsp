<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page import="model.MeetingComment"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="model.MeetingBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>펫프 모여라 게시판</title>
<%@ include file="/petst/header.jsp" %>
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">    
    <link rel="stylesheet" href="./Boot/css/bootstrap.min.css">
    <link rel="stylesheet" href="./Boot/css/font-awesome.min.css">
    <link rel="stylesheet" href="./Boot/css/animate.min.css">
    <link rel="stylesheet" href="./Boot/css/owl.carousel.css">
    <link rel="stylesheet" href="./Boot/css/owl.theme.css">
    <link rel="stylesheet" href="./Boot/css/slicknav.css">
    <link rel="stylesheet" href="./Boot/style.css">
    <link rel="stylesheet" href="./Boot/css/responsive.css">
</head>
<style type="text/css">
#mask {  
    position:absolute;  
    z-index:9000;  
    background-color:#000;  
    display:none;  
    left:0;
    top:0;
} 
#mask2 {  
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
    height:700px;
    background-color:#FFF;
    z-index:10000;   
 }
 .window2{
    display: none;
    position:absolute;  
    left:50%;
    top:300px;
    margin-left: -300px;
    width:600px;
    height:220px;
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
<div style="background: rgba(22, 18, 13, 0.001); border: 1px solid #eeeeee; border-radius: 25px;" align="center">

<table border="1"  width="1100" align="center" style="color:#CD853F; border:1; border-color:#CD853F; border-radius:5px;">
<tr><td>
<table  width="400px" height="400px">
<tr><td id="proPic" >
<img src ="img/${meeting.meetingBoard_proPic}" width="400" height="400">
</td></tr>
<tr><td align="right" style="font-size: 24px;"> 개설자 정보 &nbsp</td></tr>
<tr><td height="30px" style="font-size:20px; padding-left: 10px"> ${meeting.meetingBoard_userId}</td></tr>
<tr><td height="30px" style="font-size:20px; padding-left: 10px"><img width="20px" height="20px" src="img/tel-icon.png">${meeting.meetingBoard_phone}</td></tr>
<tr><td height="30px" style="font-size:20px; padding-left: 10px"><img width="20px" height="20px" src="img/email-icon.png">${meeting.meetingBoard_email}</td></tr>
</table>
</td><td>
<table  width="700px" height="400px">
<tr><td colspan="2" id="title" height="50"  align="center"><h2>${meeting.meetingBoard_title}</h2></td></tr>
<tr><td width="140" style="font-size:20px;"  align="center"><img width="20px" height="20px" src="img/meeting-icon.png">모임 기간</td><td id="meetingdate" height="50" style="font-size:20px; padding-left: 20px">${meeting.meetingBoard_startMeetingDate } ~ ${meeting.meetingBoard_endMeetingDate }</td></tr>
<tr><td  width="140" style="font-size:20px;"  align="center"><img width="20px" height="20px" src="img/place-icon.png">모임장소</td><td id="place" height="50" style="font-size:20px; padding-left: 20px">					
					<%=place1%> <%=place2%>
					</td></tr>
<tr><td width="140" style="font-size:20px;" align="center"><img width="20px" height="20px" src="img/meeting-icon.png">신청기간</td><td id="acceptdate" height="50"  style="font-size:20px; padding-left: 20px">${meeting.meetingBoard_startAcceptingDate } ~ ${meeting.meetingBoard_endAcceptingDate }</td></tr>
<tr><td style="font-size:20px;"  align="center"><img width="20px" height="20px" src="img/accept-icon.png">신청인원</td><td id="applyinone" height="50" style="font-size:22px; padding-left: 50px">
<h2 style="display: inline;">${applycount }</h2>명 신청중</td></tr>
</table>
<div align="right" style="padding-right: 10px">
<%-- <%if() 신청자 중에 있는지 없는지 if 로 비교후 출력%> --%>
                                     <button class="openMask2" style="height: 62px; background-color: #CD853F; border: none; padding: 5px 10px;
 									 border-radius: 5px; color: white; font-size: 35px">신청하기</button>
									 <div id="mask"></div>
            <div class="window2"> 
            <br><center><br>
            <a style="color: #00BFFF; font-size: 33px;">※신청하기를 누를시, 모임 개최자에게 <br> 닉네임과 이메일 정보가 전달됩니다.</a>
            <button id="applybutton" style="height: 62px; background-color: #CD853F; border: none; padding: 5px 10px;
 									 border-radius: 5px; color: white; font-size: 35px">신청하기</button>
 									 <button class="close2" style="height: 62px; background-color: #CD853F; border: none; padding: 5px 10px;
 									 border-radius: 5px; color: white; font-size: 35px">닫기</button>
            </center>
            </div>    
									
									 <button id="applyDeletebutton" style="height: 62px; background-color: #CD853F; border: none; padding: 5px 10px;
								      border-radius: 5px; color: white; font-size: 35px">신청취소</button>
								      
</div></td></tr>

<tr><td colspan="2">
<table  width="1100" height= "400px">
<tr><td><br></td></tr>
<tr>
<td id="contentview" width="200px" height="50px" style="font-size:20px; cursor: pointer; border: #CD853F solid 1px" align="center" onmousedown="fnMove('#content')">모임상세 정보</td>
<td id="mapview" width="200px" style="font-size:20px; cursor: pointer; border: #CD853F solid 1px" align="center" onmousedown="fnMove('#mapview')">지도 보기</td>
<td id="commentview" width="200px" style="font-size:20px; cursor: pointer; border: #CD853F solid 1px" align="center" onmousedown="fnMove('#comment')">댓글 보기</td>
<!-- <td id="applyview" height="50" style="cursor: pointer;">참여신청/취소 안내</td> -->
<td id="reviewview" width="200px" height="50" align="center" style="font-size:20px; border: #CD853F solid 1px"><div id="mask"></div>
            <div class="window">
<!--                 <p style="width:1000px;height:500px;text-align:center;vertical-align:middle;"> -->
<!--                 팝업 내용 입력 //리뷰-->
                	  <table id="listTable" width="1000px" border="1" bordercolor="#CD853F">
                	  <tr><td colspan="4">        	 
<center><font style="font-family: 'NanumSquareRound',sans-serif; font-weight: bold; font-size: 50px; color:#8B5927;">
펫프 모여라 후기 게시판
        </font></center><br>
                	  </td></tr>
				      		<tbody style="width:1000px; text-align:center;vertical-align:middle;">
				      		<c:forEach items="${review}" var="review">	      		
				      		<tr style="cursor: pointer;" onclick="location.href='reviewView.do?meeting_boardno=${meeting.meeting_boardno }&meetingReview_no=${review.meetingReview_no }'"><td width="70px;" height="50px">${review.meetingReview_no }</td>
				      		<td width="500px;">${review.meetingReview_title }</td>
				      		<td width="150px">${review.meetingReview_nickname }</td>
				      		<td width="180px">${review.meetingReview_writeDate }</td></tr>
				      		
				      		</c:forEach>
				      		</tbody>		
				      </table>
				      <table>
				      <tr style="text-align: center">
				<td width="1000px" height="30px" colspan="3"><c:if test="${start ne 1 }">
						<a href="meetingview.do?meeting_boardno=${meeting.meeting_boardno }&rpage=1&&trigger=1">[처음]</a>
						<a href="meetingview.do?meeting_boardno=${meeting.meeting_boardno }&rpage=${start-1 }&&trigger=1">[이전]</a></c:if>
					<c:forEach begin="${start }" end="${end }" var="i">
						<c:if test="${i <= rlast}">
							<c:choose>
								<c:when test="${i == rcurrent  }">
								[${i }]
							</c:when>
								<c:otherwise>
									<a href="meetingview.do?meeting_boardno=${meeting.meeting_boardno }&rpage=${i }&&trigger=1">[${i }]</a>
								</c:otherwise>
							</c:choose>
						</c:if></c:forEach>
						<c:if test="${start+9 < rlast }">
						<a href="meetingview.do?meeting_boardno=${meeting.meeting_boardno }&rpage=${end+1 }&trigger=1">[다음]</a>
						<a href="meetingview.do?meeting_boardno=${meeting.meeting_boardno }&rpage=${rlast }&trigger=1">[끝]</a></c:if>
					</td></tr>
				      </table>
				     
<!--                 팝업내용 끝//리뷰 -->
                <p style="text-align:center; right:90px; bottom:-100px; position:absolute; background:#ffffff; padding:20px;">
                <a href="http://localhost:8080/PETstFriends/writeReviewForm.do?meeting_boardno=${meeting.meeting_boardno }" style="height: 20px">후기 작성</a>
                </p>
                <p style="text-align:center; right:0px; bottom:-100px; position: absolute; background:#ffffff; padding:20px;">
                <a class="close1" style="width:48px; height: 20px; cursor: pointer;">닫기</a>
                </p>
      </div>
	 <a href="#" class="openMask" id="re"  style="font-size:20px; cursor: pointer; color:#CD853F">모임후기</a>      
<td></td>
</tr>
<tbody>
<tr><td id="content" colspan="5" height="300px;" style="min-height:300px; padding-left: 20px">
${meeting.meetingBoard_content }
</td></tr>
<tr><td colspan="1"  style="padding-left: 20px; font-size:20px; background-color: #CD853F; border: none; padding: 5px 10px;
									 border-radius: 5px; color: white; text-align: center;">
지도 보기</td><td colspan="4"></td></tr>
<tr><td colspan="5">
<div id="map" style="width: 100%; height: 450px;"></div>
</td></tr>
</tbody>
</table>

<table id="commentTable" width="1100px">
<tr><td colspan="1"  width="200px" id="comment" style="padding-left: 20px; font-size:20px; border: #CD853F solid 1px; background-color: #CD853F; border: none; padding: 5px 10px;
									 border-radius: 5px; color: white; text-align: center;">
댓글 보기
</td><td></td></tr>
<c:forEach items="${comment}" var="comment">
<tr id="${comment.meetingComment_commentno}" style="color:black;">
<td style="padding-left: 10px" colspan="1">
${comment.meetingComment_nickname }&nbsp <td colspan="2" style="width:100px; padding-left: 30px; font-size: 9px; font-style: gray;">${comment.meetingComment_writeDate }&nbsp&nbsp
<button id="recomment" value="${comment.meetingComment_commentno}/${comment.meetingComment_nickname }" style="cursor: pointer;">답글</button> 
<button id="recommentmodify" value="${comment.meetingComment_commentno}/${comment.meetingComment_content}">수정</button>
<button id="recommentdelete" value="${comment.meetingComment_commentno}/">삭제</button>
</td>
<tr style="color:black;" id="modify${comment.meetingComment_commentno}"><td  style="padding-left: 30px; width: 900px;" colspan="3"> ${comment.meetingComment_content}</td>
</tr>
</c:forEach>
<tr style="text-align: center">
				<td width="1100px" height="30px" colspan="3"><c:if test="${start ne 1 }">
						<a href="meetingview.do?meeting_boardno=${meeting.meeting_boardno }&page=1&tri=1">[처음]</a>
						<a href="meetingview.do?meeting_boardno=${meeting.meeting_boardno }&page=${start-1 }&tri=1">[이전]</a></c:if>
					<c:forEach begin="${start }" end="${end }" var="i">
						<c:if test="${i <= last}">
							<c:choose>
								<c:when test="${i == current  }">
								[${i }]
							</c:when>
								<c:otherwise>
									<a href="meetingview.do?meeting_boardno=${meeting.meeting_boardno }&page=${i }&tri=1">[${i }]</a>
								</c:otherwise>
							</c:choose>
						</c:if></c:forEach>
						<c:if test="${start+9 < last }">
						<a href="meetingview.do?meeting_boardno=${meeting.meeting_boardno }&page=${end+1 }&tri=1">[다음]</a>
						<a href="meetingview.do?meeting_boardno=${meeting.meeting_boardno }&page=${last }&tri=1">[끝]</a></c:if>
					</td></tr>

<tr><td style="text-align:center; background-color: #CD853F; border: none; padding: 5px 10px;
									 border-radius: 5px; color: white; font-size: 26px" width="200px" height="100px">
댓글 내용
</td><td style="padding-left: 3px;">
<textarea id="commentcontent" style="width: 740px; height: 100px; resize: none; background-color:white; font-family: 'NanumSquareRound',sans-serif; padding: 4px; border:1; 
	border-color:#CD853F; border-radius: 5px;"></textarea>
</td><td>
<button id="commentbtn"  style="width: 150px; height: 100px; background-color: #CD853F; border: none; padding: 5px 10px;
									 border-radius: 5px; color: white; font-size: 26px">댓글 입력</button>
</td></tr>
</table>
</td></tr></table>
<table width="1100px"><tr><td align="right">
<input type="button" onclick="location.href='meeting.do'"  value="목록">
<form action="modifyForm.do" style="display: inline">
<input type="hidden" name="meeting_boardno" value="${meeting.meeting_boardno }">
<input type="submit" value="수정">
</form>
<form action="deleteMBC.do" style="display: inline">
<input type="hidden" name="meeting_boardno" value="${meeting.meeting_boardno }">
<input type="submit" value="삭제">
</form>
</td></tr></table>
</div>
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
    $('html, body').scrollTop(0);
}
function wrapWindowByMask2(){	 
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height();  
    var maskWidth = $(window).width();  
    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    $("#mask").css({"width":maskWidth,"height":maskHeight});  
    //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
    $("#mask").fadeIn(0);      
    $("#mask").fadeTo("slow",0.6);    
    //윈도우 같은 거 띄운다.
    $(".window2").show();
    $('html, body').scrollTop(0);
}
function fnMove(se){
    var offset = $(se).offset();
    $('html, body').scrollTop(offset.top);
}
var trigge = ${trigge};
if(trigge==1){
	wrapWindowByMask();
}
var tri = ${tri};
if(tri==1){
	fnMove('#comment');
}
var triapply=${triapply};
if(triapply=1){
	fnMove('#proPic');
}

$(document).on('click', '#applyDeletebutton', function(event) {
	var boardno = ${meeting.meeting_boardno };
	$.ajax({
		type : "get",
		url : "deleteApplyMBC.do",
		data : {
			"meeting_boardno" : boardno
		},
		success : function(data){
			window.location.href="http://localhost:8080/PETstFriends/meetingview.do?meeting_boardno="+data.boardno+"&triapply=1"
		},
		error : function(request){
			alert("에러 : "+request.status);
		}
	})	
});
$(document).on('click', '#applybutton', function(event) {
	var boardno = ${meeting.meeting_boardno };
	$.ajax({
		type : "get",
		url : "insertApplyMBC.do",
		data : {
			"meeting_boardno" : boardno
		},
		success : function(data){
			window.location.href="http://localhost:8080/PETstFriends/meetingview.do?meeting_boardno="+data.boardno+"&triapply=1"
		},
		error : function(request){
			alert("에러 : "+request.status);
		}
	})	
});

$(document).on('click', '#recommentmodifybtn', function(event) {
	var boardno = ${meeting.meeting_boardno };
	var commentno = $(this).attr('value');
    var recommentcontent = $('#recommentmodifycontent'+commentno).val();
	$.ajax({
		type : "get",
		url : "commentModifyMBC.do",
		data : {
			"meeting_boardno" : boardno,
			"meetingComment_commentno" : commentno,
			"meetingComment_content" : recommentcontent
		},
		success : function(data){
			window.location.href="http://localhost:8080/PETstFriends/meetingview.do?meeting_boardno="+data.boardno+"&tri=1"
		},
		error : function(request){
			alert("에러 : "+request.status);
		}
	})	
});
$(document).on('click', '#recommentdelete', function(event) {
	var boardno = ${meeting.meeting_boardno };
	var commentnonickname = $(this).attr('value');
	var spilt = commentnonickname.split('/');
	var commentno = spilt[0];
	$.ajax({
		type : "get",
		url : "commentDeleteMBC.do",
		data : {
			"meeting_boardno" : boardno,
			"meetingComment_commentno" : commentno
		},
		success : function(data){
			window.location.href="http://localhost:8080/PETstFriends/meetingview.do?meeting_boardno="+data.boardno+"&tri=1"
		},
		error : function(request){
			alert("에러 : "+request.status);
		}
	})	
});

$(document).on('click', '#recommentbtn', function(event) {
	var boardno = ${meeting.meeting_boardno };
	var commentnonickname = $(this).attr('value');
	var spilt = commentnonickname.split('/');
	var commentno = spilt[0];
	var nickname = spilt[1];
	var recommentcontent = $('#recommentcontent'+commentno).val();
	$.ajax({
		type : "get",
		url : "commentWriteMBC.do",
		data : {
			"meeting_boardno" : boardno,
			"meetingComment_commentno" : commentno,
			"meetingComment_nickname" : nickname,
			"meetingComment_content" : recommentcontent
		},
		success : function(data){
			window.location.href="http://localhost:8080/PETstFriends/meetingview.do?meeting_boardno="+data.boardno+"&tri=1"
		},
		error : function(request){
			alert("에러 : "+request.status);
		}
	})	
})
$(document).ready(function() {
	$(document).on('click', '#recommentmodify', function(event) {
		var recom = $(this).attr('value');
		var spilt = recom.split('/');
		var commentno = spilt[0];
		var content = spilt[1];
		var trid = "modify"+commentno;
		$('#'+trid+' *').remove();
		$('#'+trid).append(
	"<td style=\"padding-left: 20px;\" >답글 내용</td><td><textarea id=\"recommentmodifycontent"+commentno+"\" rows=\"6\" style=\"width: 100%; height: 50px; resize: none;\">"+
	content+"</textarea></td><td><button id=\"recommentmodifybtn\" value=\""+commentno+"\" style=\"width: 100px; height: 50px;\" >답글 입력</button></td>");
	})
	$(document).on('click', '#recomment', function(event) {
		var recom = $(this).attr('value');
		var spilt = recom.split('/');
		var commentno = spilt[0];
		$('#'+commentno+':last').after(
	"<tr><td style=\"padding-left: 20px;\" >답글 내용</td><td><textarea id=\"recommentcontent"+commentno+"\" rows=\"6\" style=\"width: 100%; height: 50px; resize: none;\">"+
	"</textarea></td><td><button id=\"recommentbtn\" value=\""+recom+"\" style=\"width: 100px; height: 50px;\" >답글 입력</button></td></tr>");
	})
	

	$('#commentbtn').click(function(){
		var boardno = ${meeting.meeting_boardno };
		var commentcontent = $('#commentcontent').val();
		$.ajax({
			type : "get",
			url : "commentWriteMBC.do",
			data : {
				"meeting_boardno" : boardno,
				"meetingComment_content" : commentcontent
			},
			success : function(data){
				window.location.href="http://localhost:8080/PETstFriends/meetingview.do?meeting_boardno="+data.boardno+"&tri=1"
			},
			error : function(request){
				alert("에러 : "+request.status);
			}
		})	
	})
    //검은 막 띄우기
    $(".openMask").click(function(e){
        e.preventDefault();
        wrapWindowByMask();
    });
	$(".openMask2").click(function(e){
        e.preventDefault();
        wrapWindowByMask2();
    });

    //닫기 버튼을 눌렀을 때
    $(".window .close1").click(function (e) {  
        //링크 기본동작은 작동하지 않도록 한다.
        e.preventDefault();  
        $("#mask, .window").hide();
    });   
    $(".window2 .close2").click(function (e) {  
        //링크 기본동작은 작동하지 않도록 한다.
        e.preventDefault();  
        $("#mask, .window2").hide();
    });  

    //검은 막을 눌렀을 때
    $("#mask").click(function () {  
        $(this).hide();  
        $(".window").hide();
        $(".window2").hide();  
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
	                addrType +' '+ item.address +'<br>',
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
<%@ include file="/petst/footer.jsp"%>
</body>
</html>