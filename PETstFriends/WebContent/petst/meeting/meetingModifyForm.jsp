<%@page import="java.util.StringTokenizer"%>
<%@page import="model.MeetingBoard"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
 <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Ne3L3fT_ARphRLHIt9DR&submodules=geocoder"></script>
<title>펫프 모여라 글수정</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
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
<body>

<!-- 프로필사진 업로드  -->
<script type="text/javascript">
function getThumbnailPrivew(input, targetId) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            var element = window.document.getElementById(targetId);
            element.setAttribute("src", e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
function filterNumner(event){
	event.preventDefault();
}

</script>
<style>
 input[type="date"]::-webkit-inner-spin-button {
     display: none;
     appearance: none;
 }
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

@import
	url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css')
	;

table {
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

.write-btn {
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
<center>
<font style="font-family: 'NanumSquareRound',sans-serif; font-weight: bold; font-size: 50px; color:#8B5927;">
펫프 모여라 글수정
        </font></center><br>
<table border="1" style="width: 1000px; margin: auto; border-color:#CD853F;">
<tr><td>
<table style="width: 400; background-color:white; color:#CD853F; border:1; border-color:#CD853F; border-radius:5px;">
<tr><td style="font-size: 16px; padding-left: 5px">
프로필 사진 &nbsp&nbsp <input style="display:inline;" type="file" name="file" id="file" accept=".bmp, .gif, .jpg, .png" onchange="getThumbnailPrivew(this, 'avatar_image');">
</td></tr>
<tr><td width="400" height="400">
<img alt="프로필 사진" src="img/${meeting.meetingBoard_proPic }" id="avatar_image"  width="400x" height="400px"></td></tr>
</table>
</td><td>

<table style="width: 600; height: 400">
<tr><td width="140" style="padding-left:10px; background-color:white; color:#CD853F; border:1; border-color:#CD853F; border-radius:5px;"> 카테고리 / 모임명 </td><td width="460px;" height="50">
<input type="text"  id="title" maxlength="23" style="width: 450px; height: 40px; padding-left:10px; font-size: 16px;
background-color:white; color:#CD853F; border:1; border-color:#CD853F; border-radius:5px;" value="${meeting.meetingBoard_title}"></td></tr>
<%SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd"); String dat = date.format(new Date()); %>

<tr><td>기존 모임 일시</td><td> ${meeting.meetingBoard_startMeetingDate } ~ ${meeting.meetingBoard_endMeetingDate }</td></tr>
<tr><td width="140" style="padding-left:10px; background-color:white; color:#CD853F; border:1; border-color:#CD853F; border-radius:5px;"> 모임일시 </td><td height="50" >
<input id="startmeetingdate" type="date" min="<%=dat %>" onkeydown="filterNumner(event);" style="
background-color:white; color:#CD853F; border:1; width: 130px;height:30px; border-color:#CD853F; border-radius:5px;">
<select id="startmeetingdate2" style="background-color:white; color:#CD853F; border:1; width: 60px;height:30px; border-color:#CD853F; border-radius:5px;">
<%
int a0=0;
String b0="00";
int c=1;
for(int i =0; i<48;i++){
	b0="00";
	if(i%2==1){
		b0="30";
	}
if(i!=0&&i%2==0){
a0 = i-c;
c++;
}
%>
<option value="<%=a0%>:<%=b0%>"><%=a0%>:<%=b0%></option>
<%} %></select> ~ <input id="endmeetingdate" type="date" min="<%=dat %>" onkeydown="filterNumner(event);" style="
background-color:white; color:#CD853F; border:1; width: 130px;height:30px; border-color:#CD853F; border-radius:5px;">
<select id="endmeetingdate2" style="background-color:white; color:#CD853F; border:1; width: 60px;height:30px; border-color:#CD853F; border-radius:5px;">
<%
a0=0;
b0="00";
c=1;
for(int i =0; i<48;i++){
	b0="00";
	if(i%2==1){
		b0="30";
	}
if(i!=0&&i%2==0){
a0 = i-c;
c++;
} %>
<option value="<%=a0%>:<%=b0%>"><%=a0%>:<%=b0%></option>
<%} %>
</select>
</td></tr>

<tr><td>기존 접수 일시</td><td> ${meeting.meetingBoard_startAcceptingDate } ~ ${meeting.meetingBoard_endAcceptingDate }</td></tr>

<tr><td width="140px" style="padding-left:10px; background-color:white; color:#CD853F; border:1; border-color:#CD853F; border-radius:5px;"> 접수기간 </td><td id="acceptdate" height="50" >
<input id="startmeetingacceptdate" type="date" min="<%=dat %>" onkeydown="filterNumner(event);" style="
background-color:white; color:#CD853F; border:1; width: 130px;height:30px; border-color:#CD853F; border-radius:5px;">
<select id="startmeetingacceptdate2" style="background-color:white; color:#CD853F; border:1; width: 60px;height:30px; border-color:#CD853F; border-radius:5px;">
<%
a0=0;
b0="00";
c=1;
for(int i =0; i<48;i++){
	b0="00";
	if(i%2==1){
		b0="30";
	}
if(i!=0&&i%2==0){
a0 = i-c;
c++;
}
%>
<option  
 value="<%=a0%>:<%=b0%>"><%=a0%>:<%=b0%></option>
<%} %>
</select>
 ~ <input id="endmeetingacceptdate" type="date" min="<%=dat %>" onkeydown="filterNumner(event);" style="
background-color:white; color:#CD853F; border:1; width: 130px;height:30px; border-color:#CD853F; border-radius:5px;">
 <select id="endmeetingacceptdate2" style="background-color:white; color:#CD853F; border:1; width: 60px;height:30px; border-color:#CD853F; border-radius:5px;">
 <%
 a0=0;
 b0="00";
 c=1;
for(int i =0; i<48;i++){
	b0="00";
	if(i%2==1){
		b0="30";
	}
if(i!=0&&i%2==0){
a0 = i-c;
c++;
}
%>
 <option value="<%=a0%>:<%=b0%>"><%=a0%>:<%=b0%></option>
 <%} %>
 </select>
</td></tr>
					<%MeetingBoard meeting = (MeetingBoard)request.getAttribute("meeting"); 
					String place = meeting.getMeetingBoard_place();
					StringTokenizer values = new StringTokenizer(place,"/");
					String place1 = values.nextToken();
					String place2 = values.nextToken();
					%>
<tr><td style="padding-left:10px; background-color:white; color:#CD853F; border:1; border-color:#CD853F; border-radius:5px;" > 모임장소 </td><td id="place" height="250">
<div id="map" style="width:100%;height:350px;"></div></td></tr>
</table>
<form name="form" id="form" method="post">
	<table style="width: 600px">
			<tbody>
				<tr>
					<td style="padding-left:10px; width: 50%; border:2; border-color:#CD853F; border-radius:5px; width: 90px; padding: 5px; 
					background-color:white; color:#CD853F; border:1; border-color:#CD853F; border-radius:5px;" >도로명주소</td>
					<td><input type="hidden" id="confmKey" name="confmKey" value=""  >
					<input value="<%=place1%>" readonly="readonly" type="text" id="roadAddrPart1" style="width:370px; background-color:white; color:#CD853F; 
					font-family: 'NanumSquareRound',sans-serif; padding: 4px; border:1; 
	                border-color:#CD853F; border-radius: 5px;"></td>
					<td><input type="button"  value="주소검색" onclick="goPopup();" style="background-color: #CD853F; border: none; padding: 5px 10px; border-color:#CD853F;
									 border-radius: 5px; color: white;"></td>
				</tr>
				<tr>
					<td width="130" style="background-color:white; color:#CD853F; border:1; border-color:#CD853F; border-radius:5px;" >상세주소<input type="hidden" id="btn"></td>
					<td colspan="2">
						<input type="text" id="addrDetail" value="<%=place2%>" style="width:450px; background-color:white; color:#CD853F; font-family: 'NanumSquareRound',sans-serif; padding: 4px; border:1; 
	border-color:#CD853F; border-radius: 5px;" value="">
					</td>
				</tr>
			</tbody>
		</table>
</form>
<tr><td colspan="2">
<table border="1"  style="width: 1000px; border-color:#CD853F;">
<tr>
<td width="1000" height="50" style="font-size:22px; background-color:white; color:#CD853F; border:1; border-color:#CD853F; border-radius:5px;">모임상세 내용 입력</td></tr>
</table>
<script type="text/javascript" src="naverEditor/js/naverEditor.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="naverEditor/WebContent/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>


<table style="margin: auto; width: 1000px; border-color:#CD853F;"><tr><td>

	<textarea name="ir1" id="ir1" rows="10" cols="100"  style="width:100%; height:400px; display:none;">${meeting.meetingBoard_content }</textarea>
	<p align="center">
		<input type="button" onclick="location.href='meetingview.do?meeting_boardno=${meeting.meeting_boardno}'" style="font-size: 14pt" value="취소" class="write-btn"/>
		<input type="button" onclick="submitContents(this);" style="font-size: 14pt" value="수정 완료" class="write-btn"/>
</p>
</td></tr></table>	
</td></tr>
</table>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">
var oEditors = [];

// 추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "naverEditor/WebContent/resources/editor/SmartEditor2Skin.html",	
	htParams : {
		bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : false,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : false,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
		//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
		fOnBeforeUnload : function(){
			//alert("완료!");
		}
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});
	
function submitContents(elClickedObj) {
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
	var title = $("#title").val();
	var content = $("#ir1").val();
	var startmeetingdate = $("#startmeetingdate").val();
	var endmeetingdate = $("#endmeetingdate").val();
	var startmeetingacceptdate = $("#startmeetingacceptdate").val();
	var endmeetingacceptdate = $("#endmeetingacceptdate").val();
	var startmeetingdate2 = $("#startmeetingdate2").val();
	var endmeetingdate2 = $("#endmeetingdate2").val();
	var startmeetingacceptdate2 = $("#startmeetingacceptdate2").val();
	var endmeetingacceptdate2 = $("#endmeetingacceptdate2").val();
	var place = $("#roadAddrPart1").val()+"/"+$("#addrDetail").val();
		$.ajax({
			type : "get",
			url : "writeMBC.do",
			data : {
				"title" : title,
				"content" : content,
				"place" : place,
				"startmeetingdate" : startmeetingdate,
				"startmeetingdate2" : startmeetingdate2,
				"endmeetingdate" : endmeetingdate,
				"endmeetingdate2" : endmeetingdate2,
				"startmeetingacceptdate" : startmeetingacceptdate,
				"startmeetingacceptdate2" : startmeetingacceptdate2,
				"endmeetingacceptdate" : endmeetingacceptdate,
				"endmeetingacceptdate2" : endmeetingacceptdate2
			},
			success : function(data){
				window.location.href="http://localhost:8080/PETstFriends/meetingview.do?meeting_boardno="+data.meeting.meeting_boardno
						
			},
			error : function(request){
				alert("에러 : "+request.status);
			}
		})
}
  function goPopup(){
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	    var pop = window.open("petst/meeting/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	    
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}
	/** API 서비스 제공항목 확대 (2017.02) **/
	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
							, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadAddrPart1.value = roadAddrPart1;
		document.form.addrDetail.value = addrDetail;
		$('#btn').trigger("click");
	}
  $(document).ready(function() {
  var map = new naver.maps.Map("map", {
	    center: new naver.maps.LatLng(37.3595316, 127.1052133),
	    zoom: 10,
	    mapTypeControl: true
	});


	var infoWindow = new naver.maps.InfoWindow({
	    anchorSkew: true
	});

	map.setCursor('pointer');

    
	// search by tm128 coordinate
	function searchCoordinateToAddress(latlng) {
	    var tm128 = naver.maps.TransCoord.fromLatLngToTM128(latlng);
	    infoWindow.close();

	    naver.maps.Service.reverseGeocode({
	        location: tm128,
	        coordType: naver.maps.Service.CoordType.TM128
	    }, function(status, response) {
	        if (status === naver.maps.Service.Status.ERROR) {
	            return alert('Something Wrong!');
	        }

	        var items = response.result.items,
	            htmlAddresses = [];
            document.getElementById('roadAddrPart1').value = items[0].address;
	        for (var i=0, ii=1, item, addrType; i<ii; i++) {
	            item = items[i];
	            htmlAddresses.push(item.address);
	        }

	        infoWindow.setContent([
	                '<div style="padding:10px;min-width:200px;line-height:150%;">',
	                htmlAddresses.join('<br />'),
	                '</div>'
	            ].join('\n'));

	        infoWindow.open(map, latlng);
	    });
	}

	// result by latlng coordinate
	function searchAddressToCoordinate(address) {
	    naver.maps.Service.geocode({
	        address: address
	    }, function(status, response) {
	        if (status === naver.maps.Service.Status.ERROR) {
// 	            return alert('Something Wrong!');
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
	        searchCoordinateToAddress(e.coord);
	    });
	    $('#btn').on('click', function(e) {
	        e.preventDefault();

	        searchAddressToCoordinate($('#roadAddrPart1').val());
	    });
	    searchAddressToCoordinate('<%=place1%>');
	}

	naver.maps.onJSContentLoaded = initGeocoder;
  });

      </script>
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