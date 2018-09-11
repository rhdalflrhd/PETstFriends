<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<link rel="stylesheet" href="./Boot/css/bootstrap.min.css">
<link rel="stylesheet" href="./Boot/css/font-awesome.min.css">
<link rel="stylesheet" href="./Boot/css/animate.min.css">
<link rel="stylesheet" href="./Boot/css/owl.carousel.css">
<!-- <link rel="stylesheet" href="./Boot/css/owl.theme.css"> -->
<!-- <link rel="stylesheet" href="./Boot/css/slicknav.css"> -->
<link rel="stylesheet" href="./Boot/style.css">
<link rel="stylesheet" href="./Boot/css/responsive.css">
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
.none{ 
display:none; 
}
.pointer{ 
cursor:pointer; 
}
#writeBoard, button {
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
<script type="text/javascript">
	 function FaqToggleDetail ( id ){
		 alert(id)
		var latestToggleObj = null;
		var oObj = document.getElementById( id );	
		alert(oObj)
		if( this.latestToggleObj != null ){
			this.latestToggleObj.className = (this.latestToggleObj.className + " none");
		}
		if( this.latestToggleObj == oObj ){
			this.latestToggleObj = null;
			return;
		}
		this.latestToggleObj = null;
		if( oObj.className.indexOf( "none" ) != -1 ){
			oObj.className = oObj.className.replace( "none", "" );			
		}else{
			oObj.className = (oObj.className + " none");
		}
		this.latestToggleObj = oObj;
	 }
</script>
<title>자주하는 질문</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function() {
$('.deleteBtn').click(function(){
	var result = confirm('삭제하시겠습니까?');
	if(result){
		var boardno = $(this).val();
		location.href='deleteOftenQnA.do?oftenQnA_boardno='+boardno;
	}
	else{
	}
})
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
							<li><a href="showNoticeList.do">공지사항</a></li>
								<li><a href="showOftenQnAList.do">자주하는 질문</a></li>
								<li><a href="qnA.do">1:1 문의</a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-8 col-sm-8"
					style="border-left: 1px solid gray; width: 80%; display: inline-block;">
				
				<div style="border-bottom: 2px solid brown; width: 30%;">
					<div style="border-bottom: 5px solid #FFD232; width: 80%;">
					<h2>자주하는 질문</h2>
					</div>
					</div>
					<div style="height: 20px;"></div><br><br>
				<table class="table">
					<thead>
						<tr>
							<th>글 번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${oqList }" var="oftenQnA" varStatus="status">
							<tr class="pointer" onclick="FaqToggleDetail( 'row_${status.count}' )">
								<td>${oftenQnA.oftenQnA_boardno }</td>
								<td width="50%;">
<%-- 								<a href="showOftenQnA.do?oftenQnA_boardno=${oftenQnA.oftenQnA_boardno }"> --%>
										${oftenQnA.oftenQnA_title }
<!-- 										</a> -->
										</td>
								<td>관리자</td>
<%-- 								${oftenQnA.oftenQnA_adminId } --%>
								<td>
								<c:set var="str1" value="${oftenQnA.oftenQnA_writeDate }"/>
								${fn:substringBefore(str1, '.0')}
								</td>
							</tr>
							<tr class="none" id="row_${status.count}" >
							<td colspan="4">${oftenQnA.oftenQnA_content }
							<br>
							<%-- 							<c:if test="${admin_check != null}"> --%>
							<button class="deleteBtn" value="${oftenQnA.oftenQnA_boardno }">삭제하기</button>
<!-- 								<input type="button" class="deleteBtn" value="삭제하기"> -->
							<button onclick="location.href='modifyOftenQnAForm.do?oftenQnA_boardno=${oftenQnA.oftenQnA_boardno }'">
							수정하기</button>
<%-- 								</c:if> --%>
							</td>
							
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
				<c:if test="${adminCheck != null}"> 
				<input type="button" value="글쓰기" id="writeBoard" onclick="location.href='writeOftenQnAForm.do'">
			</c:if> 
			</div>
		</div>
	<div style="height: 20px;"></div>
	<div class="container" style="text-align: right;">
	<div id="writeBox">
	
</div>
	</div>	
	</div>
<%@ include file="/petst/footer.jsp"%>
</body>
</html>