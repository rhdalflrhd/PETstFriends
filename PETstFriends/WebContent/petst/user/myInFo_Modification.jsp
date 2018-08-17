<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Rubel Miah">
    <!-- favicon icon -->
    <link rel="shortcut icon" href="assets/images/favicon.png">

<title>내정보수정</title>

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.css">
    <link rel="stylesheet" href="assets/css/owl.theme.css">
    <link rel="stylesheet" href="assets/css/slicknav.css">
<!--     <link rel="stylesheet" href="style.css"> -->
    <link rel="stylesheet" href="assets/css/responsive.css">
    
   
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
	
	
});   // 첫번째 스크립트 끝 

</script>


<script type="text/javascript">

$(document).ready(function(){
// var list = function() {   // petlist 보여주기 ------------------------------------------------------------------------------------------------
// 	$.ajax({
// 		type: 'get',
// 	     url : 'petList.do',
// 		dataType : 'json',
// 	    success : function(data) {

// 	     for(var i in data){

// 	    		$('#petTable').append('<tr><td><input type="text" class="pet_name" name="pet_name" value = '+data[i]pet_name+'></td>'
// 	    				+ '<td><select class="pet_species">'
// 	    				+ '<option value="0">종 선택</option>'
// 	    				+ '<option value="1">개</option>'
// 	    				+ '<option value="2">고양이</option>'
// 	    				+ '<option value="3">토끼</option>'
// 	    				+ '<option value="4">기타</option>'
// 	    				+ '</select></td>'
// 	    				+ '<td><select class="pet_gender">'
// 	    				+ '<option value="0">성별</option>'
// 	    				+ '<option value="1">여</option>'
// 	    				+ '<option value="2">남</option>'
// 	    				+ '<option value="3">중성화</option>'
// 	    				+ '</select></td>'
// 	    				+ '<td><input type="text" class="pet_age" value = '+data[i].pet_age+'></td>'
// 	    				+ '<td><input type="file" class="pet_file" value ='data[i].pet_file'></td>'
// 	    				+ '<td class="removePet"><i class="fa fa-minus-square"></i></td>'
// 	    				+ '</tr>');
// 						}
// 					},
// 					error : function(xhrReq, status, error) {
// 						alert(error)
// 						 alert("값이 안옴 ");
// 					}
// 				})
// 			};
// 			list();          // petlist 보여주기 ------------------------------------------------------------------------------------------------




//	 		$('#inserPet').click(function(){    // 펫 추가하기 
//	 			if($('#pet_name').val()=='' || $('#pet_species').val()=='' || $('#pet_gender').val()==''
//	 				||$('#pet_age').val()=='' || $('#pet_file').val()==''){
//	 				alert('빈칸없이 적어주세요.');
//	 			}
//	 			else if($('#isDupli').html()=='사용가능'){
//	 			$.ajax({
//	 				method : 'POST',
//	 				url : 'insertPet.do',
//	 				data : 
//	 				{pet_name: $('#pet_name').val(), 
//	 				pet_species: $('#pet_species').val(), 
//	 				pet_gender: $('#pet_gender').val(),	
//	 				pet_age: $('#pet_age').val(),	
//	 				pet_file: $('#pet_file').val()},
//	 				dataType : 'json',
//	 				success : function(data) {
//	 					if(data.result==true){
//	 						$('#pet_table > tbody:last').append(('<tr><td>'+data[i].pet_name+'</td><td>'+data[i].pet_species+'</td><td>'+data[i].pet_age+'</td><td>'
//	 			+data[i].pet_file+'</td><td>'+'</td><td><button class="updatePet" style="width: 80px; height: 28px; background-color: #FFE6E6; border: 1 solid white" value=' + data[i].user_id
//	 			+'>수정</button>'+'</td><td><button class="deletePet"  style="width: 80px; height: 28px; background-color: #FFE6E6; border: 1 solid white" value=' + data[i].user_id
//	 			+'>삭제</button></td></tr>');
//	 						$('.joinEl').val(''); 
//	 					}
//	 					else{
//	 						alert(' 실패');
							
//	 					}
//	 				},
//	 				error : function(xhrReq, status, error) {
//	 					alert(error)
//	 				}
//	 			})
//	 			}
//	 			else{
//	 				alert('실패');
//	 				$('.joinEl').val(''); 
//	 			}
//	 		}); // 펫 추가 끝 
			
			
			
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
	
	$("#updatebtn").click(function (){
		$.ajax({
			method:"GET",
			url:"updateUser.do",
			data:{
			user_id:$("#user_id").val(),
		   user_nickname:$('#user_nickname').val(),
			user_pass:$('#new_user_pass').val(),
		     user_email:$('#user_email').val(),
			user_phone:$('#user_phone').val(),
			user_proPic:$('#user_proPict').val(),
			user_havePet:$('.user_havePet').val()
			},
			// datatype:"text",
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


});
</script>


</head>
<body>
<div class="wrapper">
 
       <header id="header">
        <div class="main-logo text-center">
            <h1><a href="#"><img src="./assets/images/petstlogo_2.PNG" alt="Ocean"></a></h1>
        </div>
        <div id="demo2">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="main-menu text-uppercase">
                            <ul id="menu">
                                <li><a href="index.html">메인</a></li>
                                <li class="menu-item-has-children"><a href="#">펫프모여라<i
                                        class="fa fa-angle-down"></i></a>
                                    <ul class="sub-menu">
                                        <li><a href="#">STANDARD POST</a></li>
                                        <li><a href="#">GALLERY POST</a></li>
                                        <li><a href="#"> VIDEO POST</a></li>
                                        <li><a href="#">AUDIO POST</a></li>
                                        <li><a href="#">TYPOGRAPHY</a></li>
                                        <li><a href="404.html">404 Page</a></li>

                                    </ul>
                                </li>
                                 <li class="menu-item-has-children"><a href="">펫프광장 <i
                                        class="fa fa-angle-down"></i></a>
                                    <ul class="sub-menu">
                                        <li><a href="#">강아지 광장</a></li>
                                        <li><a href="#">고양이 광장</a></li>
                                        <li><a href="#">토끼 광장</a></li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children"><a href="">펫프정보 <i
                                        class="fa fa-angle-down"></i></a>
                                    <ul class="sub-menu">
                                        <li class="menu-item-has-children"><a href="">강아지<i
                                                class="fa fa-angle-right"></i></a>
                                            <ul class="sub-menu">
                                                <li><a href="dogInfoSquareSpecies.do">강아지 종정보</a></li>
                                                <li><a href="#">강아지 Tip</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children"><a href="">고양이<i
                                                class="fa fa-angle-right"></i></a>
                                            <ul class="sub-menu">
                                                <li><a href="CatInfoSquareSpecies.do">고양이 종정보</a></li>
                                                <li><a href="#">고양이 Tip</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children"><a href="">토끼<i
                                                class="fa fa-angle-right"></i></a>
                                            <ul class="sub-menu">
                                                <li><a href="RabbitInfoSquareSpecies.do">토끼 종정보</a></li>
                                                <li><a href="#">토끼 Tip</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="#">병원</a></li>
                                <li><a href="#">플레이스</a></li>
                                <li><a href="#">펫프쇼핑비교</a></li>
                                <li class="menu-item-has-children"><a href="#">templates <i
                                        class="fa fa-angle-down"></i></a>
                                    <ul class="sub-menu">
                                        <li><a href="testimonial.html">Testimonial</a></li>
                                        <li><a href="coming-soon.html">Coming Soon</a></li>
                                        <li><a href="about-us-1.html">About Us 1</a></li>
                                        <li><a href="about-us-2.html">About Us 2</a></li>
                                        <li><a href="about-me.html">About Me</a></li>
                                        <li><a href="portfolio.html">Portfolio</a></li>
                                        <li><a href="single-protfolio.html">Single Portfolio</a></li>
                                        <li><a href="service.html">Service</a></li>
                                        <li><a href="blog.html"> single Blog</a></li>
                                        <li><a href="404.html">404 Page</a></li>

                                    </ul>
                                </li>
                                <li><a href="./Boot/contact.html">contact</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!--header section end-->


<div class="main-content">
        <div class="container">
            <div class="row">
                <div class="col-md-5 col-sm-5">

                    <article class="post">
                        <header class="entry-header text-center">
                            <h3 class="entry-title text-uppercase">내정보수정</h3>


                        </header>
		
     <center>
              	<table>
	            
	                	<div class="entry-content">
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
					<td>닉네임*</td>
					<td><input type="text" name="user_nickname" id="user_nickname"
						value="${params.user_nickname} "> <span id="nickname"></span></td>
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
					<td>전화번호</td>
					<td><input type="text" name="user_phone" id="user_phone"
						value="${params.user_phone} "><br></td>
				</tr>

<!-- 				<tr> -->
<!-- 					<td>프로필사진</td> -->
<!-- 					<td><input type="text" name="user_proPic" id="user_proPic" -->
<%-- 						value="${params.user_proPic} "></td> --%>
<!-- 				</tr> -->


				<tr>
					<td>나의점수</td>
					<td><input type="text" name="user_score" id="user_score"
						value="${params.user_score} " readonly="readonly"></td>
				</tr>

<tr>
					<td>반려동물 *</td>
					<td><input type="radio" name="user_havePet"
						class="user_havePet" value="1">있음 <input type="radio"
						name="user_havePet" class="user_havePet" value="0">없음</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button id = "updatebtn" style="width: 80px; height: 28px; background-color: #FFD000; border: 1 solid white">수정하기</button>



						<input type="button" value="탈퇴하기"
						onclick="location.href='deleteUserForm.do'"
						style="width: 80px; height: 28px; background-color: #FFD000; border: 1 solid white">


					</td>
<h5>*는 필수 입력 칸입니다.</h5>
				</tr>

		
	
		
		</table>
		</center>

</article>
</div>
		<br>

<div class="mypage_hd">
					
						<div class="mypage_nav_wrap">
					
					<table><tr>
								<td><a href="./mypage_01.sub.php">나의 정보 수정</a></td>
						        <td><a href="./mypage_02.sub.php"> 내가작성한문의</a></td>
								<td><a href="./mypage_04.sub.php">내가작성한게시글</a></td>
								<td><a href="./mypage_05.sub.php">내가 좋아요 한 글</a></td>
							<td>	<a href="./mypage_06.sub.php">내가 참여한 모임</a></td>
								</tr></table>
						
							<div class="clear"></div>
						</div>
						<div class="clear"></div>
					</div>

 <div class="col-md-5 col-sm-5" >
                    <div class="primary-sidebar">
                        <aside class="project-widget">
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
  </aside>
  </div>
  </div>
  </div>

    <footer id="footer">

        <div class="footer-widget-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <aside class="footer-widget">
                            <div class="about-me-img"><img src="./assets/images/footer-logo.png" alt="ocean"></div>
                            <div class="about-me-content">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed
                                diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed
                                voluptua. At vero eos et accusam et justo duo dlores et ea rebum magna text ar koto din.
                            </div>
                            <div class="about-me-social">
                                <a href=""><i class="fa fa-facebook"></i></a>
                                <a href=""><i class="fa fa-twitter"></i></a>
                                <a href=""><i class="fa fa-google-plus"></i></a>
                                <a href=""><i class="fa fa-instagram"></i></a>
                                <a href=""><i class="fa fa-pinterest-p"></i></a>
                                <a href=""><i class="fa fa-linkedin"></i></a>
                            </div>
                        </aside>
                    </div>
                    <div class="col-md-4">
                        <aside class="footer-widget">
                            <h3 class="widget-title text-uppercase">Recent Posts</h3>

                            <div class="thumb-latest-posts">

                                <div class="media">
                                    <div class="media-body">
                                        <h4><a href="">A Responsive WordPress Theme for you</a></h4>

                                        <div class="entry-meta small">November 25, 2015</div>
                                    </div>
                                </div>

                                <div class="media">
                                    <div class="media-body">
                                        <h4><a href="">A Responsive WordPress Theme for you</a></h4>

                                        <div class="entry-meta small">November 25, 2015</div>
                                    </div>
                                </div>

                                <div class="media">
                                    <div class="media-body">
                                        <h4><a href="">A Responsive WordPress Theme for you</a></h4>

                                        <div class="entry-meta small">November 25, 2015</div>
                                    </div>
                                </div>

                            </div>
                        </aside>
                    </div>
                    <div class="col-md-4">
                        <aside class="footer-widget">
                            <h3 class="widget-title text-uppercase">Tag Clouds</h3>

                            <div class="tagcloud">
                                <a href="">Lifestyle</a>
                                <a href="">Food</a>
                                <a href="">Travel</a>
                                <a href="">Business</a>
                                <a href="">Story</a>
                                <a href="">Drinks</a>
                                <a href="">DIY</a>
                                <a href="">Tips</a>
                                <a href="">Theme</a>
                                <a href="">Plugin</a>
                                <a href="">WordPres</a>
                                <a href="">HTML</a>
                                <a href="">Bootstrap</a>
                            </div>
                        </aside>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer-copy-right">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        &copy; 2015 <a href="">Ocean</a>, Designed by <a href="">ShapedTheme</a> & Powered by <a
                            href="">WordPress</a>
                    </div>
                    <div class="col-md-6">
                        <a href="" class="back-to-top">Back to Top</a>
                    </div>
                </div>
            </div>
        </div>
    </footer>
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