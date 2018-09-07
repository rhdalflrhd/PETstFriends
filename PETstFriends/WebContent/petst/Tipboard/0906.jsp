<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">

function move_box(an, box) {
//링크된 위치에서 부터의 설정값 지정
  var cleft = 20;  //왼쪽마진  
  var ctop = -10;  //상단마진
  var obj = an;
  while (obj.offsetParent) {
    cleft += obj.offsetLeft;
    ctop += obj.offsetTop;
    obj = obj.offsetParent;
  }
  box.style.left = cleft + 'px';
  ctop += an.offsetHeight + 8;
  if (document.body.currentStyle &&
    document.body.currentStyle['marginTop']) {
    ctop += parseInt(
      document.body.currentStyle['marginTop']);
  }
  box.style.top = ctop + 'px';
}

function show_hide_box(an, width, height, borderStyle) {
  var href = an.href;
  var boxdiv = document.getElementById(href);

  if (boxdiv != null) {
    if (boxdiv.style.display=='none') {
      move_box(an, boxdiv);
      boxdiv.style.display='block';
    } else
      boxdiv.style.display='none';
    return false;
  }

  boxdiv = document.createElement('div');
  boxdiv.setAttribute('id', href);
  boxdiv.style.display = 'block';
  boxdiv.style.position = 'absolute';
  boxdiv.style.width = width + 'px';
  boxdiv.style.height = height + 'px';
  boxdiv.style.border = borderStyle;
  boxdiv.style.backgroundColor = '#fff';

  var contents = document.createElement('iframe');
  contents.scrolling = 'no';
  contents.frameBorder = '0';
  contents.style.width = width + 'px';
  contents.style.height = height + 'px';
  contents.src = href;

  boxdiv.appendChild(contents);
  document.body.appendChild(boxdiv);
  move_box(an, boxdiv);

  return false;
}
</script>
</head>
<body>
레이어 팝업창 안에 HTML파일 및 외부사이트를 보여줄 수 있습니다.<p>
<a href="http://www.blueb.co.kr" onClick="return show_hide_box(this,440,300,'1px solid')">여기를 클릭하세요..</a>
</body>
</html>