<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
 <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Ne3L3fT_ARphRLHIt9DR&submodules=geocoder"></script>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
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

</style>

<table border="1" style="width: 1000; margin: auto;">
<tr><td>
<table border="1" style="width: 400; height: 400">
<tr><td width="400" height="300">
<img alt="프로필 사진" src="/images/user-empty.png" id="avatar_image" class="img-circle" width="400x" height="300px"></td></tr>
<tr><td><input type="file" name="file" id="file" accept=".bmp, .gif, .jpg, .png" onchange="getThumbnailPrivew(this, 'avatar_image');">
</td></tr>
<tr><td>
</td></tr>
</table>
</td><td>

<table border="1" style="width: 600; height: 400">
<tr><td width="140" style="padding-left:10px"> 카테고리 / 모임명 </td><td height="50">
<input type="text"  id="title" maxlength="23" style="width: 430px; height: 30px; padding-left:10px; font-size: 16px"></td></tr>
<tr><td width="140" style="padding-left:10px"> 모임일시 </td><td height="50" style="padding-left: 20px">
<input id="startmeetingdate" type="date" min="2018-08-27" onkeydown="filterNumner(event);">
<select id="startmeetingdate2">
<%
int a=0;
String b="00";
int c=1;
for(int i =0; i<48;i++){
	b="00";
	if(i%2==1){
		b="30";
	}
if(i!=0&&i%2==0){
a = i-c;
c++;
}
%>
<option value="<%=a%>:<%=b%>"><%=a%>:<%=b%></option>
<%} %></select> ~ <input id="endmeetingdate" type="date" min="2018-08-27" onkeydown="filterNumner(event);">
<select id="endmeetingdate2">
<%
a=0;
b="00";
c=1;
for(int i =0; i<48;i++){
	b="00";
	if(i%2==1){
		b="30";
	}
if(i!=0&&i%2==0){
a = i-c;
c++;
} %>
<option value="<%=a%>:<%=b%>"><%=a%>:<%=b%></option>
<%} %>
</select>

</td></tr>
<tr><td  width="140" style="padding-left:10px"> 접수기간 </td><td id="acceptdate" height="50" style="padding-left: 20px">
<input id="startmeetingacceptdate" type="date" min="2018-08-27" onkeydown="filterNumner(event);">
<select id="startmeetingacceptdate2">
<%
a=0;
b="00";
c=1;
for(int i =0; i<48;i++){
	b="00";
	if(i%2==1){
		b="30";
	}
if(i!=0&&i%2==0){
a = i-c;
c++;
}
%>
<option value="<%=a%>:<%=b%>"><%=a%>:<%=b%></option>
<%} %>
</select>
 ~ <input id="endmeetingacceptdate" type="date" min="2018-08-27" onkeydown="filterNumner(event);">
 <select id="endmeetingacceptdate2">
 <%
 a=0;
 b="00";
 c=1;
for(int i =0; i<48;i++){
	b="00";
	if(i%2==1){
		b="30";
	}
if(i!=0&&i%2==0){
a = i-c;
c++;
}
%>
 <option value="<%=a%>:<%=b%>"><%=a%>:<%=b%></option>
 <%} %>
 </select>
</td></tr>
<tr><td width="140" style="padding-left:10px" > 모임장소 </td><td id="place" height="250">
<div id="map" style="width:430px;height:350px;"></div></td></tr>
</table>
<form name="form" id="form" method="post">
	<table >
			<colgroup>
				<col style="width:20%"><col>
			</colgroup>
			<tbody>
				<tr>
					<th width="200px">도로명주소</th>
					<td><input type="hidden" id="confmKey" name="confmKey" value=""  >
					<input readonly="readonly" type="text" id="roadAddrPart1" style="width:300px"></td>
					<td><input type="button"  value="주소검색" onclick="goPopup();"></td>
				</tr>
				<tr>
					<th>상세주소<input type="hidden" id="btn"></th>
					<td>
						<input type="text" id="addrDetail" style="width:95%" value="">
					</td>
				</tr>
			</tbody>
		</table>
</form>
<tr><td colspan="2">
<table border="1" style="width: 1000">
<tr>
<td width="1000" height="50">모임상세 내용 입력</td></tr>
</table>
<script type="text/javascript" src="js/naverEditor.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

</table>
<table style="margin: auto; width: 1000px;"><tr><td>
	<textarea name="ir1" id="ir1" rows="10" cols="100" style="width:1000px; height:400px;; display:none;"></textarea>
	<p align="center">
		<input type="button" onclick="setDefaultFont();" style="font-size: 14pt" value="취소"/>
		<input type="button" onclick="submitContents(this);" style="font-size: 14pt" value="개설 완료" />
	</p>
</td></tr></table>
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
	sSkinURI: "resources/editor/SmartEditor2Skin.html",	
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
	    searchAddressToCoordinate('서울');
	}

	naver.maps.onJSContentLoaded = initGeocoder;
  });

      </script>
</body>
</html>