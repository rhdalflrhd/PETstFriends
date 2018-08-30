<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function(){


			$('#RabC').on('click',function(){

				$.ajax({
					url : "Species.do",
			        type: "get",
			        data : {"query": "토끼목 토끼과의 포유류", "display": 10, "start": 2},
// 			        async: false,
					success : function(responseData1) {
						alert("토끼 데이터 들어옴성공")
						alert(responseData1)
						responseData11 = responseData1.replace(/\"\[/g,"\[").replace(/\]\"/g,"\]").replace(/\"\{/g,"\{").replace(/\}\"/g,"\}");
						var jsonObj1 = JSON.parse(responseData1);
						$('#listTable tr:not(:first)').remove();
						$('#listTable tr:eq(1)').append("<tr>")
				        for(var i=0; i<jsonObj1["items"].length; i++){
						var items = [];
						items.push("<td>" + jsonObj1["items"][i]["title"] + "</td>"); 	
						items.push("<td>" +"<a href=\""+ jsonObj1["items"][i]["link"]+ "\">상세링크</a>"+ "</td>")
						items.push("<td>" + jsonObj1["items"][i]["description"] + "</td>");
						items.push("<td>" + "<img src=\""+jsonObj1["items"][i]["thumbnail"]+"\">" + "</td>"); 
						$("<tr/>", {html : items}).appendTo('#listTable'); 						
				        }	
						alert("토끼데이터 테이블 생성 끝");
					},
					
			    error:function(xhrReq, status, error){
			        alert("ajax통신 실패!!!");
			        alert(xhrReq);
					alert(status);
					alert(error);	    	
			    }
				});	
				
				
			});

			$('#Catc').on('click',function(){
// 				alert("일단들어옴")
				$.ajax({
					url : "Species.do",
			        type: "get",
			        data : {"query": "식육목 고양이과의 포유류", "display": 10, "start": 12},
// 			        async: false,
					success : function(responseData2) {
						alert("고양이 데이터 ㅎㅎ들어옴성공")
						alert(responseData2);
						responseData22 = responseData2.replace(/\"\[/g,"\[").replace(/\]\"/g,"\]").replace(/\"\{/g,"\{").replace(/\}\"/g,"\}");
						var jsonObj2 = JSON.parse(responseData2);
						alert(jsonObj2);
						$('#listTable tr:not(:first)').remove();
						$('#listTable tr:eq(1)').append("<tr>")
				        for(var i=0; i<jsonObj2["items"].length; i++){
						var items = [];
						items.push("<td>" + jsonObj2["items"][i]["title"] + "</td>"); 
						items.push("<td>" +"<a href=\""+ jsonObj2["items"][i]["link"]+ "\">상세링크</a>"+ "</td>")
						items.push("<td>" + jsonObj2["items"][i]["description"] + "</td>"); 
						items.push("<td>" + "<img src=\""+jsonObj2["items"][i]["thumbnail"]+"\">" + "</td>"); 
						$("<tr/>", {html : items}).appendTo('#listTable');					
				        }	

					},
					
			    error:function(xhrReq, status, error){
			        alert("ajax통신 실패!!!");
			        alert(xhrReq);
					alert(status);
					alert(error); 	
			    }
				});	
				
				
			});
			
			$('#DogC').on('click',function(){
// 				alert("일단들어옴")
				$.ajax({
					url : "Species.do",
			        type: "get",
			        data : {"query": "FCI 스탠다드", "display": 10, "start": 1},
// 			        async: false,
					success : function(responseData3) {
						alert("강아지 데이터 ㅎㅎ들어옴성공")
						alert(responseData3);
						responseData33 = responseData3.replace(/\"\[/g,"\[").replace(/\]\"/g,"\]").replace(/\"\{/g,"\{").replace(/\}\"/g,"\}");
						var jsonObj3 = JSON.parse(responseData3);
						$('#listTable tr:not(:first)').remove();
						$('#listTable tr:eq(1)').append("<tr>")
				        for(var i=0; i<jsonObj3["items"].length; i++){
						var items = [];
						items.push("<td>" + jsonObj3["items"][i]["title"] + "</td>"); 
						items.push("<td>" +"<a href=\""+ jsonObj3["items"][i]["link"]+ "\">상세링크</a>"+ "</td>")
						items.push("<td>" + jsonObj3["items"][i]["description"] + "</td>"); 
						items.push("<td>" + "<img src=\""+jsonObj3["items"][i]["thumbnail"]+"\">" + "</td>"); 
						$("<tr/>", {html : items}).appendTo('#listTable');					
				        }	
						alert("강아지 데이터 테이블 생성 끝");
					},
					
			    error:function(xhrReq, status, error){
			        alert("ajax통신 실패!!!");
			        alert(xhrReq);
					alert(status);
					alert(error);  	
			    }
				});	
				
				
			});	
			
});
</script>
<style type="text/css">
.a {
	border: solid red 5px
}
body {
	border: 0;
	padding: 0;

	min-height: 100%;
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;

}
span {
	width: 150px;
	color: #C1AEEE;
}

input {
	border: solid gray 1px
}

table {
	width: 100%;
	background-color: transparent;
}

th, td {
	border: 1px gray solid;
	text-align: center;
	padding: 3px
}

h2 {
	text-align: center
}
</style>
</head>
<body>
	<center>
		<font color="grey" style="font-family: Georgia; font-weight: bold;">
			
			<input type="button" id="DogC" value="강아지클릭ㅎ"  >
			<input type="button" id="Catc" value="고양이클릭ㅎ"  >
			<input type="button" id="RabC" value="토끼클릭ㅎ"  >
			<h1> 종정보 페이지</h1>
		
		<table id="listTable" cellspacing="0">
		<tr bgcolor="#7B68EE" style="color:white;"  >
			<th>타이틀</th>
			<th>링크</th>
			<th>설명</th>
			<th>섬네일</th>
		</tr>
		</table>

		</font>
	</center>
</body>
</html>