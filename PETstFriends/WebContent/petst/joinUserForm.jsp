<%@page import="org.apache.catalina.ssi.SSICommand"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#user_id').blur(function() { //id 중복 검사
		
		var userid=$('#user_id').val();
	if($('#user_id').val() == ""){
		$('#user_idResult').html('ID를 입력해주세요.');
		$(this).focus();
	}
	else{
		
		
		$.ajax({
			method : 'GET',
			url : 'idCheck.do',
			data : {
				user_id : $('#user_id').val()
			},
			success : function(result) {
		
				if (result == true) {
					$('#user_idResult').html('사용가능한 id입니다.'); 
				} else {
					$('#user_idResult').html('사용 불가한 id입니다.');
					$(this).focus();
				}
			},
			error : function(xhrReq, status, error) {
				alert(error)
			}
		});
	}
	}); //아디
//-------------------------------------------------------------------
	$('#user_nickname').blur(function() { //닉네임 중복 검사
	
			
			var usernickname=$('#user_nickname').val();
		if($('#user_nickname').val() == ""){
			$('#user_nicknameResult').html('닉네임을 입력해주세요.');
			$(this).focus();
		}
		else{

		
		$.ajax({
			method : 'GET',
			url : 'NnCheck.do',
			data : {
				user_nickname : $('#user_nickname').val()
			},
			success : function(result1) {
				if (result1 == true) {
					$('#user_nicknameResult').html('사용가능한 닉네임입니다.');
				} else {
					$('#user_nicknameResult').html('사용 불가한 닉네임입니다.');
					$(this).focus();
				}
			},
			error : function(xhrReq, status, error) {
				alert(error)
			}
		});
		}
	});//닉넴
	//-------------------------------------------------------------------

	
	//-----------------------------------------------------------------
	
	//핸드폰 정규식
	$('#user_phone').blur(function() { //휴대폰 정규식
		var phonePattern = /^\d{3}-\d{3,4}-\d{4}$/;
		if ((phonePattern.test($('#user_phone').val()))) {
			$('#user_phoneResult').html('ㅇㅇ');	
		
		}
		else{
			$('#user_phoneResult').html('ex) 010-1234-5678 형식으로 입력해주세요.');
			$(this).focus();
		}
	
	});// user_phone
	
	//-----------------------------------------------------------------
	
	$('.user_havePet').click(function() { //반려동물 있음 =>펫테이블 보이게하기
			if ($(this).val() == 1)
				$('#petTable').css('display', 'inline');
		});
		$('.user_havePet').click(function() { //반려동물 없음 =>펫테이블 사라지게하기
			if ($(this).val() == 0) {
				$('#petTable').css('display', 'none');
			}
		});
		var clickNum = 1;//10마리까지만 입력 가능하도록 함
		$(document).on('click', '.addPet', function() { //+클릭시 종 입력 줄 한줄 생성
			if(clickNum>9){
				alert('최대 10마리까지 입력 가능합니다.')
			}else{
				clickNum++;
			$('#petTable').append('<tr><td><input type="text" class="pet_name" name="pet_name"></td>'
				+ '<td><select class="pet_species">'
				+ '<option value="0">종 선택</option>'
				+ '<option value="1">개</option>'
				+ '<option value="2">고양이</option>'
				+ '<option value="3">토끼</option>'
				+ '<option value="4">기타</option>'
				+ '</select></td>'
				+ '<td><select class="pet_gender">'
				+ '<option value="0">성별</option>'
				+ '<option value="1">여</option>'
				+ '<option value="2">남</option>'
				+ '<option value="3">중성화</option>'
				+ '</select></td>'
				+ '<td><input type="text" class="pet_age"></td>'
				+ '<td><input type="file" class="pet_file"></td>'
				+ '<td class="removePet"><i class="fa fa-minus-square"></i></td>'
				+ '</tr>')
			}
		})
		$(document).on('click', '.removePet', function() { //-클릭시 그 줄 삭제
			var thisR = $(this);
			thisR.parent().remove();
			if(clickNum>1){
				clickNum--;
			}
		});
	//----------------------------------------------------------------	
	//비번정규식
	$('#user_pass').blur(function() {
		var userpass=$('#user_pass').val();
	if($('#user_pass').val() == ""){
		$('#user_passResult').html('PW를 입력해주세요.');
		$(this).focus();
	}
	else{
		
		var passPt = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		if((passPt.test($('#user_pass').val()))){
			$('#user_passResult').html('ㅇㅇ');
		}
		else{
			$('#user_passResult').html('ㄴㄴ');
			$(this).focus();
		}
	}
	});//pass
	
	//----------------------------------------------------------------------

	//비번 일치 불일치

	$(function() {
		$('#user_pass').blur(function() {
			$('font[name=user_pwcheck]').text('');
		}); //#user_pass.keyup

		$('#user_pass2').blur(function() {
			if ($('#user_pass').val() != $('#user_pass2').val()) {
				$('font[name=user_pwcheck]').text('');
				$('font[name=user_pwcheck]').html("PW불일치");
			} else {
				$('font[name=user_pwcheck]').text('');
				$('font[name=user_pwcheck]').html("PW일치");
			}
		});
	});
	


//-----------------------------------------------------------------------------------
//이멜 정규식
$('#user_email').blur(function() {
	var useremail=$('#user_email').val();
	if($('#user_emil').val() == ""){
		$('#user_emailResult').html('Email을 입력해주세요.');
		$(this).focus();
	}
	else{
	var emailPt = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if((emailPt.test($('#user_email').val()))){
		$('#user_emailResult').html('ㅇㅇ');
	}
	else{
		$('#user_emailResult').html('ㄴㄴ');
		$(this).focus();
	}
	}
	
}); //이멜

//-----------------------------------------------------------------------------------
//프사

	
//------------------------------------------------------------------------------------
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
//	             alert(authNum);
	            
	            $('#auth_btn2').click(function(){
	            	
	            
	            if( $('#user_authNum').val()==authNum){
	                alert("인증완료");
	                $("#lab1").html("인증완료");
	            }else{
	                alert("인증실패");
	                $("#lab1").html("<label>인증실패</label>");
	            }
	            
	        });
	         }
	    
	});
	});
	});
	
	
	//---------------------------------------------------------------------
	
	//회원가입 버튼

	
	$('#joinBtn').on("click",function(){

		$.ajax({
			type:"GET",
			url:"joinUser.do",
			data:{
			"user_id":$('#user_id').val(),
			"user_pass":$('#user_pass').val(),
			"user_name":$('#user_name').val(),
			"user_nickname":$('#user_nickname').val(),
			"user_email":$('#user_email').val(),
			"user_phone":$('#user_phone').val(),
			"user_havePet":$('.user_havePet').val(),
			"user_contentPic":$('#user_contentPic').val()
			},
			datatype:"text",
			success: function(data){
				alert("ddd")
				alert("가입성공");
				window.location.href="loginForm.do";
			},
			error:function(xhrReq, status, error){
				alert(error);
				alert("가입실패");
			}
		})//ajax
	})//joinbtn
	
	
	
	
});//ready
	
	
	
	
	
</script>
</head>
<body>
	<center>
		<h1>
			<b><font color="gray">회원가입</font></b>
		</h1>
		<form id="joinUser">
		*는 필수 입력 칸 입니다.

			<b><font color="gray">${msg }</font></b>
<!-- ------------------------------------------------------------------------------------------------------ -->
			
			<table id="user_table">
				<tr>
					<td>아이디 *</td>
					<td><input type="text" id="user_id" name="user_id">
				<span id='user_idResult'></span>
						<input type="hidden" value="uncheck" id="user_idChecked">
					</td>
				</tr>
				<tr>
					<td>비밀번호 *</td>
					<td><input type="password" id="user_pass" name="user_pass"> <span
						id='user_passResult'></span></td>
				</tr>
				<tr>
					<td>비밀번호 확인 *</td>
					<td><input type="password" id="user_pass2" name="user_pass2">
					<span
						id='user_passResult2'></span>
						<font name="user_pwcheck" size="2" color="red"></font> </td>
						    

				</tr>
				<tr>
					<td>이름 *</td>
					<td><input type="text" id="user_name" name="user_name">
					<span id='user_nameResult'></span></td>
				</tr>
				<tr>
					<td>닉네임 *</td>
					<td><input type="text" id="user_nickname" name="user_nickname">
						<span id='user_nicknameResult'></span><input
						type="hidden" value="uncheck" id="user_nicknameChecked"></td>
				</tr>
				<tr>
					<td>이메일 *</td>
					<td><input type = "text"   name  = "user_email"   id ="user_email">
						<button type="button" id="auth_btn">인증하기</button>
						 <span id = "email"></span><br>
						
						</tr>
						<tr>
						<td>인증번호 *</td>
						<td><input type="text" id="user_authNum" name="user_authNum" >
							<button type="button" id="auth_btn2">확인</button>
							 <span id = "lab1"></span>
						</td>
						
				<tr>
					<td>프사</td>
					<td><input type="text" id="user_contentPic" name="user_contentPic"> <span
						id='user_contentPicResult'></span> <input type="hidden"
						value="uncheck" id="user_contentPicChecked"></td>
				</tr>


				<tr>
					<td>전화번호</td>
					<td><input type="text" id="user_phone" name="user_phone">
					<span id='user_phoneResult'></span>
					</td>
				</tr>
				<tr>
					<td>반려동물 *</td>
				<td><input type="radio" name="user_havePet"
					class="user_havePet" value="1">있음 <input type="radio"
					name="user_havePet" class="user_havePet" value="0">없음</td>
				</tr>
				</table>
				
<!-- ------------------------------------------------------------------------------------------------------ -->
				<table id="petTable" style="display: none">
			<thead>
			<tr>
					<td colspan="5" align="right" class="addPet">반려동물 추가<i
						class="fa fa-plus-square"></i></td>
				</tr>
				<tr>
					<th>이름 *</th>
					<th>종 *</th>
					<th>성별 *</th>
					<th>나이</th>
					<th>사진</th>
					<th></th>
				</tr>
			</thead>
			<tbody id="petTable_tbody">
				<tr>
					<td><input type="text" class="pet_name" name="pet_name"></td>

					<td><select class="pet_species">
							<option value="0">종 선택</option>
							<option value="1">개</option>
							<option value="2">고양이</option>
							<option value="3">토끼</option>
							<option value="4">기타</option>
					</select></td>
					<td><select class="pet_gender">
							<option value="0">성별</option>
							<option value="1">여</option>
							<option value="2">남</option>
							<option value="3">중성화</option>
					</select></td>
					<td><input type="text" class="pet_age"></td>
					<td><input type="file" class="pet_file"></td>
					<td class="removePet"></td>
				</tr>
			</tbody>
		</table>
		
<!-- ------------------------------------------------------------------------------------------------------ -->
				<table>
				<tr>
					<td style="height: 3px"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button id=joinBtn
							style="width: 80px; height: 28px; background-color: #FFE6E6; border: 1 solid white">가입하기</button>
						<input type="reset" value="다시입력"
						style="width: 80px; height: 28px; background-color: #FFE6E6; border: 1 solid white">
						<button onclick="location.href='main.do'"
						style="width: 80px; height: 28px; background-color: #FFE6E6; border: 1 solid white">취소</button>
						
					</td>
				</tr>
			</table>


		</form>
	</center>
</body>
</html>