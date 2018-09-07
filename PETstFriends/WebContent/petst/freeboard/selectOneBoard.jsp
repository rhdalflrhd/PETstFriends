<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Rubel Miah">

<!-- favicon icon -->
<link rel="shortcut icon" href="assets/images/favicon.png">

<title>게시글 하나보기</title>

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
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


<!-- HTML5 shim and Respond.js IE9 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="assets/js/html5shiv.js"></script>
    <script src="assets/js/respond.js"></script>
    <![endif]-->

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var numb = 3;//나중에 고치기?????????
		
		$('#deleteBtn').click(function() {
			var result = confirm('삭제하시겠습니까?');
			if (result == true) {
				location.href = 'dogDeleteFreeBoard.do?freeBoard_boardname='+${freeBoard_boardname}
				+'&freeBoard_boardno='+ ${freeBoard_boardno}
			} else {
			}
		})
		//===========================댓글=====================================
		//=================댓글
		var comment_start = ${comment_start}
			var comment_end = ${comment_end }
			var comment_current = ${comment_current}
			var comment_last = ${comment_last}
			var boardno = ${freeBoard.freeBoard_boardno};
			var boardname = ${freeBoard.freeBoard_boardname};
			var comment_finalpage = ${comment_current};
			var comment_page = ${comment_current};
			var listsize = ${listsize}%3;
			//댓글 리스트 불러오기
			var cPaging = function(){
				$.ajax({
					type : 'GET',
					url : 'freeCommentList.do',
					data : {
						"comment_page" : comment_page,
						"freeBoard_boardname" : boardname, 
						"freeBoard_boardno" : boardno
					},
					dataType : 'json',
					success : function(data) {
						var fList = JSON.parse(data.freeCommentList);
						comment_current = comment_page;
						var commentList = data;
						var commentStr = '';
						for(var i in fList){
							if(fList[i].freeComments_commentno == fList[i].freeComments_parent){
								commentStr +='<tr><td colspan="2" style="text-align: left;">닉네임'+fList[i].freeComments_nickname+'</td>'
							}else{
								commentStr +='<tr><td class="reTD"></td><td><i class="fa fa-level-up fa-rotate-90"></i>&nbsp;닉네임'
								+fList[i].freeComments_nickname+'</td>'
							}
							commentStr += '<td class="btnTD">날짜'+fList[i].freeComments_writeDate+'</td></tr><tr">';
							if(fList[i].freeComments_commentno == fList[i].freeComments_parent){
								commentStr += '<td colspan="2" style="text-align: left;">';
							}else{
								commentStr +='<td class="reTD"></td><td>';
							}
							if(fList[i].freeComments_content != null){
								commentStr +=fList[i].freeComments_content +'</td><td class="btnTD">';
								if(data.user_idCheck!=null){
									commentStr +='<button value="'+fList[i].freeComments_parent +'&'+fList[i].freeComments_nickname+'" class="reComBtn">답글</button>';
									if(fList[i].freeComments_content !=null && fList[i].freeComments_userId==data.user_idCheck){
										commentStr += '<button value="'+fList[i].freeComments_commentno+'" class="modifyComBtn">수정</button><button value="'
										+fList[i].freeComments_commentno+'&'+fList[i].freeComments_parent
										+'"class="deleteComBtn">삭제</button>';
									}
									}
							}
							else{
								commentStr += '이미 삭제된 댓글입니다.' +'</td><td class="btnTD">';
							}
							
							commentStr += '</td></tr>'
						}
						$('#commentTable').empty();
						$('#commentTable').append(commentStr);
						comment_end = data.comment_end;
						comment_current = data.comment_current;
						comment_last = data.comment_last;
						comment_start = data.comment_start;
						var paginStr='';
						if(comment_start != 1){
							paginStr += '<li><a class="pagingFun" page='+1+'>[처음]</a></li>'
							+'<li><a class="pagingFun"page='+(comment_start-1)+'>[이전]</a></li>';
						}
						for(var i = comment_start; i <= comment_end; i++){
							if(i == comment_current)
								paginStr +='<li><a page='+i+' class="pagingFun" style="background-color: #eeeeee;">['+i+']</a></li>';
							else
								paginStr +='<li><a page='+i+' class="pagingFun">['+i+']</a></li>';
						}
						if(comment_end < comment_last){
							paginStr +='<li><a class="pagingFun" page='+(comment_end+1) +'>[다음]</a></li>'
							+'<li><a class="pagingFun" page='+comment_last+'>[끝]</a></li>'
						}
						$('.pagination').empty();
						$('.pagination').append(paginStr);
					},
					error : function(xhrReq, status, error) {
						alert(error)
					}
			});
			}
			
			//다른 페이지 클릭시
			$(document).on('click', '.pagingFun', function(){
				comment_page = $(this).attr("page");
				cPaging();
				event.preventDefault();
				});
			
			//답글달기 클릭시
			$(document).on('click', '.reComBtn', function(){
				var tr = $(this).parent().parent();
				var str = $(this).val();
				var strArr = str.split('&');
				var freeComments_parent = strArr[0];//패런트넘
				var freeComments_nickname = '';//답글주인의 닉네임
				
				for(var i = 1; i<strArr.length; i++)
					freeComments_nickname +=strArr[i];
				var tableStr = '';
				tableStr +='<tr><td colspan=3><div><img src="./Boot/images/comment.jpg" class="pull-left"><p align="left" style="font-size: 16px;">'
						+'<i class="fa fa-level-up fa-rotate-90"></i> @'+freeComments_nickname
						+ '</p><p align="left"><textarea id="rereply_content" rows="3" cols="120" name="rereply_content"></textarea>'
						+'</p><button class="rereply_save" name="rereply_save"'
						+' value='+freeComments_parent+'&'+freeComments_nickname
						+'>댓글 등록</button></div></td></tr><tr></tr>';
				tr.after(tableStr);
			})
			
			//답글 등록시
			$(document).on('click', '.rereply_save', function(){
				var freeComments_info = $(this).val();
				var freeArray = freeComments_info.split('&');
				var freeComments_parent  = freeArray[0];
				var freeComments_nickname='';
				for(var i = 1; i <freeArray.length; i++)
					freeComments_nickname += freeArray[i];
				var freeComments_content = '<a>'+freeComments_nickname+'</a> '+$('#rereply_content').val();//내용
				$.ajax({
					type : 'GET',
					url : 'writefreeComment.do',
					data : {
						"freeComments_content" : freeComments_content,
						"freeComments_parent" : freeComments_parent,
						"freeBoard_boardname" : boardname, 
						"freeBoard_boardno" : boardno
					},
					success : function(data) {
						listsize++;
						cPaging();
					},
					error : function(xhrReq, status, error) {
						alert(error)
					}
				});	
			});
			
			//그냥 댓글 달때
			$(document).on('click', '.reply_save', function(){
				var freeComments_content = $('#reply_content').val();//내용
				var freeComments_parent = 0;
				$('#reply_content').val('');
				$.ajax({
					type : 'GET',
					url : 'writefreeComment.do',
					data : {
						"freeComments_content" : freeComments_content,
						"freeComments_parent" : freeComments_parent,
						"freeBoard_boardname" : boardname, 
						"freeBoard_boardno" : boardno
					},
					success : function(data) {
						listsize++;
						if(listsize > numb){
							comment_finalpage = comment_finalpage+1;
							listsize= listsize%3;
						}
						comment_page = comment_finalpage;
						
						cPaging();
					},
					error : function(xhrReq, status, error) {
						alert(error)
					}
				});	
			});
			//댓글 삭제시
			$(document).on('click', '.deleteComBtn', function(){
				var str = $(this).val();
				var strArr = str.split('&');
				var freeComments_commentno = strArr[0];//패런트넘
				var freeComments_parent = '';//답글주인의 닉네임
				for(var i = 1; i<strArr.length; i++)
					freeComments_parent +=strArr[i];
				$.ajax({
					type : 'GET',
					url : 'deletefreeComment.do',
					data : {
						"freeComments_commentno" : freeComments_commentno,
						"freeComments_parent" : freeComments_parent
					},
					success : function(data) {
						listsize--;
						if(listsize < 1){
							comment_finalpage = comment_finalpage-1;
							comment_page = comment_page-1;
							listsize=3;
						}
						alert(comment_page+"페이지현재")
						cPaging();
					},
					error : function(xhrReq, status, error) {
						alert(error)
					}
				});	
			});
			//댓글 수정폼
			$(document).on('click', '.modifyComBtn', function(){
				var freeComments_commentno = $(this).val();
				var tr = $(this).parent().parent();
				var td = tr.children();
				var nick = '';
				if(td.eq(0).text()==''){
					alert('d')
					var comment_content = td.eq(1).text();
					var str = comment_content;
					alert(str)
					var strArr = str.split(' ');
					nick =strArr[0]+' ';
				}
				else
					var comment_content = td.eq(0).text();
				nick = nick.trim();
				comment_content = comment_content.replace(nick, "");
				alert(nick)
				alert(comment_content)
				comment_content=comment_content.trim();
				alert(comment_content)
				tr.empty();
				var tableStr ='';
				tableStr +='<td colspan=3><div><textarea class="modi_content" style="text-align=left;" rows="3" cols="120" name="modi_content">'
					+comment_content+'</textarea>'
					+'</p><button class="reply_modi" name="reply_modi"'
					+'value="'+'<a>'+nick+'</a>'+freeComments_commentno+'">수정하기</button></div></td>';
				tr.after(tableStr);
			})
			
			//댓글 수정하기
			$(document).on('click', '.reply_modi', function(){
				var str = $(this).val();
				var strArr = str.split('</a>');
				var nick = strArr[0]+'</a>';
				var freeComments_commentno=str.replace(nick,"");
				var freeComments_parent = '';//답글주인의 닉네임
				var freeComments_content = nick+' '+$('.modi_content').val();
//		 		alert(freeComments_content)
//		 		alert(freeComments_commentno)
				$.ajax({
					type : 'GET',
					url : 'updatefreeComment.do',
					data : {
						"freeComments_commentno" : freeComments_commentno,
						"freeComments_content" : freeComments_content
					},
					success : function(data) {
						cPaging();
					},
					error : function(xhrReq, status, error) {
						alert(error)
					}
				});	
			})
		
		
		
		
	});
</script>
<style type="text/css">
.rereply_save {
	background-color: #CD853F;
	color: white;
	font-size: 15px;
	font-weight: bold;
	border: 1;
	border-color: #CD853F;
	border-radius: 5px;
}
table{
 border-collapse: collapse;
width: 100%;
}
tr:nth-child(odd)  { 
  border-top : 1px dashed gray;
}
tr:nth-child(1)  { 
 border-top : none; 
}
th, td{
text-align: left;
padding : 10px;
}
h4 {
	font-family: 'NanumSquareRound', sans-serif;
}

ul, li {
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

.main-content {
	position: relative;
	left: 22%;
	margin-left: -375px;
	text-align: center;
}
.chooseYourDesc a {
	color: #fff;
	background-color: #FFD232;
	border: 1px solid #FFD232;
	border-radius: 5px;
	font-family: 'NanumSquareRound', sans-serif;
	font-size: 15px !important;
	font-weight: bold;
	height: 35px;
	width: 130px;
	line-height: 35px;
	padding: 0;
	margin-right: 5px;
}

.chooseYourDesc a:hover {
	color: #fff;
	border: 1px solid #d2d2d2;
	background-color: #d2d2d2;
}
.reTD{
width: 10%;
}
.btnTD{
width: 20%;
}
a{
color : #BDBDBD;
cursor: pointer;
}
.rereply_save, .reply_save, .reply_modi {
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
input[type="button"]{ 
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
.reComBtn, .modifyComBtn, .deleteComBtn{
border: 0;
/* opacity: 0.5; */
color: balck;
background : #00ff0000;
}
</style>
</head>
<body>

	<%@ include file="/petst/header.jsp"%>
	<div class="wrapper">
		<div class="container">
		<br>
				<div style="border-bottom: 2px solid brown; width: 22%;">
               <div style="border-bottom: 5px solid #FFD232; width: 70%;">
               <h2>펫프광장</h2>
               </div>
               </div>
		<br>
				<br>
				<article> 
		<table class="table">

			<tr align="center" style="font-family: 'monaco';" bgcolor="white">
				<td style="width: 100px">${freeBoard.freeBoard_boardno }</td>
				<td style="width: 400px; text-align: left;">${freeBoard.freeBoard_title }</td>
					<td style="width: 100px"></td>
				<td style="width: 100px">${freeBoard.freeBoard_writeDate }</td>
				<td style="width: 100px">조회수 : ${freeBoard.freeBoard_readCount }</td>
					<td  style="width: 100px">♥ ${freeBoard.freeBoard_LikeCount }</td>
				
			</tr>
			<tr>
			<td align="left"text-align: left;" >작성자 : ${freeBoard.freeBoard_nickname }</td>
				<td align="left" colspan="7" height="200" width="700">
					${freeBoard.freeBoard_content }</td>					
			</tr>
	
			<tr>
											
				<td colspan="7" align="right"><br>
		<c:if test="${freeBoard.freeBoard_userId eq user_idCheck}">
						<input type="button"  value="수정하기"
							onclick="location.href='dogModifyFreeBoardForm.do?freeBoard_boardno=${freeBoard.freeBoard_boardno}&freeBoard_boardname=${freeBoard.freeBoard_boardname }'">

					</c:if> <input type="button"  value="목록"
					onclick="location.href='dogFreeBoardList.do'"> 
					<input type="button" 
					value="뒤로" onclick="history.back();" />
					 <c:if
 						test="${freeBoard.freeBoard_userId eq user_idCheck}">
						<input type="button"  value="삭제"  id="deleteBtn" onclick="removeCheck()" > 
 					</c:if>  
			</td> 
			</tr>

		</table>
		<div class="bottom-comment" style="background-color: #FAFAFA;">
						<table id="commentTable" style="border: none;">
								<c:forEach items="${commentList }" var="comment">
									<tr style="border-bottom: none;">
										<c:if
											test="${comment.freeComments_commentno == comment.freeComments_parent}">
											<td colspan="2">
												닉네임${comment.freeComments_nickname}
											</td>
										</c:if>
										<c:if
											test="${comment.freeComments_commentno != comment.freeComments_parent}">
											<td class="reTD"></td>
											<td>
												<div style="display: inline-block;"></div>
												<i class="fa fa-level-up fa-rotate-90 fa-1x"></i>&nbsp;닉네임${comment.freeComments_nickname}
											</td>
										</c:if>
										<td class="btnTD">날짜${comment.freeComments_writeDate }</td>
									</tr>
									<tr>
										<c:if
											test="${comment.freeComments_commentno == comment.freeComments_parent}">
											<td colspan="2"><c:if
													test="${comment.freeComments_content ==null}">
											삭제된 댓글입니다.
											</c:if> 
											<c:if test="${comment.freeComments_content !=null}">
											${comment.freeComments_content }
											</c:if></td>
										</c:if>
										<c:if
											test="${comment.freeComments_commentno != comment.freeComments_parent}">
											<td class="reTD"></td>	
											<td>
												${comment.freeComments_content }</td>
										</c:if>
										<td class="btnTD"><c:if test="${user_idCheck != null }">
												<button
													value="${comment.freeComments_parent }&${comment.freeComments_nickname}"
													class="reComBtn">답글</button>
											</c:if> <c:if
												test="${comment.freeComments_content !=null &&
											comment.freeComments_userId eq user_idCheck}">
												<button value="${comment.freeComments_commentno}"
													class="modifyComBtn">수정</button>
												<button
													value="${comment.freeComments_commentno}&${comment.freeComments_parent}"
													class="deleteComBtn">삭제</button>
											</c:if></td>
									</tr>
								</c:forEach>
							</table>
							</div>
							<div align="center"  style="background-color: #FAFAFA;">
							<ul class="pagination">
								<!-- 			스타트 엔드 페이지는 페이지값 보고!  -->
								<c:if test="${comment_start != 1 }">
								
									<li><a class="pagingFun" page=1>[처음]</a></li>
									<li><a class="pagingFun" page=${comment_start-1 }>[이전]</a></li>
								</c:if>
								<c:forEach begin="${comment_start }" end="${comment_end }"
									var="i">
									<c:choose>
										<c:when test="${i == comment_current }">
											<li><a style="background-color: #eeeeee;">[${i }]</a></li>
										</c:when>
										<c:otherwise>
											<li><a page=${i } onclick="return false;"
												class="pagingFun"> [${i }]</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${end < last}">
									<li><a class="pagingFun"
										onclick="commentPage(${comment_end+1 })">[다음]</a></li>
									<li><a class="pagingFun"
										onclick="commentPage(${comment_last })">[끝]</a></li>
								</c:if>
							</ul>
							</div>
							<c:if test="${user_idCheck != null }">
							<div id="testComment" class="top-comment"
								style="border: none; background-color:#FAFAFA;">
								<!--top comment-->

								<img src="./Boot/images/comment.jpg" class="pull-left">
								<%-- 							<h3 align="left">닉네임: ${user_idCheck}</h3> --%>
								<p align="left" style="font-size: 16px;">닉네임:
									${freeBoard_nickname}</p>
								<p align="left">
									<textarea id="reply_content" rows="3" cols="120"
										name="reply_content" placeholder="댓글을 입력하세요."></textarea>
								</p>
								<button class="reply_save" name="reply_save" value=0>댓글 등록</button>
<!-- 									style="background-color: #CD853F; color: white; font-family: 'NanumSquareRound', sans-serif; font-size: 15px; font-weight: bold; border: 1; border-color: #CD853F; border-radius: 5px;" -->
									

							</div>
						</c:if>
						</div>
						<div style="height: 30px;"></div>
						
						<!--top comment end-->
						<br> <br>
</article>
</div>
</div>



	<%@ include file="/petst/footer.jsp"%>
	<!-- js files -->

</body>
</html>