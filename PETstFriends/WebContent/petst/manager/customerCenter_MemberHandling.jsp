<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<link rel="stylesheet" href="./Boot/css/bootstrap.min.css">
<link rel="stylesheet" href="./Boot/css/font-awesome.min.css">
<link rel="stylesheet" href="./Boot/css/animate.min.css">
<link rel="stylesheet" href="./Boot/css/owl.carousel.css">
<link rel="stylesheet" href="./Boot/css/owl.theme.css">
<link rel="stylesheet" href="./Boot/css/slicknav.css">
<link rel="stylesheet" href="./Boot/style.css">
<link rel="stylesheet" href="./Boot/css/responsive.css">
<title>회원관리 페이지</title>
<style type="text/css">
button {
	margin: 5px 5px 6px;
	text-decoration: none;
	border: 0;
	background-color: #dcdcdc;
	position: relative;
	height: 27px; padding : 0.438em 0.625em 0.438em 0.625em;
	line-height: 1.125em;
	cursor: pointer;
	color: white;
	padding: 0.438em 0.625em 0.438em 0.625em;
}
.close1{
	margin: 5px 5px 6px;
	text-decoration: none;
	border: 0;
	background-color: #dcdcdc;
	position: relative;
	height: 40px;
	padding : 0.438em 0.625em 0.438em 0.625em;
	line-height: 1.125em;
	cursor: pointer;
	color: white;
	padding: 0.438em 0.625em 0.438em 0.625em;
}
#mask {
	position: absolute;
	z-index: 9000;
	background-color: #000;
	display: none;
	left: 0;
	top: 0;
}

.window {
	display: none;
	position: absolute;
	left: 50%;
	top: 200px;
	margin-left: -300px;
	width: 600px;
	height: 370px;
	background-color: #FFF;
	z-index: 10000;
}

</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#searchBtn').click(function(){
			$('#showFrm').submit();
		})
		
		$(document).on('click', '.stopBtn', function(){
			alert('스탑')
			var tr = $(this).parent().parent();
			var user_no = $(this).val();
			stopFun(user_no, 10, tr);
		})
		
		$(document).on('click', '.cancelBtn', function(){
			var tr = $(this).parent().parent();
			var user_no = $(this).val();
			stopFun(user_no, 1, tr);
		})
		var stopFun = function(user_no, stopdate, tr){
			$.ajax({
				type : 'GET',
				url : 'stopUser.do',
				data : {
					"user_no" : user_no,
					"stopdate" : stopdate
				},
				success : function(data) {
					if(stopdate==10){//정지시킴
					tr.find("td").eq(3).html('영구정지됨');
					tr.find("td").eq(4).empty();
					tr.find("td").eq(4).append('<button class="cancelBtn" value="'+user_no+
						'">정지 취소</button>');
					}else{
						tr.find("td").eq(3).html('활동중');
						tr.find("td").eq(4).empty();
						tr.find("td").eq(4).append('<button class="stopBtn" value="'+user_no+
						'">영구 정지</button>');
					}
					},
				error : function(xhrReq, status, error) {
					alert(error)
				}
			});
		}
		
		var wrapWindowByMask = function(user_id){	
		    //화면의 높이와 너비를 구한다.
		    var maskHeight = $(document).height();  
		    var maskWidth = $(window).width();  
		    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
		    $("#mask").css({"width":maskWidth,"height":maskHeight});  
		    //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
		    $("#mask").fadeIn(0);      
		    $("#mask").fadeTo("slow",0.6);    
		    //윈도우 같은 거 띄운다.
		    $(".window").show();
		    $("#msg_id").val(user_id);
		    $('html, body').scrollTop(0);
		}
		$(".openMask").click(function(e){
			var tr = $(this).parent().parent();
			var user_no = tr.find("td").eq(0).html();
			var user_id = tr.find("td").eq(1).html();
		    e.preventDefault();
		    wrapWindowByMask(user_id);
		});
		$("#mask").click(function () {  
		    $(this).hide();  
		    $(".window").hide();
		    $(".window2").hide();  
		});   

		$(document).on('click', '#msgSendbutton', function(event) {
			var msg_ReceiverId = $("#msg_id").val();
			var msg_title = $('#msg_title').val();
			var msg_contents = $('#msg_contents').val();
			$.ajax({
				type : "get",
				url : "sendMsg.do",
				data : {
					"msg_ReceiverId" : msg_ReceiverId,
					"msg_title" : msg_title,
					"msg_contents" : msg_contents
				},
				success : function(data){
					alert('전송 성공')
				},
				error : function(request){
					alert("에러 : "+request.status);
				}
			})	
		})	
		$(".window .close1").click(function (e) {  
    	//링크 기본동작은 작동하지 않도록 한다.
    		e.preventDefault();  
   			 $("#mask, .window").hide();
   		})
	
	});
</script>

</head>
<body>
	<%@ include file="/petst/header.jsp"%>
	<div class="wrapper">
		<!--main content start-->
		<div class="main-content">
			<div class="container" style="background: white;">
				<h2 style="text-align: center;">회원 관리</h2>
				<br>
				<div align="center">
					<form action="showUserList.do" id="showFrm">
						<input type="text" name="keyword"
							style="cursor: text; color: black; width: 250px; height: 27px;">
						<select name="numb" style="height: 27px;">
							<option value="10">10개씩 보기</option>
							<option value="20">20개씩 보기</option>
							<option value="30">30개씩 보기</option>
						</select>
						<button id="searchBtn" style="height: 27px;">검색하기</button>
					</form>
				</div>
				<div style="height: 10px;"></div>
				<table class="table">
					<thead>
						<tr>
							<th>회원번호</th>
							<th>아이디</th>
							<th>이메일</th>
							<th>회원상태</th>
							<th>정지하기</th>
							<th>쪽지 보내기</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userList }" var="user">
							<tr>
								<td>${user.user_no }</td>
								<td>${user.user_id }</td>
								<td>${user.user_email }</td>
								<td><c:if test="${user.user_state==0 }">
							활동중
							</c:if> <c:if test="${user.user_state==1}">
							영구정지됨
							</c:if></td>
								<td><c:if test="${user.user_state==0 }">
										<button class="stopBtn" value="${user.user_no}">영구 정지
										</button>
									</c:if> <c:if test="${user.user_state==1}">
										<button class="cancelBtn" value="${user.user_no}">정지
											취소</button>
									</c:if></td>
								<td><button class="openMask" value="${user.user_no}">쪽지 보내기</button></td>
								<div id="mask"></div>
							</tr>
						</c:forEach>
					</tbody>

				</table>

				<div align="center">
					<ul class="pagination">
						<c:if test="${start != 1 }">
							<li><a
								href="showUserList.do?page=1&type=${type }&keyword=${keyword }&numb=${numb }">[처음]</a></li>
							<li><a
								href="showUserList.do?page=${start-1 }&type=${type }&keyword=${keyword }&numb=${numb }">[이전]</a></li>
						</c:if>
						<c:forEach begin="${start }" end="${end }" var="i">
							<c:choose>
								<c:when test="${i == current }">
									<li><a style="background-color: #FFD232">[${i }]</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="showUserList.do?page=${i }&type=${type }&keyword=${keyword }&numb=${numb }">
											[${i }]</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${end < last}">
							<li><a
								href="showUserList.do?page=${end+1 }&type=${type }&keyword=${keyword }&numb=${numb }">[다음]</a></li>
							<li><a
								href="showUserList.do?page=${last }&type=${type }&keyword=${keyword }&numb=${numb }">[끝]</a></li>
						</c:if>
					</ul>
				</div>



				<!-- 				</div> -->
			</div>
		</div>
		<!--main content end-->

	</div>
	
	
<!-- 	쪽지 보내기 -->
	<div class="window">
		<br>
		<table class="table">
		<tr>
		<td>받는 회원 id  </td>
		<td><input type="text" id="msg_id" style="width: 400px"></td>
		</tr>
		<tr>
		<td>제목  </td>
		<td><input type="text" id="msg_title" style="width: 400px" placeholder="제목을 입력해주세요."></td>
		</tr>
		<tr>
		<td colspan="2">
		<textarea id="msg_contents"
				style="resize: none; width: 580px; height: 180px;" placeholder="내용을 입력해주세요."></textarea>
		</td>
		</tr>
		<tr>
		<td colspan="2" align="right">
		<button id="msgSendbutton" class="close1">보내기</button>
			<button class="close1">닫기</button>
		</td>
		</tr>
		</table>
		
	</div>
	<%@ include file="/petst/footer.jsp"%>
</body>
</html>