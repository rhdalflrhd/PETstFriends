<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Rubel Miah">

    <!-- favicon icon -->
    <link rel="shortcut icon" href="./Boot/images/favicon.png">
    
	<title>꿀 TIP 게시글 read d</title>
	   
	    <!-- common css -->
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">    
    <link rel="stylesheet" href="./Boot/css/bootstrap.min.css">
    <link rel="stylesheet" href="./Boot/css/font-awesome.min.css">
    <link rel="stylesheet" href="./Boot/css/animate.min.css">
    <link rel="stylesheet" href="./Boot/css/owl.carousel.css">
    <link rel="stylesheet" href="./Boot/css/owl.theme.css">
    <link rel="stylesheet" href="./Boot/css/slicknav.css">
    <link rel="stylesheet" href="./Boot/style.css">
    <link rel="stylesheet" href="./Boot/css/responsive.css">
   <link  rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
   
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>    
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>   
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	examFunction();//-유튜브소환
	
	
	//-------------------------------댓글용 함수 시작 
// 	var seryun = ${tipComment.seryun}
	var comment_start = ${tipComment.comment_start}
	var comment_end = ${tipComment.comment_end }
	var comment_current = ${tipComment.comment_current}
	var comment_last = ${tipComment.comment_last}
	var boardno = ${tipboard.tipBoard_boardno};
	var boardname = ${tipboard.tipBoard_boardname};
	var comment_finalpage = ${tipComment.comment_current};
	var comment_page = ${tipComment.comment_current};
	var listsize = ${tipComment.listsize}%3;
	
	//---------------------------------댓글 리스트 불러오기
	var cPaging = function(){
		$.ajax({
			type : 'GET',
			url : 'tipCommentsList.do',
			data : {
				"comment_page" : comment_page,
				"tipComments_boardname" : boardname, 
				"tipComments_boardno" : boardno
			},
			dataType : 'json',
			success : function(data) {
				var tList = JSON.parse(data.TipCommentList);
				comment_current = comment_page;
				var commentList = data;
				var commentStr = '';
				for(var i in tList){
					if(tList[i].tipComments_commentno == tList[i].tipComments_parent){
						commentStr +='<tr><td colspan="2" style="text-align: left;">닉네임'+tList[i].tipComments_nickname+'</td>'
					}else{
						commentStr +='<tr><td class="reTD"></td><td><i class="fa fa-level-up fa-rotate-90"></i>&nbsp;닉네임'
						+tList[i].tipComments_nickname+'</td>'
					}
					commentStr += '<td class="btnTD">날짜'+tList[i].tipComments_writeDate+'</td></tr><tr">';
					if(tList[i].tipComments_commentno == tList[i].tipComments_parent){
						commentStr += '<td colspan="2" style="text-align: left;">';
					}else{
						commentStr +='<td class="reTD"></td><td>';
					}
					if(tList[i].tipComments_content != null){
						commentStr +=tList[i].tipComments_content +'</td><td class="btnTD">';
						if(data.user_idCheck!=null){
							commentStr +='<button value="'+tList[i].tipComments_parent +'&'+tList[i].tipComments_nickname+'" class="reComBtn">답글</button>';
							if(tList[i].tipComments_content !=null && tList[i].tipComments_userId==data.user_idCheck){
								commentStr += '<button value="'+tList[i].tipComments_commentno+'" class="modifyComBtn">수정</button><button value="'
								+tList[i].tipComments_commentno+'&'+tList[i].tipComments_parent
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
						paginStr +='<li><a page='+i+' class="pagingFun" style="background-color: #FFD232;">['+i+']</a></li>';
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
	
	//---------------------------------다른 페이지 클릭시
	$(document).on('click', '.pagingFun', function(){
		comment_page = $(this).attr("page");
		cPaging();
		event.preventDefault();
		});
	
	//---------------------------------답글달기 클릭시
	$(document).on('click', '.reComBtn', function(){
		var tr = $(this).parent().parent();
		var str = $(this).val();
		var strArr = str.split('&');
		var tipComments_parent = strArr[0];//패런트넘
		var tipComments_nickname = '';//답글주인의 닉네임
		
		for(var i = 1; i<strArr.length; i++)
			tipComments_nickname +=strArr[i];
		var tableStr = '';
		tableStr +='<tr><td colspan=3><div><img src="./Boot/images/comment.jpg" class="pull-left"><p align="left" style="font-size: 16px;">'
				+'<i class="fa fa-level-up fa-rotate-90"></i> @'+tipComments_nickname
				+ '</p><p align="left"><textarea id="rereply_content" rows="3" cols="120" name="rereply_content"></textarea>'
				+'</p><button class="rereply_save" name="rereply_save"'
				+' value='+tipComments_parent+'&'+tipComments_nickname
				+'>댓글 등록</button></div></td></tr><tr></tr>';
		tr.after(tableStr);
	})
	
	//---------------------------------답글 등록시
	$(document).on('click', '.rereply_save', function(){
		var tipComments_info = $(this).val();
		var tipArray = tipComments_info.split('&');
		var tipComments_parent  = tipArray[0];
		var tipComments_nickname='';
		for(var i = 1; i <tipArray.length; i++)
			tipComments_nickname += tipArray[i];
		var tipComments_content = '<a>'+tipComments_nickname+'</a> '+$('#rereply_content').val();//내용
		$.ajax({
			type : 'GET',
			url : 'writeTipComment.do',
			data : {
				"tipComments_content" : tipComments_content,
				"tipComments_parent" : tipComments_parent,
				"tipComments_boardname" : ${tipboard.tipBoard_boardname}, 
				"tipComments_boardno" : ${tipboard.tipBoard_boardno}
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
	
	//---------------------------------그냥 댓글 달때
	$(document).on('click', '.reply_save', function(){
		var tipComments_content = $('#reply_content').val();//내용
		var tipComments_parent = 0;
		$('#reply_content').val('');
		$.ajax({
			type : 'GET',
			url : 'writeTipComment.do',
			data : {
				"tipComments_content" : tipComments_content,
				"tipComments_parent" : tipComments_parent,
				"tipComments_boardname" : ${tipboard.tipBoard_boardname}, 
				"tipComments_boardno" : ${tipboard.tipBoard_boardno}
			},
			success : function(data) {
				listsize++;
				if(listsize > ${tipComment.comment_numb}){
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
	
	//---------------------------------댓글 삭제시
	$(document).on('click', '.deleteComBtn', function(){
		var str = $(this).val();
		var strArr = str.split('&');
		var tipComments_commentno = strArr[0];//패런트넘
		var tipComments_parent = '';//답글주인의 닉네임
		for(var i = 1; i<strArr.length; i++)
			tipComments_parent +=strArr[i];
		$.ajax({
			type : 'GET',
			url : 'deleteTipComment.do',
			data : {
				"tipComments_commentno" : tipComments_commentno,
				"tipComments_parent" : tipComments_parent
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
	
	//---------------------------------댓글 수정폼
	$(document).on('click', '.modifyComBtn', function(){
		var tipComments_commentno = $(this).val();
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
			+'</p><button class="reply_modi" name="reply_modi"	style="background-color: #CD853F; color: white;'
			+'font-size: 15px; font-weight: bold; border: 1; border-color: #CD853F; border-radius: 5px;"'
			+'value="'+'<a>'+nick+'</a>'+tipComments_commentno+'">수정하기</button></div></td>';
		tr.after(tableStr);
	})
	
	//---------------------------------댓글 수정하기
	$(document).on('click', '.reply_modi', function(){
		var str = $(this).val();
		var strArr = str.split('</a>');
		var nick = strArr[0]+'</a>';
		var tipComments_commentno=str.replace(nick,"");
		var tipComments_parent = '';//답글주인의 닉네임
		var tipComments_content = nick+' '+$('.modi_content').val();

		$.ajax({
			type : 'GET',
			url : 'updateTipComment.do',
			data : {
				"tipComments_commentno" : tipComments_commentno,
				"tipComments_content" : tipComments_content
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
	var test ="${tipboard.tipBoard_YoutubeUrl}";

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
	
	//----------------------------------------------------글삭제
	$('#tblbutton').on('click',	function removeCheck() {

		 if (confirm("정말 삭제하시겠습니까?") == true){    //확인
			alert("해당 글에대한 삭제처리가 완료됐습니다.");
		     document.removefrm.submit();
		 }else{   //취소
		     return false;
		 }
		});	
	
	
	//------------------------------------------------------좋아요 기능
	$('#likeCheckFunction').on('click',	function like_func(){
	
// 		alert("likeCheckFunction들어옴");
		  var boardno = ${tipboard.tipBoard_boardno};
		  var boardname = ${tipboard.tipBoard_boardname};
		  var userid = $('#user_idCheck').val();
		  console.log("boardno, boardname, userid : " + boardno +","+ boardname+","+userid );
		  
		  $.ajax({
		    url: "InsertLikesTipBoard.do",
		    type: "GET",
		    cache: false,
		    dataType: "json",
		    data: 'boardno=' +boardno+ '&boardname=' +boardname,
		    success: function(data) {
		    	
// 		    alert(data.mm);
		      var msg = data.mm;
// 		      msg += data.mm;
		      alert(msg);
		      
		      var like_msg='';
		      if(data.like_check == 0){
		        like_msg = "좋아요 누르기";
		      } else {
		        like_msg = "좋아요 취소하기";
		      }      

		      $('#like_msg').html(like_msg);
		      $('#like_cnt').html(data.like_cnt);
		    },
		    error: function(request, status, error){
		      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		  });//ajax끝
		  
		});
	
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
// 	    	var jaksY = $('.btn-example').clientY; var jaksX = $('.btn-example').clientX;
	        var pos = $('#jak').position();
	    	
// 		    var divTop = el.clientY - 40; //상단 좌표 위치 안맞을시 e.pageY
// 		    var divLeft = el.clientX; //좌측 좌표 위치 안맞을시 e.pageX 	

	        var $el = $(el);        //레이어의 id를 $el 변수에 저장
	        	$el.css({
// 	                marginTop: -30,
// 	                marginLeft: -$elWidth
	    		   top: pos.top +'px', 
	    		   left: pos.left +'px', 
// 	    		   "position": "absolute"
	            })
	       			$el.fadeIn();
	        
	        $('#layer1').find('a.btn-layerClose').click(function(){
	           $('#layer1').fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
//	        	document.getElementById('layer1').style.display='none'
	            return false;
	        });

	    }	// function layer_popup끝
	   
	    
});
</script>

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

@import
	url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css')
	;
table {
	width: 100%;
	background-color: transparent;
}

th, td {
	/* 	border: 1px gray solid; */
	text-align: center;
	padding: 8px
}

h6,h4,h3,h2,h1,h5{
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


/*   ------------------팝업레이어용 CSS 시작 ------------------- */
.pop-layer .pop-container {
/*   padding: 20px 25px; */
}

.pop-layer p.ctxt {
  color: #666;
  line-height: 25px;
}

.pop-layer .btn-r {
  text-align: right;
/*   border: 1px solid #dcdcdc; */
}

.pop-layer {
  display: none;
  position: absolute; 
  width: 200px;
  height:100px;
  background-color: #fff;
  border: 1px solid #dcdcdc;
  border-radius: 5px;
  z-index: 10;
}

a.btn-layerClose {
  display: inline-block;
  height: 20px;
  padding: 0 14px 0; 
  border: 1px solid #d2d2d2;
  border-radius: 5px;
  background-color: #d2d2d2;
  font-size: 10px;
  color: #fff;
  line-height: 25px; 
}

a.btn-layerClose:hover {
  border: 1px solid #d2d2d2;
  border-radius: 5px;
  background-color: #dcdcdc;
  color: #fff;
}
/*   ------------------팝업레이어용 CSS 끝 ------------------- */
.gogoCss {
    color: #b4b4b4;
    margin: 0 7px;
    font-size: 12px;
}
.gogoCss :hover {
    color: #FFD232;
}

/*---------------댓글 CSS-------------*/
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
.reComBtn, .modifyComBtn, .deleteComBtn{
border: 0;
/* opacity: 0.5; */
background : #00ff0000;
}


</style>	
</head>
<body>
<%@ include file="/petst/header.jsp"%>
<center>




<br>
<br>
<br>
<div class="wrapper">  

    <!--main content start-->
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-sm-12">

						<article class="post" style="border: 1px solid #eeeeee;">
						<header class="entry-header text-center">
						<h2 class="entry-title" style="font-family: 'NanumSquareRound', sans-serif;">
							<a href="#"> <c:if test="${empty tipboard.tipBoard_title}">
								"제목 없음"
								</c:if> <c:if test="${not empty tipboard.tipBoard_title}">
								${tipboard.tipBoard_title}
								</c:if>
							</a>
						</h2>

						<div class="entry-meta">
							<input type="hidden" id="user_idCheck" name="user_idCheck"
								value="${user_idCheck}" />
							<!-- 							 <span class="comment"> -->
							<%-- 							 <a class="imgSelect">♥작성자:  ${tipboard.tipBoard_userId} </a> --%>
							<!-- 							 </span>	 -->
							<a href="#layer1" id="jak" class="btn-example">♥ 작성자:
								${tipboard.tipBoard_userId} </a>
							
							
							<div id="layer1" class="pop-layer">
								<div class="pop-container">
									<div class="pop-conts">
										<!--content //-->
										<p class="ctxt mb20">
											<h5>
											<font style=" font-weight: bold;color: #dcdcdc;">
											 ${tipboard.tipBoard_userId} </font>
											<font style="color: #dcdcdc;"> 님의 회원정보</font>
											</h5>
											<h6>						
										<a	class="gogoCss"
											onclick="location.href='CertainMemberWrites.do?memberid=${tipboard.tipBoard_userId}'">
											* 해당회원이 쓴 게시글 보러가기</a><br> 
										<a class="gogoCss" href="#">
											* 해당회원에게 쪽지보내기</a>
										</h6>										
										<div class="btn-r">
											<a href="#" class="btn-layerClose">Close</a>
										</div>
										<!--// content-->
									</div>
								</div>
							</div>
							
							
							<span class="date"><i class="fa fa-clock-o"></i> <fmt:formatDate
									value="${tipboard.tipBoard_writeDate}" pattern="yyyy년 MM월 dd일" />
							</span> <span class="cat"><i class="fa fa-folder-open-o"></i>
							<c:if test="${tipboard.tipBoard_boardname eq '7'}">
								강아지 tip 정보
								</c:if> <c:if test="${tipboard.tipBoard_boardname eq '8'}">
								고양이 tip 정보
								</c:if> <c:if test="${tipboard.tipBoard_boardname eq '9'}">
								토끼 tip 정보
								</c:if> </span> <span class="comment"><i class="fa fa-comment-o"></i><a
								href="">3 Comments(코멘트게시판이랑합칠것)</a></span>
						</div>
						</header>
						<div class="entry-content" style="border: 1px solid #eeeeee;">
						<br>
							<h4 align="left" style="font-family: 'NanumSquareRound', sans-serif;">
							 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							 첨부된 동영상 <c:if test="${empty tipboard.tipBoard_YoutubeUrl}">: No video(없음)</c:if>
							</h4>
							<c:if test="${not empty tipboard.tipBoard_YoutubeUrl}">
							<iframe id="iframe" width="980" height="551" src="" frameborder="0" allowfullscreen></iframe>
							</c:if>
						<br><br>
						</div>
						<div class="entry-content" >
						<br><br>${tipboard.tipBoard_content}<br><br>			
						</div>
						<div class="decoration">
						</div>
						<!-- decoration div 끝 -->
						<div class="social-share">
							<ul class="text-center">
								<li><c:if
										test="${tipboard.tipBoard_userId eq user_idCheck}">
										<a class="s-facebook"
											onclick="location.href='ModifyFormTipBoard.do?boardname=${tipboard.tipBoard_boardname}&boardno=${tipboard.tipBoard_boardno}'">
											수정하기 </a>
									</c:if></li>
								<li><a class="s-google-plus" onclick="location.href='TipBoardList.do?tipBoard_boardname=${tipboard.tipBoard_boardname}'">목록으로</a></li>
								<li><a class="s-twitter" onclick="history.back();">뒤로가기</a></li>
								<li>
							<c:if test="${tipboard.tipBoard_userId eq user_idCheck}">
								<form
									action="DeleteTipBoard.do?boardname=${tipboard.tipBoard_boardname}&boardno=${tipboard.tipBoard_boardno}"
									id="removefrm"  name="removefrm" method="post">
									<a class="s-google-plus" id="tblbutton" onclick="removeCheck()">글 삭제</a>
								</form>
							</c:if>		
								</li>
								<li>
								<a class="s-twitter"
									href="writeReportForm.do?report_boardname=${tipboard.tipBoard_boardname}&report_boardno=${tipboard.tipBoard_boardno}&report_userId=${tipboard.tipBoard_userId}"
									data-toggle="modal" data-target="#myModal"> 글신고 </a>
									<div id="myModal" class="modal fade">
										<div class="modal-dialog" style="background: white;">
											<div class="modal-header">
												<!-- 닫기(x) 버튼 -->
												<button type="button" class="close" data-dismiss="modal">닫기ⓧ</button>
												<!-- header title -->
											</div>
											<div class="modal-body">
												<div class="modal-content">
													<!-- Content will be loaded here from "remote.php" file -->
												</div>
											</div>

										</div>
									</div>
								</li>
								<li>
								<a class="s-pinterest">
								<c:choose>
									<c:when
										test="${user_idCheck ne null and tipLikes_SessionuserlikeCheck eq '0'}">
										<button type="button" id="likeCheckFunction"
											class="btn send-btn"
											style="border-radius: 5px; height: 40px;">
											<span id='like_msg'>좋아요누르기</span> <i class="fa fa-heart"
												style="color: #FF895A;"></i>
										</button>

									</c:when>
									<c:when
										test="${user_idCheck ne null and tipLikes_SessionuserlikeCheck eq '1'}">
										<button type="button" id="likeCheckFunction"
											class="btn send-btn"
											style="border-radius: 5px; height: 40px;">
											<span id='like_msg'>좋아요 취소하기</span> <i class="fa fa-heart"
												style="color: #FF895A;"></i>
										</button>

									</c:when>
									<c:otherwise>
										<button type="button" id="loginNeedLike" class="btn send-btn"
											style="border-radius: 5px; height: 40px;">좋아요를 누르려면
											로그인이 필요합니다.</button>
									</c:otherwise>
								</c:choose>
								</a>	
								</li>								
								<li>
								<button type="button"
									style="background: none; color:#FFD232; border-color: #FFD232; border-radius: 5px; text-transform: uppercase; transition: all .4s; height: 40px;">
									총 좋아요 수 <span id='like_cnt'>${tipboard.tipBoard_LikeCount}</span>
									Likes
								</button>
								</li>

							</ul>
						</div>

						</article>

						<br> <br>

<!-- ★						 -->
						<c:if test="${user_idCheck != null }">
							<div class="bottom-comment" style="background-color: #FAFAFA;">
								<div>
									<table id="commentTable" style="border: none;">
										<c:forEach items="${tipComment.commentList}" var="comment">
											<tr style="border-bottom: none;">
												<c:if
													test="${comment.tipComments_commentno == comment.tipComments_parent}">
													<td colspan="2">닉네임${comment.tipComments_nickname}</td>
												</c:if>
												<c:if
													test="${comment.tipComments_commentno != comment.tipComments_parent}">
													<td class="reTD"></td>
													<td>
														<div style="display: inline-block;"></div> <i
														class="fa fa-level-up fa-rotate-90 fa-1x"></i>&nbsp;닉네임${comment.tipComments_nickname}
													</td>
												</c:if>
												<td class="btnTD">날짜${comment.tipComments_writeDate }</td>
											</tr>
											<tr>
												<c:if
													test="${comment.tipComments_commentno == comment.tipComments_parent}">
													<td colspan="2"><c:if
															test="${comment.tipComments_content ==null}">
											삭제된 댓글입니다.
											</c:if> <c:if test="${comment.tipComments_content !=null}">
											${comment.tipComments_content }
											</c:if></td>
												</c:if>
												<c:if
													test="${comment.tipComments_commentno != comment.tipComments_parent}">
													<td class="reTD"></td>
													<td>${comment.tipComments_content }</td>
												</c:if>
												<td class="btnTD"><c:if test="${user_idCheck != null }">
														<button
															value="${comment.tipComments_parent }&${comment.tipComments_nickname}"
															class="reComBtn">답글</button>
													</c:if> <c:if
														test="${comment.tipComments_content !=null &&
											comment.tipComments_userId eq user_idCheck}">
														<button value="${comment.tipComments_commentno}"
															class="modifyComBtn">수정</button>
														<button
															value="${comment.tipComments_commentno}&${comment.tipComments_parent}"
															class="deleteComBtn">삭제</button>
													</c:if></td>
											</tr>
										</c:forEach>
									</table>
								</div>
								<ul class="pagination">
									<!-- 			스타트 엔드 페이지는 페이지값 보고!  -->
									<c:if test="${tipComment.comment_start != 1 }">

										<li><a class="pagingFun" page=1>[처음]</a></li>
										<li><a class="pagingFun" page=${tipComment.comment_start-1 }>[이전]</a></li>
									</c:if>
									<c:forEach begin="${tipComment.comment_start }" end="${tipComment.comment_end }"
										var="i">
										<c:choose>
											<c:when test="${i == tipComment.comment_current }">
												<li><a style="background-color: #FFD232;">[${i }]</a></li>
											</c:when>
											<c:otherwise>
												<li><a page=${i } onclick="return false;"
													class="pagingFun"> [${i }]</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${end < last}">
										<li><a class="pagingFun"
											onclick="commentPage(${tipComment.comment_end+1 })">[다음]</a></li>
										<li><a class="pagingFun"
											onclick="commentPage(${tipComment.comment_last })">[끝]</a></li>
									</c:if>
								</ul>

							</div>
						</c:if>
						<div style="height: 30px;"></div>
						<c:if test="${user_idCheck != null }">
							<div id="testComment" class="top-comment"
								style="border: 1px solid #eeeeee; background-color: #E1B771;">
								<!--top comment-->

								<img src="./Boot/images/comment.jpg" class="pull-left">
								<%-- 							<h3 align="left">닉네임: ${user_idCheck}</h3> --%>
								<p align="left" style="font-size: 16px;">닉네임:
									${user_nickname}</p>
								<p align="left">
									<textarea id="reply_content" rows="3" cols="120"
										name="reply_content" placeholder="댓글을 입력하세요."></textarea>
								</p>
								<button class="reply_save" name="reply_save"
									style="background-color: #CD853F; color: white; font-family: 'NanumSquareRound', sans-serif; font-size: 15px; font-weight: bold; border: 1; border-color: #CD853F; border-radius: 5px;"
									value=0>댓글 등록</button>

							</div>
						</c:if>						
<!-- ★					 -->
						<!--top comment end-->
						<br> <br>
												
					</div>
					<!--  <div class="col-md-8 col-sm-7">의 끝 -->

				</div>
				<!-- row div 끝 -->
			</div>
			<!--컨테이너 div 끝-->
</div>
</center>
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