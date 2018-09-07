<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1"  style="min-height: 600px;" align="center">
<tr><td width="770px;" height="20px;" style="padding-left: 30px;">
<input type="hidden" id="meeting_boardno" value="${review.meeting_boardno }">
<input type="hidden" id="meetingReview_no" value="${review.meetingReview_no }">
${review.meetingReview_title }
</td><td width="200px;" height="20px;" style="padding-left: 30px;">
${review.meetingReview_writeDate }
</td></tr>
<tr><td colspan="2" height="20px;" style="padding-left: 30px;">
${review.meetingReview_nickname }
</td></tr>
<tr><td colspan="2" style="padding-left: 30px;">
${review.meetingReview_content } 
</td></tr>
<tr><td colspan="2" height="20px;" style="padding-left: 30px;">
댓글
</td></tr>


</table>




</body>
</html>