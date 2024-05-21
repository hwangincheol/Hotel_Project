<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.javalab.dao.*, com.javalab.vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!doctype html>
<%
	// reserveDetail에 진입했을 때 로그인 확인
%>
<%
	String mainContextPath = request.getContextPath();
%>
<%

	String room_id = request.getParameter("room");
	String img_src = "";
	String room_name = "";
	String room_type = "";
	String price = "";
	
	String hotel_name = "EZEN_HOTEL";
	
	RoomDao rdao = RoomDao.getInstance();
	RoomVo room = rdao.getRoom(room_id);
	
	price = room.getRoom_price();
	room_name = room.getRoom_name();
	room_type = room.getRoom_type();
	
	switch(room_id) {
	case "room1":
		img_src = "../images/reserve/room1.1.jpg";
		break;
	case "room2":
		img_src = "../images/reserve/room2.1.jpg";
		break;
	case "room3":
		img_src = "../images/reserve/room3.1.jpg";
		break;
	}
	
	
%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>예약 화면</title>
    
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/mainCss.css?version=1.11">
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/reverseDetailCss.css?1.1" >
    <style>
	  .button {
	    display: inline-block;
	    margin-top: 20px;
	    padding: 10px 20px;
	    background-color: #FFA500;
	    color: white;
	    text-decoration: none;
	    border-radius: 5px;
	    border: none;
	    font-size: 16px;
	    cursor: pointer;
	    transition: background-color 0.3s ease;
	  }
	
	  .button:hover {
	    background-color: #FF7F00;
	  }
	  
	  .orangeButton {
	    display: inline-block;
	    width: 50px;
	    height: 50px;
	    line-height: 30px;
	    text-align: center;
	    background-color: #FFA500;
	    color: white;
	    border-radius: 30%;
	    border: none;
	    font-size: 16px;
	    cursor: pointer;
	    transition: background-color 0.3s ease;
	  }
	
	.orangeButton :hover {
	    background-color: #FF7F00;
	  }
	</style>
	<link rel="shortcut icon" href="#">
	
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    	$(document).ready(function() {
    		setCheckinToday();
    		
    		
    		$('#checkin').change(function() {
    			console.log($('#checkin').val());
    			getDiffDay();
    		});
    		
    		$('#checkout').change(function() {
    			console.log($('#checkout').val());
    			getDiffDay();
    		});
    		
    	}); // end (document).ready
    	
    	function getDiffDay() {
    		const date1 = new Date($('#checkin').val());
    		const date2 = new Date($('#checkout').val());
    		//console.log("첫 번째 날짜 : " + date1);
    		//console.log("두 번째 날짜 : " + date2);
    		// 체크인 날짜가 체크아웃 날짜보다 뒤에 있는 경우
    		if(date1 != "" && date2 != "") {
    			if(date1 > date2) {
        			alert("체크인하는 날짜는 체크아웃하는 날보다 많을 수 없습니다.");
        			$('#checkin').val("");
        			$('#checkout').val("");
        			$('#diffDay').val("");
        			return;
        		}
    			
    			// 날짜가 같은 날일 경우
    			if(getDayToString(date1) == getDayToString(date2)) {
    				alert("체크인과 체크아웃 날짜는 같을 수 없습니다.");
    				$('#checkin').val("");
        			$('#checkout').val("");
        			$('#diffDay').val("");
        			return;
    			}
    			
    			const diffTime = Math.abs(date2 - date1);
        		//console.log("두 날짜의 차이(절댓값) : " + diffTime);
        		
        		const diffDay = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
        		//console.log("두 날짜의 차이(일수) : " + diffDay);
        		// 날짜 데이터는 millisecond(1000분의 1초)로 표현된다.
        		// 1000(1초) * 60(1분) * 60(1시간) * 24(24시간 = 하루)
        		if(diffDay > 0) {
        			$('#diffDay').val(diffDay + '박');
        		}
        		
    		}
    	} // end getDiffDay()
    	
    	function getToday() {
    		const today = new Date();
    		const year = today.getFullYear();
    		const month = '0' + (today.getMonth() + 1);
    		const day = today.getDate();
    		const minDate = year + "-" + month + "-" + day;
   
    		return minDate;
    	} // end getToday(
    			
    	// 날짜 데이터를 문자열로 변경
    	function getDayToString(date) {
    		const beforeDate = date;
    		const year = beforeDate.getFullYear();
    		const month = '0' + (beforeDate.getMonth() + 1);
    		const day = beforeDate.getDate();
    		const minDate = year + "-" + month + "-" + day;
    		
    		return minDate;
    	}
    			
    			
    	// 체크인 날짜를 오늘 보다 이전으로 선택할 수 없도록 설정
    	function setCheckinToday() {
    		const todayString = getToday();
    		$('#checkin').attr("min", todayString);
    		$('#checkout').attr("min", todayString);
    	} // end setCheckinToday()
    	
    	// 인원 추가
    	function addPerson() {
    		var num = $('#numOfuser').val();
    		num++;
    		if(num >= 4) {
    			num = 4;
    		}
    		
    		$('#numOfuser').val(num);
    	}
    	
    	// 인원 감소
    	function minusPerson() {
    		var num = $('#numOfuser').val();
    		num--;
    		if(num <= 1) {
    			num = 1;
    		}
    		
    		$('#numOfuser').val(num);
    	}
    	
    	function reserveConfirm() {
			// date 입력 검증
			var date1 = $('#checkin').val();
			var date2 = $('#checkout').val();
			
			if(date1 == "" || date2 == "") {
				alert("날짜가 모두 입력되지 않았습니다.");
				return;
			}
			
			if(confirm("예약하시겠습니까?")) {
				alert("예약 내용을 모두 작성하였습니다.");
				$('#reserveForm').submit();
			} else {
				alert("내용입력 화면으로 돌아갑니다.")
			}
		}
    	
    	
    </script>

  </head>
  <body>
  	  <%@ include file = "../etc/header.jsp" %>
  	  <form id="reserveForm" action="${contextPath}/reserveConfirm" method="post">
  	  	  <input name="user_id" type="hidden" value="${sessionScope.member.user_id}">
	  	  <div class="container">
	          <div class="reserveTitle">
	              <div id="title"><%= room_name %><span id="subtitle"><%= room_type %></span></div>
	              <div id="menu">예약 화면</div>
	              <hr>
	              <div id="body">
	                  <img src=<%= img_src %> />
	                  <div class="centerd">
	                      <table>
	                          <tr>
	                              <td><label for="hotelName">호텔이름</label></td>
	                              <td><label for="roomName">객실종류</label></td>
	                              <td><label for="checkin">체크인</label></td>
	                              <td><input type="text" id="diffDay" name="diffDay" readonly style="color: #FFA500; border:none"></td>
	                              <td><label for="checkout">체크아웃</label></td>
	                              <td><label for="numOfuser">인원</label></td>
	                          </tr>
	                          <tr>
	                              <td><input id="hotelName" name="hotelName" type="text" value=<%= hotel_name %> readonly></td>
	                              <td><input id="roomName" name="roomName" type="text" value="<%= room_type %>" readonly></td>
	                              <td><input id="checkin" name="checkin" type="date" min="YYYY-MM-DD"></td>
	                              <td></td>
	                              <td><input id="checkout" name="checkout" type="date"></td>
	                              <td><input id="numOfuser" name="numOfuser" type="number" value="1" readonly></td>
	                              <td><input id="price" name="price" type="hidden" value=<%= price %>></td>
	                              <td>
	                                  <button class="orangeButton" type="button" onclick="minusPerson();">-</button>
	                                  <button class="orangeButton" type="button" onclick="addPerson();">+</button>
	                              </td>
	                          </tr>
	                          <tr>
	                         	 <td>
	                          	 	 <div style="display: flex; justify-content: center; margin-top: 20px;">
				                        <button class="button" type="button" onclick="reserveConfirm();" style="width: 120px; height: 40px; font-size: 15px;">예약하기</button>
				                     </div>
			                      </td>                          	
	                          </tr>
	                      </table>
	                  </div>
	              </div>
	          </div>
	      </div>
  	  </form>
      
      
      <%@ include file = "../etc/footer.jsp" %>
  </body>
</html>