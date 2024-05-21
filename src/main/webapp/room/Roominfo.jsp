<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ezen Hotel 객실정보</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/css/Roominfo.css?version=1.7">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="shortcut icon" href="#">


</head>
<body>
	<%@ include file="../etc/header.jsp"%>

	<div id="container">
		<div class="service">Accommodation</div>
		<p class="pageTitle">Ezen Hotel Room</p>
		<div class="roomall">
			<div class="roomimg">
				<div>
				<a href="../room/DeluxeKing.jsp"><img class="roomimg1" src="http://www.embledonhotel.com/attachList/upload/hall/c20201112152219673/p20201112152448923/m20201218150729560.jpg"></a>
				<div class="text1" >Deluxe King</div> 
				<div class="text2">디럭스 킹</div>
				<div class="text3">비즈니스고객에게 적합한 사무 공간과 숙면을 위한 편안한 객실입니다.</div>
			</div>
				<div>
				<a href="../room/DeluxeTwin.jsp"><img class="roomimg2" src="http://www.embledonhotel.com/attachList/upload/hall/c20201112152219673/p20201113143859280/m20201218150502533.jpg"></a>
				<div class="text1" style="margin-left: 18px; font-weight: 80px;"  >Deluxe Twin</div> 
				<div class="text2" style="margin-left: 18px;">디럭스 트윈</div>
				<div class="text3" style="margin-left: 18px;">공간의 부드러움을 더하여 업무의 피로를 녹일 수 있는 배려가 깃든 객실입니다.</div>
			</div>
	</div>
			<div class="roomimg3">
				<div> 
				<a href="../room/RoyalSuite.jsp"><img class="roomimg4" src="http://www.embledonhotel.com/attachList/upload/hall/c20201112152219673/p20201218143948880/m20201218144057687.jpg"></a>
				<div class="text4">Royal Suite</div>
				<div class="text5">로얄 스위트</div>
				<div class="text6">넓고 아름다운 전망을 자랑하는 로얄 스위트 룸은 도시 생활의 멋을 재정의합니다.</div>
				</div>
				</div>
	</div>
</div>
	
	

	<script src="${contextPath}/script/main.js?version=1.0"></script>
	<%@ include file="../etc/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>