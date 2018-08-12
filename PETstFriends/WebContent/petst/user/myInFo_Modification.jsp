<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내정보수정</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">





window.onload = function() {

	var pwd1Check = document.getElementById("new_user_pass");
var pwd1ok = document.getElementById("pwd1ok ");
pwd1Check.addEventListener('blur', function(e) {
	var pattern1 = /[0-9]/;
	// 숫자 
	var pattern2 = /[a-zA-Z]/;
	// 문자 
	var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;
	// 특수문자
	var blank_pattern2 = /^\s+|\s+$/g;

	if (blank_pattern2.test(pwd1Check.value) == true) {
		pwd1ok.innerHTML = "비밀번호는 공백이 불가합니다."
		pwd1Check.focus();
	}
	 else if(!pattern1.test(pwd1Check.value) || !pattern2.test(pwd1Check.value) || !pattern3.test(pwd1Check.value)) {
			pwd1ok.innerHTML = "비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다.사용가능한 특수문자: ~!@#$%^&*()_+|<>?:{}"
			pwd1Check.focus();
	 }
	 else pwd1ok.innerHTML = "사용가능합니다.";
});


var pwd2Check = document.getElementById("new_user_pass_chk");
var pwd2ok = document.getElementById("pwd2ok");
pwd2Check.addEventListener('blur', function(e) {
	if(pwd1Check.value != pwd2Check.value){

		pwd2ok.innerHTML="비밀번호가 일치하지 않습니다. 다시 입력해주세요";
		pwd2Check.focus();
	}
	else{
		pwd2ok.innerHTML="비밀번호가 일치합니다.";
	}		
});
	
};

</script>
<script type="text/javascript">

$(document).ready(function(){
	

	
	$('#user_pass').blur(function() { //비밀번호 일치 검사
		$.ajax({
			method : 'GET',
			url : 'passCheck.do',
			data : {
				user_pass : $('#user_pass').val()
			},
			success : function(result) {
				if (result != true) {
					$('#pass').html('비밀번호가 일치합니다.');
				} else {
					$('#pass').html('비밀번호가 일치하지않습니다.');
					$(this).focus();
				}
			},
			error : function(xhrReq, status, error) {
				alert(error)
				alert("값이 안온건가용?")
			}
		});
	});



	$('#user_nickname').blur(function() { //닉네임 중복 검사
			$.ajax({
				method : 'GET',
				url : 'nicknameCheck.do',
				data : {
					user_nickname : $('#user_nickname').val()
				},
				success : function(result) {
					if (result == true) {
						$('#nickname').html('사용가능한 닉네임입니다.');
					} else {
						$('#nickname').html('사용 불가한 닉네임입니다.');
						$(this).focus();
					}
				},
				error : function(xhrReq, status, error) {
					alert(error)
					alert("값이 안온건가용?")
				}
			});
		});
	

	
	$('#user_email').blur(function() { //이메일 중복 검사
		$.ajax({
			method : 'GET',
			url : 'emailCheck.do',
			data : {
				user_email : $('#user_email').val()
			},
			success : function(result) {
				if (result == true) {
					$('#email').html('사용 가능한 이메일 입니다.');
				} else {
					$('#email').html('사용 불가한 이메일입니다.');
					$(this).focus();
				}
			},
			error : function(xhrReq, status, error) {
				alert(error)
				alert("값이 안온건가용?")
			}
		});
	});
	
	
});

</script>
<script type="text/javascript">
$(function () {
   var chk = -1;


$("#auth_btn").click(function () {   // 이메일 인증 받기 

    var authNum = "";
    
    $.ajax({
    	method : 'GET',
    	url : "emailAuth.do",
        data : {
        	
        	user_email : $('#user_email').val()
        	
        },
        success : function (str) {
            authNum = str;
            alert("인증번호 전송완료.");
//             alert(authNum);
            
            $('#user_authNum').blur(function(){
            	
            
            if( $('#user_authNum').val()==authNum){
                alert("인증완료");
                
                $("#lab1").html("<label>인증완료</label>");
            }else{
                alert("인증실패");
                $("#lab1").html("<label>인증실패</label>");
            }
            
        });
         }
    
});
});
});
</script>

</head>
<body>



<form action ="userPetUpdate.do">


회원번호 <input type = "text"   name  = "user_no" id = "user_no"> <br>
이름 <input type = "text"   name  = "user_name" id ="user_name"  > <br>
아이디<input type = "text"   name  = "user_id"  id = "user_id"" > <br>
닉네임<input type = "text"  id ="user_nickname"><span id = "nickname"></span><br>
기본비번<input type = "password"     id ="user_pass" ><span id = "pass"></span><br>
새비번<input type = "password"   name  = "new_user_pass"   id ="new_user_pass"><span id = "pwd1ok "></span><br>
새비번확인<input type = "password"   name  = "new_user_pass_chk"   id ="new_user_pass_chk"><span id ="pwd2ok"></span><br>

이메일<input type = "text"   name  = "user_email"   id ="user_email""><span id = "email"></span><br><button type="button" id="auth_btn">인증하기</button><br>
인증번호 : <input type="text" id="user_authNum" name="user_authNum" ><div id="lab1"></div><br>

전화번호<input type = "text"   name  = "user_phone"   id ="user_phone"><br>
프로필사진<input type = "text"   name  = "user_proPic" id = "user_proPic"><br>
나의점수 <input type = "text"   name  = "user_score" id ="user_score"><br>

펫이름<input type = "text"  name   = "pet_name"  id = "pet_name" ><br>
펫 종<INPUT TYPE = "text" name   = "pet_species"  id="pet_species" ><br>
펫 성별<INPUT TYPE = "text"  name   = "pet_gender"  id="pet_gender" ><br>
펫 나이<INPUT TYPE = "text"  name   = "pet_age" id="pet_age" ><br>
펫사진<INPUT TYPE = "text"  name   = "pet_file"  id="pet_file" ><br>

<input type = "submit" value = "수정하기">



</form>


<form action="deleteUserForm.do" method = "post">

<input type = "submit" value = "탈퇴하기">

</form>
</body>
</html>