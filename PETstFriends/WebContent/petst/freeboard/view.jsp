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
	<br>
	<br>
	<br>
	<center>
<h1><b><font color="gray">게시글</font></b></h1>
		<br>
		<table border="1">

			<tr style="color: white;" bgcolor="#bebebe">
				<th>글번호</th>
				<th>제 목</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>작성자</th>
				<th>이메일</th>
				<th>파 일</th>
			</tr>

			<tr align="center" style="font-family: 'monaco';" bgcolor="white">
				<td>${board.num }</td>
				<td>${board.title }</td>
				<td>${date }</td>
				<td>${board.readCount }</td>
				<td>${board.name }</td>
				<td>${board.email }</td>
				<td><a href="download.do?num=${board.num }">${board.file }</a></td>
			</tr>

			<tr>
				<td style="color: white" bgcolor="#FFD2D2" align="center" colspan="7">
					내용</td>
			</tr>

			<tr>
				<td align="center" colspan="7" height="500">
				<img src="download.do?num=${board.num }" alt=""> <br>
				${board.content }</td>
			</tr>

			<tr>
				<td colspan="7" align="right"><input type="button" value="수정하기" 
				style="width:500 font-family: 'monaco'; background-color: #FFE6E6; border: 1 solid white"
					onclick="location.href='modifyForm.do?num=${board.num}&page=${page }&type=${type }&keyword=${keyword }&startDate=${startDate}&endDate=${endDate}'">
				<input type="button" value="삭제하기"
				style="width:500 font-family: 'monaco'; background-color: #FFE6E6; border: 1 solid white"
					onclick="location.href='deleteForm.do?num=${board.num }&page=${page }&type=${type }&keyword=${keyword }&startDate=${startDate}&endDate=${endDate}'">
			<input type="button" value="게시판으로"
			style="width:500 font-family: 'monaco'; background-color: #FFE6E6; border: 1 solid white"
					onclick="location.href='boardList.do?page=${page }&type=${type }&keyword=${keyword }&startDate=${startDate}&endDate=${endDate}'"></td>
			</tr>

		</table>

	</center>

</body>
</html>