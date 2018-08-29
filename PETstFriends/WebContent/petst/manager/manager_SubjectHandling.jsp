<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- common css -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/animate.min.css">
<link rel="stylesheet" href="assets/css/owl.carousel.css">
<link rel="stylesheet" href="assets/css/owl.theme.css">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="assets/css/responsive.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

<script type="text/javascript">
$(document).ready(function() {
$('#deleteBtn').click(function(){
	var result = confirm('삭제하시겠습니까?');
	if(result){
		$.ajax({
			type : 'GET',
			url : 'deleteMal.do',
			data : {
				mal_no : $(':radio[name="radioValue"]:checked').val()
			},
			success : function(data) {
				if (data == 1) {
					$(':radio[name="radioValue"]:checked').parent().remove();
				} else {
					
				}
			},
			error : function(xhrReq, status, error) {
				alert(error)
			}
		});
	}
	else{
	}
}) 
$('#addBtn').click(function(){
	$.ajax({
		type : 'GET',
		url : 'addMal.do',
		data : {
			mal_malname : $('#newmal_name').val()
		},
		success : function(data) {
			alert(data);
			var malStr = '<span class="mal"><input type="radio" name="radioValue" value="';
			malStr += data+'">'+$('#newmal_name').val();
			malStr +='</span>';
			alert(malStr);
			$('#mals').append(malStr);
		},
		error : function(xhrReq, status, error) {
			alert(error)
		}
	})
})
$('#newmal_name').click(function(){
	if($(this).val()=='추가할 말머리를 입력하세요.')
		$(this).val('');
}).blur(function(){
	if($(this).val()=='')
		$(this).val('추가할 말머리를 입력하세요.')
})
});
</script>
</head>
<body>
	<%@ include file="/petst/header.jsp"%>
	<div class="wrapper">
		<!--main content start-->
		<div class="main-content" style="border-bottom: 1px solid gray;">
			<div class="container"
				style="background: white; border-left: 1px solid gray; border-top: 1px solid gray;">
				<div class="row">

					<div style="width: 20%; display: inline-block; float: left;">
						<div>
							<div>
								<h4>고객센터</h4>
								<div class="sub">공지사항</div>
								<div class="sub">자주하는 질문</div>
								<div class="sub">1:1문의</div>
							</div>
						</div>
					</div>

					<div class="col-md-8 col-sm-8"
						style="border-left: 1px solid gray; width: 80%; display: inline-block;">

						<h2 style="text-align: center;">말머리 추가 삭제</h2>

						<div style="border-bottom: 1px solid red; height: 5px;"></div>
						<div style="height: 20px;"></div>
						<table class="table">
						<tr>
						<td>현재 말머리 목록</td>
						<td id="mals">
						<c:forEach items="${malList }" var="mal">
						<span class="mal">
						<input type="radio" name="radioValue" value="${mal.mal_no }">
						${mal.mal_malname }
						</span>
						</c:forEach>
						</td>
						<td><button id="deleteBtn">삭제</button></td>
						</tr>
						<tr>
						<td>추가할 말머리</td>
						<td colspan="2"><input type="text" id="newmal_name" value="추가할 말머리를 입력하세요."
						style="width: 500px;"><button id="addBtn">추가</button></td>
						</tr>
						</table>


						
						<div style="height: 20px;"></div>
					</div>


				</div>
			</div>
		</div>
		<!--main content end-->


	</div>
<%@ include file="/petst/footer.jsp"%>
</body>
</html>