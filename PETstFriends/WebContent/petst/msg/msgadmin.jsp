<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        	   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
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
    top:200px;
    margin-left: -300px;
    width:600px;
    height:370px;
    background-color:#FFF;
    z-index:10000;  
 }
</style>
<body>
<button class="openMask" style="height: 62px; background-color: #CD853F; border: none; padding: 5px 10px;
border-radius: 5px; color: white; font-size: 35px">쪽지 보내기</button>
									<div id="mask"></div>
            <div class="window"> 
            <br><center>
            <a style="color: #00BFFF; font-size: 33px;">쪽지 보내기</a><br>
                            제목 : <input type="text" id="msg_title" style="width: 500px">
            <textarea id="msg_contents" style="resize: none; width: 580px; height: 220px;" ></textarea>
            <button id="msgSendbutton" class="close1" style="height: 62px; background-color: #CD853F; border: none; padding: 5px 10px;
 									 border-radius: 5px; color: white; font-size: 35px">보내기</button>
 									 <button class="close1" style="height: 62px; background-color: #CD853F; border: none; padding: 5px 10px;
 									 border-radius: 5px; color: white; font-size: 35px">닫기</button>
            </center>
            </div> 
            <button id="msgdeleteAdminbutton" style="height: 62px; background-color: #CD853F; border: none; padding: 5px 10px;
border-radius: 5px; color: white; font-size: 35px" value="1">관리자 쪽지 삭제</button>  

            <br><center>
            <a style="color: #00BFFF; font-size: 33px;">쪽지함 관리자페이지</a><br>

            <table id="msgtable">
       
            <tbody align="center">
            </tbody>

            </table>
             <table id="msgtablepage" align="center">
            
            <tbody align="center">
            </tbody>

            </table>
  
            <input type="text" id="searchbox" style="width: 200px; height: 30px;" >
 			<button id="search" style="height: 40px; background-color: #CD853F; border: none; padding: 5px 10px;
 			 border-radius: 5px; color: white; font-size: 20px">검색</button>
            </center>
          

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
crossorigin="anonymous"></script>
<script type="text/javascript">
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ쪽지 검색
$(document).on('click', '#search', function(event) {
	var contents = $('#searchbox').val();
$.ajax({
		type : "get",
		url : "showMsgListAdimin.do",
		dataType : "json",
		data:{
			"msg_ReceiverId" : contents
		},
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			$('#msgtable>tbody').empty();
			$('#msgtable>tbody:last').append("<tr style=\"text-align: center;\"><td width=\"70px\">쪽지번호</td><td width=\"380px\">쪽지 제목</td><td width=\"150px\">받는사람 ID</td><td>보낸 날짜</td></tr>");
			for(var i = 0; i<data.showMsgListAdmin.length;i++){
			$('#msgtable>tbody:last').append(
			"<tr style=\"text-align: center;\"><td width=\"70px;\" height=\"50px\">"+data.showMsgListAdmin[i].msg_no+		
			"</td><td id=\"msgview\" style=\"cursor: pointer;\" width=\"500px;\"><input type=\"hidden\"  value=\""+data.showMsgListAdmin[i].msg_no+"\">"+data.showMsgListAdmin[i].msg_title+"</td>"+
			"<td width=\"150px\">"+data.showMsgListAdmin[i].msg_ReceiverId+"</td>"+
			"<td width=\"180px\">"+data.showMsgListAdmin[i].msg_sendDate+"</td></tr>");}
		},
		error : function(request){
			alert("에러 : "+request.status);
		}
	})
})	
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ쪽지 보기
$(document).on('click', '#msgview', function(event) {
	 var msg_no = $(this).find('input[type="hidden"]').val();
	$.ajax({
		type : "get",
		url : "showMsgAdimin.do",
		data:{
			"msg_no" : msg_no
		},
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			$('#msgtable>tbody').empty();
			$('#msgtable>tbody:last').append(
			"<tr style=\"text-align: center;\"><td width=\"70px;\" height=\"50px\">"+data.showMsgAdmin.msg_no+ "</td>"+			
			"<td width=\"380px;\">"+data.showMsgAdmin.msg_title+"</td><td width=\"150px\">"+data.showMsgAdmin.msg_sendDate+"</td></tr>"+
			"<tr><td colspan=\"3\" style=\"padding-left:20px;\" width=\"580px\"  height=\"205px\">"+data.showMsgAdmin.msg_contents+"</td></tr>");
		},
		error : function(request){
			alert("에러 : "+request.status);
		}
	})
});
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ쪽지함 목록 출력
$.ajax({
		type : "get",
		url : "showMsgListAdimin.do",
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			$('#msgtable>tbody:last').append("<tr style=\"text-align: center;\"><td colspan=\"2\" width=\"70px\">쪽지번호</td><td width=\"380px\">쪽지 제목</td><td width=\"150px\">받는사람 ID</td><td>보낸 날짜</td></tr>");
			var cur;
			if(10>data.showMsgListAdmin.length){
				cur=data.showMsgListAdmin.length;
			}else{
				cur=10;
			}
			for(var i = 0; i<cur;i++){
			$('#msgtable>tbody:last').append(
			"<tr style=\"text-align: center;\"><td width=\"15px\"><input type=\"checkbox\" name=\"checkbox\" value=\""+data.showMsgListAdmin[i].msg_no+"\"></td>"+"<td width=\"55px;\" height=\"50px\">"+data.showMsgListAdmin[i].msg_no+			
			"</td><td id=\"msgview\" style=\"cursor: pointer;\" width=\"500px;\"><input type=\"hidden\"  value=\""+data.showMsgListAdmin[i].msg_no+"\">"+data.showMsgListAdmin[i].msg_title+"</td>"+
			"<td width=\"150px\">"+data.showMsgListAdmin[i].msg_ReceiverId+"</td>"+
			"<td width=\"180px\">"+data.showMsgListAdmin[i].msg_sendDate+"</td></tr>");}
			$('#msgtablepage>tbody:last').append(
					"<tr><td width=\"1100px\" height=\"30px\">");
			if(data.start !=1){
						$('#msgtablepage>tbody:last').append(
						"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\""+1+"\">[처음]</a>"+
						"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\""+data.start-1+"\">[이전]</a>");
					}
			for(var i = data.start; i <data.end;i++){
				if(i<=data.last){
						$('#msgtablepage>tbody:last').append(
								"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\""+i+"\">["+i+"]</a>");
					
				}			
			}
			if(data.start+9<data.last){
				$('#msgtablepage>tbody:last').append(
						"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\""+data.end+"\">[다음]</a>"+
						"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\""+data.last+"\">[끝]</a>");
			}		
				$('#msgtablepage>tbody:last').append(
					"</td></tr>"
					);
			
		},
		error : function(request){
			alert("에러 : "+request.status);
		}
	})	
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
$(document).on('click', '#current', function(event) {
	var page = $(this).attr('value');
	$.ajax({
		type : "get",
		url : "showMsgListAdimin.do",
		data : {
			"page" : page
		},
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			$('#msgtable>tbody').empty();
			$('#msgtablepage>tbody').empty();
			$('#msgtable>tbody:last').append(
			"<tr style=\"text-align: center;\"><td colspan=\"2\" width=\"70px\">쪽지번호</td><td width=\"380px\">쪽지 제목</td><td width=\"150px\">받는사람 ID</td><td>보낸 날짜</td></tr>");
			var cur;
			if(data.current*10>data.showMsgListAdmin.length){
				cur=data.showMsgListAdmin.length;
			}else{
				cur=data.current*10;
			}
			for(var i = data.current*10-10; i<cur;i++){	
			$('#msgtable>tbody:last').append(
			"<tr style=\"text-align: center;\"><td width=\"15px\"><input type=\"checkbox\" name=\"checkbox\" value=\""+data.showMsgListAdmin[i].msg_no+"\"></td>"+"<td width=\"55px;\" height=\"50px\">"+data.showMsgListAdmin[i].msg_no+			
			"</td><td id=\"msgview\" style=\"cursor: pointer;\" width=\"500px;\"><input type=\"hidden\"  value=\""+data.showMsgListAdmin[i].msg_no+"\">"+data.showMsgListAdmin[i].msg_title+"</td>"+
			"<td width=\"150px\">"+data.showMsgListAdmin[i].msg_ReceiverId+"</td>"+
			"<td width=\"180px\">"+data.showMsgListAdmin[i].msg_sendDate+"</td></tr>");}
			$('#msgtablepage>tbody:last').append(
					"<tr><td width=\"1100px\" height=\"30px\">");
			if(data.start !=1){
						$('#msgtablepage>tbody:last').append(
								"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\""+1+"\">[처음]</a>"+
								"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\""+data.start-1+"\">[이전]</a>");
					}
			for(var i = data.start; i <data.end;i++){
				if(i<=data.last){
						$('#msgtablepage>tbody:last').append(
								"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\""+i+"\">["+i+"]</a>");
					
				}			
			}
			if(data.start+9<data.last){
				$('#msgtablepage>tbody:last').append(
						"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\""+data.end+"\">[다음]</a>"+
						"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\""+data.last+"\">[끝]</a>");
			}		
				$('#msgtablepage>tbody:last').append(
					"</td></tr>"
					);
			
		},
		error : function(request){
			alert("에러 : "+request.status);
		}
	})	
	
})	
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ쪽지 삭제
$(document).on('click', '#msgdeleteAdminbutton', function(event) {
    $("input[name=checkbox]:checked").each(function() {
		  var msg_no = $(this).val(); 
			$.ajax({
				type : "get",
				url : "deleteMsgAdimin.do",
				data : {
					"msg_no" : msg_no
				},
				success : function(data){
					location.reload();
				},
				error : function(request){
					alert("에러 : "+request.status);
				}
			})
		  
		})

	
});

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ쪽지 보내기
$(document).on('click', '#msgSendbutton', function(event) {
	var msg_ReceiverId = 'msg_ReceiverId';
	var msg_title = $('#msg_title').val();
	var msg_contents = $('#msg_contents').val();
	$.ajax({
		type : "get",
		url : "sendMsg.do",
		data : {
			"msg_ReceiverId" : msg_ReceiverId,
			"msg_title" : msg_title,
			"msg_contents" : msg_contents
		},
		success : function(data){
			alert('전송 성공')
		},
		error : function(request){
			alert("에러 : "+request.status);
		}
	})	
});


//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ윈도우창, 검은막
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
$(".openMask").click(function(e){
    e.preventDefault();
    wrapWindowByMask();
});
$(".window .close1").click(function (e) {  
    //링크 기본동작은 작동하지 않도록 한다.
    e.preventDefault();  
    $("#mask, .window").hide();
    $.ajax({
		type : "get",
		url : "showMsgListAdimin.do",
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			$('#msgtable>tbody').empty();
			for(var i = 0; i<10;i++){
			$('#msgtable>tbody:last').append(
			"<tr style=\"text-align: center;\"><td width=\"70px;\" height=\"50px\">"+data.showMsgListAdmin[i].msg_no+ "</td>"+			
			"<td id=\"msgview\" style=\"cursor: pointer;\" width=\"500px;\"><input type=\"hidden\"  value=\""+data.showMsgListAdmin[i].msg_no+"\">"+data.showMsgListAdmin[i].msg_title+"</td>"+
			"<td width=\"150px\">"+data.showMsgListAdmin[i].msg_ReceiverId+"</td>"+
			"<td width=\"180px\">"+data.showMsgListAdmin[i].msg_sendDate+"</td></tr>");}
		},
		error : function(request){
			alert("에러 : "+request.status);
		}
	})	
}); 
$("#mask").click(function () {  
    $(this).hide();  
    $(".window").hide();
    $(".window2").hide();  
});   
</script>



</body>
</html>