<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">
// window.onload = function() {
// alert("ㅎㅎ")	
// };
$(document).ready(function(){
//alert("ㅎㅎ")

			$('#gg').on('click',function(){
				alert("일단들어옴")
				$.ajax({
			        url : 'Rabbit.do',
			        type: "get",
			        data : { "id" : "ryun" },
			        success : function(responseData){
			        	alert(responseData)
// 			            var dataa = JSON.parse(responseData);
// 			        	console.log(dataa);
			        },
			        error : function(xhr, status, error) {
		                 alert("에러발생");
			           }
			    });
			});

// 	$("#gg").bind("click",function(){
	    
// 		$.ajax({
// 	        url : contextPath+"/Rabbit.do",
// 	        type: "get",
// 	        data : { "id" : "ryun" },
// 	        success : function(responseData){
// 	        	alert("통신성공")
// 	            var dataa = JSON.parse(responseData);
// 	        	console.log(dataa);
// 	        },
// 	        error : function(xhr, status, error) {
//                  alert("에러발생");
// 	           }
// 	    });
		
		
// 	});	
});
</script>
</head>
<body>
	<center>
		<font color="grey" style="font-family: Georgia; font-weight: bold;">
			
			<input type="button" id="gg" value="클릭ㅎ"  >
			
			<h1>토끼 종정보 페이지</h1>
			<table>
				<tr>
					<td height="3" colspan="6" bgcolor="brown"></td>
				</tr>

				<c:forEach items="${RabbitEncycList1 }" var="e" varStatus="i">

					<tr>
						<td rowspan="2"><c:if test="${empty e.encyc_thumbnail}">제공되는 썸네일이없습니다.</c:if>
							<c:if test="${not empty e.encyc_thumbnail}">
								<img src="${e.encyc_thumbnail}">
							</c:if><br></td>
						<td width="200">${i.count}. ${e.encyc_title}</td>
						<td width="200"><a href=" ${e.encyc_link} ">상세내용보기</a></td>
					</tr>
					<tr>
						<td colspan="6">${e.encyc_description}</td>
					</tr>
					<tr>
						<td colspan="6" height="1" width="1000" bgcolor="brown"></td>
					</tr>
				</c:forEach>
			</table>
			
			<table>
				<tr>
					<td height="3" colspan="6" bgcolor="brown"></td>
				</tr>

				<c:forEach items="${RabbitEncycList2 }" var="e" varStatus="i">

					<tr>
						<td rowspan="2">
						<c:if test="${empty e.encyc_thumbnail}">
						제공되는 썸네일이없습니다.
						</c:if>
						<c:if test="${not empty e.encyc_thumbnail}">
						<img src="${e.encyc_thumbnail}">
						</c:if><br>
						</td>	
											
						<td width="200">						
						<c:choose>
						<c:when test="${e.encyc_title eq '무주의 동물상 (무주)'}">
<%-- 						${i.count+91} 흠좀무 --%>
  						</c:when>
  						<c:when test="${e.encyc_title eq '토끼'}">
<%-- 						${i.count+91} 흠좀무 --%>
  						</c:when>
  						<c:when test="${e.encyc_title eq '래빗'}">
<%-- 						${i.count+91} 흠좀무 --%>
  						</c:when>
  						<c:otherwise>
						${i.count+91}. ${e.encyc_title}
  						</c:otherwise>
						</c:choose>   
						</td>
						
						<td width="200">
						<a href=" ${e.encyc_link} ">상세내용보기</a>
						</td>
					</tr>
					<tr>
						<td colspan="6">
<%-- 						${e.encyc_description} --%>
						<c:choose>
						<c:when test="${e.encyc_title eq '무주의 동물상 (무주)'}">
<!-- 						흠좀무 -->
  						</c:when>
  						<c:otherwise>
						${e.encyc_description}
  						</c:otherwise>
						</c:choose>   	
						</td>
					</tr>
					<tr>
						<td colspan="6" height="1" width="1000" bgcolor="brown"></td>
					</tr>
				</c:forEach>
			</table>
		
		</font>
	</center>
</body>
</html>