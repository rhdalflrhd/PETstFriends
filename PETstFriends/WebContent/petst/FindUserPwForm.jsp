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
		$(document).on('click', '#findPwBtn', function() {
			
			var user_id = $('#user_id').val();
			var user_name = $('#user_name').val();
			var user_email = $('#user_email').val();

			var postData = {
				'user_id' : user_id,
				'user_name' : user_name,
				'user_email' : user_email
			};
			
			$.ajax({
				url : 'FindUserPw.do',
				type : 'POST',
				data : postData,

				success : function(data) {
			
					if(data ==false ){
							alert("�������� �ʴ� ȸ���Դϴ�.");
						}else{
					window.location.href="ChangeUserPwForm.do?user_id="+user_id;
					}
				},
				error : function(jqXHR, exception) {
					if (jqXHR.status === 0) {
						alert('Not connect.\n Verify Network.');
					} else if (jqXHR.status == 400) {
						alert('Server understood the request, but request content was invalid. [400]');
					} else if (jqXHR.status == 401) {
						alert('Unauthorized access. [401]');
					} else if (jqXHR.status == 403) {
						alert('Forbidden resource can not be accessed. [403]');
					} else if (jqXHR.status == 404) {
						alert('Requested page not found. [404]');
					} else if (jqXHR.status == 500) {
						alert('Internal server error. [500]');
					} else if (jqXHR.status == 503) {
						alert('Service unavailable. [503]');
					} else if (exception === 'parsererror') {
						alert('Requested JSON parse failed. [Failed]');
					} else if (exception === 'timeout') {
						alert('Time out error. [Timeout]');
					} else if (exception === 'abort') {
						alert('Ajax request aborted. [Aborted]');
					} else {
						alert('Uncaught Error.n' + jqXHR.responseText);
					}
				}
			});


		});
		//-------------------------------------------------------------------------------------
				$(function() {
					var chk = -1;
					$("#auth_btn").click(function() { // �̸��� ���� �ޱ� 
						var authNum = "";

						$.ajax({
							method : 'GET',
							url : "emailAuth.do",
							data : {
								user_email : $('#user_email').val()
							},
							success : function(str) {
								authNum = str;
								alert("������ȣ ���ۿϷ�.");
								//			             alert(authNum);

								$('#auth_btn2').click(function() {


									if ($('#user_authNum').val() == authNum) {
										alert("�����Ϸ�");
										$("#lab1").html("�����Ϸ�");
									} else {
										alert("��������");
										$("#lab1").html("<label>��������</label>");
									}

								});
							}
						});
					});
				});

	}) //����
</script>
</head>
<body>
	<center>
		<h1>
			<b><font color="gray">PWã��</font></b>
		</h1>

		<h2>�̸��� ����</h2>
		ȸ������ �� ����� �̸����ּҿ� �����Ͽ��� <br> ������ȣ�� ���� �� �ֽ��ϴ�. <br>

		<table>
			<tr>
				<td style="height: 3px"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button id=idFindBtn onclick="location.href='FindUserIdForm.do'"
						style="width: 100px; height: 28px; background-color: #FFE6E6; border: 1 solid white">���̵�ã��</button>
					<button id=pwFindBtn onclick="location.href='FindUserPwForm.do'"
						style="width: 100px; height: 28px; background-color: #FFE6E6; border: 1 solid white">��й�ȣã��</button>
				</td>
			</tr>
		</table>

		<table>
			<tr>
				<td>���̵�</td>
				<td><input type="text" id="user_id" name="user_id"> <span
					id='user_idResult'></span> <input type="hidden" value="uncheck"
					id="user_idChecked"></td>
			</tr>
			<tr>
				<td>�̸�</td>
				<td><input type="text" id="user_name" name="user_name">
					<span id='user_idResult'></span> <input type="hidden"
					value="uncheck" id="user_idChecked"></td>
			</tr>

			<tr>
				<td>�̸��� *</td>
				<td><input type="text" name="user_email" id="user_email">
					<button type="button" id="auth_btn">�����ϱ�</button> <span id="email"></span><br>
			</tr>
			<tr>
				<td>������ȣ *</td>
				<td><input type="text" id="user_authNum" name="user_authNum">
					<button type="button" id="auth_btn2">Ȯ��</button> <span id="lab1"></span>
				</td>
			</tr>

		</table>

		<table>
			<tr>
				<td style="height: 3px"></td>
			</tr>
			<tr>
				<td colspan="4" align="center">

					<button id=findPwBtn
						style="width: 80px; height: 28px; background-color: #FFE6E6; border: 1 solid white">Ȯ��</button>
				</td>
			</tr>
		</table>

	</center>
</body>
</html>