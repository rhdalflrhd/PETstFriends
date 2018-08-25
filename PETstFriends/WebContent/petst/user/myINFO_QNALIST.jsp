<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Rubel Miah">
     <link rel="shortcut icon" href="./assets/images/favicon.png">
      <link rel="shortcut icon" href="./assets/images/favicon.png">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>내가 작성한 글 </title>

  <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="./assets/css/animate.min.css">
    <link rel="stylesheet" href="./assets/css/owl.carousel.css">
    <link rel="stylesheet" href="./assets/css/owl.theme.css">
    <link rel="stylesheet" href="./assets/css/slicknav.css">
    <link rel="stylesheet" href="./assets/style.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
    

</head>
<!-- <style> -->
<!-- /* .layer{ */ -->
<!-- /*   position:absolute; */ -->
<!-- /*   top:50%;  */ -->
<!-- /*   left:40%;  */ -->
<!-- /*   width:400px; */ -->
<!-- /*   height:300px; */ -->
<!-- /*   background:; */ -->
<!-- /*   margin:-50px 0 0 -50px; */ -->
<!-- /* } */ -->

<!-- </style> -->
   
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">


</script>
<style type="text/css">
    .bs-example{
    	margin: 10px;
    	
    }

 
</style>
<body>


<div class="wrapper">
 
<!--        <header id="header"> -->
<%@ include file="/petst/header.jsp" %>
    <!--header section end-->
<div class="bs-example">
	<ul class="nav nav-tabs navbar-right" >
        <li><a href="getUserId.do">내정보수정</a></li>
        <li><a href="#">내가쓴게시글</a></li>
        <li class="active"><a href="#">내가문의한글</a></li>
         <li><a href="#">내가좋아요한글</a></li>
          <li><a href="#">내가참여한모임</a></li>
	</ul>
</div>

<center>

<colgroup>
<col width = "7%">
<col width = "*%">
<col width = "17%">
<col width = "10%">
<col width = "7%">

</colgroup>


<div class="memberout-wrap"  style="border: none; height: 850px; width: 850px;" >


<div class = "container">
		<table class = "table table-board">
		

	<tr>
				
				<th width="700px" align="center">제 목</th>
				<th width="150px" align="center">작성자</th>
				<th width="200px" align="center">작성일</th>
			
				
	</tr>
	<tr>
				<td width="1250px" colspan="5" bgcolor="yellow"></td>
			</tr>

<c:forEach items="${qnaList}" var="qna">
				<tr>
								<td>
		<c:if test="${empty qna.qnA_title}"><a href="view.do?num=${qna.num }">제목없음</a></c:if>
		<c:if test="${not empty  qna.qnA_title}"><a href="view.do?num=${qna.num }">${ qna.qnA_title }</a></c:if>	
					</td>
				
					<td align="center">
					<fmt:formatDate value="${qna.qnA_writeDate }"
							pattern="yyyy-MM-dd" /></td>
							
				
					<td align="center">${qna.qnA_userId }</td>
				</tr>
</c:forEach>
			
			<tr>
				<td width="1250px" colspan="5" bgcolor="yellow"></td>
			</tr>
			
			<tr>
				<td width="1250px" colspan="5">
					<c:if test="${start != 1 }">
						<a href="myinquiry.do?page=1">[처음]</a>
						<a href="myinquiry.do?page=${start-1 }">[이전]</a>
					</c:if>
					
					<c:forEach begin="${start }" end="${end }" var="i">
						<c:choose>
							<c:when test="${i == current }">
								[${i }]
							</c:when>
							<c:otherwise>
								<a href="myinquiry.do?page=${i }">[${i }]</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${end != last }">
						<a href="myinquiry.do?page=${end+1 }">[다음]</a>
						<a href="myinquiry.do?page=${last }">[끝]</a>
					</c:if>
				</td>
				
		
		</table>	

</div>

</center>

<!--   <footer id="footer"> -->
<%@ include file="/petst/footer.jsp" %>
    <!--footer end-->
	<script type="text/javascript" src="./assets/js/modernizr-2.6.2.min.js"></script>
<script type="text/javascript" src="./assets/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="./assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./assets/js/smoothscroll.js"></script>
<script type="text/javascript" src="./assets/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="./assets/js/imagesloaded.pkgd.js"></script>
<script type="text/javascript" src="./assets/js/isotope.2.2.2min.js"></script>
<script type="text/javascript" src="./assets/js/jquery.fitvids.js"></script>
<script type="text/javascript" src="./assets/js/jquery.stickit.min.js"></script>
<script type="text/javascript" src="./assets/js/jquery.slicknav.js"></script>
<script type="text/javascript" src="./assets/js/scripts.js"></script>


</body>
</html>