<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%	
	String mainContextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
	<title>예약 내용 확인</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function reservationConfirmed() {
        	if(confirm("예약을 확정하시겠습니까?")) {
        		alert("예약이 완료되었습니다.");
                $('#completeForm').submit();
        	} else {
        		alert("내용을 확인 후 확정을 눌러주세요.");
        	}
            
        }
    </script>
    
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/mainCss.css?version=1.7">
    <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    .container {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      background-color: #f2f2f2;
    }

    .content {
      text-align: center;
      color: #FFA500;
    }

    h1 {
      font-size: 60px;
    }

    table {
      margin: 20px auto;
      border-collapse: collapse;
    }

    #completeForm th, td {
      padding: 10px 20px;
      border: 1px solid #FFA500;
    }

    .button {
      display: inline-block;
      margin-top: 20px;
      padding: 10px 20px;
      background-color: #FFA500;
      color: white;
      text-decoration: none;
      border-radius: 5px;
    }
  </style>
</head>
<body>
	  <%@ include file="../etc/header.jsp" %>
	
  	  <div class="container">
	    <form id="completeForm" action="${contextPath}/reserveComplete" method="post">
	        <div class="content">
	          <h1>예약 내용 확인</h1>
	          <table>
	            <tr>
	              <th>호텔 이름</th>
	              <td><c:out value="${requestScope.reserveInfo.hotelName}"/></td>
	            </tr>
	            <tr>
	              <th>객실 종류</th>
	              <td><c:out value="${requestScope.reserveInfo.roomName}"/></td>
	            </tr>
	            <tr>
	              <th>체크인</th>
	              <td><c:out value="${requestScope.reserveInfo.checkin}"/></td>
	            </tr>
	            <tr>
	              <th>체크아웃</th>
	              <td><c:out value="${requestScope.reserveInfo.checkout}"/></td>
	            </tr>
	            <tr>
	              <th>기간</th>
	              <td><c:out value="${requestScope.reserveInfo.diffDay}"/></td>
	            </tr>
	            <tr>
	              <th>수용 인원</th>
	              <td><c:out value="${requestScope.reserveInfo.numOfuser}"/>명</td>
	            </tr>
	            <tr>
	              <th>결제 금액</th>
	              <td><c:out value="${requestScope.reserveInfo.price}" />원</td>
	            </tr>
	          </table>
	          <input name="hotelName" type="hidden" value="${requestScope.reserveInfo.hotelName}">
	          <input name="roomName" type="hidden" value="${requestScope.reserveInfo.roomName}">
	          <input name="checkin" type="hidden" value="${requestScope.reserveInfo.checkin}">
	          <input name="checkout" type="hidden" value="${requestScope.reserveInfo.checkout}">
	          <input name="diffDay" type="hidden" value="${requestScope.reserveInfo.diffDay}">
	          <input name="numOfuser" type="hidden" value="${requestScope.reserveInfo.numOfuser}">
	          <input name="user_id" type="hidden" value="${requestScope.reserveInfo.user_id}">
	          <a href="#" class="button" onclick="reservationConfirmed();">예약확정</a>
	        </div>
	    </form>
	  </div>
  	  
  	  <%@ include file="../etc/footer.jsp" %>
</body>
</html>