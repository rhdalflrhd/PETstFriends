<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
						tr.find("td").eq(3).html('');
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
	});
</script>

</head>
<body>
	<%@ include file="/petst/header.jsp"%>
	<div class="wrapper">
		<!--main content start-->
		<div class="main-content" style="border-bottom: 1px solid gray;">
			<div class="container"
				style="background: white; border-top: 1px solid gray;">
						<h2 style="text-align: center;">회원 정보 관리</h2>
						<form action="showUserList.do" id="showFrm">
						<input type="text" name="keyword">
						<select	name="numb" style="height: 27px;">
						<option value="10">10개씩 보기</option>
						<option value="20">20개씩 보기</option>
						<option value="30">30개씩 보기</option>
						</select>
						<button id="searchBtn">검색하기</button>
						</form>
						

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
							<td>
<%-- 							<c:if test="${user.user_state==0 }"> --%>
<!-- 							영구 정지 -->
<%-- 							</c:if> --%>
							<c:if test="${user.user_state==1}">
							영구정지됨
							</c:if>
							</td>
							<td>
							<c:if test="${user.user_state==0 }">
							<button class="stopBtn" value="${user.user_no}">
							영구 정지
							</button>
							</c:if>
							<c:if test="${user.user_state==1}">
							<button class="cancelBtn" value="${user.user_no}">
							정지 취소
							</button>
							</c:if>
							</td>
							<td><input type="button" value="쪽지보내기"></td>
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
						<li><a>[${i }]</a></li>
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
	<%@ include file="/petst/footer.jsp"%>
</body>
</html>