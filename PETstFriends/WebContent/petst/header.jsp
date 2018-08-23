<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="keywords" content=" ">
    <meta name="author" content="ShapedTheme">

<!-- favicon icon -->
   <link rel="shortcut icon" href="assets/images/favicon.png">
<title>header</title><!-- common css -->
    <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="./assets/css/animate.min.css">
    <link rel="stylesheet" href="./assets/css/owl.carousel.css">
    <link rel="stylesheet" href="./assets/css/owl.theme.css">
    <link rel="stylesheet" href="./assets/css/owl.transitions.css">
    <link rel="stylesheet" href="./assets/css/slicknav.css">
    <link rel="stylesheet" href="./assets/style.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">

</head>
<body>
	<%
		boolean a = false;//어드민 이면 ture
		boolean b = false;//회원 이면 true
		if (session.getAttribute("user_id") != null && session.getAttribute("adminCheck") != null) {//아이디가 있고 어드민 있으므로 어드민
			a = true;
		} else if (session.getAttribute("user_id") != null) {
			b = true;
		}
		;
		pageContext.setAttribute("a", a);
		pageContext.setAttribute("b", b);
	%>
	<div class="main-logo text-center" style="background-color: white">

		<div class="container">
			<div class="menu-item-has-children" align="right">
				<c:choose>
					<c:when test="${a }">
						<a style="cursor: pointer">로그아웃</a>
					</c:when>
					<c:when test="${b}">
						<a style="cursor: pointer">고객센터</a>
						<a style="cursor: pointer">로그아웃</a>
						<a style="cursor: pointer">마이페이지</a>
						<a style="cursor: pointer">쪽지함</a>
					</c:when>
					<c:otherwise>
						<a style="cursor: pointer">고객센터</a>
						<a style="cursor: pointer"href="loginForm.do">로그인</a>
						<a style="cursor: pointer" href="joinUserForm.do">회원가입</a>
					</c:otherwise>
				</c:choose>

			</div>
		</div>

		<h1>
			<a href="#"><img src="assets/images/petstlogo_2.PNG" style=""></a>
		</h1>
	</div>

		<div class="container">

			<div class="row">
				<div class="col-md-12">
					<div class="main-menu text-uppercase">
						<ul id="menu">

							<li><a href="index.html">첫 화면으로</a></li>
							<li class="menu-item-has-children"><a href="#">펫프 모여라 </a></li>
							<li class="menu-item-has-children"><a href="#">펫프 광장 <i
									class="fa fa-angle-down"></i>
							</a>
								<ul class="sub-menu">
									<li><a href="#">강아지</a></li>
									<li><a href="#">고양이</a></li>
									<li><a href="#">토끼</a></li>
									<li><a href="#">기타</a></li>
								</ul></li>

							<li class="menu-item-has-children"><a href="">펫프정보 <i
									class="fa fa-angle-down"></i></a>
								<ul class="sub-menu">

									<li class="menu-item-has-children"><a href="">강아지 <i
											class="fa fa-angle-right"></i>
									</a>
										<ul class="sub-menu">
											<li><a href="#">강아지 종류</a></li>
											<li><a href="#">강아지 팁</a></li>
										</ul></li>

									<li class="menu-item-has-children"><a href="">고양이 <i
											class="fa fa-angle-right"></i>
									</a>
										<ul class="sub-menu">
											<li><a href="#">고양이 종류</a></li>
											<li><a href="#">고양이 팁</a></li>
										</ul></li>

									<li class="menu-item-has-children"><a href="">토끼 <i
											class="fa fa-angle-right"></i>
									</a>
										<ul class="sub-menu">
											<li><a href="#">토끼 종류</a></li>
											<li><a href="#">토끼 팁</a></li>
										</ul></li>
								</ul></li>




							<li><a href="#">병원</a></li>
							<li class="menu-item-has-children"><a href="#">플레이스</a>
							<li><a href="contact.html">펫프쇼핑비교</a></li>

							<c:if test="${a }">
								<li class="menu-item-has-children"><a href="">관리자 메뉴<i
										class="fa fa-angle-down"></i></a>
									<ul class="sub-menu">

										<li class="menu-item-has-children"><a href="">고객센터 관리
										</a>
										<li class="menu-item-has-children"><a href="">회원관리 <i
												class="fa fa-angle-right"></i>
										</a>
											<ul class="sub-menu">
												<li><a href="#">회원관리</a></li>
												<li><a href="#">쪽지</a></li>
											</ul></li>

										<li class="menu-item-has-children"><a href="">게시판관리 <i
												class="fa fa-angle-right"></i>
										</a>
											<ul class="sub-menu">
												<li><a href="#">신고글 보기</a></li>
												<li><a href="#">말머리 추가삭제</a></li>
											</ul></li>
									</ul></li>
							</c:if>


						</ul>
					</div>
				</div>
			</div>
		</div>
</body>
</html>