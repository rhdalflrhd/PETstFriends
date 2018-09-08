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
<link href="https://use.fontawesome.com/releases/v5.0.1/css/all.css"
	rel="stylesheet">
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

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


<!-- HTML5 shim and Respond.js IE9 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="assets/js/html5shiv.js"></script>
    <script src="assets/js/respond.js"></script>
    <![endif]-->
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

table {
	border-collapse: collapse;
	width: 100%;
}

tr:nth-child(odd) {
	border-top: 1px dashed gray;
}

tr:nth-child(1) {
	border-top: none;
}

th, td {
	text-align: left;
	padding: 10px;
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

.reTD {
	width: 10%;
}

.btnTD {
	width: 20%;
}

a {
	color: #BDBDBD;
	cursor: pointer;
}

.rereply_save, .reply_save, .reply_modi {
	margin: 5px 5px 6px;
	text-decoration: none;
	border: 0;
	background-color: #dcdcdc;
	position: relative;
	float: right;
	padding: 0.438em 0.625em 0.438em 0.625em;
	line-height: 1.125em;
	cursor: pointer;
	color: white;
}

input[type="button"] {
	margin: 5px 5px 6px;
	text-decoration: none;
	border: 0;
	background-color: #dcdcdc;
	position: relative;
	float: right;
	padding: 0.438em 0.625em 0.438em 0.625em;
	line-height: 1.125em;
	cursor: pointer;
	color: white;
}

.reComBtn, .modifyComBtn, .deleteComBtn {
	border: 0;
	/* opacity: 0.5; */
	color: balck;
	background: #00ff0000;
}
.pop-layer .pop-container {
  padding: 20px 25px;
}

.pop-layer p.ctxt {
  color: #666;
  line-height: 25px;
}

.pop-layer .btn-r {
  width: 100%;
  margin: 10px 0 20px;
  padding-top: 10px;
  border-top: 1px solid #DDD;
  text-align: right;
}

.pop-layer {
  display: none;
  position: absolute;
  top: 50%;
  left: 50%;
  width: 410px;
  height: auto;
  background-color: #fff;
  border: 5px solid #3571B5;
  z-index: 10;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		examFunction();//-유튜브소환
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
		
			
			//----------------------------------------------------유튜브
			function examFunction(){
			var test ="${freeboard.freeBoard_YoutubeUrl}";

			function youtubeId(url) {
				console.log(url);
			    var tag = "";
			    if(url)  {
			        var regExp = /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/;
			        var matchs = url.match(regExp);
			        if (matchs) {
			            tag = matchs[7];
			        }
			        console.log(tag);		   
			        return tag;
			    }
			}
			 var result = youtubeId(test);
			 console.log(result);
			 var finytb ="http://www.youtube.com/embed/"+result+"?autoplay=1&loop=1&playlist="+result;
			 console.log(finytb);
			 $('#iframe').attr('src',finytb);
			}//function examFunction()끝
			
			//--------------------------------로그인안하고 좋아요 누를시
			$('#loginNeedLike').on('click',	function login_need(){
				
				 if (confirm("로그인이 필요합니다. 로그인하시겠습니까?") == true){    //확인
					alert("로그인페이지로 이동합니다.");
					document.location.href = "loginForm.do";
				 }else{   //취소
				     return false;
				 }
							
			});
		
			//--------------------------------작성자 아이디 클릭시 뜨는 레이어팝업창----------------------
			$('.btn-example').click(function(){
		        var $href = $(this).attr('href');
		        layer_popup($href);
		    });
			
			function layer_popup(el){

		        var $el = $(el);        //레이어의 id를 $el 변수에 저장
		        var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

		        isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

		        var $elWidth = ~~($el.outerWidth()),
		            $elHeight = ~~($el.outerHeight()),
		            docWidth = $(document).width(),
		            docHeight = $(document).height();

		        // 화면의 중앙에 레이어를 띄운다.
		        if ($elHeight < docHeight || $elWidth < docWidth) {
		            $el.css({
		                marginTop: -$elHeight /2,
		                marginLeft: -$elWidth/2
		            })
		        } else {
		            $el.css({top: 0, left: 0});
		        }

		        $el.find('a.btn-layerClose').click(function(){
		            isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
		            return false;
		        });

		        $('.layer .dimBg').click(function(){
		            $('.dim-layer').fadeOut();
		            return false;
		        });

		    }	
			
			$('.imgSelect').click(function(e) {
		    var divTop = e.clientY - 40; //상단 좌표 위치 안맞을시 e.pageY
		    var divLeft = e.clientX; //좌측 좌표 위치 안맞을시 e.pageX 
		    var serial = $(this).attr("serial");
		    var idx = $(this).attr("idx");
		    
		    $('#divView').empty().append(
		    '<div style="position:absolute;top:5px;right:5px"><span id="close" style="cursor:pointer;font-size:1.5em" title="닫기">X</span> </div><br><a href="?serial=' + serial + '">serial</a><BR><a href="?idx=' + idx + '">idx</a>');
		   
		    $('#divView').css({
		     "top": divTop 
		    ,"left": divLeft 
		    , "position": "absolute"
		     }).show(); 
		    	
		    $('#close').click(function(){document.getElementById('divView').style.display='none'});
		    	 
			});
		   
	});
</script>
<script type="text/javascript">
var aaa = function(){
	$(document).ready(function(){
		 var boardno = ${freeBoard_boardno};
		  var boardname = ${freeBoard_boardname};
		  var userid = $('#user_idCheck').val();
		  
		  $.ajax({
		    url: "insertLikesFreeBoard.do",
		    type: "GET",
		    cache: false,
		    dataType: "json",
		    data: 'boardno=' +boardno+ '&boardname=' +boardname,
		    success: function(data) {
		    
		      var msg = data.mm;
		      alert(msg);
		      var like_msg='';
		      $('#heart').empty();
		      if(data.like_check == 0){//좋아요 취소시
		      $('#heart').append('<i class="far fa-heart" onclick="aaa()" style="cursor: pointer;"></i>');
		      } else {
		    	  $('#heart').append('<i class="fa fa-heart" onclick="aaa()" style="cursor: pointer;"></i>');
		      } 
		      $('#likecount').html(data.like_cnt)
		    },
		    error: function(request, status, error){
		      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		  });//ajax끝
	});
}

</script>

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
			<br> <br>
			<article>
			<table class="table">
				<tr align="center" style="font-family: 'monaco';" bgcolor="white">
					<td style="width: 100px">${freeBoard.freeBoard_boardno }</td>
					<td style="width: 400px; text-align: left;">${freeBoard.freeBoard_title }</td>
					<td style="width: 100px"></td>
					<td style="width: 100px">${freeBoard.freeBoard_writeDate }</td>
					<td style=""><a href="#layer1" class="btn-example">작성자 : ${freeBoard.freeBoard_userId }</a>
							<div id="layer1" class="pop-layer">
								<div class="pop-container">
									<div class="pop-conts">
										<!--content //-->
										<p class="ctxt mb20">
											<h2>${tipboard.tipBoard_userId} 님의 회원정보</h2><br> 
							<a class="gogoCss" onclick="location.href='CertainMemberWrites.do?memberid=${tipboard.tipBoard_userId}'">
											* 해당회원이 쓴 게시글 보러가기</a><br>
											
											<a class="gogoCss" href="#">
											* 해당회원에게 쪽지보내기</a><br>																		
											<br>
											(저거 커서대면 색깔이 바뀌던 아니면 예쁘게 버튼을 만들던 해야하고 뜨는위치는.
											바로 글작성자 옆에 떠야함 지금처럼 중앙가운데에 뜨면 안됨.
											모달창 스럽게 팝업창 디자인도 노란색이라던가 우리 이미지에 맞게)
										</p>

										<div class="btn-r">
											<a href="#" class="btn-layerClose">Close</a>
										</div>
										<!--// content-->
									</div>
								</div>
							</div>
					</td>

					<td style="width: 100px"><span id="heart"> <c:choose>
								<c:when
									test="${user_idCheck ne null and freeLikes_SessionuserlikeCheck eq '0' }">
									<i class="far fa-heart" onclick="aaa()"
										style="cursor: pointer;"></i>
									<!-- 					좋아요누르기 -->
								</c:when>
								<c:when
									test="${user_idCheck ne null and freeLikes_SessionuserlikeCheck eq '1'}">
									<i class="fa fa-heart" onclick="aaa()" style="cursor: pointer;"></i>
									<!-- 					좋아요 취소하기 -->
								</c:when>
								<c:otherwise>
									<i class="fa fa-heart"></i>
								</c:otherwise>
							</c:choose>
					</span> <span id="likecount">${freeBoard.freeBoard_LikeCount }</span></td>
					<td style="width: 100px">조회수 : ${freeBoard.freeBoard_readCount }</td>
				</tr>
				<tr>
					<td align="left" colspan="7" height="200" width="700">
						${freeBoard.freeBoard_content } <br> <br> <br>
						<div style="text-align: right; width: 90%;">
							<div class="bs-example">
								<!-- Button HTML (to Trigger Modal) -->
								<a href="writeReportForm.do?report_boardname=${freeBoard.freeBoard_boardname }&report_boardno=${freeBoard.freeBoard_boardno }&report_userId=${freeBoard.freeBoard_userId }"
									data-toggle="modal" data-target="#myModal">글 신고</a>

								<!-- Modal HTML -->
								<div id="myModal" class="modal fade">
									<div class="modal-dialog" style="background: white;">
										<div class="modal-header">
											<!-- 닫기(x) 버튼 -->
											<button type="button" class="close" data-dismiss="modal">×</button>
											<!-- header title -->
										</div>
										<div class="modal-body">
											<div class="modal-content">
												<!-- Content will be loaded here from "remote.php" file -->
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>


					</td>

				</tr>

				<tr>
					<td colspan="6" align="right"><br> <c:if
							test="${freeBoard.freeBoard_userId eq user_idCheck}">
							<input type="button" value="수정하기"
								onclick="location.href='dogModifyFreeBoardForm.do?freeBoard_boardno=${freeBoard.freeBoard_boardno}&freeBoard_boardname=${freeBoard.freeBoard_boardname }'">

						</c:if> <input type="button" value="목록"
						onclick="location.href='dogFreeBoardList.do'"> <input
						type="button" value="뒤로" onclick="history.back();" /> <c:if
							test="${freeBoard.freeBoard_userId eq user_idCheck}">
							<input type="button" value="삭제" id="deleteBtn"
								onclick="removeCheck()">
						</c:if></td>
				</tr>

			</table>

			<div class="bottom-comment" style="background-color: #FAFAFA;">
				<table id="commentTable" style="border: none;">
					<c:forEach items="${commentList }" var="comment">
						<tr style="border-bottom: none;">
							<c:if
								test="${comment.freeComments_commentno == comment.freeComments_parent}">
								<td colspan="2">닉네임${comment.freeComments_nickname}</td>
							</c:if>
							<c:if
								test="${comment.freeComments_commentno != comment.freeComments_parent}">
								<td class="reTD"></td>
								<td>
									<div style="display: inline-block;"></div> <i
									class="fa fa-level-up fa-rotate-90 fa-1x"></i>&nbsp;닉네임${comment.freeComments_nickname}
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
											</c:if> <c:if test="${comment.freeComments_content !=null}">
											${comment.freeComments_content }
											</c:if></td>
							</c:if>
							<c:if
								test="${comment.freeComments_commentno != comment.freeComments_parent}">
								<td class="reTD"></td>
								<td>${comment.freeComments_content }</td>
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
			<div align="center" style="background-color: #FAFAFA;">
				<ul class="pagination">
					<!-- 			스타트 엔드 페이지는 페이지값 보고!  -->
					<c:if test="${comment_start != 1 }">

						<li><a class="pagingFun" page=1>[처음]</a></li>
						<li><a class="pagingFun" page=${comment_start-1 }>[이전]</a></li>
					</c:if>
					<c:forEach begin="${comment_start }" end="${comment_end }" var="i">
						<c:choose>
							<c:when test="${i == comment_current }">
								<li><a style="background-color: #eeeeee;">[${i }]</a></li>
							</c:when>
							<c:otherwise>
								<li><a page=${i } onclick="return false;" class="pagingFun">
										[${i }]</a></li>
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
					style="border: none; background-color: #FAFAFA;" align="center">
					<div style="border: none; background-color: #FAFAFA; width: 80%;">
						<!--top comment-->

						<p align="left" style="font-size: 16px;">닉네임:
							${freeBoard_nickname}</p>
						<p align="left">
							<textarea id="reply_content" rows="3" cols="120"
								style="color: black;" name="reply_content"
								placeholder="댓글을 입력하세요."></textarea>
						</p>
						<button class="reply_save" name="reply_save" value=0>댓글
							등록</button>
					</div>
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