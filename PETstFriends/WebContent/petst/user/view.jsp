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
</script>
<style type="text/css">

 .nav  {
  display: table;
  margin-left: auto;
  margin-right: auto;
}
</style>
<body>

	
<div class="wrapper">
 
<!--        <header id="header"> -->
<%@ include file="/petst/header.jsp" %>
    <!--header section end-->
<br>
	<center>	
<div class="bs-example">
	
	<ul class="nav nav-tabs navbar-" >
	
        <li><a href="getUserId.do">내정보수정</a></li>
        <li><a href="myWritesList.do">내가쓴게시글</a></li>
        <li class="active"><a href="myinquiry.do">내가문의한글</a></li>
         <li><a href="myLikesList.do">내가좋아요한글</a></li>
          <li><a href="myMeetingApply.do">내가참여한모임</a></li>
         
	</ul>
	</div>
	
<center>
<div class="row">
                <div class="col-md-8 col-sm-8" >
</center>
                    <article class="post">
                        <header class="entry-header text-center">
                            <h2 class="entry-title" > 제목 : ${qna.qnA_boardtitle }</h2>

                            <div class="entry-meta">
                                <span class="date"><i class="fa fa-clock-o"></i> 작성일 : <fmt:parseDate value ="${qna.qnA_writeDate }" var = "wriedate" pattern = "yyyymmdd" ></fmt:parseDate><fmt:formatDate value="${wriedate}" pattern="yyyy-MM-dd" /></span>
                                  <span class="cat"><i class="fa fa-folder-open-o"></i>작성자 : ${qna.qnA_userId }</span>
                           
                            </div>
                        </header>


                        <div class="" style="border:1px solid #FFD700 ; height: 500px; width: 500px;">
                           <p>${qna.qnA_content}" </p>

                            
                        </div>
	<td colspan="2" align="center">
						<input type=button value="뒤로가기" onClick="history.back();" class="btn btn-warning btn-xs">
     


					</td>
                      
                    </article>
</center>
</div>
</div>

</div>

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