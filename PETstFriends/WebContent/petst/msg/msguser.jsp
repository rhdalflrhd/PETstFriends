<%@page import="java.awt.Window"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    top:150px;
    margin-left: -350px;
    width:700px;
    height:450px;
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
<button class="openMask" style="height: 62px; background-color: #CD853F; border: none; padding: 5px 10px;
border-radius: 5px; color: white; font-size: 35px">쪽지함</button>
									<div id="mask"></div>
            <div class="window"> 
        
            <a style="font-size: 28px;"><ins>쪽지함</ins></a>
                         				<button id="current" style="height: 40px; background-color: #CD853F; border: none; padding: 5px 10px;
                                          border-radius: 5px; color: white; font-size: 18px" value="1">쪽지 목록</button> 
             							<button id="msgdeletebutton" style="height: 40px; background-color: #CD853F; border: none; padding: 5px 10px;
                                          border-radius: 5px; color: white; font-size: 18px" value="1">쪽지 삭제</button> 
             							<button class="close1" style="height: 40px; background-color: #CD853F; border: none; padding: 5px 10px;
 									      border-radius: 5px; color: white; font-size: 18px">닫기</button>
 
            
            <br>
                <center>
            <table id="msgtable"><tbody>
            </tbody></table>
            <table id="msgtablepage" align="center">
            <tbody align="center"></tbody></table>

            </center>
            </div>             
            
 
     
     
          
            
            
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
crossorigin="anonymous"></script>
<script type="text/javascript">
window.open('msgadmin.jsp');
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ쪽지 보기
$(document).on('click', '#msgview', function(event) {
	 var msg_no = $(this).find('input[type="hidden"]').val();
	$.ajax({
		type : "get",
		url : "showMsg.do",
		data:{
			"msg_no" : msg_no
		},
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			$('#msgtable>tbody').empty();
			$('#msgtablepage>tbody').empty();
			$('#msgtable>tbody:last').append(
			"<tr><td  style=\"text-align: center;\" width=\"70px;\">쪽지 번호</td><td  style=\"text-align: center;\">제 목</td><td  style=\"text-align: center;\">보낸 날짜</td></tr>"+
			"<tr><td  style=\"text-align: center;\" width=\"70px;\" height=\"50px\">"+data.showMsg.msg_no+ "</td>"+			
			"<td style=\"text-align: center; width=\"380px;\">"+data.showMsg.msg_title+"</td><td width=\"150px\">"+data.showMsg.msg_sendDate+
			"</td></tr><tr style=\"border: 1px solid black\"><td height=\"40px\" colspan=\"3\">내용</td></tr>"+
			"<tr><td colspan=\"3\" style=\"padding-left:20px;\" width=\"580px\"  height=\"205px\">"+data.showMsg.msg_contents+"</td></tr><tr><td height=\"100px\" colspan=\"3\"></td></tr>");
		},
		error : function(request){
			alert("에러 : "+request.status);
		}
	})
});
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ쪽지함 목록 출력
$.ajax({
		type : "get",
		url : "showMsgList.do",
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			$('#msgtable>tbody:last').append("<tr style=\"text-align: center;\"><td colspan=\"2\" width=\"70px\">쪽지번호</td><td width=\"270px\">쪽지 제목</td><td width=\"130px\">보낸사람</td><td>보낸 날짜</td></tr>");
			var cur;
			if(10>data.showMsgList.length){
				cur=data.showMsgList.length;
			}else{
				cur=10;
			}
			for(var i = 0; i<cur;i++){
			$('#msgtable>tbody:last').append(
			"<tr style=\"text-align: center;\"><td width=\"15px\"><input type=\"checkbox\" name=\"checkbox\" value=\""+data.showMsgList[i].msg_no+"\"></td>"+
			"<td width=\"55px;\" height=\"30px\">"+data.showMsgList[i].msg_no+			
			"</td><td id=\"msgview\" style=\"cursor: pointer;\" width=\"500px;\"><input type=\"hidden\"  value=\""+data.showMsgList[i].msg_no+"\">"+data.showMsgList[i].msg_title+"</td>"+
			"<td width=\"150px\">관리자</td>"+
			"<td width=\"180px\">"+data.showMsgList[i].msg_sendDate+"</td></tr>");}
			$('#msgtablepage>tbody:last').append(
					"<tr><td>");
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
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ쪽지 목록출력 2
$(document).on('click', '#current', function(event) {
	var page = $(this).attr('value');
	$.ajax({
		type : "get",
		url : "showMsgList.do",
		data : {
			"page" : page
		},
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			$('#msgtable>tbody').empty();
			$('#msgtablepage>tbody').empty();
			$('#msgtable>tbody:last').append(
					"<tr style=\"text-align: center;\"><td colspan=\"2\" width=\"70px\">쪽지번호</td><td width=\"270px\">쪽지 제목</td><td width=\"130px\">보낸사람</td><td>보낸 날짜</td></tr>");
			var cur;
			if(data.current*10>data.showMsgList.length){
				cur=data.showMsgList.length;
			}else{
				cur=data.current*10;
			}
			for(var i = data.current*10-10; i<cur;i++){
				$('#msgtable>tbody:last').append(
						"<tr style=\"text-align: center;\"><td width=\"15px\"><input type=\"checkbox\" name=\"checkbox\" value=\""+data.showMsgList[i].msg_no+"\"></td>"+
						"<td width=\"55px;\" height=\"30px\">"+data.showMsgList[i].msg_no+			
						"</td><td id=\"msgview\" style=\"cursor: pointer;\" width=\"500px;\"><input type=\"hidden\"  value=\""+data.showMsgList[i].msg_no+"\">"+data.showMsgList[i].msg_title+"</td>"+
						"<td width=\"150px\">관리자</td>"+
						"<td width=\"180px\">"+data.showMsgList[i].msg_sendDate+"</td></tr>");}
						$('#msgtablepage>tbody:last').append(
								"<tr><td>");
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
$(document).on('click', '#msgdeletebutton', function(event) {
    $("input[name=checkbox]:checked").each(function() {
		  var msg_no = $(this).val(); 
			$.ajax({
				type : "get",
				url : "deleteMsg.do",
				data : {
					"msg_no" : msg_no
				},
				success : function(data){
					data.deleteMsg
// 					alert(data.deleteMsg);
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
		url : "showMsgList.do",
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			$('#msgtable>tbody').empty();
			$('#msgtablepage>tbody').empty();
			$('#msgtable>tbody:last').append("<tr style=\"text-align: center;\"><td colspan=\"2\" width=\"70px\">쪽지번호</td><td width=\"270px\">쪽지 제목</td><td width=\"130px\">보낸사람</td><td>보낸 날짜</td></tr>");
			var cur;
			if(10>data.showMsgList.length){
				cur=data.showMsgList.length;
			}else{
				cur=10;
			}
			for(var i = 0; i<cur;i++){
			$('#msgtable>tbody:last').append(
			"<tr style=\"text-align: center;\"><td width=\"15px\"><input type=\"checkbox\" name=\"checkbox\" value=\""+data.showMsgList[i].msg_no+"\"></td>"+
			"<td width=\"55px;\" height=\"30px\">"+data.showMsgList[i].msg_no+			
			"</td><td id=\"msgview\" style=\"cursor: pointer;\" width=\"500px;\"><input type=\"hidden\"  value=\""+data.showMsgList[i].msg_no+"\">"+data.showMsgList[i].msg_title+"</td>"+
			"<td width=\"150px\">관리자</td>"+
			"<td width=\"180px\">"+data.showMsgList[i].msg_sendDate+"</td></tr>");}
			$('#msgtablepage>tbody:last').append(
					"<tr><td>");
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
}); 
$("#mask").click(function () {  
    $(this).hide();  
    $(".window").hide();
    $(".window2").hide();  
});   
</script>




</body>
</html>