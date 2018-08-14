<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">

</script>
<style type="text/css">
.a {
	border: solid red 5px
}
body {
	border: 0;
	padding: 0;

	min-height: 100%;
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;

}
span {
	width: 150px;
	color: #C1AEEE;
}

input {
	border: solid gray 1px
}

table {
	width: 100%;
	background-color: transparent;
}

th, td {
	border: 1px gray solid;
	text-align: center;
	padding: 3px
}

h2 {
	text-align: center
}
</style>
</head>
<body>
	
	
	
	 			<h1>토끼 종정보 페이지</h1>
			<table cellspacing="0">
				<tr bgcolor="#7B68EE" style="color: white;">
					<th>타이틀</th>
					<th>링크</th>
					<th>설명</th>
					<th>섬네일</th>
				</tr>
				<c:forEach items="${RabbitEncycList1 }" var="e" varStatus="i">
					<tr>
																					
						<c:choose>
						
						<c:when test="${e.encyc_title eq '무주의 동물상 (무주)'}">
<%-- 						${i.count+91} 흠좀무 --%>
  						</c:when>
  						
  						<c:when test="${e.encyc_title eq '토끼'}">
<%-- 						${i.count+91} 흠좀무 --%>
  						</c:when>
  						
  						<c:when test="${e.encyc_title eq '래빗'}">
<%-- 						${i.count+91} 흠좀무 --%>
  						</c:when>
  						
  						<c:otherwise>
  						
  						<td>${i.count}. ${e.encyc_title}</td>
						<td ><a href=" ${e.encyc_link} ">상세내용</a></td>
  						<td>${e.encyc_description}</td>
						<td>
						<c:if test="${empty e.encyc_thumbnail}">
						제공되는 썸네일이없습니다.</c:if>
						<c:if test="${not empty e.encyc_thumbnail}">
						<img src="${e.encyc_thumbnail}"></c:if><br>
						</td>
  						
  						</c:otherwise>
						
						
						</c:choose>   					
					</tr>
				</c:forEach>
			</table>    
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<center>
		<font color="grey" style="font-family: Georgia; font-weight: bold;">
			<h1>강아지 종정보 페이지</h1>
			<table cellspacing="0">
				<tr bgcolor="#7B68EE" style="color: white;">
					<th>타이틀</th>
					<th>링크</th>
					<th>설명</th>
					<th>섬네일</th>
				</tr>
				<c:forEach items="${DogEncycList1 }" var="e">
					<tr>
						<td >${e.encyc_title}</td>
						<td ><a href=" ${e.encyc_link} ">상세내용보기</a></td>
						<td >${e.encyc_description}</td>
						<td >
						<c:if test="${empty e.encyc_thumbnail}">
						제공되는 썸네일이없습니다.</c:if>
						<c:if test="${not empty e.encyc_thumbnail}">
						<img src="${e.encyc_thumbnail}"></c:if><br>
						</td>
					</tr>
				</c:forEach>
			</table>
			<table cellspacing="0">
				<c:forEach items="${DogEncycList2 }" var="e">
					<tr>
						<td >${e.encyc_title}</td>
						<td ><a href=" ${e.encyc_link} ">상세내용보기</a></td>
						<td >${e.encyc_description}</td>
						<td >
						<c:if test="${empty e.encyc_thumbnail}">
						제공되는 썸네일이없습니다.</c:if>
						<c:if test="${not empty e.encyc_thumbnail}">
						<img src="${e.encyc_thumbnail}"></c:if><br>
						</td>
					</tr>
				</c:forEach>
			</table>
			<table cellspacing="0">
				<c:forEach items="${DogEncycList3 }" var="e">
					<tr>
						<td >${e.encyc_title}</td>
						<td ><a href=" ${e.encyc_link} ">상세내용보기</a></td>
						<td >${e.encyc_description}</td>
						<td >
						<c:if test="${empty e.encyc_thumbnail}">
						제공되는 썸네일이없습니다.</c:if>
						<c:if test="${not empty e.encyc_thumbnail}">
						<img src="${e.encyc_thumbnail}"></c:if><br>
						</td>
					</tr>
				</c:forEach>
			</table>
			<table cellspacing="0">
				<c:forEach items="${DogEncycList4 }" var="e">
					<tr>
						<td >${e.encyc_title}</td>
						<td ><a href=" ${e.encyc_link} ">상세내용보기</a></td>
						<td >${e.encyc_description}</td>
						<td >
						<c:if test="${empty e.encyc_thumbnail}">
						제공되는 썸네일이없습니다.</c:if>
						<c:if test="${not empty e.encyc_thumbnail}">
						<img src="${e.encyc_thumbnail}"></c:if><br>
						</td>
					</tr>
				</c:forEach>
			</table>
		</font>
	</center>
</body>
</html>