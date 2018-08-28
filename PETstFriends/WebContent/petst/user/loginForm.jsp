<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
    <meta name="author" content="Rubel Miah">
    <link rel="shortcut icon" href="./assets/images/favicon.png">
    
<title>로그인</title>

  <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="./assets/css/animate.min.css">
    <link rel="stylesheet" href="./assets/css/owl.carousel.css">
    <link rel="stylesheet" href="./assets/css/owl.theme.css">
    <link rel="stylesheet" href="./assets/css/slicknav.css">
   
    <link rel="stylesheet" href="./assets/css/responsive.css">
    
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

<style type="text/css">

	.login-form {
		width:400px;
    	margin:20px auto;
	}
    .login-form form {
    	margin-bottom: 15px;
        background: #f7f7f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
    .login-form h2 {
        margin: 0 0 15px;
    }
    .login-form .hint-text {
		color: #777;
		padding-bottom: 20px;
		text-align: center;
    }
    .form-control, .btn {
        min-height: 40px;
        border-radius: 2px;
    }
    .login-btn {        
        font-size: 15px;
        font-weight: bold;
    }
    .or-seperator { 
        margin: 20px 0 10px; 
         text-align: center; 
        border-top: 1px solid #ccc; 
     } 
    .or-seperator i { 
        padding: 0 10px; 
         background: #f7f7f7; 
        position: relative; 
         top: -11px; 
        z-index: 1; 
   } 
    .social-btn .btn {
        margin:10px ;
        font-size: 15px;
        text-align: center; 
        line-height: 24px;    
        width: 250px;   
        height: 40px;
             
    }
	.social-btn .btn i {
		float: left;
		margin: 4px 15px  0 5px;
        min-width:20px;
	}
	.input-group-addon .fa{
		font-size: 20px;
	}
</style>
	<script type="text/javascript">
$(document).ready(function() {

	$('#loginBtn').click(function() {

		$.ajax({
			type : "POST",
			url : "login.do",
			data : {
				"user_id" : $('#user_id').val(),
				"user_pass" : $('#user_pass').val()
			},
			success : function(result) {
				if (result == true) {
					alert("로그인성공");
					window.location.href = "main.do";
				} else {
					alert("로그인실패");
				}
			},
			error : function(jqXHR, exception) {
		alert(error)
			}
		}) //ajax



	}) //로그인버튼




}) //레디


</script>
</head>
<body>
    
<div class="login-form">

        <h2 class="text-center">로그인</h2>		
        
               <div class="form-group">
        	<div class="input-group">
                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                <input type="text" class="form-control" name="user_id" id="user_id"  placeholder="Id" required="required">
            </div>
        </div>
		<div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                <input type="password" class="form-control" name="user_pass" id="user_pass" placeholder="Password" required="required">
            </div>
        </div>        
        <div class="form-group">
            <button class="btn btn-success btn-block login-btn" id=loginBtn >로그인</button>
        </div>
        <div class="clearfix">
            <label class="pull-left checkbox-inline"><input type="checkbox"> ID저장</label>
               <div class="hint-text small">
            <a href="FindUserPwForm.do" class="pull-right text-success">비밀번호 찾기</a><a href="#" class="pull-right text-success">│</a> <a href="FindUserIdForm.do" class="pull-right text-success">아이디 찾기</a>
</div>
        </div>  
    
		<div class="or-seperator"><i>or</i></div>
		
		
		 <div class="text-center social-btn"  >
    <div class="hint-text ">아직 회원이 아니신가요?  </div>
    <div style="display: inline-block; ">
    
    <br>

<!--     </div> -->
<!-- <div style="display: inline-block;  width: 30%;"> -->
				<table >
	<tr><td><a href="${url}">
<img src="img/naverid_login_button.png" width="400" height="40" border="0" align="middle">
</a></td>
</tr><tr>
					<td>
					<a href="#" class="btn btn-danger btn-block" style="width:400px; height:40px;">
					<i class="fa fa-google"></i> <b>구글 아이디로 로그인</b></a>
					</td>
					</tr>
        </table>
   
 </div>
 </div>
        


</div>
</div>
<br><br>
<!-- <footer> -->
   <%@ include file="/petst/footer.jsp" %>
    <!--footer end-->


		
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