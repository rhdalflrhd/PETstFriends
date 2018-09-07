<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신고글 보기</title>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
button, input[type="button"],input[type="submit"] {
   margin: 5px 5px 6px;
  text-decoration: none;
  border : 0;
	background-color : #dcdcdc;
   position: relative;
   height : 32px;
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
// report_state ==0 미처리
// report_state ==1 보류
// report_state ==2 처리완료

	$(document).ready(function() {
		$(document).on("click",".holdStateBtn",function(){ //보류
			var tr = $(this).parent().parent();
			var report_reportNo = $(this).val();
			var report_state = 1
			var state = '처리보류';
			var btnStr = '<button class="completeStateBtn" value="'+report_reportNo+'">처리 완료</button> '
				btnStr += '<button class="holdStateBtn"	value="'+report_reportNo+'">처리 보류</button>'
			updateState(report_reportNo, report_state,tr,state, btnStr);
		})
		$(document).on("click",".cancelStateBtn",function(){//취소
			var tr = $(this).parent().parent();
			var report_reportNo = $(this).val();
			var report_state = 0;
			var state = '미처리';
			var btnStr = '<button class="completeStateBtn" value="'+report_reportNo+'">처리 완료</button> '
			btnStr += '<button class="holdStateBtn"	value="'+report_reportNo+'">처리 보류</button>'
				updateState(report_reportNo, report_state,tr,state, btnStr);
		})
		$(document).on("click",".completeStateBtn",function(){//완료
			var tr = $(this).parent().parent();
			var report_reportNo = $(this).val();
			var report_state = 2;
			var state = '처리완료';			
			var btnStr = '<button class="holdStateBtn" value="'+report_reportNo+'">처리 보류</button> '
			btnStr += '<button class="cancelStateBtn" value="'+report_reportNo+'">처리 취소</button>'
				updateState(report_reportNo, report_state,tr,state, btnStr);
		})
		
		
		var updateState = function(report_reportNo, report_state, tr, state, btnStr){
			var td = tr.children();	
			$.ajax({
				type : 'GET',
				url : 'updateReportState.do',
				data : {
					"report_reportNo" : report_reportNo,
					"report_state" : report_state
				},
				success : function(data) {
					tr.find("td").eq(5).html(state);  
					tr.find("td").eq(6).empty();
					tr.find("td").eq(6).append(btnStr);
				},
				error : function(xhrReq, status, error) {
					alert(error)
				}
			});
		}
		
		$('#deletReportBtn').click(function(){
			var checkArr = [];
			$("input[name='report_reportNo']:checked").each(function(i){
				checkArr.push($(this).val());
			})
			$.ajax({
				type : 'GET',
				url : 'deleteReport.do',
				data : {
					"deleteArr" : checkArr
				},
				success : function(data) {
					location.reload();
				},
				error : function(xhrReq, status, error) {
					alert(error)
				}
			});
		})
		
	});
</script>
</head>
<body>
	<%@ include file="/petst/header.jsp"%>
	<div class="wrapper">
		<div class="main-content">
			<div class="container" style="background: white;">
			<div>
				<form action="showReportList.do" style="text-align: center;"
					id="listForm">
					<input type="text" name="keyword" style="height: 34px; width: 250px; cursor: text; color: black;"
						placeholder="아이디를 입력해주세요."> <select name="numb"
						style="height: 34px;">
						<option value="10">10개씩 보기</option>
						<option value="20">20개씩 보기</option>
						<option value="30">30개씩 보기</option>
					</select> <select name="boardname" style="height: 34px;">
						<option value="0">게시판선택</option>
						<option value="2">모임게시판</option>
						<option value="3">개 자유게시판</option>
						<option value="4">고양이 자유게시판</option>
						<option value="5">토끼 자유게시판</option>
						<option value="6">기타 자유게시판</option>
						<option value="7">개 팁게시판</option>
						<option value="8">고양이 팁게시판</option>
						<option value="9">토끼 팁게시판</option>
					</select> <input type="submit" value="검색하기">
				</form>
			</div>
			<br>
				<table class="table">
					<thead>
						<tr>
						<th></th>
							<th>글 번호</th>
							<th>신고이유</th>
							<th>게시글링크</th>
							<th>작성일</th>
							<th>처리여부</th>
							<th>처리하기</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${rList }" var="report">
							<tr>
							<td><input type="checkbox" value="${report.report_reportNo }" name="report_reportNo"></td>
								<td>${report.report_reportNo }</td>
								<td width="30%;">${report.report_reportReason }</td>
								<td width="15%;">
								<c:if test="${report.report_boardname==2 }">
										<c:set value="meetingview.do?boardno=${report.report_boardno }"
											var="path"></c:set>
									</c:if> 
								<c:if test="${report.report_boardname>=3 && report.report_boardname<=6 }">
										<c:set value="selectOneBoard.do?boardno=${report.report_boardno }"
											var="path"></c:set>
									</c:if> 
									
								<c:if test="${report.report_boardname>=7 && report.report_boardname<=9 }">
										<c:set value="ReadTipBoard.do?boardno=${report.report_boardno }"
											var="path"></c:set>
								</c:if> <a onclick="window.open('${path}','width=#', 'height=#');"
									style="cursor: pointer;"> 해당 게시글로 가기</a></td>
								<!-- 								경로정해지면 하기???????? -->
								<td><c:set var="str1" value="${report.report_date }" />
									${fn:substringBefore(str1, '.0')}</td>
								<td>
								<c:if test="${report.report_state ==0}">
								미처리
								</c:if>
								<c:if test="${report.report_state ==1}">
								처리보류
								</c:if>
								<c:if test="${report.report_state ==2}">
								처리완료
								</c:if></td>
								<td>
								<c:choose>
										<c:when test="${report.report_state ==2}">
											<button class="holdStateBtn" 
												value="${report.report_reportNo }">처리 보류</button>
											<button class="cancelStateBtn"
												value="${report.report_reportNo }">처리 취소</button>
										</c:when>
										<c:otherwise>
											<button class="completeStateBtn"
												value="${report.report_reportNo }">처리 완료</button>
											<button class="holdStateBtn"
												value="${report.report_reportNo }">처리 보류</button>
										</c:otherwise>
									</c:choose>
									</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button id="deletReportBtn">삭제하기</button>
			</div>
		</div>
	</div>

	<div align="center">
		<ul class="pagination">
			<c:if test="${start != 1 }">
				<li><a
					href="showReportList.do?page=1&boardname=${boardname }&keyword=${keyword }&numb=${numb }">[처음]</a></li>
				<li><a
					href="showReportList.do?page=${start-1 }&boardname=${boardname }&keyword=${keyword }&numb=${numb }">[이전]</a></li>
			</c:if>
			<c:forEach begin="${start }" end="${end }" var="i">
				<c:choose>
					<c:when test="${i == current }">
						<li><a style="background-color: #FFD232">[${i }]</a></li>
					</c:when>
					<c:otherwise>
						<li><a
							href="showReportList.do?page=${i }&boardname=${boardname }&keyword=${keyword }&numb=${numb }">
								[${i }]</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${end < last}">
				<li><a
					href="showReportList.do?page=${end+1 }&boardname=${boardname }&keyword=${keyword }&numb=${numb }">[다음]</a></li>
				<li><a
					href="showReportList.do?page=${last }&boardname=${boardname }&keyword=${keyword }&numb=${numb }">[끝]</a></li>
			</c:if>
		</ul>
	</div>
	<%@ include file="/petst/footer.jsp"%>
</body>
</html>