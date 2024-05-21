<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예약 확인</title>
	
	<!-- 부트스트랩 link -->
   <link rel="stylesheet" 
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	
	<link rel="stylesheet" type="text/css" href="../css/mainCss.css?version=1.7">
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
		//폼에서 submit 이벤트 발생시 작동
	        $("#regform").on('submit', function() {
	        	event.preventDefault();
	        	
	        	var params = $('#regform').serialize();
	        	console.log('자바스크립트단', params);
	        	
	            // 서블릿으로 Ajax 요청 보내기
	            $.ajax({
	            	url: "${pageContext.request.contextPath}/reserveCheck",
	            	type: "post",
	            	dataType : "text",   // 서버로부터 받을 데이터 타입
	            	//폼의 내용을 serialize해서 url로 전송(변수 이름은 무관)
	            	data : params,   // 서버로 보낼 데이터
	            	// 처리결과 성공시 호출되는 콜백 함수
	            	success:function (result){
	            		
	            		console.log('result', result);
	            		//JSON Type String -> javascript Obj
	            		reserve = JSON.parse(result);
	            		
	            		if (reserve.reserve_no == 0) {
							alert("없는 예약 번호입니다. 예약번호를 다시 입력해주세요.")
						} else {
							
	            		//테이블 생성
	                   	var tableHtml = "<table border=1 style='margin:auto;text-align:center;'><br>";

		                tableHtml += '<tr><th style="width: 150px;">예약 번호</th><td style="width: 200px;">' + reserve.reserve_no + '</td></tr>';
		                tableHtml += '<tr><th style="width: 150px;">예약자 이름</th><td style="width: 200px;">' + reserve.reserve_name + '</td></tr>';
		                tableHtml += '<tr><th style="width: 150px;">예약된 방 정보</th><td style="width: 200px;">' + reserve.room_type + '</td></tr>';
		                tableHtml += '<tr><th style="width: 150px;">예약 시작일</th><td style="width: 200px;">' + reserve.checkin + '</td></tr>';
		                tableHtml += '<tr><th style="width: 150px;">예약 종료일</th><td style="width: 200px;">' + reserve.checkout + '</td></tr>';
		                tableHtml += '</table>';
		                
	                    $('#result').html(tableHtml);
						}
	                },
	                error:function(xhr, status, error){
	                	//오류쳐리
	                    console.error("An error occurred: " + error);
	                }
	            }); 
	        });
	    });
    </script>
</head>
<body>

	<%@ include file="../etc/header.jsp" %>
	<br><br><br><br>
	
	<div style="margin:auto;text-align:center;">
	<form style="display:inline-block;" id="regform" method="post" action="">
		<h1 style="text-align: center; font-weight: bold; color: #696969;">예약 내역 확인</h1>
		<hr color="orange">
		<br><br>
		<table>
			<tr>
				<td><label for="exampleFormControlInput1" class="form-label">예약 번호를 입력해 주세요&nbsp;</label></td>
				<td><input type="text" class="form-control" name="reserve_no" id="reserve_no" required></td>
			</tr>
		</table>
		<table style="margin:auto;text-align:center;">
			<tr>
				<td>
				<div class="d-flex gap-2 justify-content-center py-5">
					<button class="btn btn-outline-secondary d-inline-flex align-items-center" type="submit">
					예약 내역 확인</button>&nbsp;&nbsp;&nbsp;
					<button class="btn btn-outline-secondary d-inline-flex align-items-center" type="reset">
					다시입력</button>
				</div> 
				</td>
			</tr>
		</table>
	</form>
	</div>
	<div id="result">
	</div>
	<br><br><br><br><br>
	
	<%@ include file="../etc/footer.jsp" %>

</body>
</html>