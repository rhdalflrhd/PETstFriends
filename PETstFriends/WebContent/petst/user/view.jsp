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
<h1><b><font color="gray"></font></b></h1>
		<br>
		
  
       
	

			<tr style="color: white;" bgcolor="#bebebe">
				<th>글번호</th><br>
				<th>제 목</th><br>
				<th>작성일</th><br>
				
				<th>작성자</th><br>
				
			</tr>

			<tr align="center" style="font-family: 'monaco';" bgcolor="white">
				<td>${qna.qnA_boardno }</td>
				<td>${qna.qnA_title }</td>
				<td>${date }</td>
				
				<td>${qna.qnA_userId }</td>
				
				
			</tr>

			<tr>
				<td style="color: white" bgcolor="#FFD2D2" align="center" colspan="10">
					내용</td>
			</tr>

			<tr>
				<td align="center" colspan="10" height="500">
			
				${qna.qnA_content }</td>
			</tr>

			<tr>
				<td colspan="7" align="right">
		<input type=button value="뒤로가기" onClick="history.back();">
			</tr>
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