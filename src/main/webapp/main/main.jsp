<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javax.servlet.http.HttpSession, java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	String javaContextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	
	
	<link rel="stylesheet" type="text/css" href="${contextPath}/css/mainCss.css?version=1.7">
</head>
<body>
	<%@ include file= "../etc/header.jsp" %>
		
	<div class="wrapper">
		<div id="container">
			<img src="${contextPath}/images/main/hotel1.jpg" >
			<img src="${contextPath}/images/main/hotel2.jpg" >
			<img src="${contextPath}/images/main/hotel3.jpg" >
			<button id="prev">&lang;</button>
			<button id="next">&rang;</button>
		</div>
	</div>
	
	<div class="roominfo">
		<font size="10">이젠 호텔만의 모던한 객실</font><br>
	    <font size="5">이젠 호텔의 객실은 모던하면서도 품격 있는 라이프 스타일 공간으로<br>
	    고객님들께 집과 같이 보다 쾌적한 환경에서 지내실 수 있는 객실을 제공합니다.</font>
	</div>	
	<div class="main">
		<div id="room">
			<img src="${contextPath}/images/main/room1.jpg">
	       	<img src="${contextPath}/images/main/room2.jpg">
	       	<img src="${contextPath}/images/main/room3.jpg">
		</div>
	</div>
	<div class="roominfo">
		<div>
			<font size="10">다양한 서비스</font><br>
			<font size="5">다양한 소셜 라이프(Social life)를 즐길 수 있는 라운지부터<br>
			수영장, 퍼스널 트레이닝 스튜디오 그리고 레스토랑 겸 <br>바인 다이닝 존을 경험할 수 있습니다.</font>
		</div>
	</div>
	
	
	<%@ include file= "../etc/footer.jsp" %>
	<script src="${contextPath}/script/main.js?version=1.0"></script>
</body>
</html>