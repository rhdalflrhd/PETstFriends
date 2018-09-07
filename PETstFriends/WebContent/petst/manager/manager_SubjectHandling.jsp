<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>말머리 추가 삭제</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link rel="stylesheet" href="./Boot/css/bootstrap.min.css">
<link rel="stylesheet" href="./Boot/css/font-awesome.min.css">
<link rel="stylesheet" href="./Boot/css/animate.min.css">
<link rel="stylesheet" href="./Boot/css/owl.carousel.css">
<link rel="stylesheet" href="./Boot/css/owl.theme.css">
<link rel="stylesheet" href="./Boot/css/slicknav.css">
<link rel="stylesheet" href="./Boot/style.css">
<link rel="stylesheet" href="./Boot/css/responsive.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
<!-- common css -->

<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
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
<style type="text/css">

.main-content {
	position: relative;
	left: 22%;
	margin-left: -375px;
	text-align: center;
}

  .bs-example{
    	margin: 20px;
    }
    
/*     .row{ */
    
/*     height:500px; */
/*     width: 500px; */
    
    
/*     } */
</style>

</head>
<body>
	<%@ include file="/petst/header.jsp"%>
<div class="wrapper">
		<!--main content start-->
		<div class="main-content" >
			<div class="container" >
				<div class="row">
<div class="col-md-8 col-sm-8" style = "height: 500px; width: 800px; ">

						<h2 style="text-align: center;">말머리 추가 삭제</h2>

						<div style="border-bottom: 1px solid orange; height: 5px;"></div>
						<div style="height: 20px;"></div>
						<table class="table">
						<tr>
						<td>현재 말머리 목록</td>
						<td id="mals" style="width: 475px;">
						
						<c:forEach items="${malList }" var="mal">
						<span class="mal" >
						<input type="radio" name="radioValue" value="${mal.mal_no }">
						${mal.mal_malname }
						</span>
						
						</c:forEach>
						</td>
						<td><button id="deleteBtn" class="btn btn-warning btn-xs">삭제</button></td>
						</tr>
						<tr>
						<td>추가할 말머리</td>
						<td colspan="2"><input type="text" id="newmal_name" value="추가할 말머리를 입력하세요."
						style="width: 475px; height:38px;"><button id="addBtn" class="btn btn-warning btn-xs">추가</button></td>
						</tr>
						</table><br><br>
						 <div style="border-bottom: 1px solid orange; height: 5px;"></div>
<br><br><br><br>
                    
					
						<div style="height: 20px;"></div>
					</div>


				</div>
			</div>
		</div>
		<!--main content end-->


	</div>
	<%@ include file="/petst/footer.jsp"%>
	<!-- js files -->
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