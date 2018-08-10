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
		$('#user_nickname').blur(function() { //닉네임 중복 검사
			$.ajax({
				type : 'GET',
				url : 'getUserNn.do',
				data : {
					user_nickname : $('#user_nickname').val()
				},
				success : function(data) {
					if (data == true) {
						$('#idCheck').html('사용가능한 닉네임입니다.');
					} else {
						$('#idCheck').html('사용 불가한 닉네임입니다.');
						$(this).focus();
					}
				},
				error : function(xhrReq, status, error) {
					alert(error)
				}
			});
		});

		$('#user_phone').blur(function() { //휴대폰 정규식
			var phonePattern = /^\d{3}-\d{3,4}-\d{4}$/;
			if (!(phonePattern.test($('#user_phone').val))) {
				$('#phoneCheck').html('잘못된 입력입니다.');
			}
		});

		$('.user_havePet').click(function() { //반려동물 있음 =>펫테이블 보이게하기
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

		$('.user_havePet').click(function() { //반려동물 없음 =>펫테이블 사라지게하기
			if ($(this).val() == 0) {
				$('#petTable').css('display', 'none');
			}
		});
		
		$('#joinBtn').click(function(){//회원가입
			var petArr = new Array();
		
			$('.pet_gender').each(function(){
				petArr = {
					pet_name : $('.pet_name'),
					pet_species : $('.pet_species'),
					pet_gender : $('.pet_gender')
				}
			})
		      
			$.ajax({
				type : 'post',
				url : 'joinUser.do',
				data : petArr,
				success : function(data){
					alert(data);
				},
				error : function(xhrReq, status, error) {
					alert(error)
				}
			})
		});

	});
</script>
</head>
<body>
<form name="joinForm" id="joinForm">
		*는 필수 입력 칸입니다.
		<table id="userTable">
			<tr>
				<td>닉네임 *</td>
				<td><input type="text" id="user_nickname"> <span
					id="idCheck">중복결과 여부</span></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" id="user_phone"> <span
					id="phoneCheck"></span></td>
			</tr>
			<tr>
				<td>반려동물 *</td>
				<td>
				
				<input type="radio" name="user_havePet"
					class="user_havePet" value="1">있음 <input type="radio"
					name="user_havePet" class="user_havePet" value="0">없음</td>
			</tr>
		</table>


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
		
		<button onclick="location.href='loginForm.do'">취소</button>
<!-- 		???? -->
		<button id="joinBtn">가입하기</button> 
</form>
</body>
</html>