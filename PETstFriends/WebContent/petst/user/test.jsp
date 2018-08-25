<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
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
			pwd1ok.innerHTML = "비밀번호는 8자리 이상 문자, 숫자, 특수문자(사용가능한 특수문자: ~!@#$%^&*()_+|<>?:{})"
			pwd1Check.focus();
	 }
	 else pwd1ok.innerHTML = "사용가능합니다.";
});

//ddd
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
	
	
	$('#updatebtn').click(function() { //회원가입 //가입 조건 전체 확인
		if (!($('#user_nickname').val())==''&&!($('#user_email').val())==''&&
				!($('#user_pass').val())==''&&!($("#new_user_pass").val())==''&&!($("#new_user_pass_chk").val())==''
				&&!($("#user_email").val())==''&& $('.user_havePet').is(':checked'))  {
			if ($('.user_havePet :checked').val() == 1) {
				$('#petTable_tbody tr').each(function() {
					if (!($('.pet_name').val() == '') && !($('.pet_species').val() == 0) && !($('.pet_gender').val() == 0))
						insertPet();
					else
						alert('필수 입력조건을 확인해주세요.');
				})
			}
			else
				insertPet();
		}
		else
			alert('필수 입력조건을 확인해주세요!');
		return false;
	});
	var insertPet = function() {
		var petArr = new Array();
		if ($('.user_havePet').val() == 1) {
			$('#petTable_tbody tr').each(function() {
				var cellItem = $(this).find(":input");
				var petObj = new Object();
				petObj.pet_name = cellItem.eq(0).val();
				petObj.pet_species = cellItem.eq(1).val();
				petObj.pet_gender = cellItem.eq(2).val();
				petObj.pet_age = cellItem.eq(3).val();
				petObj.pet_no= cellItem.eq(4).val();
				petObj.pet_file = cellItem.eq(5).val();
				petArr.push(petObj);
			})
		}
		$.ajax({
			type : 'post',
			url : 'insertPet.do',
			data : {
				"jsonData" : JSON.stringify(petArr),
				  "user_id":$("#user_id").val(),
				    "user_nickname":$('#user_nickname').val(),
					"user_pass":$('#new_user_pass').val(),
				     "user_email":$('#user_email').val(),
					"user_phone":$('#user_phone').val(),
					"user_proPic":$('#user_proPict').val(),
					"user_havePet" : $('.user_havePet:checked').val()
			},
			success : function(data) {
				alert('성공');
				window.location.href = "main.jsp";
			},
			error : function(xhrReq, status, error) {
				alert(error)
			}
		})
	}
});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	$('#user_pass').blur(function() { //비밀번호 일치 검사 ----------------------------------
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
	}); //  비밀번호 일치 검사 끝 ------------------------------------------------------------



	$('#user_nickname').blur(function() { //닉네임 중복 검사-------------------------------------
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
		});//닉네임 중복 검사--------------------------------------------------------------------------
	

	
	$('#user_email').blur(function() { //이메일 중복 검사-------------------------------------------------------
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
	});//이메일 중복 검사-------------------------------------------------------
	
	
// });   // 첫번째 스크립트 끝 
</script>
<script type="text/javascript">
$(function () {
	   var chk = -1;


	$("#auth_btn").click(function () {   // 이메일 인증 받기  -------------------------------------------------------------

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
	});  // 이메일 인증 받기 끛 -------------------------------------------------------------


	});

</script>

<script type="text/javascript">

$(document).ready(function (){
	
	$("#updatebtn").click(function (){
		$.ajax({
			type:"POST",
			url:"updateUser.do",
			data:{
				"user_id":$('#user_id').val(),
				"user_nickname":$('#user_nickname').val(),
				"user_pass":$('#user_pass').val(),
				"user_email":$('#user_email').val(),
				"user_phone":$('#user_phone').val(),
				"user_havePet":$('.user_havePet:checked').val(),
			
			},
		//	datatype:"text",
			success: function(data){
			
				alert("수정성공");
				//window.location.href="usermain.do";
			
			
			},
			error : function(xhrReq, status, error){
				alert(error);
				alert("수정실패");
			}
		})//ajax
	});
		

	

// $('.user_havePet').click(function() { //반려동물 있음 =>펫테이블 보이게하기
// 	if ($(this).val() == 1)
// 		$('#petTable').css('display', 'inline');
// });
// $('.user_havePet').click(function() { //반려동물 없음 =>펫테이블 사라지게하기
// 	if ($(this).val() == 0) {
// 		$('#petTable').css('display', 'none');
// 	}
// });
// var clickNum = 1; //10마리까지만 입력 가능하도록 함
// $(document).on('click', '.addPet', function() { //+클릭시 종 입력 줄 한줄 생성
// 	if (clickNum > 9) {
// 		alert('최대 10마리까지 입력 가능합니다.')
// 	} else {
// 		clickNum++;
// 		$('#petTable').append('<tr><td><input type="text" class="pet_name" name="pet_name"></td>'
// 			+ '<td><select class="pet_species">'
// 			+ '<option value="0">종 선택</option>'
// 			+ '<option value="1">개</option>'
// 			+ '<option value="2">고양이</option>'
// 			+ '<option value="3">토끼</option>'
// 			+ '<option value="4">기타</option>'
// 			+ '</select></td>'
// 			+ '<td><select class="pet_gender">'
// 			+ '<option value="0">성별</option>'
// 			+ '<option value="1">여</option>'
// 			+ '<option value="2">남</option>'
// 			+ '<option value="3">중성화</option>'
// 			+ '</select></td>'
// 			+ '<td><input type="text" class="pet_age"></td>'
// 			+ '<td><input type="file" class="pet_file"></td>'
// 			+ '<td class="removePet"><i class="fa fa-minus-square"></i></td>'
// 			+ '</tr>')
// 	}
// })
// $(document).on('click', '.removePet', function() { //-클릭시 그 줄 삭제
// 	var thisR = $(this);
// 	thisR.parent().remove();
// 	if (clickNum > 1) {
// 		clickNum--;
// 	}
// });


});


</script>
<body>
<header id="header">
		<h1> 내 정보 수정</h1>
	
			*는 필수 입력 칸입니다.

			<table id="userTable" boder="" bgcolor="#cdfdee" cellspacing="1">
				
					<tr>
					<td>이름</td>
					<td><input type="text" name="user_name" id="user_name"
						value="${params.user_name} " readonly="readonly"></td>
				</tr>

				<tr>
					<td>아이디</td>
					<td><input type="text" name="user_id" id="user_id"
						value=" ${params.user_id} " readonly="readonly"></td>
				</tr>
				
				<tr>
					<td>닉네임 *</td>
					<td><input type="text" id="user_nickname" name="user_nickname" value="${params.user_nickname} ">
						<span id="idCheck">중복결과 여부</span></td>
				</tr>
				<tr>
					<td>기본비번*</td>
					<td><input type="password" id="user_pass"><span
						id="pass"></span></td>
				</tr>

				<tr>
					<td>새비번*</td>
					<td><input type="password" name="user_pass"
						id="new_user_pass"><span id="pwd1ok "></span></td>
				</tr>

				<tr>
					<td>새비번확인*</td>
					<td><input type="password" id="new_user_pass_chk"><span
						id="pwd2ok"></span></td>
				</tr>
				<tr>
					<td>이메일*</td>
					<td><input type="text" name="user_email" id="user_email"
						value="${params.user_email} "> <span id="email"></span>
						<button type="button" id="auth_btn"
							style="width: 80px; height: 28px; background-color: #FFD000; border: 1 solid white">인증하기</button></td>
				</tr>
				<tr>
					<td>인증번호*</td>
					<td><input type="text" id="user_authNum">
						<div id="lab1"></div></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" id="user_phone"   value="${params.user_phone}"> <span
						id="phoneCheck"></span></td>
				</tr>
					<tr>
					<td>나의점수</td>
					<td><input type="text" name="user_score" id="user_score"
						value="${params.user_score} " readonly="readonly"></td>
				</tr>
			<tr>
					<td>반려동물 *</td>
					<td><input type="radio" name="user_havePet" class="user_havePet" value="1">있음 
					<input type="radio" name="user_havePet" class="user_havePet" value="0">없음</td>
				</tr>
			
	</table>

	
			<br>
			<button id = "updatebtn" style="width: 80px; height: 28px; background-color: #FFD000; border: 1 solid white">수정하기</button>
			<button onclick="location.href='login.do'" style="width: 80px; height: 28px; background-color: #FFD000; border: 1 solid white">탈퇴하기</button>
	

		</header>
	</center>
</body>
</html>