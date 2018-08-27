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
    <link rel="shortcut icon" href="./assets/images/favicon.png">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>내정보수정</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="./assets/css/animate.min.css">
    <link rel="stylesheet" href="./assets/css/owl.carousel.css">
    <link rel="stylesheet" href="./assets/css/owl.theme.css">
    <link rel="stylesheet" href="./assets/css/slicknav.css">
    <link rel="stylesheet" href="./assets/style.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
    
   
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>


<script type="text/javascript">
$(document).ready(function(){
	
	
	$('#new_user_pass').blur(function() {      // 새 비밀번호 유효검사 -----------------------------------------------------------
		var userpass=$('#new_user_pass').val();
	if($('#new_user_pass').val() == ""){
		$('#pwd1ok').html('PW를 입력해주세요.');
	}
	else{
		
		var passPt = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		if((passPt.test($('#new_user_pass').val()))){
			$('#pwd1ok').html('사용가능 한 PW입니다');
		}
		else{
			$('#pwd1ok').html('비밀번호는 8자리 이상 문자, 숫자, 특수문자(사용가능한 특수문자: ~!@#$%^&*()_+|<>?:{}');
		}
	}
	});
	
	$(function() {
		$('#new_user_pass').blur(function() {
			$('font[name=user_pwcheck]').text('');
		}); //#user_pass.keyup
		$('#new_user_pass_chk').blur(function() {
			if ($('#new_user_pass').val() != $('#new_user_pass_chk').val()) {
				$('font[name=user_pwcheck]').text('');
				$('font[name=user_pwcheck]').html("PW불일치");
			} else {
				$('font[name=user_pwcheck]').text('');
				$('font[name=user_pwcheck]').html("PW일치");
			}
		});
	});
	
	//------------------------------------------------------- 새 비번 ------------------------------------------
	
	
	$('#user_pass').blur(function() { //기존 비밀번호 일치 검사 ----------------------------------
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
			alert("비밀번호를 입력해주세요.")
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
					
					alert("닉네임을 입력해주세요.")
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
					$('#email').html('기존 이메일과 일치합니다.');
					$(this).focus();
				}
			},
			error : function(xhrReq, status, error) {
				alert(error)
				alert("이메일을 입력해주세요")
			}
		});
	});//이메일 중복 검사-------------------------------------------------------
	
	
});   // 첫번째 스크립트 끝 
</script>


<script type="text/javascript">
$(document).ready(function(){
	


	
	var list = function() {   // petlist 보여주기 ------------------------------------------------------------------------------------------------

		$.ajax({
		type: 'get',
	     url : 'petList.do',
		dataType : 'json',
	    success : function(data) {
	  alert(data);
	    	if (data == 0){
	    	$('#petTable').css('display', 'none');	
// 	    	$("#petTable_tbody").empty();	
	    	}
	    	else {
	    		$('#petTable').css('display', 'inline');
	    		$("#petTable_tbody").empty();	
    	      
	    		for(var i in data){
    	    	 
	    			
	    		$('#petTable').append('<tr><td><input type="text"  name = "pet_name" class="form-control" class="pet_name" value = '+data[i].pet_name+'  readonly="readonly"></td>'
	    			
	    		      +'<td><select class="pet_species" id = "pet_species">'
	    				+ '<option value="0">종 선택</option>'
	    				+ '<option value="1">개</option>'
	    				+ '<option value="2">고양이</option>'
	    				+ '<option value="3">토끼</option>'
	    				+ '<option value="4">기타</option>'
	    				+ '</select></td>'
	    				+ '<td><select class="pet_gender" id = "pet_gender">'
	    				+ '<option value="0">성별</option>'
	    				+ '<option value="1">여</option>'
	    				+ '<option value="2">남</option>'
	    				+ '<option value="3">중성화</option>'
	    				+ '</select></td>'
	    				

	    			+ '<td><input type="text" class="pet_age" class="form-control" value = '+data[i].pet_age+'><input type = "hidden" class = "pet_no" value = '+data[i].pet_no+'>'
	    			+'</td>'
	    			+ '<td><input type="file" class="pet_file" class="form-control" value ='+data[i].pet_file+'></td>'
	    			+'<td><button class = "deletePet" class="btn btn-warning btn-xs" value = '+data[i].pet_name+' >삭제</button></td>'
	    			+ '<td class="removePet"></td>'
	    			+ '</tr>');
	    	}	}
					},
					error : function(xhrReq, status, error) {
					
						 alert("값이 안옴 ");
					}
				})
			};
			list(); 	
			
			// petlist 보여주기 ------------------------------------------------------------------------------------------------

			$(document).on('click', '.deletePet', function() { //-클릭시 펫 삭제   
				var pet_name = $(this).val();
			  var thisbtn = $(this);	
			
				$.ajax({
					method : 'post',
					url : 'deletePet.do',
					data : {
					  pet_name : pet_name
				  
					},
					success : function(data) {
					thisbtn.parent().parent().remove();
						alert('삭제성공');

					},
					error : function(xhrReq, status, error) {
						alert(error)
					}
				});
			});
			
			
			
});
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
});  // 이메일 인증 받기 끛 -------------------------------------------------------------
});
</script>

<script type="text/javascript">
$(document).ready(function (){
	
	
	$('#updatebtn').click(function() { //회원수정, 펫 수정, 펫 추가 
		if ($('#pass').html()=='비밀번호가 일치합니다.'&&$('font[name=user_pwcheck]').html()=='PW일치'&&$('.user_havePet').is(':checked'))  {

			if ($('input[name="user_havePet"]:checked').val()== 1) {

					if (!($('.pet_name').val()=='') &&!($('.pet_species').val() == 0) && !($('.pet_gender').val() == 0))
						insertPet();
					else
						alert('pet 필수 입력조건을 확인해주세요.');
		}
		
			else 
				insertPet();
		}
		else
			alert(' user 필수 입력조건을 확인해주세요!');
		return false;
	}); // updatebtn 끝 
	var insertPet = function() {
		var petArr = new Array();

			$('#petTable_tbody tr').each(function() {
				if ($('input[name="user_havePet"]:checked').val()== 1) {
				var cellItem = $(this).find(":input");
				var petObj = new Object();
				petObj.pet_name = cellItem.eq(0).val();
				petObj.pet_species = cellItem.eq(1).val();
				petObj.pet_gender = cellItem.eq(2).val();
				petObj.pet_age = cellItem.eq(3).val();
				petObj.pet_no= cellItem.eq(4).val();
				petObj.pet_file = cellItem.eq(5).val();
				petArr.push(petObj);  
				}else{
					
				}
			})
// 		}
		
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
					"user_havePet" :$('input[name="user_havePet"]:checked').val()
					
			},


			success : function(data) {
				alert('성공');
				//window.location.href = "main.jsp";
			},
			error : function(xhrReq, status, error) {
				alert(error)
			}
		})
	}

	


	
				
	
		
			

	
	

	

	
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
		$('#petTable').append('<tr><td><input type="text" class="pet_name" name = "pet_name"  class="form-control"></td>'
			+ '<td><select class="pet_species" id = "pet_species">'
			+ '<option value="0">종 선택</option>'
			+ '<option value="1">개</option>'
			+ '<option value="2">고양이</option>'
			+ '<option value="3">토끼</option>'
			+ '<option value="4">기타</option>'
			+ '</select></td>'
			+ '<td><select class="pet_gender" id = "pet_gender">'
			+ '<option value="0">성별</option>'
			+ '<option value="1">여</option>'
			+ '<option value="2">남</option>'
			+ '<option value="3">중성화</option>'
			+ '</select></td>'
			+ '<td><input type="text" class="pet_age"><input type="hidden" class="pet_no"  value ="0" class="form-control"></td>' 
			+ '<td><input type="file" class="pet_file" class="form-control"></td>'
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








	
});




</script>
<style type="text/css">
    .bs-example{
    	margin: 10px;
    	
    }
	/* Fix alignment issue of label on extra small devices in Bootstrap 3.2 */
   .control-label{
        padding-top: 5px;
    }
/*     .row{ */
/*    border : solid; */
/*    border-color : light-grey; */
/*     } */
 
</style>

</head>
<body>
<div class="wrapper">
 
<!--        <header id="header"> -->
         <%@ include file="/petst/header.jsp" %>
    <!--header section end-->

<div class="bs-example">
	<ul class="nav nav-tabs navbar-right" >
        <li class="active"><a href="getUserId.do">내정보수정</a></li>
        <li><a href="myWritesList.do">내가쓴게시글</a></li>
        <li><a href="myinquiry.do">내가문의한글</a></li>
         <li><a href="myLikesList.do">내가좋아요한글</a></li>
          <li><a href="myMeetingApply.do">내가참여한모임</a></li>
	</ul>
</div>
<div class="main-content">
        <div class="container">
            <div class="row">


                    <article class="post">
                        <header class="entry-header text-center">
                          <h4>내 정보 수정</h4>
<h5>*는 필수 입력 칸입니다.</h5>

                        </header>
		
     <center>
              	<table>
	          
	                	<div class="bs-example">
	                	
	                	  <div class="form-group">
		
					<label for="inputid" class="control-label col-xs-2">이름</label>
					 <div class="col-xs-4">
					<input type="text" name="user_name" id="user_name"
						value="${params.user_name} " readonly="readonly" class="form-control" >
				      </div>
				      </div>

				 <div class="form-group">
				<label for="inputid" class="control-label col-xs-2">아이디</label>	
				 <div class="col-xs-4">
					<input type="text" name="user_id" id="user_id"
						value=" ${params.user_id} " readonly="readonly" class="form-control">
			
</div>
</div>


				<div class="form-group">
				 <label for="inputnickname" class="control-label col-xs-2">닉네임*</label>	
				  <div class="col-xs-4">
					<input type="text" name="user_nickname" id="user_nickname"
						value="${params.user_nickname} " class="form-control"> <span id="nickname"></span>
			  </div>
        </div>

				<div class="form-group">
					<label for="inputpass" class="control-label col-xs-2">기본비번*</label>
					 <div class="col-xs-4">
					<input type="password" id="user_pass" class="form-control"><span
						id="pass"></span>
				</div></div>

				<div class="form-group">
						<label for="inputnewpass" class="control-label col-xs-2">새비번*</label>
					<div class="col-xs-4">
					<input type="password" name="user_pass"
						id="new_user_pass" class="form-control"><span id="pwd1ok"></span>
				</div></div>

				<div class="form-group">
					<label for="inputpassch" class="control-label col-xs-2">새비번확인*</label>
						<div class="col-xs-4">
					<input type="password" id="new_user_pass_chk" class="form-control"><span
						id="pwd2ok"></span>
						<font name ="user_pwcheck" size ="2'" color = "red"></font>
				</div></div>

			<div class="form-group">
					<label for="inputemail" class="control-label col-xs-2">이메일*</label>
					<div class="col-xs-4">
					<input type="text" name="user_email" id="user_email"
						value="${params.user_email} " class="form-control"> <span id="email"></span>
						<button type="button" class="btn btn-warning btn-xs">인증하기</button>
						
				</div></div>
			
			<div class="form-group">
						<label for="inputnum" class="control-label col-xs-2">인증번호*</label>
						<div class="col-xs-4">
					<input type="text" id="user_authNum" class="form-control">
						<div id="lab1"></div>
			</div></div>

			<div class="form-group">
						<label for="inputphone" class="control-label col-xs-2">전화번호</label>
					<div class="col-xs-4">
					<input type="text" name="user_phone" id="user_phone"
						value="${params.user_phone} " class="form-control"><br>
				</div></div>

<!-- 				<tr> -->
<!-- 					<td>프로필사진</td> -->
<!-- 					<td><input type="text" name="user_proPic" id="user_proPic" -->
<%-- 						value="${params.user_proPic} "></td> --%>
<!-- 				</tr> -->


				<div class="form-group">
						<label for="inputphone" class="control-label col-xs-2">나의점수</label>
						<div class="col-xs-4">
					<input type="text" name="user_score" id="user_score"
						value="${params.user_score} " readonly="readonly" class="form-control">
			</div></div>

<div class="form-group">
   
				 	<label for="inputpet" class="control-label col-xs-2">반려동물 *</label>
				<div class="col-xs-4">
				 <div class="radio">
				<label><input type="radio" name="user_havePet" class="user_havePet" value="1">있음 </label>
					<label><input type="radio" name="user_havePet" class="user_havePet" value="0">없음</label>
				
				
				 </div>
            </div>
        </div>
		
</div>
		</table>
		</center>

</article>
</div>
		<br>



<!--  <div class="col-md-5 col-sm-5" > -->
                    <div class="primary-sidebar">
                        <aside class="project-widget">
<div class="project-details">
	<center>
			
		
<table id="petTable" style="display: none">
				<thead>
					<tr>
						<td colspan="5" align="right" class="addPet">반려동물 추가<i
							class="fa fa-plus-square"></i></td>
					</tr>
					<tr id = "pet_exist">
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
						<td><input type="text" class="pet_name"  name = "pet_name" class="form-control"></td>
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
						<td><input type="text" class="pet_age"><input type="hidden" class="pet_no"  value ="0" class="form-control"></td>
						<td><input type="file" class="pet_file" class="form-control"></td>
						<td class="removePet"><i class="fa fa-minus-square"></i></td><br>
				
				
					</tr>
				</tbody>
					
			</table>
			</center>
			
			<center>
				<td colspan="2" align="center">
						<button id = "updatebtn" class="btn btn-warning btn-xs">수정하기</button>
     


						<input type="button" value="탈퇴하기"
						onclick="location.href='deleteUserForm.do'"
						class="btn btn-warning btn-xs">

					</td>
			</center>
  </aside>
  </div>
  </div>
  </div>

    
<!-- <footer> -->
   <%@ include file="/petst/footer.jsp" %>
    <!--footer end-->

</div>
		
	<script type="text/javascript" src="./assets/js/modernizr-2.6.2.min.js"></script>
<script type="text/javascript" src="./assets/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="./assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./assets/js/smoothscroll.js"></script>
<script type="text/javascript" src="./assets/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="./assets/js/imagesloaded.pkgd.js"></script>
<script type="text/javascript" src="./assets/js/isotope.2.2.2min.js"></script>
<script type="text/javascript" src="./assets/js/jquery.fitvids.js"></script>
<script type="text/javascript" src="./assets/js/jquery.stickit.min.js"></script>
<script type="text/javascript" src="./assets/js/jquery.slicknav.js"></script>
<script type="text/javascript" src="./assets/js/scripts.js"></script>
</body>
</html>