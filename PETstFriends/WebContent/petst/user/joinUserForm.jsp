<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Rubel Miah">
    <!-- favicon icon -->
    <link rel="shortcut icon" href="./Boots/images/favicon.png">

<title>로그인</title>

	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">    
    <link rel="stylesheet" href="./Boot/css/bootstrap.min.css">
    <link rel="stylesheet" href="./Boot/css/font-awesome.min.css">
    <link rel="stylesheet" href="./Boot/css/animate.min.css">
    <link rel="stylesheet" href="./Boot/css/owl.carousel.css">
    <link rel="stylesheet" href="./Boot/css/owl.theme.css">
    <link rel="stylesheet" href="./Boot/css/slicknav.css">
    <link rel="stylesheet" href="./Boot/style.css">
    <link rel="stylesheet" href="./Boot/css/responsive.css">
    
   
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

	
<script type="text/javascript">
$(document).ready(function() {
	$('#user_id').blur(function() { //id 중복 검사
		
		var userid=$('#user_id').val();
	if($('#user_id').val() == ""){
		$('#user_idResult').html('ID를 입력해주세요.');

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
			}
			},
			error : function(xhrReq, status, error) {
				alert(error)
			}
		});
		}
	});//닉넴
	//-------------------------------------------------------------------

	
	//핸드폰 정규식
	$('#user_phone').blur(function() { //휴대폰 정규식
		var phonePattern = /^\d{3}-\d{3,4}-\d{4}$/;
		if ((phonePattern.test($('#user_phone').val()))) {
			$('#user_phoneResult').html('');	
		
		}
		else{
			$('#user_phoneResult').html('ex) 010-1234-5678 형식으로 입력해주세요.');

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

	}
	else{
		
		var passPt = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		if((passPt.test($('#user_pass').val()))){
			$('#user_passResult').html('사용가능 한 PW입니다');
		}
		else{
			$('#user_passResult').html('다시입력해주세요.');

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

	}
	else{
	var emailPt = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if((emailPt.test($('#user_email').val()))){
		$('#user_emailResult').html('사용가능한 Email입니다.');
	}
	else{
		$('#user_emailResult').html('다시 입력 해 주세요');

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

			$('#joinBtn').click(function() { //회원가입 //가입 조건 전체 확인
			if ($('#user_idResult').html()=='사용가능한 id입니다.' && $('#user_nicknameResult').html()=='사용가능한 닉네임입니다.' && $('.user_havePet').is(':checked')) {
				if ($('input[name="user_havePet"]:checked').val() == 1) {
// 					$('#petTable_tbody tr').each(function() {
						if (!($('.pet_name').val() == '') && !($('.pet_species').val() == 0) && !($('.pet_gender').val() == 0))
							joinFun();
						else
							alert('필수 입력조건을 확인해주세요.1');
// 					})
				}
				else
					joinFun();
			}
			else
				alert('필수 입력조건을 확인해주세요2');
			return false;
		});
	
			var joinFun = function() {
				var petArr = new Array();
				if ($('input[name="user_havePet"]:checked').val() == 1) {
					$('#petTable_tbody tr').each(function() {
						var cellItem = $(this).find(":input");
						var petObj = new Object();
						petObj.pet_name = cellItem.eq(0).val();
						petObj.pet_species = cellItem.eq(1).val();
						petObj.pet_gender = cellItem.eq(2).val();
						petObj.pet_age = cellItem.eq(3).val();
						petArr.push(petObj);
					})
				}
				 var formData = new FormData($("#joinForm")[0]);//여기서부터 밑에 에이작스 다 수정????????????
				$.ajax({
					type : 'post',
					url : 'joinUser.do',
					contentType: false,
					processData: false,
					cache: false,
					data : formData,
					success : function(data) {
						alert('유저성공');
//	 					window.location.href="loginForm.do";
						$.ajax({
							type : 'post',
							url : 'joinUserPet.do',
							data : 
							{
								"jsonData" : JSON.stringify(petArr),
							},
							success : function(data) {
								alert('펫성공');
								window.location.href = "main.do";
							},
							error : function(xhrReq, status, error) {
								alert(error)
					}
				})


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
				})
			}

});//ready
	
$(function() {
	$("#user_proPic").on('change', function() {
		readURL(this);
		 document.getElementById('pre').style.display="none";
	});
});

function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function(e) {
			$('#blah').attr('src', e.target.result);
			 document.getElementById('pre').style.display="inline";
		}
		
	reader.readAsDataURL(input.files[0]);
	}
}


	
</script>


<style type="text/css">
 
   .main-content{ 
 	position:relative; 
 	left:10%;  
 	margin-left:-375px; 
text-align:center;
 } 
/*  .btntable{ */

/*  top:30%;  */
/*   left:43%;  */
/* margin :auto; */

/* } */
.left{

  float: left;
  width: 30%;
}
.right {

  float: right;
  width: 40%;
}
.center{
  float: left;
  width: 30%;
}
th, td{
padding: 5px;
margin: 0px;
}
th{
text-align: center;
}
select{
height: 27px;
width: 150px;
}
</style>
</head>
<body>
<!--        <header id="header"> -->
         <%@ include file="/petst/header.jsp" %>
    <!--header section end-->
	

<center>
		<h1>
			<b><font color="gray">회원가입</font></b>
		</h1>

		*는 필수 입력 칸 입니다.

			<b><font color="gray">${msg }</font></b>
			</center>	
<!-- ------------------------------------------------------------------------------------------------------ -->
<div class="wrapper">
<div class="main-content">
        <div class="container">
            <div class="row">
	<form id="joinForm" enctype="multipart/form-data">	
		<div class = "left">
	
	
			<div class="form-group">
			
			
					<label for="inputid" class="control-label col-xs-3">프사</label>	
				<div class="col-xs-8">
				<div>
				<input type="file" id="user_proPic" name="user_proPic" class="form-control">
				</div>
				<div id="pre" style="display: none;">
				 <img id="blah" src="#" alt="your image" width=" 200px" height="200px"/> 
				 </div>
		</div></div><br><br>
	</div> 
<!-- 	       left끛-->
	
	
	
	
	
	<div class = "center">
				 
				  <div class="form-group">
					 <label for="inputid" class="control-label col-xs-3">이름 *</label>	
					  <div class="col-xs-8">
					<input type="text" id="user_name" name="user_name" class="form-control" >
					
					<span id='user_nameResult'></span>
				</div> </div> <br><br>
		
	
		
			    	  <div class="form-group">
				         <label for="inputid" class="control-label col-xs-3">아이디*</label>	
				      <div class="col-xs-8">
                <input type="text" class="form-control" id="user_id" name="user_id"> 
	                 <span id='user_idResult'></span></div><input type="hidden" value="uncheck" id="user_idChecked">
	  </div><br><br>
	
			
	      	
				<div class="form-group">
				<label for="inputid" class="control-label col-xs-3">닉네임 *</label>	
					<div class="col-xs-8">
					<input type="text" id="user_nickname" name="user_nickname" class="form-control" >
				
						<span id='user_nicknameResult'></span><input
						type="hidden" value="uncheck" id="user_nicknameChecked">
						</div></div><br><br>
				
				
								
		
				
				
				<div class="form-group">
							<label for="inputid" class="control-label col-xs-3">전화번호</label>
				<div class="col-xs-8">
					<input type="text" id="user_phone" name="user_phone" class="form-control">
				
					<span id='user_phoneResult'></span>
					</div></div><br><br>
				
					<div class="form-group">
   
				 	<label for="inputpet" class="control-label col-xs-3">반려동물*</label>
				<div class="col-xs-8">
				 <div class="radio">
				<label><input type="radio" name="user_havePet" class="user_havePet" value="1">있음 </label>
					<label><input type="radio" name="user_havePet" class="user_havePet" value="0">없음</label>
				<br><br><br><br>
				
				 </div>
            </div>
        </div>
					
					
					</div>
<!-- 					center 끝 -->
		
				
				<div class = "right">
				
				
				
				   <div class="form-group">
			 <label for="inputid" class="control-label col-xs-3">비밀번호*</label>	
			<div class="col-xs-8">
					<input type="password" id="user_pass" name="user_pass" class="form-control" > 
				<span id='user_passResult'></span>
			</div> </div><br><br>
			
			
			
		 <div class="form-group">
				<label for="inputid" class="control-label col-xs-3">비밀번호 확인*</label>	
				<div class="col-xs-8">
					<input type="password" id="user_pass2" name="user_pass2"  class="form-control" >
			<span id='user_passResult2'></span><font name="user_pwcheck" size="2" color="red"></font></div>
				</div><br><br>
			
			
			<div class="form-group">
					<label for="inputid" class="control-label col-xs-3">이메일*</label>	
						<div class="col-xs-8">
					<input type = "text"   name  = "user_email"   id ="user_email" class="form-control" ><span id = "user_emailResult"></span></div>
						<div class="col-xs-1">
					<button type="button" id="auth_btn" class="btn btn-warning btn-xs">인증하기</button></div>
				
					
						 </div><br><br>
						 
						
					
		
		 <div class="form-group">
					<label for="inputid" class="control-label col-xs-3">인증번호*</label>	
					<div class="col-xs-8">
						<input type="text" id="user_authNum" name="user_authNum" class="form-control" ><span id = "lab1"></span></div>
							<div class="col-xs-1">
						<button type="button" id="auth_btn2" class="btn btn-warning btn-xs">확인</button></div>
						
						</div><br>
		
		</div>
<!-- 		right끝 -->
				</form>  
<!-- 				form위치 수정함???????? -->
		</div>
<!-- 		row끝 -->
			
			
		<div class="project-details">
<!-- ------------------------------------------------------------------------------------------------------ -->
				
				<table id="petTable" style="display: none;">
			<thead>
			<tr>
					<td colspan="5" align="right" class="addPet">반려동물 추가<i
						class="fa fa-plus-square"></i></td>
				</tr>
				<tr>
					<th width="150px;">이름 *</th>
					<th width="150px;">종 *</th>
					<th width="150px;">성별 *</th>
					<th width="150px;">나이</th>
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
<!-- 					<td><img id="blah" src="#" alt="your image" width=" 100px" height="100px"/></td> -->
					<td class="removePet"></td>
				</tr>
			</tbody>
		</table>
<br>
	</div>	
<!-- 	project-details끝 -->
<!-- ------------------------------------------------------------------------------------------------------ -->
			<center>
		
				<table>
			
				<tr>
					<td >
						<button id=joinBtn
						class="btn btn-warning btn-xs">가입하기</button>
						<input type="reset" value="다시입력"
						class="btn btn-warning btn-xs">
						<button onclick="location.href='main.do'"
						class="btn btn-warning btn-xs">취소</button>
						
					</td>
				</tr>
			
			</table>
		
</center>
</div>
<!-- container -->
</div>
<!-- main-content -->
</div>
<!-- wrapper -->


	<!-- <footer> -->
   <%@ include file="/petst/footer.jsp" %>
    <!--footer end-->


		
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