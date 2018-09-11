<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
.sub {
	border-bottom: 1px solid red;
	padding-left: 15px;
	padding-top: 10px;
	font-size: 17px;
}

h2 {
	text-align: center;
	background: white;
}

.none {
	display: none;
}

.pointer {
	cursor: pointer;
}

#writeBoard, button {
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

#search{
margin: 5px 5px 6px;
	text-decoration: none;
	border: 0;
	background-color: #dcdcdc;
	position: relative;
	padding: 0.438em 0.625em 0.438em 0.625em;
	line-height: 1.125em;
	cursor: pointer;
	color: white;
	height: 30px;
}
.close1, .close2 {
	margin: 5px 5px 6px;
	text-decoration: none;
	border: 0;
	background-color: #dcdcdc;
	position: relative;
	height: 40px;
	padding: 0.438em 0.625em 0.438em 0.625em;
	line-height: 1.125em;
	cursor: pointer;
	color: white;
	padding: 0.438em 0.625em 0.438em 0.625em;
}
#mask {
	position: absolute;
	z-index: 9000;
	background-color: #000;
	display: none;
	left: 0;
	top: 0;
}

.window {
	display: none;
	position: absolute;
	left: 50%;
	top: 200px;
	margin-left: -300px;
	width: 600px;
	height: 370px;
	background-color: #FFF;
	z-index: 10000;
}
</style>
<script type="text/javascript">
	function FaqToggleDetail(id) {
		var latestToggleObj = null;
		var oObj = document.getElementById(id);
		if (this.latestToggleObj != null) {
			this.latestToggleObj.className = (this.latestToggleObj.className + " none");
		}
		if (this.latestToggleObj == oObj) {
			this.latestToggleObj = null;
			return;
		}
		this.latestToggleObj = null;
		if (oObj.className.indexOf("none") != -1) {
			oObj.className = oObj.className.replace("none", "");
		} else {
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
		var key = '';
		// $('.deleteBtn').click(function(){
		// 	var result = confirm('삭제하시겠습니까?');
		// 	if(result){
		// 		var boardno = $(this).val();
		// 		location.href='deleteOftenQnA.do?oftenQnA_boardno='+boardno;
		// 	}
		// 	else{
		// 	}
		// })

		//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ쪽지 검색
		$(document).on('click', '#search', function(event) {
			var contents = $('#searchbox').val();
			key=contents;
			$.ajax({
				type : "get",
				url : "showMsgListAdimin.do",
				dataType : "json",
				data : {
					"msg_ReceiverId" : contents
				},
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					var cur;
					if (10 > data.showMsgListAdmin.length) {
						cur = data.showMsgListAdmin.length;
					} else {
						cur = 10;
					}

					$('#msgtable').empty();
					for (var i = 0; i < cur; i++) {
						var tableStr = '';
						tableStr += '<tr class="pointer" onclick="FaqToggleDetail(\'row_' + i + '\')"><td>';
						tableStr += '<input type="checkbox" name="checkbox" value='+data.showMsgListAdmin[i].msg_no+'></td><td>';
						tableStr += data.showMsgListAdmin[i].msg_no + '</td><td width="50%;">' + data.showMsgListAdmin[i].msg_title;
						tableStr += '</td><td>' + data.showMsgListAdmin[i].msg_ReceiverId + '</td><td width="150px;">' + data.showMsgListAdmin[i].msg_sendDate;
						tableStr += '</td></tr>';
						tableStr += '<tr class="none" id="row_' + i + '"><td></td><td colspan="2">내용 : ' + data.showMsgListAdmin[i].msg_contents + '</td>'
						tableStr += '<td><button class="openMask" value=' + data.showMsgListAdmin[i].msg_ReceiverId + '>쪽지 보내기</button></td></tr>';
						$('#msgtable').append(tableStr);
					}
					$('#msgtablepage>tbody').empty();
					if (data.start != 1) {
						$('#msgtablepage>tbody:last').append(
							"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\"" + 1 + "\">[처음]</a>" +
							"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\"" + data.start - 1 + "\">[이전]</a>");
					}
					for (var i = data.start; i < data.end; i++) {
						if (i <= data.last) {
							if(i==data.current){
								$('#msgtablepage>tbody:last').append(
										"<imput style=\"cursor: text;\" type=\"text\" id=\"current\" value=\"" + i + "\"> [" + i + "] </a>");
							}
							else{
							$('#msgtablepage>tbody:last').append(
								"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\"" + i + "\"> [" + i + "] </a>");
							}
						}
					}
					if (data.start + 9 < data.last) {
						$('#msgtablepage>tbody:last').append(
							"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\"" + data.end + "\">[다음]</a>" +
							"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\"" + data.last + "\">[끝]</a>");
					}
					$('#msgtablepage>tbody:last').append(
						"</td></tr>"
					);
				},
				error : function(request) {
					alert("에러 : " + request.status);
				}
			})
		})
		//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ쪽지함 목록 출력
		$.ajax({
			type : "get",
			url : "showMsgListAdimin.do",
			data : {
				"msg_ReceiverId" : key
			},
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				var cur;
				if (10 > data.showMsgListAdmin.length) {
					cur = data.showMsgListAdmin.length;
				} else {
					cur = 10;
				}
				for (var i = 0; i < cur; i++) {
					// 					$('#msgtable').empty();
					var tableStr = '';
					tableStr += '<tr class="pointer" onclick="FaqToggleDetail(\'row_' + i + '\')"><td>';
					tableStr += '<input type="checkbox" name="checkbox" value='+data.showMsgListAdmin[i].msg_no+'></td><td>';
					tableStr += data.showMsgListAdmin[i].msg_no + '</td><td width="50%;">' + data.showMsgListAdmin[i].msg_title;
					tableStr += '</td><td>' + data.showMsgListAdmin[i].msg_ReceiverId + '</td><td width="150px;">' + data.showMsgListAdmin[i].msg_sendDate;
					tableStr += '</td></tr>';
					tableStr += '<tr class="none" id="row_' + i + '"><td></td><td colspan="2">내용 : ' + data.showMsgListAdmin[i].msg_contents + '</td>'
					tableStr += '<td><button class="openMask" value=' + data.showMsgListAdmin[i].msg_ReceiverId + '>쪽지 보내기</button></td></tr>';
					$('#msgtable').append(tableStr);
				}
				if (data.start != 1) {
					$('#msgtablepage>tbody:last').append(
						"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\"" + 1 + "\">[처음]</a>" +
						"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\"" + data.start - 1 + "\">[이전]</a>");
				}
				for (var i = data.start; i < data.end; i++) {
					if (i <= data.last) {
						if(i==data.current){
							$('#msgtablepage>tbody:last').append(
									"<imput style=\"cursor: text;\" color=\"red;\" type=\"text\" id=\"current\" value=\"" + i + "\"> [" + i + "] </a>");
						}
						else{
						$('#msgtablepage>tbody:last').append(
							"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\"" + i + "\"> [" + i + "] </a>");
						}
					}
				}
				if (data.start + 9 < data.last) {
					$('#msgtablepage>tbody:last').append(
						"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\"" + data.end + "\">[다음]</a>" +
						"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\"" + data.last + "\">[끝]</a>");
				}
				$('#msgtablepage>tbody:last').append(
					"</td></tr>"
				);

			},
			error : function(request) {
				alert("에러 : " + request.status);
			}
		})
		//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
		$(document).on('click', '#current', function(event) {
			var page = $(this).attr('value');
			var msg_ReceiverId = key;
			$.ajax({
				type : "get",
				url : "showMsgListAdimin.do",
				data : {
					"page" : page,
					"msg_ReceiverId" : msg_ReceiverId
				},
				dataType : "json",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					$('#msgtable').empty();
					$('#msgtablepage>tbody').empty();
					var cur;
					if (data.current * 10 > data.showMsgListAdmin.length) {
						cur = data.showMsgListAdmin.length;
					} else {
						cur = data.current * 10;
					}
					for (var i = data.current * 10 - 10; i < cur; i++) {
						var tableStr = '';
						tableStr += '<tr class="pointer" onclick="FaqToggleDetail(\'row_' + i + '\')"><td>';
						tableStr += '<input type="checkbox" name="checkbox" value='+data.showMsgListAdmin[i].msg_no+'></td><td>';
						tableStr += data.showMsgListAdmin[i].msg_no + '</td><td width="50%;">' + data.showMsgListAdmin[i].msg_title;
						tableStr += '</td><td>' + data.showMsgListAdmin[i].msg_ReceiverId + '</td><td width="150px;">' + data.showMsgListAdmin[i].msg_sendDate;
						tableStr += '</td></tr>';
						tableStr += '<tr class="none" id="row_' + i + '"><td></td><td colspan="2">내용 : ' + data.showMsgListAdmin[i].msg_contents + '</td>'
						tableStr += '<td><button class="openMask" value=' + data.showMsgListAdmin[i].msg_ReceiverId + '>쪽지 보내기</button></td></tr>';
						$('#msgtable').append(tableStr);
					}
					$('#msgtablepage>tbody:last').append(
						"<tr><td width=\"1100px\" height=\"30px\">");
					if (data.start != 1) {
						$('#msgtablepage>tbody:last').append(
							"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\"" + 1 + "\">[처음]</a>" +
							"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\"" + data.start - 1 + "\">[이전]</a>");
					}
					for (var i = data.start; i < data.end; i++) {
						if (i <= data.last) {
							if(i==data.current){
								$('#msgtablepage>tbody:last').append(
										"<imput style=\"cursor: text;\" type=\"text\" id=\"current\" value=\"" + i + "\"> [" + i + "] </a>");
							}
							else{
							$('#msgtablepage>tbody:last').append(
								"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\"" + i + "\"> [" + i + "] </a>");
							}
						}
					}
					if (data.start + 9 < data.last) {
						$('#msgtablepage>tbody:last').append(
							"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\"" + data.end + "\">[다음]</a>" +
							"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\"" + data.last + "\">[끝]</a>");
					}
					$('#msgtablepage>tbody:last').append(
						"</td></tr>"
					);

				},
				error : function(request) {
					alert("에러 : " + request.status);
				}
			})

		})
		//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ쪽지 삭제
		$(document).on('click', '#msgdeleteAdminbutton', function(event) {
			$("input[name=checkbox]:checked").each(function() {
				var msg_no = $(this).val();
				$.ajax({
					type : "get",
					url : "deleteMsgAdimin.do",
					data : {
						"msg_no" : msg_no
					},
					success : function(data) {
						location.reload();
// 						$('#current').trigger('click')
					},
					error : function(request) {
						alert("에러 : " + request.status);
					}
				})

			})


		});

		//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ쪽지 보내기
		$(document).on('click', '#msgSendbutton', function(event) {
			var msg_ReceiverId = $("#msg_id").val();
			var msg_title = $('#msg_title').val();
			var msg_contents = $('#msg_contents').val();
			$.ajax({
				type : "get",
				url : "sendMsg.do",
				data : {
					"msg_ReceiverId" : msg_ReceiverId,
					"msg_title" : msg_title,
					"msg_contents" : msg_contents
				},
				success : function(data) {
// 					var tf = true; 
					alert('전송 성공')
					$('.window .close2').trigger('click')
// 					tf = false;
				},
				error : function(request) {
					alert("에러 : " + request.status);
				}
			})
		});
	});
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ윈도우창, 검은막
	function wrapWindowByMask(msg_ReceiverId) {
		//화면의 높이와 너비를 구한다.
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();
		//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
		$("#mask").css({
			"width" : maskWidth,
			"height" : maskHeight
		});
		//애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
		$("#mask").fadeIn(0);
		$("#mask").fadeTo("slow", 0.6);
		//윈도우 같은 거 띄운다.
		$(".window").show();
		// 	$('#msg_id').empty();
		$('#msg_id').val(msg_ReceiverId)

		$('html, body').scrollTop(0);
	}
	$(document).on('click', '.openMask', function(e) {
		var msg_ReceiverId = $(this).val()
		e.preventDefault();
		wrapWindowByMask(msg_ReceiverId);
	});
	$(document).on('click','.window .close1',function(e){
		//링크 기본동작은 작동하지 않도록 한다.
		e.preventDefault();
		$("#mask, .window").hide();
		$.ajax({
			type : "get",
			url : "showMsgListAdimin.do",
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				$('#msgtable').empty();
				for (var i = 0; i < 10; i++) {
					var tableStr = '';
					tableStr += '<tr class="pointer" onclick="FaqToggleDetail(\'row_' + i + '\')"><td>';
					tableStr += '<input type="checkbox" name="checkbox" value='+data.showMsgListAdmin[i].msg_no+'></td><td>'
					tableStr += data.showMsgListAdmin[i].msg_no + '</td><td width="50%;">' + data.showMsgListAdmin[i].msg_title;
					tableStr += '</td><td>' + data.showMsgListAdmin[i].msg_ReceiverId + '</td><td width="150px;">' + data.showMsgListAdmin[i].msg_sendDate;
					tableStr += '</td></tr>';
					tableStr += '<tr class="none" id="row_' + i + '"><td></td><td colspan="2">내용 : ' + data.showMsgListAdmin[i].msg_contents + '</td>'
					tableStr += '<td><button class="openMask" value=' + data.showMsgListAdmin[i].msg_ReceiverId + '>쪽지 보내기</button></td></tr>';
					$('#msgtable').append(tableStr);
				}
			},
			error : function(request) {
				alert("에러 : " + request.status);
			}
		})
	});
	$(document).on('click','.window .close2',function(e){
		//링크 기본동작은 작동하지 않도록 한다.
		e.preventDefault();
		$("#mask, .window").hide();
		$.ajax({
			type : "get",
			url : "showMsgListAdimin.do",
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				$('#msgtable').empty();
				for (var i = 0; i < 10; i++) {
					var tableStr = '';
					tableStr += '<tr class="pointer" onclick="FaqToggleDetail(\'row_' + i + '\')"><td>';
					tableStr += '<input type="checkbox" name="checkbox" value='+data.showMsgListAdmin[i].msg_no+'></td><td>'
					tableStr += data.showMsgListAdmin[i].msg_no + '</td><td width="50%;">' + data.showMsgListAdmin[i].msg_title;
					tableStr += '</td><td>' + data.showMsgListAdmin[i].msg_ReceiverId + '</td><td width="150px;">' + data.showMsgListAdmin[i].msg_sendDate;
					tableStr += '</td></tr>';
					tableStr += '<tr class="none" id="row_' + i + '"><td></td><td colspan="2">내용 : ' + data.showMsgListAdmin[i].msg_contents + '</td>'
					tableStr += '<td><button class="openMask" value=' + data.showMsgListAdmin[i].msg_ReceiverId + '>쪽지 보내기</button></td></tr>';
					$('#msgtable').append(tableStr);
				}
			},
			error : function(request) {
				alert("에러 : " + request.status);
			}
		})
	});
	$("#mask").click(function() {
		$(this).hide();
		$(".window").hide();
		$(".window2").hide();
	});
</script>
</head>

<body>
	<%@ include file="/petst/header.jsp"%>
	<div class="wrapper">
		<div class="main-content">
			<div class="container" style="background: white;">

				<div style="border-bottom: 2px solid brown; width: 30%;">
					<div style="border-bottom: 5px solid #FFD232; width: 80%;">
						<h2>쪽지함 Admin</h2>
					</div>
				</div>
				<div style="height: 20px;"></div>
				<br>
				<br>
				<table class="table">
					<thead>
						<tr>
							<th></th>
							<th>쪽지 번호</th>
							<th>쪽지 제목</th>
							<th>받는 사람 ID</th>
							<th>보낸 날짜</th>
						</tr>
					</thead>
					<tbody id="msgtable">
					</tbody>
				</table>
				<div style="float: left;">
				<button id="msgdeleteAdminbutton">쪽지 삭제</button>
				</div>
				<div id="mask"></div>
				<table id="msgtablepage" align="center">

					<tbody align="center">
					</tbody>

				</table>
			</div>
		</div>
		<div align="center">
		<input type="text" id="searchbox" style="width: 200px; height: 30px;">
		<input type="button" value="검색" id="search">
		</div>
		<div style="height: 20px;"></div>
		<div class="container" style="text-align: right;">
			<div id="writeBox"></div>
		</div>
		
	</div>

<!-- 쪽지보내기 -->
	<div class="window">
		<br>
		<table class="table">
			<tr>
				<td>받는 회원 id</td>
				<td><input type="text" id="msg_id" style="width: 400px"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" id="msg_title" style="width: 400px"
					placeholder="제목을 입력해주세요."></td>
			</tr>
			<tr>
				<td colspan="2"><textarea id="msg_contents"
						style="resize: none; width: 580px; height: 180px;"
						placeholder="내용을 입력해주세요."></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<button id="msgSendbutton" class="close1">보내기</button>
					<button class="close2">닫기</button>
				</td>
			</tr>
		</table>
		

	</div>
	<!-- 	//  -->

	<%@ include file="/petst/footer.jsp"%>
</body>
</html>