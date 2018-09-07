<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Rubel Miah">

<!-- favicon icon -->
<link rel="shortcut icon" href="./Boot/images/favicon.png">

<title>${ThatmemberId}회원님이 작성한 게시글</title>

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
$(document).ready(function(){
 
});
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
	background-color: #CD853F;
}

tr a:hover {
	color: #FFD232;
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



</style>
</head>
<body>
	<%@ include file="/petst/header.jsp"%>
	<div class="wrapper">
		<div class="container">
			<!-- font-size: 24px; -->
						<br><br>
			<div class="heading-text text-center text-uppercase">
				<font style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; font-size: 50px; color: #8B5927;">
						${ThatmemberId} 회원님이 작성한 게시글들
				</font>
				<br>
<!-- 				<a class="s-twitter" onclick="history.back();">뒤로가기</a> -->
			</div>
			<br> <br>

			<!-- ========================================================어떤 회원이 작성한 게시글 모두보기 시작===================================================-->
			<div style="background: rgba(244, 159, 0, 0.7); border: 1px solid #eeeeee; border-radius: 25px; width: 1200px;">
				<article> 
				<br>
<table style="width: 100%">
								<tr>
									<th>작성자</th>
									<th>제 목</th>
									<th>작성일</th>
								</tr>
								<c:forEach items="${myWriteList}" var="write">
									<tr>
										<td align="center">
										${write.userId }
										</td>
										<td>
											<c:if test="${empty write.title}">
													<a href="ReadTipBoard.do?boardname=${write.boardname}&boardno=${write.boardno}">
															제목없음
													</a>
											</c:if>
											<c:if test="${not empty  write.title}">											
													<a href="ReadTipBoard.do?boardname=${write.boardname}&boardno=${write.boardno}">
															${ write.title }
													</a>
<!-- 											<a id="a"> -->
<%-- 												<input type="hidden" value="${write.boardname}" id="boardname"> --%>
<%-- 												<input type="hidden" value="${write.boardno}" id="boardno"> --%>
<%-- 													${ write.title } --%>
<!-- 											</a> -->
											</c:if>
										</td>															
										<td>
										<fmt:formatDate value="${write.writeDate}" pattern="yyyy-MM-dd" />
										</td>
									</tr>
								</c:forEach>
							</table>
							<div class="numbers">
								<c:if test="${start != 1 }">
										<a href="CertainMemberWrites.do?page=1">[처음]</a>
										<a href="CertainMemberWrites.do?page=${start-1 }">[이전]</a>
								</c:if>
								<c:forEach begin="${start }" end="${end }" var="i">
										<c:choose>
											<c:when test="${i == current }">  
												[${i }]
											</c:when>
											<c:otherwise>
												<a href="CertainMemberWrites.do?page=${i }">[${i }]</a>
											</c:otherwise>
										</c:choose>
								</c:forEach> 
									<c:if test="${end != last }">
										<a href="CertainMemberWrites.do?page=${end+1 }">[다음]</a>
										<a href="CertainMemberWrites.do?page=${last }">[끝]</a>
									</c:if>
									
									&nbsp;&nbsp;<a onclick="history.back();" style="color: white;">[되돌아가기]</a>
							</div>	
								
<!-- 				<div class="memberout-wrap"	style="border: none; height: 850px; width: 850px;"> -->
<!-- 					<div class="container"> -->
<!-- 						<table class="table table-board"> -->
<!-- 							<tr> -->
<!-- 								<th width="700px" align="center">제 목</th> -->
<!-- 								<th width="150px" align="center">작성자</th> -->
<!-- 								<th width="200px" align="center">작성일</th> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td width="1250px" colspan="5" bgcolor="yellow"></td> -->
<!-- 							</tr> -->
<%-- 							<c:forEach items="${myWriteList}" var="write"> --%>
<!-- 								<tr> -->
<%-- 									<td><c:if test="${empty write.title}"> --%>
<!-- 											<a id="a">제목없음</a> -->
<%-- 										</c:if> <c:if test="${not empty  write.title}"> --%>
<!-- 											<a id="a"><input type="hidden" -->
<%-- 												value="${write.boardname}" id="boardname"> <input --%>
<%-- 												type="hidden" value="${write.boardno}" id="boardno"> --%>
<%-- 												${ write.title }</a> --%>
<%-- 										</c:if></td> --%>

<%-- 									<td align="center">${write.userId }</td> --%>
<%-- 									<td align="center"><fmt:parseDate --%>
<%-- 											value="${write.writeDate }" var="wriedate" pattern="yyyymmdd"></fmt:parseDate> --%>
<%-- 										<fmt:formatDate value="${wriedate }" pattern="yyyy-MM-dd" /></td> --%>
<!-- 								</tr> -->
<%-- 							</c:forEach> --%>

<!-- 							<tr> -->
<!-- 								<td width="1250px" colspan="5" bgcolor="yellow"></td> -->
<!-- 							</tr> -->

<!-- 							<tr> -->
<!-- 								<td width="1250px" colspan="5"> -->
<%-- 								<c:if test="${start != 1 }"> --%>
<!-- 										<a href="CertainMemberWrites.do?page=1">[처음]</a> -->
<%-- 										<a href="CertainMemberWrites.do?page=${start-1 }">[이전]</a> --%>
<%-- 								</c:if> --%>
<%-- 								<c:forEach begin="${start }" end="${end }" var="i"> --%>
<%-- 										<c:choose> --%>
<%-- 											<c:when test="${i == current }">   --%>
<%-- 												[${i }] --%>
<%-- 											</c:when> --%>
<%-- 											<c:otherwise> --%>
<%-- 												<a href="CertainMemberWrites.do?page=${i }">[${i }]</a> --%>
<%-- 											</c:otherwise> --%>
<%-- 										</c:choose> --%>
<%-- 								</c:forEach>  --%>
<%-- 									<c:if test="${end != last }"> --%>
<%-- 										<a href="CertainMemberWrites.do?page=${end+1 }">[다음]</a> --%>
<%-- 										<a href="CertainMemberWrites.do?page=${last }">[끝]</a> --%>
<%-- 									</c:if> --%>
<!-- 								</td> -->
<!-- 							</tr> -->
<!-- 						</table> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
				
				
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