<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.bs-example {
	margin: 20px;
}
</style>
</head>
<body>
	<div class="bs-example">
		<!-- Button HTML (to Trigger Modal) -->
		<a href="writeReportForm.do?report_boardname=2&report_boardno=3&report_userId='dd'"
		 class="btn btn-lg btn-primary"	data-toggle="modal" data-target="#myModal">신고하기1</a>

		<!-- Modal HTML -->
		<div id="myModal" class="modal fade">
			<div class="modal-dialog" style="background: white;">
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
				</div>
				<div class="modal-body">
				<div class="modal-content">
					<!-- Content will be loaded here from "remote.php" file -->
				</div>
				</div>
				
			</div>
		</div>

		
</body>
</html>