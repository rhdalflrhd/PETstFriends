<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">

	$(document).ready(function() {

		
		//������Խ�--------------------------------------------------------------------------
		$('#user_pass').blur(function() {
			var userpass=$('#user_pass').val();
		if($('#user_pass').val() == ""){
			$('#user_passResult').html('PW�� �Է����ּ���.');

		}
		else{
			
			var passPt = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			if((passPt.test($('#user_pass').val()))){
				$('#user_passResult').html('��밡�� �� PW�Դϴ�');
			}
			else{
				$('#user_passResult').html('�ٽ��Է����ּ���.');

			}
		}
		});//pass
// 		--------------------------------------------------------------------------------------
		//��� ��ġ ����ġ
		$(function() {
			$('#user_pass').blur(function() {
				$('font[name=user_pwcheck]').text('');
			}); //#user_pass.keyup
			$('#user_pass2').blur(function() {
				if ($('#user_pass').val() != $('#user_pass2').val()) {
					$('font[name=user_pwcheck]').text('');
					$('font[name=user_pwcheck]').html("PW����ġ");
				} else {
					$('font[name=user_pwcheck]').text('');
					$('font[name=user_pwcheck]').html("PW��ġ");
				}
			});
		});
		//------------------------------------------------------------------------------------------------
		$('#change').click( function() {


			
			 $.ajax({
				type : 'post',
				url : 'ChangeUserPw.do',
				data : {
					"user_id":  $("#userIDCheck").text(),
					"user_pass":$('#user_pass').val()
				},
				success : function(data) {
					alert('����');
					alert( $("#userIDCheck").text());
					window.location.href="loginForm.do";
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
			
			});






	}); //����
</script>
</head>
<body>
<center>
<%-- ${msg  } --%>
		<h1>
			<b><font color="gray">PWã��</font></b>
		</h1>

		<h2>���ο� ��й�ȣ�� �����ϼ���!</h2>
		- ��й�ȣ�� 8~20���� �����ҹ���, ����, Ư�����ڸ� �����Ͽ� ��� �� �� �ֽ��ϴ�. <br>
		- Ư�����ڸ� �߰��Ͽ� ��й�ȣ�� ����Ͻø� ��й�ȣ�� �������� ��������. <br>

<!-- 			--------------------------------------------------------------- -->
<br>
<table>
					<tr>
					<td>�� ��й�ȣ</td>
					<td><input type="password" id="user_pass" name="user_pass"> <span
						id='user_passResult'></span></td>
				</tr>
				<tr>
					<td>��й�ȣ Ȯ��</td>
					<td><input type="password" id="user_pass2" name="user_pass2">
					<span
						id='user_passResult2'></span>
				<span	id='userIDCheck'  > ${user_id }</span>
						<font name="user_pwcheck" size="2" color="red"></font> </td>
						    


				</tr>
			</table>

<!-- 			--------------------------------------------------------------- -->
			<table>
			<tr>
				<td style="height: 3px"></td>
			</tr>
			<tr>
				<td colspan="4" align="center">

					<button id="change" 
						style="width: 100px; height: 28px; background-color: #FFE6E6; border: 1 solid white">Ȯ��</button>
				</td>
			</tr>
		
</table>
</center>
</body>
</html>