<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>
			<b><font color="gray">게시판</font></b>
		</h1>

			<table>
				<tr>
					<th></th>
					<th></th>
					<th>검색 시작 기간</th>
					<th>검색 마지막 기간</th>
					<th></th>
				</tr>
				<tr>
					<td><select name="type" style="height: 27px;">
							<option value="0">검색어 선택</option>
							<option value="1">제목으로 검색</option>
							<option value="2">내용으로 검색</option>
							<option value="3">제목,내용으로 검색</option>
							<option value="4">이름으로 검색</option>
					</select></td>
					<td><input type="text" name="keyword" style="height: 20px;">
					</td>
					<td><input type="date" name="startDate" style="height: 22px;">
					</td>
					<td><input type="date" name="endDate" style="height: 22px;">
					</td>
					<td><input type="submit" value="검색하기"
						style="width: 100px; height: 30px; font-family: 'monaco'; background-color: #FFE6E6; border: 1 solid white">
					</td>
			</table>

		<br>
		<table>
			<tr>
				<td width="1250px" colspan="5" bgcolor="pink"></td>
			</tr>
			<tr>
				<th width="100px" align="center">글 번호</th>
				<th width="500px" align="center">제 목</th>
				<th width="150px" align="center">작성자</th>
				<th width="200px" align="center">작성일</th>
				<th width="100px" align="center">조회수</th>
				
			</tr>
			<tr>
				<td width="1250px" colspan="5" bgcolor="pink"></td>
			</tr>

			<c:forEach items="${FreeBoardList }" var="Freeboard">
				<tr>
					<td align="center">${FreeBoard_boardno }</td>
					<td><a
						href="view.do?num=${FreeBoard_boardno }&page=${current}&type=${type }&keyword=${keyword }&startDate=${startDate}&endDate=${endDate}">
							<c:if test="${FreeBoard_title != null &&  FreeBoard_title ne '' }">
					${freeboard.FreeBoard_title }
					</c:if> <c:if test="${FreeBoard_title == null || FreeBoard_title eq '' }">
					제목없음
					</c:if>
					</a></td>
					<td align="center"><fmt:formatDate value="${Freeboard.FreeBoard_WriteDate }"
							pattern="yyyy-MM-dd" /></td>

					<td align="center">${Freeboard.FreeBoard_readCount }</td>
					<td align="center">${Freeboard.FreeBoard_nickname }</td>
				</tr>
			</c:forEach>

			<tr>
				<td width="1250px" colspan="5" bgcolor="pink"></td>
			</tr>


			<tr>
				<td></td>
			</tr>
			<tr>
				<td width="1250px" colspan="3"><c:if test="${start != 1 }">
						<a
							href="FreeBoardList.do?page=1&type=${type }&keyword=${keyword }&startDate=${startDate}&endDate=${endDate}">[처음]</a>
						<a
							href="FreeBoardList.do?page=${start-1 }&type=${type }&keyword=${keyword }&startDate=${startDate}&endDate=${endDate}">[이전]</a>
					</c:if> <c:forEach begin="${start }" end="${end }" var="i">
						<c:choose>
							<c:when test="${i == current }">
								[${i }]
							</c:when>
							<c:otherwise>
								<a
									href="boardList.do?page=${i }&type=${type }&keyword=${keyword }&startDate=${startDate}&endDate=${endDate}">[${i }]</a>
							</c:otherwise>
						</c:choose>
					</c:forEach> <c:if test="${end < last}">
						<a
							href="boardList.do?page=${end+1 }&type=${type }&keyword=${keyword }&startDate=${startDate}&endDate=${endDate}">[다음]</a>
						<a
							href="boardList.do?page=${last }&type=${type }&keyword=${keyword }&startDate=${startDate}&endDate=${endDate}">[끝]</a>
					</c:if></td>
				<td colspan="2"><input type="button" value="글쓰기"
					style="width: 80px; height: 25px; background-color: #FFE6E6; border: 1 solid white"
					onclick="location.href='writeForm.do'"> <input
					type="button" value="뒤로가기"
					style="width: 80px; height: 25px; background-color: #FFE6E6; border: 1 solid white"
					onclick="location.href='main.do'"></td>
			</tr>
		</table>
	</center>
</body>
</html>