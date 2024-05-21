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
<script src="https://kit.fontawesome.com/def66b134a.js"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/css/DeluxeKing.css?version=1.7">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="shortcut icon" href="#">


<script type="text/javascript">
	function on_submit() {
		window.location.href = '${contextPath}/reserve/reserveDetail.jsp?room=room1'
	}
</script>

</head>
<body>
	<%@ include file="../etc/header.jsp"%>

	<div class="wrapper">
		<div id="container">
			<img src="${contextPath}/images/main/room1.1.jpg"> <img
				src="${contextPath}/images/main/room1.2.jpg"> <img
				src="${contextPath}/images/main/room1.3.jpg"> <img
				src="${contextPath}/images/main/room1.4.jpg"> <img
				src="${contextPath}/images/main/room1.5.jpg"> <img
				src="${contextPath}/images/main/room1.6.jpg">
			<button id="prev">&lang;</button>
			<button id="next">&rang;</button>
		</div>
	</div>
	<p class="page_title">디럭스 킹</p>
	<div class=line></div>

	<div class="imgContainer">
		<div class="service-info-area">
			<h3 class="service-info-heading">Information</h3>
			<div class="service-info-detail">
				<div class="service-info-division">
					<div class="service-info-list-group">
						<div class="service-info-list">
							<div class="service-info-listbox">
								<div class="service-info-item">
									<div class="title">체크 인</div>
									<div class="ment">15:00</div>
								</div>
								<div class="service-info-item">
									<div class="title">체크 아웃</div>
									<div class="ment">11:00</div>
								</div>
							</div>
						</div>
						<div class="service-info-list">
							<div class="service-info-listbox">
								<div class="service-info-item">
									<div class="title">기준 인원</div>
									<div class="ment">최대 4인 (1인 어미니티 추가
										제공)</div>
								</div>
								<div class="service-info-item">
									<div class="title">객실 구성</div>
									<div class="ment">침실1, 욕실1</div>
								</div>
								<div class="service-info-item">
									<div class="title">침대 타입</div>
									<div class="ment">Queen Size 1600*2000㎜ 1EA</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<section class="description_section">

		<div class="description">
			이젠만의 유니크한 가구 디자인과 <br>
			퀸베드, 소파, 테이블로 이루어진 커플 &amp; 비즈니스 고객을 위한 객실입니다. <br> <br>
			• 인원기준 : 기준 2인/최대 4인(미취학아동 포함 최대 4인 무료입실) <br>
			• 객실면적 : 22.47㎡ <br>
			• 객실구조 : 침실+욕실 <br>
			• 베드규격 : 퀸1개 <br>
			• 객실전망 : 시티뷰 <br>
			• 취사여부 : 불가능 <br>*어메니티: 샴프,린스,바디워시,대형냉장고,세탁기,커피머신(돌체) <br>전자레인지,커피포트,토스터기
		</div>

		<div class="cont">
			<h3>Benefits</h3>
		</div>
		<div class="cont1">
			<div class="cont">
			1. 투숙객 무료주차가능 <br>
			2. 이젠 컴퓨터 학원 수강료할인 <br>
			3. 이젠카페 10% 할인 <br>
			4. 이젠카페 1+1 쿠폰 제공 <br>
			5. 오이도 조개구이 &amp; 칼국수  최대 10,000원 할인 <br>
			6. 한대앞 모든 야장 10%할인 <br>
			7. GS25 5% 요금 할인 <br>
			8. 안산 올림픽수영장 30% 요금할인 <br>
			9. 대부도 유리섬 패키지 30% 요금 할인
			</div>
		</div>
		<div class="cont2">
			<h4>Service</h4>
		</div>
			<div class="cont3">
				<div class="cont">
			- 투숙객 수하물/귀중품 보관 서비스 <br>
			- 콜택시 제공
			</div>
		</div>
		<div class="cont">
			<h5>Check In Instructions</h5>
		</div>
			<div class="cont4">
				<div class="cont">
				- 규정인원 외 비용이 추가 됩니다. (미취학 아동 부터) <br>
				- 체크인 / 체크아웃 시간을 준수해 주세요. 체크인 시간: 15:00 / 체크아웃 시간 11:00 <br>
				- 고성방가 등으로 타인에게 불쾌감을 주는 행위를 금지하며, 강제 퇴실의 사유가 될 수 있습니다. <br>
				- 객실과 차량 내 귀중품의 분실에 대하여 당사에서는 책임을 지지 않습니다. <br>
				- 쾌적한 환경과 공중위생을 위하여 반려객실 외 동물 출입은 금지합니다. <br>
				- 당사는 금연 건물로 객실내 흡연이 불가합니다.
			</div>
		</div>
		<div class="cont5">
			<h6>Traffic</h6>
		</div>
			<div class="cont6">
				<div class="cont">
				한대앞 2번출구 도보 3~5분거리 <br>
				안산 버스터미널에서 한대앞방향 20분 거리
				</div>
			</div>
		<div class="cont7">
			<h8>예약 및 이용문의</h8>
		</div>
	<div class="imgContainer1">
		<div class="service-info-area1">
			<div class="cont8">
				<div class="cont9">
				<ul>
  					<li>체크인 오후 3시 이후, 체크아웃 오전 11시</li>
  					<li style="margin-top: 10px;">전 객실 금연</li>
				</ul>
				</div>
			</div>
				<h9>조식 이용 안내</h9>
			<div class="cont10">
				<ul>
  					<li>엠다이닝 07:00~09:00(주중/주말/공휴일)</li>
				</ul>
			</div>
				<h10>취소 규정</h10>
			<div class="cont11">
				<ul>
  					<li>입실일 전일 18시 이전 무료 취소</li>
  					<li style="margin-top: 10px;">18시이후 ~ 당일 1박 요금 100%</li>
				</ul>
			</div>
				<h11>성수기 취소 규정</h11>
			<div class="cont12">
				<ul>
  					<li>2일전 자정까지 취소시 50%</li>
  					<li style="margin-top: 10px;">1일전 18시까지 취소시 70%</li>
  					<li style="margin-top: 10px;">18시이후 ~ 당일 1박요금 100%</li>
				</ul>
			</div>
		</div>
	</div>
	<div class= wrap id="wrap">
		<button class="btn_alert" style="padding: 23px; " onclick="location.href='${contextPath}/reserveDetail?room=room1'">객실 예약하기</button>
	</div>
	</section>



	<script src="${contextPath}/script/main.js?version=1.0"></script>
	<%@ include file="../etc/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>