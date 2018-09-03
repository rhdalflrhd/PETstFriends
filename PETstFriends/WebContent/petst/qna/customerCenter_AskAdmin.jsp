<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="style.css">
<style type="text/css">
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
					<div class="widget" style="background: white;">
						<h3 style="background: white;">고객센터</h3>
						<ul>
							<li><a href="showNoticeList.do">공지사항</a></li>
							<li><a href="showOftenQnAList.do">자주하는 질문</a></li>
							<li><a href="qnA.do">1:1 문의</a></li>
						</ul>
					</div>
				</div>

				<div style="display: inline-block; width: 80%; float: right;">
				<form action="showQnAList.do" style="text-align: center;">
					<select name="boardname" style="height: 27px;">
						<option value="0">게시판 선택</option>
						<option value="1">모임게시판</option>
						<option value="2">자유게시판</option>
						<option value="3">팁게시판</option>
						<option value="4">기타 문의</option>
					</select>				
					<select name="type" style="height: 27px;">
						<option value="0">검색어 선택</option>
						<option value="1">제목으로 검색</option>
						<option value="2">내용으로 검색</option>
						<option value="3">제목,내용으로 검색</option>
						<option value="4">아이디로 검색</option>
					</select> <input type="text" name="keyword" style="height: 27px;"> 
					<select
						name="numb" style="height: 27px;">
						<option value="10">10개씩 보기</option>
						<option value="20">20개씩 보기</option>
						<option value="30">30개씩 보기</option>
					</select> <input type="submit" value="검색하기">
				</form>
					<table class="table">
						<thead>
							<tr>
								<th>글 번호</th>
								<th>제목</th>
								<th>글쓴이</th>
								<th>작성일</th>
								<th>답변여부</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${qList }" var="qnA">
								<tr>
									<td>${qnA.qnA_boardno }</td>
									<td width="50%;"><a
										href="showQnABoard.do?qnA_boardno=${qnA.qnA_boardno }&page=${current }&boardname=${boardname }&type=${type }&keyword=${keyword }&numb=${numb }">
											${qnA.qnA_title }</a></td>
									<td>${qnA.qnA_userId }</td>
									<td><c:set var="str1" value="${qnA.qnA_writeDate }" />
										${fn:substringBefore(str1, '.0')}</td>
									<td><c:if test="${qnA.qnA_reply == null }">
								미처리
								</c:if> <c:if test="${qnA.qnA_reply != null }">
								처리됨
								</c:if></td>
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
				onclick="location.href='writeQnAForm.do'">
		</c:if>
	</div>

	<div align="center">
		<ul class="pagination">
			<c:if test="${start != 1 }">
				<li><a
					href="showQnAList.do?page=1&boardname=${boardname }&type=${type }&keyword=${keyword }&numb=${numb }">[처음]</a></li>
				<li><a
					href="showQnAList.do?page=${start-1 }&boardname=${boardname }&type=${type }&keyword=${keyword }&numb=${numb }">[이전]</a></li>
			</c:if>
			<c:forEach begin="${start }" end="${end }" var="i">
				<c:choose>
					<c:when test="${i == current }">
						<li><a>[${i }]</a></li>
					</c:when>
					<c:otherwise>
						<li><a
							href="showQnAList.do?page=${i }&boardname=${boardname }&type=${type }&keyword=${keyword }&numb=${numb }">
								[${i }]</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${end < last}">
				<li><a
					href="showQnAList.do?page=${end+1 }&boardname=${boardname }&type=${type }&keyword=${keyword }&numb=${numb }">[다음]</a></li>
				<li><a
					href="showQnAList.do?page=${last }&boardname=${boardname }&type=${type }&keyword=${keyword }&numb=${numb }">[끝]</a></li>
			</c:if>
		</ul>
	</div>
	<%@ include file="/petst/footer.jsp"%>

</body>
</html>