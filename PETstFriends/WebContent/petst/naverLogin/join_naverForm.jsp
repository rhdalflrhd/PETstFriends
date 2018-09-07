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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>네이버 회원가입</title>
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">    
    <link rel="stylesheet" href="./Boot/css/bootstrap.min.css">
    <link rel="stylesheet" href="./Boot/css/font-awesome.min.css">
    <link rel="stylesheet" href="./Boot/css/animate.min.css">
    <link rel="stylesheet" href="./Boot/css/owl.carousel.css">
    <link rel="stylesheet" href="./Boot/css/owl.theme.css">
    <link rel="stylesheet" href="./Boot/css/slicknav.css">
    <link rel="stylesheet" href="./Boot/style.css">
    <link rel="stylesheet" href="./Boot/css/responsive.css">
<style type="text/css">
h, td, tr, input, select, FORM {
	font-family: 고딕;
	font-size: 1em;
	border-radius: 5px;
}
   .main-content{ 
 	position:relative; 
 	left:30%;  
 	margin-left:-375px; 
    text-align:center;
 } 
 
.project-details{

	position:relative; 
 	left:12%;  
 	margin-left:-375px; 
    text-align:center;


}

</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#user_nickname').blur(function() { //닉네임 중복 검사
			if ($(this).val() == "") {
				$('#idCheck').html('중복결과 여부');
			} else {
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
			}
		});
		$('#user_phone').blur(function() { //휴대폰 정규식
			var phonePattern = /^\d{3}-\d{3,4}-\d{4}$/;
			if ($(this).val() == "") {
				$('#phoneCheck').html('');
			} else if (!(phonePattern.test($('#user_phone').val))) {
				$('#phoneCheck').html('잘못된 입력입니다.');
			} else {
				$('#phoneCheck').html('');
			}
		});
		$('.user_havePet').click(function() { //반려동물 있음 =>펫테이블 보이게하기
			if ($(this).val() == 1)
				$('#petTable').css('display', 'inline');
		});
		$('.user_havePet').click(function() { //반려동물 없음 =>펫테이블 사라지게하기
			if ($(this).val() == 0) {
				$('#petTable').css('display', 'none');
			}
		});
		var clickNum = 1; //10마리까지만 입력 가능하도록 함
		$(document).on('click', '.addPet', function() { //+클릭시 종 입력 줄 한줄 생성
			if (clickNum > 9) {
				alert('최대 10마리까지 입력 가능합니다.')
			} else {
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
			if (clickNum > 1) {
				clickNum--;
			}
		});

		$('#joinBtn').click(function() { //회원가입 //가입 조건 전체 확인
		
			alert($("input:radio[name=user_havePet]:checked").val())
			alert('여기')
			if ($('#idCheck').html() == '사용가능한 닉네임입니다.' && $('#phoneCheck').html() == '' && $('.user_havePet').is(':checked')) {
				if ($("input:radio[name=user_havePet]:checked").val() == 1) {
// 					$('#petTable_tbody tr').each(function() {
						if (!($('.pet_name').val() == '') && !($('.pet_species').val() == 0) && !($('.pet_gender').val() == 0))
							joinFun();
						else
							alert('필수 입력조건을 확인해주세요.');
// 					})
				}
				else
					joinFun();
			}
			else
				alert('필수 입력조건을 확인해주세요!');
			return false;
		});
		var joinFun = function() {
			var petArr = new Array();
			if ($('.user_havePet').val() == 1) {
				$('#petTable_tbody tr').each(function() {
					var cellItem = $(this).find(":input");
					var petObj = new Object();
					petObj.pet_name = cellItem.eq(0).val();
					petObj.pet_species = cellItem.eq(1).val();
					petObj.pet_gender = cellItem.eq(2).val();
					petObj.pet_age = cellItem.eq(3).val();
					petObj.pet_file = cellItem.eq(4).val();
					petArr.push(petObj);
				})
			}
			$.ajax({
				type : 'post',
				url : 'joinUserNaver.do',
				data : {
					"jsonData" : JSON.stringify(petArr),
					"user_nickname" : $('#user_nickname').val(),
					"user_phone" : $('#user_phone').val(),
					"user_havePet" : $("input:radio[name=user_havePet]:checked").val()
				},
				success : function(data) {
					alert('성공');
					window.location.href = "main.do";
				},
				error : function(xhrReq, status, error) {
					alert(error)
				}
			})
		}
	});
</script>
</head>
<body>

	
         <%@ include file="/petst/header.jsp" %>
<center>
		<h1>회원가입</h1>

			*는 필수 입력 칸입니다.
			</center>
<div class="wrapper">
<div class="main-content">
        <div class="container">
            <div class="row">
			
			<div class="form-group">
				<label for="inputid" class="control-label col-xs-1">닉네임 *</label>	
					<div class="col-xs-4">
					<input type="text" id="user_nickname" name="user_nickname" class="form-control" >
			         <span id='idCheck'></span></div>
			
			</div>
						<br><br>
				
				<div class="form-group">
				<label for="inputid" class="control-label col-xs-1">전화번호</label>
				<div class="col-xs-4">
				<input type="text" id="user_phone" name="user_phone" class="form-control" placeholder ="'010-1234-5678' 형식으로 입력해주세요.">
				<span id='phoneCheck"'></span>
				</div></div><br><br>
			
					<div class="form-group">
   
				 	<label for="inputpet" class="control-label col-xs-1">반려동물*</label>
				<div class="col-xs-4">
				 <div class="radio">
				<label><input type="radio" name="user_havePet" class="user_havePet" value="1">있음 </label>
					<label><input type="radio" name="user_havePet" class="user_havePet" value="0">없음</label>
				<br><br><br>
				
				 </div>
            
            </div>
  </div>
  
  </div>
  </div>
  </div>
		
		<div class="project-details">
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
			<br>
		    <br>
		    <br>
		    <br>

		
		
		
			<button onclick="location.href='login.do'" 	class="btn btn-warning btn-xs">취소</button>
			<button id="joinBtn" 	class="btn btn-warning btn-xs">가입하기</button>

		



	</div>
</div>
   <%@ include file="/petst/footer.jsp" %>




<script type="text/javascript" src="./Boot/js/modernizr-2.6.2.min.js"></script>
<script type="text/javascript" src="./Boot/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="./Boot/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./Boot/js/smoothscroll.js"></script>
<script type="text/javascript" src="./Boot/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="./Boot/js/imagesloaded.pkgd.js"></script>
<script type="text/javascript" src="./Boot/js/isotope.2.2.2min.js"></script>
<script type="text/javascript" src="./Boot/js/jquery.fitvids.js"></script>
<script type="text/javascript" src="./Boot/js/jquery.stickit.min.js"></script>
<script type="text/javascript" src="./Boot/js/jquery.slicknav.js"></script>
<script type="text/javascript" src="./Boot/js/scripts.js"></script>

</body>
</html>