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
	}); //아디


//-------------------------------------------------------------------

	$('#user_nickname').blur(function() { //닉네임 중복 검사
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
	});//닉넴
	
	

	
	//-----------------------------------------------------------------
	
	//핸드폰 정규식
	$('#user_phone').blur(function() { //휴대폰 정규식
		var phonePattern = /^\d{3}-\d{3,4}-\d{4}$/;
		if ((phonePattern.test($('#user_phone').val()))) {
			$('#user_phoneResult').html('ㅇㅇ');	
		
		}
		else{
			$('#user_phoneResult').html('ㄴㄴ');
			$(this).focus();
		}
	

	});// user_phone
	

	//-----------------------------------------------------------------
	
	$('#user_havePet').click(function() { //반려동물 있음 =>펫테이블 보이게하기
		if ($(this).val() == 1) {
			$('#petTable').css('display', 'inline');
		}
	});
	
	$(document).on('click', '.addPet', function() {//+클릭시 종 입력 줄 한줄 생성
	
		$('#petTable').append('<tr><td><input type="text" class="pet_name"></td>'
				+'<td><select class="pet_species">'
				+'<option value="0">종 선택</option>'
				+'<option value="1">개</option>'
				+'<option value="2">고양이</option>'
				+'<option value="3">토끼</option>'
				+'<option value="4">기타</option>'
				+'</select></td>'
				+'<td><select class="pet_gender">'
				+'<option value="0">성별</option>'
				+'<option value="1">여</option>'
				+'<option value="2">남</option>'
				+'<option value="3">중성화</option>'
				+'</select></td>'
			+ '<td><input type="text" class="pet_age"></td>'
			+ '<td><input type="text" class="pet_file"></td>'
			+ '<td class="removePet"><i class="fa fa-minus-square"></i></td>'
			+ '</tr>')
	})
	
	$(document).on('click', '.removePet', function() {//-클릭시 그 줄 삭제
		var thisR = $(this);
		thisR.parent().remove();
	});
	
	$('#user_havePet').click(function() { //반려동물 없음 =>펫테이블 사라지게하기
		if ($(this).val() == 0) {
			$('#petTable').css('display', 'none');
		}
	});
	//----------------------------------------------------------------	

	//비번정규식
	$('#user_pass').blur(function() {
		var passPt = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

		if((passPt.test($('#user_pass').val()))){
			$('#user_passResult').html('ㅇㅇ');
		}
		else{
			$('#user_passResult').html('ㄴㄴ');
			$(this).focus();
		}

		
	});//pass
	
//-----------------------------------------------------------------------------------

//이멜 정규식
$('#user_email').blur(function() {
	var emailPt = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if((emailPt.test($('#user_email').val()))){
		$('#user_emailResult').html('ㅇㅇ');
	}
	else{
		$('#user_emailResult').html('ㄴㄴ');
		$(this).focus();
	}
	
}); //이멜

//------------------------------------------------------------------------------------



	
	
	
	
	
	
	

});//ready

</script>
</head>
<body>
	<center>
		<h1>
			<b><font color="gray">회원가입</font></b>
		</h1>
		<form action="">

			<b><font color="gray">${msg }</font></b>
<!-- ------------------------------------------------------------------------------------------------------ -->
			
			<table id="user_table">
				<tr>
					<td>아이디</td>
					<td><input type="text" id="user_id">
				<span id='user_idResult'></span>
						<input type="hidden" value="uncheck" id="user_idChecked">
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" id="user_pass">
						<span id='user_passResult'></span>
					</td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" id="user_pass2"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" id="user_name"></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input type="text" id="user_nickname">
						<span id='user_nicknameResult'></span><input
						type="hidden" value="uncheck" id="user_nicknameChecked"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" id="user_email">
						<button id="user_emailMult">중복확인</button> <span
						id='user_emailResult'></span><input type="hidden" value="uncheck"
						id="user_emailChecked"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" id="user_phone">
					<span id='user_phoneResult'></span>
					</td>
				</tr>
				<tr>
					<td>반려동물</td>
					<td><input type="radio" value="1" id="user_havePet" class="user_havePet">있음
						<input type="radio" value="0" id="user_havePet" class="user_havePet">없음</td>
				</tr>
				</table>
				
<!-- ------------------------------------------------------------------------------------------------------ -->
				<table id="petTable" style="display: none">
			<tr>
				<td colspan="6" align="right" class="addPet">반려동물 추가<i
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
			<tr>
				<td><input type="text" class="pet_name"></td>
				
				<td>
				<select class="pet_species">
				<option value="0">종 선택</option>
				<option value="1">개</option>
				<option value="2">고양이</option>
				<option value="3">토끼</option>
				<option value="4">기타</option>
				</select>
				</td>
				<td>
				<select class="pet_gender">
				<option value="0">성별</option>
				<option value="1">여</option>
				<option value="2">남</option>
				<option value="3">중성화</option>
				</select>
				</td>
				<td><input type="text" class="pet_age"></td>
				<td><input type="text" class="pet_file"></td>
				<td class="removePet"></td>
			</tr>
		</table>
		
<!-- ------------------------------------------------------------------------------------------------------ -->
				<table>
				<tr>
					<td style="height: 3px"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button id=joinUserBtn
							style="width: 80px; height: 28px; background-color: #FFE6E6; border: 1 solid white">가입하기</button>
						<input type="reset" value="다시입력"
						style="width: 80px; height: 28px; background-color: #FFE6E6; border: 1 solid white">
						<input type="button" value="뒤로가기"
						onclick="location.href='main.do'"
						style="width: 80px; height: 28px; background-color: #FFE6E6; border: 1 solid white">
					</td>
				</tr>
			</table>


		</form>
	</center>
</body>
</html>