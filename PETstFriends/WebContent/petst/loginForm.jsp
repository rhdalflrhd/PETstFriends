<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">

$(document).ready(function(){

	$('#loginBtn').click(function(){
		
		$.ajax({
			type:"GET",
			url:"login.do",
			data:{
				"user_id":$('#user_id').val(),
				"user_pass":$('#user_pass').val()
			},
			success:function(result){
			if(result == true){
				alert("로그인성공");
				window.location.href="main.do";
			}else{
				alert("로그인실패");
				
			}
			},
			   error: function(jqXHR, exception) {
			        if (jqXHR.status === 0) {
			            alert('Not connect.\n Verify Network.');
			        }
			        else if (jqXHR.status == 400) {
			            alert('Server understood the request, but request content was invalid. [400]');
			        }
			        else if (jqXHR.status == 401) {
			            alert('Unauthorized access. [401]');
			        }
			        else if (jqXHR.status == 403) {
			            alert('Forbidden resource can not be accessed. [403]');
			        }
			        else if (jqXHR.status == 404) {
			            alert('Requested page not found. [404]');
			        }
			        else if (jqXHR.status == 500) {
			            alert('Internal server error. [500]');
			        }
			        else if (jqXHR.status == 503) {
			            alert('Service unavailable. [503]');
			        }
			        else if (exception === 'parsererror') {
			            alert('Requested JSON parse failed. [Failed]');
			        }
			        else if (exception === 'timeout') {
			            alert('Time out error. [Timeout]');
			        }
			        else if (exception === 'abort') {
			            alert('Ajax request aborted. [Aborted]');
			        }
			        else {
			            alert('Uncaught Error.n' + jqXHR.responseText);
			        }
			    }
			
		})//ajax
		
		
		
	})//로그인버튼
	
	
	
	
})//레디





</script>
</head>
<body>
	<center>
		<h1>
			<b><font color="gray">로그인</font></b>
		</h1>
		<form id="login">


아이디-
<input type="text" id="user_id" name="user_id"> 
					
비밀번호-
<input type="password" id="user_pass" name="user_pass">

<button id=loginBtn>가입하기</button>
<button onclick="location.href='joinUserForm.do'">취소</button>
</form>
	</center>
</body>
</html>