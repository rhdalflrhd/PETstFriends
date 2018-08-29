<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.sub{
border-bottom: 1px solid red;
padding-left: 15px;
padding-top: 10px;
font-size: 17px;
}
h2{
text-align: center; 
background: white;
}
</style>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
	});
</script>
</head>

<body>
<%@ include file="/petst/header.jsp"%>
	<div class="wrapper">
		<div class="main-content">
			<div class="container" style="background: white;">
				<div class="col-md-4 col-sm-5"
					style="display: inline-block; width: 20%;">
					<div class="widget">
						<h3>고객센터</h3>
						<ul>
							<li><a href="">공지사항</a></li>
							<li><a href="">자주하는 질문</a></li>
							<li><a href="">1:1 문의</a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-8 col-sm-8"
					style="border-left: 1px solid gray; width: 80%; display: inline-block;">
				<table class="table">
					<thead>
						<tr>
							<th>글 번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${oqList }" var="oftenQnA">
							<tr>
								<td>${oftenQnA.oftenQnA_boardno }</td>
								<td width="50%;"><a
									href="showOftenQnA.do?oftenQnA_boardno=${oftenQnA.oftenQnA_boardno }">
										${oftenQnA.oftenQnA_title }</a></td>
								<td>관리자</td>
<%-- 								${oftenQnA.oftenQnA_adminId } --%>
								<td>
								<c:set var="str1" value="${oftenQnA.oftenQnA_writeDate }"/>
								${fn:substringBefore(str1, '.0')}
								</td>
								<td>${oftenQnA.oftenQnA_readCount }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
			</div>
		</div>
	</div>
	<div class="container" style="text-align: right;">
	<div id="writeBox"></div>
	<c:if test="${admin_check != null}">
		<input type="button" value="글쓰기" onclick="location.href='writeOftenQnAForm.do'">
</c:if>
	</div>	
<%@ include file="/petst/footer.jsp"%>
</body>
</html>