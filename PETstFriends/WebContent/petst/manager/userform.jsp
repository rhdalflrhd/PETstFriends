<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" href="./Boot/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="./Boot/css/font-awesome.min.css"> -->
<!-- <link rel="stylesheet" href="./Boot/css/animate.min.css"> -->
<!-- <link rel="stylesheet" href="./Boot/css/owl.carousel.css"> -->
<!-- <link rel="stylesheet" href="./Boot/css/owl.theme.css"> -->
<!-- <link rel="stylesheet" href="./Boot/css/slicknav.css"> -->
<!-- <link rel="stylesheet" href="./Boot/css/responsive.css"> -->
<title>Insert title here</title>
<style type="text/css">
 td:nth-child(1){ 
 background: #f2f2f2; 
 }
/* tr:nth-child(odd) {background-color: #f2f2f2;} */
td{
 padding: 15px;
}
table {
    border-collapse: collapse;
    width: 100%;
}
button{
   margin: 5px 5px 6px;
  text-decoration: none;
  border : 0;
   background-color : #dcdcdc;
   position: relative;
  float: left;
  padding: 0.438em 0.625em 0.438em 0.625em;
 line-height: 1.125em;
  cursor: pointer; 
  color: white;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

<script type="text/javascript">
var sessionId = '<%=session.getAttribute("user_id") %>';
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
			tr.find("td").eq(1).html('영구정지됨');
			tr.find("td").eq(2).empty();
			tr.find("td").eq(2).append('<button class="cancelBtn" value="'+user_no+
				'">정지 취소</button>');
			}else{
				tr.find("td").eq(1).html('활동중');
				tr.find("td").eq(2).empty();
				tr.find("td").eq(2).append('<button class="stopBtn" value="'+user_no+
				'">영구 정지</button>');
			}
			},
		error : function(xhrReq, status, error) {
			alert(error)
		}
	});
}
</script>

</head>
<body>
<center>
<table>
<c:if test="${sessionScope.adminCheck !=null }">
<tr>
<td>아이디</td>
<td>${user.user_id }</td>
</tr>
</c:if>
<tr>
<td>닉네임</td>
<td>${user.user_nickname }</td>
</tr>
<c:if test="${sessionScope.adminCheck !=null }">
<tr>
<td>이메일</td>
<td>${user.user_email }</td>
</tr>
</c:if>
<tr>
<td>점수</td>
<td>${user.user_score }</td>
</tr>
<tr>
<td>가입일</td>
<td>${user.user_joinDate }</td>
</tr>
<tr>
<td>상태</td>
<td>
<c:if test="${user.user_state ==0}">
활동중
</c:if>
<c:if test="${user.user_state ==1}">
정지된 회원입니다.
</c:if>
</td>
<c:if test="${sessionScope.adminCheck !=null }">
<td><c:if test="${user.user_state==0 }">
<button class="stopBtn" value="${user.user_no}">영구 정지</button>
</c:if> <c:if test="${user.user_state==1}">
<button class="cancelBtn" value="${user.user_no}">정지 취소</button>
</c:if></td>
</c:if>
</tr>
</table>
</center>
</body>
</html>