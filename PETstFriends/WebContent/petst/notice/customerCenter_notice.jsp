<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
a{
 color: red;
}
a:hover {
   color: brown;
}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

<script type="text/javascript">
	$(document).ready(function() {});
</script>

<body>
	<%@ include file="/petst/header.jsp"%>
	<div class="wrapper">
		<div class="main-content">
			<div class="container" style="background: white;">
				<form action="showNoticeList.do" style="text-align: center;">
					<select name="type" style="height: 27px;">
						<option value="0">검색어 선택</option>
						<option value="1">제목으로 검색</option>
						<option value="2">내용으로 검색</option>
						<option value="3">제목,내용으로 검색</option>
					</select> <input type="text" name="keyword" style="height: 27px;"> <select
						name="numb" style="height: 27px;">
						<option value="10">10개씩 보기</option>
						<option value="20">20개씩 보기</option>
						<option value="30">30개씩 보기</option>
					</select> <input type="submit" value="검색하기">

				</form>
				<div style="width: 20%; display: inline-block; float: left;">
					<div>
						<div>
							<h4>고객센터</h4>
							<div class="sub"><a href="showNoticeList.do">공지사항</a></div>
							<div class="sub"><a href="showOftenQnAList.do">자주하는 질문</a></div>
							<div class="sub"><a href="qnA.do">1:1문의</a></div>
						</div>
					</div>
				</div>
				<div style="width: 75%; display: inline-block;">
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
							<c:forEach items="${noticeList }" var="notice">
								<tr>
									<td>${notice.notice_boardno }</td>
									<td width="50%;"><a
										href="showNoticeBoard.do?notice_boardno=${notice.notice_boardno }&page=${current}&type=${type }&keyword=${keyword }&numb=${numb }">
											${notice.notice_title }</a></td>
									<td>관리자</td>
									<%-- 								${notice.notice_adminId } --%>
									<td><c:set var="str1" value="${notice.notice_writeDate }" />
										${fn:substringBefore(str1, '.0')}</td>
									<td>${notice.notice_readCount }</td>
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
			<input type="button" value="글쓰기"
				onclick="location.href='writeNoticeBoardForm.do'">
		</c:if>
	</div>

	<div align="center">
		<ul class="pagination">
			<c:if test="${start != 1 }">
				<li><a
					href="showNoticeList.do?page=1&type=${type }&keyword=${keyword }&numb=${numb }">[처음]</a></li>
				<li><a
					href="showNoticeList.do?page=${start-1 }&type=${type }&keyword=${keyword }&numb=${numb }">[이전]</a></li>
			</c:if>
			<c:forEach begin="${start }" end="${end }" var="i">
				<c:choose>
					<c:when test="${i == current }">
						<li><a>[${i }]</a></li>
					</c:when>
					<c:otherwise>
						<li><a
							href="showNoticeList.do?page=${i }&type=${type }&keyword=${keyword }&numb=${numb }">
								[${i }]</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${end < last}">
				<li><a
					href="showNoticeList.do?page=${end+1 }&type=${type }&keyword=${keyword }&numb=${numb }">[다음]</a></li>
				<li><a
					href="showNoticeList.do?page=${last }&type=${type }&keyword=${keyword }&numb=${numb }">[끝]</a></li>
			</c:if>
			<!-- 			<li><a href="#"><i class="fa fa-angle-double-right"></i></a></li> -->
		</ul>
	</div>
	<%@ include file="/petst/footer.jsp"%>
</body>
</html>