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

<title> 꿀 TIP 게시판</title>

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

  $('.ScrollCheck').click(function(event){

	  var scrollTarget = $('#scrollMsg').val();
	  var st = '#'+scrollTarget

   event.preventDefault();
   $('html,body').animate({scrollTop:$(st).offset().top}, 500);	
	})  
    
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
	background-color: #f5f5f5;
}

tr a:hover {
	color: #FF5050;
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

#footer {
	font-family: 'NanumSquareRound', sans-serif;
}

.footer-widget-section {
	font-family: 'NanumSquareRound', sans-serif;
}

.portfolio {
	font-family: 'NanumSquareRound', sans-serif;
	font-weight: bold;
	"
}

tr a:hover {
	color: #FF5050;
}

.tipUserBoard {
	width: 1200px;
}

.honeytip a:hover {
    color: #FFD232;
}

</style>
</head>
<body>
	<%@ include file="/petst/header.jsp"%>
	<div class="wrapper">
		<div class="container">
			<!-- font-size: 24px; -->
			<br><br><br><br>
			<div class="heading-text text-center text-uppercase">
				<a href="" class="honeyTip"><font
					style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; font-size: 50px; color: #8B5927;">
						<c:if test="${tipBoard_boardname eq '7'}">
							강아지
						</c:if> 
						<c:if test="${tipBoard_boardname eq '8'}">
						고양이
						</c:if>
						<c:if test="${tipBoard_boardname eq '9'}">
						토끼
						</c:if>
						꿀 TIP 게시판 </font></a>					
					&nbsp;
								
			<c:if test="${user_idCheck ne null}">			
					<input type="button" value="글쓰기"
					onclick="location.href='WriteTipBoardForm.do?tipBoard_boardname=${tipBoard_boardname}'"
					style="background-color: #CD853F; color: white; font-family: 'NanumSquareRound', sans-serif; font-size: 15px !important; font-weight: bold; height: 40px; width: 80px; border: 1; border-color: #CD853F; border-radius: 25px;">
			</c:if>	
			</div><br><br><br><br>
			
<!-- =====================================================================사용자 입력 Tip게시글 div 시작!!===================================================-->
			<div
				style="background: rgba(244, 159, 0, 0.7); border: 1px solid #eeeeee; border-radius: 25px;">
				<article> 
				
				<!-- 							<div class="tipUserBoard" style="font-family: 'NanumSquareRound',sans-serif; font-weight: bold; color:#CD853F;" > -->
				<!-- 														<br><br> --> <!-- 							<p style="float: left;"> -->
				<!-- 							 <font style="font-family: 'NanumSquareRound',sans-serif; font-weight: bold; color:#CD853F;"> -->
				<%-- 								총 게시물 : ${TipBoardCount }개 --%> <!--      						   </font>							 -->
				<!-- 							</p> --> <!-- 														<br><br> --> <!-- 							<div class="search" align="center"> -->
				<!-- 								<form action="TipBoardList.do" method="get"> --> <!-- 									<label>기간</label>&nbsp;&nbsp;&nbsp;&nbsp; -->
				<!-- 									<input type="date" name="startDate" min="2018-06-01" style="background-color:white; color:#CD853F; border:1; width: 150px;height:30px; border-color:#CD853F; border-radius:5px;"> -->
				<!-- 									<label> ~ </label> --> <!-- 									<input type="date" name="endDate" max="2018-12-31" style="background-color:white; color:#CD853F; border:1; width: 150px; height:30px; border-color:#CD853F; border-radius:5px;"> -->
				<!-- 									<select name="type"	style=" border:2; height:30px; border-color:#FFD232; border-radius:5px; width: 90px; padding: 5px;"> -->
				<!-- 										<option value="0">선택</option> --> <!-- 										<option value="1">제목</option> -->
				<!-- 										<option value="2">내용</option> --> <!-- 										<option value="3">제목+내용</option> -->
				<!-- 										<option value="4">작성자</option> --> <!-- 									</select>  -->
				<!-- 									<input type="text" placeholder="검색하세요-"  name="keyword" style="background-color:white; color:#CD853F; font-family: 'NanumSquareRound',sans-serif; padding: 4px; width: 400px; border:1; border-color:#CD853F; border-radius: 5px;" > -->
				<!-- 									<input style="background-color: #CD853F; border: none; padding: 5px 10px; -->
				<!-- 									 border-radius: 5px; color: white; cursor: pointer;" type="submit" value="검색">									 -->
				<!-- 								</form> --> <!-- 							</div> --> <!-- 							<br> -->
				<!-- 							<table style="width: 100%"> --> <!-- 								<tr> --> <!-- 									<th>글번호</th> -->
				<!-- 									<th>제 목</th> --> <!-- 									<th>작성일</th> --> <!-- 									<th>조회수</th> -->
				<!-- 									<th>작성자</th> --> <!-- 								</tr> --> <%-- 								<c:forEach items="${TipBoardList }" var="tipboard"> --%>
				<!-- 									<tr> --> <%-- 										<td>${tipboard.tipBoard_boardno }</td> --%>
				<%-- 										<td ><a href="view.do?num=${tipboard.tipBoard_boardno }&page=${current } --%>
				<%-- 								&type=${type }&keyword=${keyword}&startDate=${startdate}&endDate=${enddate}">${tipboard.tipBoard_title }</a></td> --%>
				<%-- 										<td><fmt:formatDate value="${tipboard.tipBoard_writeDate}" pattern="yyyy-MM-dd" /></td> --%>
				<%-- 										<td>${tipboard.tipBoard_readCount }</td> --%> <%-- 										<td>${tipboard.tipBoard_nickname }</td> --%>
				<!-- 									</tr> --> <%-- 								</c:forEach> --%> <!-- 							</table> -->
				<!-- 							<div class="numbers"> --> <%-- 								<c:if test="${start != 1 }"> --%>
				<%-- 									<a href="TipBoardList.do?page=1&type=${type }&keyword=${keyword}&startDate=${startdate} --%>
				<%-- 									&endDate=${enddate}">[처음]</a> --%> <%-- 									<a href="TipBoardList.do?page=${start-1 }&type=${type }&keyword=${keyword} --%>
				<%-- 									&startDate=${startdate}&endDate=${enddate}">[이전]</a> --%>
				<%-- 								</c:if> --%> <%-- 								<c:forEach begin="${start }" end="${end }" var="i"> --%>
				<%-- 									<c:choose> --%> <%-- 										<c:when test="${i == current }"> --%>
				<%-- 										[${i }] --%> <%-- 									</c:when> --%> <%-- 										<c:otherwise> --%>
				<%-- 											<a href="dogTipBoardList.do?page=${i }&type=${type }&keyword=${keyword} --%>
				<%-- 											&startDate=${startdate}&endDate=${enddate}">[${i }]</a> --%>
				<%-- 										</c:otherwise> --%> <%-- 									</c:choose> --%> <%-- 								</c:forEach> --%>
				<%-- 								<c:if test="${end!=last }"> --%> <%-- 									<a href="TipBoardList.do?page=${end+1 }&type=${type }&keyword=${keyword} --%>
				<%-- 									&startDate=${startdate}&endDate=${enddate}">[다음]</a> --%>
				<%-- 									<a href="TipBoardList.do?page=${last }&type=${type }&keyword=${keyword} --%>
				<%-- 									&startDate=${startdate}&endDate=${enddate}">[끝]</a> --%>
				<%-- 								</c:if> --%> <!-- 							</div> --> <!-- 							<br> -->
				<!-- 							<br> --> <!-- 							<div class="button"> --> <!-- 								<input type="button" style="background-color: orange;" value="글쓰기"	 onclick="location.href='WriteTipBoardForm.do'"> -->
				<!-- 							</div> --> <!-- 						</div>		 -->


				<div class="search" align="center">
					<form action="TipBoardList.do" method="get">
						<h2 align="left"
							style="font-family: 'NanumSquareRound', sans-serif; color: white;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ı 펫프회원 꿀팁글!
						</h2>
						<br> <font
							style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; color: white;">
							총 게시물 : ${TipBoardCount -1}개&nbsp;&nbsp;&nbsp; </font> <label
							style="color: #CD853F">기간</label>&nbsp;&nbsp; <input type="date"
							name="startDate" min="2018-06-01"
							style="background-color: white; color: #CD853F; border: 1; width: 150px; height: 30px; border-color: #CD853F; border-radius: 5px;">
						<label> ~ </label> <input type="date" name="endDate"
							max="2018-12-31"
							style="background-color: white; color: #CD853F; border: 1; width: 150px; height: 30px; border-color: #CD853F; border-radius: 5px;">
						<select name="type"
							style="border: 2; height: 30px; border-color: #CD853F; border-radius: 5px; width: 90px; padding: 5px;">
							<option value="0">선택</option>
							<option value="1">제목</option>
							<option value="2">내용</option>
							<option value="3">제목+내용</option>
							<option value="4">작성자</option>
						</select> <input type="text" placeholder="검색하세요-" name="keyword"
							style="background-color: white; color: #CD853F; font-family: 'NanumSquareRound', sans-serif; padding: 4px; width: 380px; border: 1; border-color: #CD853F; border-radius: 5px;">
						<input
							style="background-color: #CD853F; border: none; padding: 5px 10px; border-radius: 5px; color: white; cursor: pointer;"
							type="submit" value="검색">
						<!-- 									<input -->
						<!-- 						style="background-color: #CD853F; border: none; padding: 5px 10px; border-radius: 5px; color: white; cursor: pointer;" -->
						<!-- 						type="button" value="글쓰기" -->
						<%-- 					onclick="location.href='WriteTipBoardForm.do?tipBoard_boardname=${tipBoard_boardname}'">		 --%>
						<input
							style="background-color: #CD853F; border: none; padding: 5px 10px; border-radius: 5px; color: white; cursor: pointer;"
							type="button" value="목록으로"
							onclick="location.href='TipBoardList.do?tipBoard_boardname=${tipBoard_boardname}'">


					</form>
				</div>
				<br>
				<!-- ================================================================================================================================================ -->
				<div class="portfolio">
					<c:forEach items="${TipBoardList }" var="tipboard" varStatus="i">
						<c:if test="${i.last}">

						</c:if>
						<c:if test="${! i.last}">
							<!-- fake dummy게시글 가려내려는 코드  -->


							<div id="${tipboard.tipBoard_boardno}" class="portfolio-item"
								style="width: 345px; height: 500px; border: 1px #F2F2F2 solid; border-radius: 5px;">
								<div style="height: 285px;">
									<c:if test="${empty tipboard.tipBoard_file}">
										<img src="./Boot/images/tipBoardNonImageCondition.png"
											alt="ocean" height="280px">
									</c:if>
									<c:if test="${not empty tipboard.tipBoard_file}">
										<img
											src="download.do?boardname=${tipBoard_boardname}&boardno=${tipboard.tipBoard_boardno}"
											height="280px">
										<br>
									</c:if>
								</div>
								<div class="form-group">
									<div class="col-md-2" style="text-align: left; height: 60px;">
										<h6>
											<font
												style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; color: #8B5927;">
												제목 </font>
										</h6>
									</div>
									<div class="col-md-7" style="text-align: left; height: 60px;">
										<h5>
											<font
												style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; color: #8B5927;">
												${tipboard.tipBoard_title} </font>
										</h5>
									</div>
									<div class="col-md-3" style="text-align: left; height: 60px;">
										<h6>
											<font
												style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; color: #8B5927;">
												조회수 ${tipboard.tipBoard_readCount} </font>
										</h6>
									</div>
								</div>
								<div
									style="display: inline-block; width: 340px; height: 200px; padding-left: none; text-align: left; border: 1px #F2F2F2 solid; border-radius: 5px;">
									<h5>
										<font
											style="font-family: 'NanumSquareRound', sans-serif; color: #8B5927;">
											${tipboard.tipBoard_content} </font>
									</h5>
								</div>
								<div class="img-overlay">
									<div class="portfolio-text">
										<h4>${tipboard.tipBoard_title}</h4>
										<a
											href="ReadTipBoard.do?boardname=${tipboard.tipBoard_boardname}&boardno=${tipboard.tipBoard_boardno}">click</a>
										<!-- 해당게시글로 넘어가게 view.jsp만들고 난후 수정할것 -->
									</div>
								</div>
							</div>


						</c:if>
						<!-- fake dummy게시글 가려내려는 코드끝  -->


					</c:forEach>
				</div>
				<!-- =========================================페이징처리======================================================================================================= -->
				<br>
				<br>
				<div class="numbers">
					<div class="col-md-9">
						<c:if test="${start != 1 }">
							<a
								href="TipBoardList.do?page=1&type=${type }&keyword=${keyword}&startDate=${startdate}
									&endDate=${enddate}">[처음]</a>
							<a
								href="TipBoardList.do?page=${start-1 }&type=${type }&keyword=${keyword}
									&startDate=${startdate}&endDate=${enddate}">[이전]</a>
						</c:if>
						<c:forEach begin="${start }" end="${end }" var="i">
							<c:choose>
								<c:when test="${i == current }">
										[${i }]
									</c:when>
								<c:otherwise>
									<a
										href="TipBoardList.do?page=${i }&type=${type }&keyword=${keyword}
											&startDate=${startdate}&endDate=${enddate}">[${i }]</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${end!=last }">
							<a
								href="TipBoardList.do?page=${end+1 }&type=${type }&keyword=${keyword}
									&startDate=${startdate}&endDate=${enddate}">[다음]</a>
							<a
								href="TipBoardList.do?page=${last }&type=${type }&keyword=${keyword}
									&startDate=${startdate}&endDate=${enddate}">[끝]</a>
						</c:if>
					</div>
					<div class="col-md-3" align="right">
						<c:if test="${user_idCheck ne null}">

							<input type="button"
								style="background-color: #CD853F; color: white; font-family: 'NanumSquareRound', sans-serif; font-size: 15px !important; font-weight: bold; border: 1; border-color: #CD853F; border-radius: 5px;"
								value="글쓰기"
								onclick="location.href='WriteTipBoardForm.do?tipBoard_boardname=${tipBoard_boardname}'">
						</c:if>
					</div>
				</div>
				<br>
				<br>
				</article>
			</div>
			<br> <br> <br> <br>
			<!-- ============================================ ===사용자 입력 꿀팁 div 최종 끝===============================================================-->			


<!-- ======================================================네이버 API& 웹문서파싱 결과 시작===============================================================-->
			<div style="background: rgba(109, 45, 0, 0.7); border: 1px solid #eeeeee; border-radius: 25px;">
				<br>
				<h2 align="left"
					style="font-family: 'NanumSquareRound', sans-serif; color: white;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ı 펫프제공 꿀팁글!</h2>
					<br>
				<div class="portfolio"><!--begin portfolio items-->
					
					
					<c:forEach items="${EncycList1 }" var="e" varStatus="i">
						<div id="${e.encyc_title}" class="portfolio-item"
							style="width: 345px; height: 450px; border: 1px #F2F2F2 solid; border-radius: 5px;">
							<div style="height: 285px;">
								<c:if test="${empty e.encyc_thumbnail}">
									<img src="./Boot/images/tipBoardNonImageCondition.png"
										alt="ocean">
								</c:if>
								<c:if test="${not empty e.encyc_thumbnail}">
									<img src="${e.encyc_thumbnail}" height="280px">
								</c:if>
							</div>
							<br>
							<div class="form-group">
								<div class="col-md-2" style="text-align: left; height: 40px;">
									<font
										style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; color: #8B5927;">
										제목</font>
								</div>
								<div class="col-md-10" style="text-align: left; height: 40px;">
									<font
										style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; color: #8B5927;">
										${e.encyc_title}</font>
								</div>
							</div>
							<div
								style="display: inline-block; width: 340px; height: 150px; padding-left: none; text-align: left; border: 1px #F2F2F2 solid;border-radius: 5px;강아지 꿀 TIP 게시판  ">
								<h5>
									<font
										style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; color: #8B5927;">
										${e.encyc_description} </font>
								</h5>
							</div>
							<div class="img-overlay">
								<div class="portfolio-text">
									<h4>${e.encyc_title}</h4>
									<a onclick="window.open('${e.encyc_link}','new','width=700, height=700, toolbar =no, menubar =no, lacation= no, resizable=no, scrollbars=yes, status=no, top='+((window.screen.height-700)/2)+',left='+((window.screen.width-700)/2));">click</a>
								</div>
							</div>
						</div>
					</c:forEach>
			
			<c:if test="${tipBoard_boardname eq '9'}">			
						<c:forEach items="${EncycList9 }" var="e" varStatus="i" >
						<div id="${e.encyc_title}" class="portfolio-item"
							style="width: 345px; height: 450px; border: 1px #F2F2F2 solid; border-radius: 5px;">
							<div style="height: 285px;">
								<c:if test="${empty e.encyc_thumbnail}">
									<img src="./Boot/images/tipBoardNonImageCondition.png"
										alt="ocean">
								</c:if>
								<c:if test="${not empty e.encyc_thumbnail}">
									<img src="${e.encyc_thumbnail}" height="280px">
								</c:if>
							</div>
							<br>
							<div class="form-group">
								<div class="col-md-2" style="text-align: left; height: 40px;">
									<font
										style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; color: #8B5927;">
										제목</font>
								</div>
								<div class="col-md-10" style="text-align: left; height: 40px;">
									<font
										style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; color: #8B5927;">
										${e.encyc_title}</font>
								</div>
							</div>
							<div
								style="display: inline-block; width: 340px; height: 150px; padding-left: none; text-align: left; border: 1px #F2F2F2 solid;border-radius: 5px;강아지 꿀 TIP 게시판  ">
								<h5>
									<font
										style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; color: #8B5927;">
										${e.encyc_description} </font>
								</h5>
							</div>
							<div class="img-overlay">
								<div class="portfolio-text">
									<h4>${e.encyc_title}</h4>
									<a onclick="window.open('${e.encyc_link}','new','width=700, height=700, toolbar =no, menubar =no, lacation= no, resizable=no, scrollbars=yes, status=no, top='+((window.screen.height-700)/2)+',left='+((window.screen.width-700)/2));">click</a>
								</div>
							</div>
						</div>
					</c:forEach>
			</c:if>


				</div><!--End portfolio item-->
				<br><br>
				</div><!-- ======네이버 API& 웹문서파싱 결과 끝 -->
				

			</div>


	</div>
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