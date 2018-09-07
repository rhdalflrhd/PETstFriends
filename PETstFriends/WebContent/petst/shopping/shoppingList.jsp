<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Rubel Miah">
    <link rel="shortcut icon" href="./Boot/images/favicon.png">

<title>펫프광장</title>

<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
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
<!-- 검색 -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
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
	color: #808080;
}

input::-webkit-input-placeholder {
	color: #808080;
}

 input::-moz-placeholder { 
 	color: #808080; 
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
		<br>
		<div style="border-bottom: 2px solid brown; width: 20%;">
               <div style="border-bottom: 5px solid #FFD232; width: 70%;">
               <h2>쇼핑비교</h2>
               </div>
               </div>
		<form action="shoppingList.do"  >
<br>
<div align="center">
			<input type="text" name="keyword" style="width: 300px" placeholder="검색어를 입력해주세요."required="required"  > <input type="submit"
				value="검색"  style="background-color: #EBC680" >
			</div>

			
			
			<br>
			<div class="container">
			<table>

				<tr>
					<th>상품번호</th>
					<th></th>
					<th>상품명</th>
					<th>최저가</th>
					<th>최대가</th>
					<th>쇼핑몰</th>
				</tr>

				<c:forEach var="shop" items="${sList }">
					<tr>
									<td>${shop.shopping_productId }</td>
						<td><a href="${shop.shopping_link }" target="_blank"/><img src="${shop.shopping_image }"  width="150"
							height="150"></td>
						<td width="200"><a href="${shop.shopping_link }" target="_blank"/>${shop.shopping_title }</td>
<%-- 						<td width="200"><a  href="${shop.shopping_link }"/>${shop.shopping_link }</td> --%>
						<td>${shop.shopping_lprice }</td>
						<td>${shop.shopping_hprice }</td>
						<td>${shop.shopping_mallName }</td>
		
					</tr>









				</c:forEach>

			</table>
		</div>
		</form>
		
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