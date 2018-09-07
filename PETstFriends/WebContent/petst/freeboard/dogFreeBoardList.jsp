<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Rubel Miah">

<!-- favicon icon -->
<link rel="shortcut icon" href="./Boot/images/favicon.png">

<title>Dog-square</title>

<!-- common css -->
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

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">

</script>

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

@import
	url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css')
	;

article {
	-webkit-flex: 3;
	-ms-flex: 3;
	flex: 3;
	background-color: #white;
	padding: 20px 10px;
}

table {
	width: 100%;
	background-color: transparent;
}

th {
	background-color: #CD853F;
	border: none;
	color: white;
}

th, td {
	/* 	border: 1px gray solid; */
	text-align: center;
	padding: 8px;
	border-bottom: 1px solid #ddd;
}

tr:hover {
	background-color: #EBC680;
}

tr a:hover {
	color: #EBC680;
}

.button {
	float: right;
	padding: 10px;

}

h2,h4, ul, li {
	font-family: 'NanumSquareRound', sans-serif;
}

input::-ms-input-placeholder {
	color: #CD853F;
}

input::-webkit-input-placeholder {
	color: #CD853F;
}

input::-moz-placeholder {
	color: #CD853F;
}

.wrapper {
	font-family: 'NanumSquareRound', sans-serif;
}
button {
   margin: 5px 5px 6px;
  text-decoration: none;
  border : 0;
   background-color : #dcdcdc;
   position: relative;
  float: right;
  padding: 0.438em 0.625em 0.438em 0.625em;
 line-height: 1.125em;
  cursor: pointer; 
  color: white;
}





</style>
</head>
<body>
	<%@ include file="/petst/header.jsp"%>
	<div class="wrapper">
		<div class="container">
		<br>
<!-- 		게시글 3개 -->
		<div style="border-bottom: 2px solid brown; width: 22%;">
               <div style="border-bottom: 5px solid #FFD232; width: 70%;">
               <h2><font style="font-size: 30px;">♥</font> BEST 3 <font style="font-size: 30px;">♥</font></h2>
               </div>
               </div>
		<div>
		<div class="portfolio">
				<!--begin portfolio items-->
				<c:forEach items="${selectBoardLike }"  var="freeBoard">
					<div class="portfolio-item"
						style="width: 300px; height: 300px; border-radius: 5px; border: 1px solid red;">
						<div style=" height: 200px;">

								<div style="width=200px; border: 1px solid black;">
									${freeBoard.freeBoard_content}</div>
							</div>
						<div align="center" class="form-group">
						<div class="col-md-4" align="center" style="text-align: left; height: 40px; border: 1px solid red;">
								<h5>
									<font
										style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; color: #8B5927;">
										</font>
								</h5>
							</div>
						<div class="col-md-8" style="text-align: left; height: 200px;">
<!-- 								<h5> -->
<!-- 									<font -->
<!-- 										style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; color: #8B5927;"> -->
<%-- 										${freeBoard.freeBoard_title}</font> --%>
<!-- 								</h5> -->
							</div>
						</div>
<!-- 						마우스올리면 오버레이~~ -->
						<div class="img-overlay">
							<div class="portfolio-text">
								<h4><font style="font-family: 'NanumSquareRound', sans-serif;"> <font style="font-size: 20px; ">♥</font>${freeBoard.freeBoard_LikeCount }</font></h4>
								<a 
									href="selectOneBoard.do?freeBoard_boardno=${freeBoard.freeBoard_boardno }&freeBoard_boardname=${freeBoard.freeBoard_boardname }&page=${current}&type=${type }&keyword=${keyword }&startDate=${startDate}&endDate=${endDate}">click</a>
							</div>
						</div>
					</div>
					</c:forEach>
		</div>
		

		</div>
<!-- 		게시글 3개 -->
		<div style="border-bottom: 2px solid brown; width: 22%;">
               <div style="border-bottom: 5px solid #FFD232; width: 70%;">
               <h2>강아지광장</h2>
               </div>
               </div>
				<article> 
				<table class="table" style="text-align: right:;">
					<thead align="center" style="text-align: right:;">
						<tr>
							<th style="width: 100px">글 번호</th>
							<th  style="width: 600px;">제 목</th>
							<th  style="width: 100px">작성자</th>
							<th  style="width: 100px">작성일</th>
							<th  style="width: 100px">조회수</th>
	<th><font style="font-size: 20px; ">♥</font></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${dogFreeBoardList}" var="freeBoard">
							<tr>
								<td>${freeBoard.freeBoard_boardno }</td>
								<td style="text-align: left;"><a
									href="selectOneBoard.do?freeBoard_boardno=${freeBoard.freeBoard_boardno }&freeBoard_boardname=${freeBoard.freeBoard_boardname }&page=${current}&type=${type }&keyword=${keyword }&startDate=${startDate}&endDate=${endDate}">
										<c:if
											test="${freeBoard.freeBoard_title != null &&  freeBoard.freeBoard_title ne '' }">
					${freeBoard.freeBoard_title }
					</c:if> <c:if
											test="${freeBoard.freeBoard_title == null ||freeBoard.freeBoard_title eq '' }">
					제목없음
					</c:if>
								</a></td>
								<td>${freeBoard.freeBoard_nickname }</td>
								<td>${freeBoard.freeBoard_writeDate }</td>
								<%--  <fmt:formatDate value="${FreeBoard.freeBoard_writeDate}" pattern="yyyy-MM-dd" /> --%>
								<td>${freeBoard.freeBoard_readCount }</td>
									<td>${freeBoard.freeBoard_LikeCount }</td>

							</tr>

						</c:forEach>
					</tbody>
				</table>
				<br>
				<div class="numbers" align="center">
									<div align="right">
						<c:if test="${user_idCheck !=null }">
							<input type="button" id="aaa"  value="글쓰기"  style="background-color: #EBC680"
								onclick="location.href='writeDogFreeBoardForm.do'">
							<input type="button" value="뒤로가기"   style="background-color: #EBC680"
								onclick="location.href='main.do'">
						</c:if>
						<c:if test="${user_idCheck==null }">
							<input type="button" value="뒤로가기"   style="background-color: #EBC680"
								onclick="location.href='main.do'">
						</c:if>
					</div>
					
<!-- 					페이징처리 -->
					<ul class="pagination">
								<!-- 			스타트 엔드 페이지는 페이지값 보고!  -->
								<c:if test="${start != 1 }">
								
									<li><a href="dogFreeBoardList.do?page=1&type=${type }&keyword=${keyword }&startDate=${startDate}&endDate=${endDate}">[처음]</a></li>
									<li><a href="dogFreeBoardList.do?page=${start-1 }&type=${type }&keyword=${keyword }&startDate=${startDate}&endDate=${endDate}">[이전]</a></li>
								</c:if>
												<c:forEach begin="${start }" end="${end }" var="i">
						<c:choose>
							<c:when test="${i == current }">
								<li><a style="background-color: #EBC680;">[${i }]</a></li>
							</c:when>
							<c:otherwise>
								<li><a
									href="dogFreeBoardList.do?page=${i }&type=${type }&keyword=${keyword }&startDate=${startDate}&endDate=${endDate}">[${i }]</a></li>
							</c:otherwise>
							
						</c:choose>
					</c:forEach>
									<c:if test="${end < last}">
						<a
							href="dogFreeBoardList.do?page=${end+1 }&type=${type }&keyword=${keyword }&startDate=${startDate}&endDate=${endDate}">[다음]</a>
						<a
							href="dogFreeBoardList.do?page=${last }&type=${type }&keyword=${keyword }&startDate=${startDate}&endDate=${endDate}">[끝]</a>
					</c:if>
							</ul>

									<form action="dogFreeBoardList.do">
		

							<div>
									<select name="type" style="height: 26px;">
											<option value="0">검색어 선택</option>
											<option value="1">제목</option>
											<option value="2">내용</option>
											<option value="3">제목+내용</option>
											<option value="4">글쓴이</option>
									</select>


									<input type="text" name="keyword"
										style="height: 26px;">

									<input type="submit" value="검색"   style="background-color: #EBC680; text-align: center;border-radius:3px">
	</div>
					</form>
				</div>
				
				<input type="hidden" id="freeBoard.freeBoard_boardname"
			name="freeBoard.freeBoard_boardname"
			value=" freeBoard.freeBoard_boardname"> <input type="hidden"
			id="freeBoard_userId" name="freeBoard_userId"
			value="freeBoard.freeBoard_userId ">

				
				
				
				<br>
				<br>
				</article>
			</div>
			<!-- div style 끝 -->

			<br> <br> <br> <br>

		</div>
		<!-- container끝 -->
	</div>
	<!-- wrapper끝 -->
	<%@ include file="/petst/footer.jsp"%>

	<!-- js files -->
	<script type="text/javascript" src="./Boot/js/modernizr-2.6.2.min.js"></script>
	<script type="text/javascript" src="./Boot/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="./Boot/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./Boot/js/smoothscroll.js"></script>
	<script type="text/javascript" src="./Boot/js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="./Boot/js/imagesloaded.pkgd.js"></script>
	<script type="text/javascript" src="./Boot/js/isotope.2.2.2min.js"></script>
	<script type="text/javascript" src="./Boot/js/jquery.fitvids.js"></script>
	<script type="text/javascript" src="./Boot/js/jquery.stickit.min.js"></script>
	<script type="text/javascript" src="./Boot/js/jquery.slicknav.js"></script>
	<script type="text/javascript" src="./Boot/js/scripts.js"></script>


</body>
</html>