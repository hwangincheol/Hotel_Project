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
<meta charset="UTF-8">
    <title>Insert title here</title>
    
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/mainCss.css?version=1.11">
	<link rel="shortcut icon" href="#">
	
	<style>
        .container {
          display: flex;
          align-items: center;
          justify-content: center;
          height: 40vh;
          margin: 12%;
        }

        .content {
          display: flex;
          width: 1000px;
          border: 3px solid orange;
          padding: 15px;
        }

        .left-column {
          width: 40%;
        }

        .right-column {
          width: 60%;
          padding-left: 20px;
        }

        .title {
          color: #EDA900;
          font-size: 45px;
          margin-top: 10px;
          text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
          margin-left: 5px;
        }

        .description {
          font-size: 20px;
          margin-top: -30px;
          margin-bottom: 16px;
          margin-left: 5px;
        }

        .image-container {
          display: flex;
          justify-content: space-between;
          margin-top: 20px;
          margin-left: 10px;
        }

        .image-container img {
          width: 170px;
          height: 111px;
          margin-right: 25px;
        }
        .reservation-button {
          padding: 10px 20px;
          background-color: orange;
          color: white;
          border: none;
          border-radius: 5px;
          font-size: 16px;
          cursor: pointer;
          transition: transform 0.3s, box-shadow 0.3s;
          margin-left: 50px;
          font-size: 30px;
        }

        .reservation-button:hover {
          transform: scale(1.1);
          box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
        }

    </style>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%@ include file = "../etc/header.jsp" %>

    <div class="container">
      <div class="content">
        <div class="left-column">
          <img src="${contextPath}/images/reserve/room1.1.jpg" alt="Main Photo" width="400" height="270">
        </div>
        <div class="right-column">
          <h2 class="title">디럭스 킹</h2>
          <p class="description">비즈니스 고객에게 적합한 사무 공간과<br>숙면을 위한 편안한 객실입니다.</p>
          <div class="image-container">
            <img src="${contextPath}/images/reserve/room1.2.jpg" alt="Image 1" width="160" height="120">
            <img src="${contextPath}/images/reserve/room1.3.jpg" alt="Image 2" width="160" height="120">
            <img src="${contextPath}/images/reserve/room1.4.jpg" alt="Image 3" width="160" height="120">
          </div>
        </div>
        <button class="reservation-button"  type="button" onclick="location.href='${contextPath}/reserveDetail?room=room1'">예약하기</button>
      </div>
    </div>
    
    <div class="container">
      <div class="content">
        <div class="left-column">
          <img src="${contextPath}/images/reserve/room2.1.jpg" alt="Main Photo" width="400" height="270">
        </div>
        <div class="right-column">
          <h2 class="title">디럭스 트윈</h2>
          <p class="description">공간의 부드러움을 더하여 업무의 피로를<br>녹일 수 있는 배려가 깃든 객실입니다.</p>
          <div class="image-container">
            <img src="${contextPath}/images/reserve/room2.2.jpg" alt="Image 1" width="160" height="120">
            <img src="${contextPath}/images/reserve/room2.3.jpg" alt="Image 2" width="160" height="120">
            <img src="${contextPath}/images/reserve/room2.4.jpg" alt="Image 3" width="160" height="120">
          </div>
        </div>
        <button class="reservation-button"  type="button" onclick="location.href='${contextPath}/reserveDetail?room=room2'">예약하기</button>
      </div>
    </div>
    
    <div class="container">
      <div class="content">
        <div class="left-column">
          <img src="${contextPath}/images/reserve/room3.1.jpg" alt="Main Photo" width="400" height="270">
        </div>
        <div class="right-column">
          <h2 class="title">로얄 스위트</h2>
          <p class="description">고급스러운 스위트 룸이 선사하는<br>프리미엄 라이프스타일 공간을 누리세요.</p>
          <div class="image-container">
            <img src="${contextPath}/images/reserve/room3.2.jpg" alt="Image 1" width="160" height="120">
            <img src="${contextPath}/images/reserve/room3.3.jpg" alt="Image 2" width="160" height="120">
            <img src="${contextPath}/images/reserve/room3.4.jpg" alt="Image 3" width="160" height="120">
          </div>
        </div>
        <button class="reservation-button"  type="button" onclick="location.href='${contextPath}/reserveDetail?room=room3'">예약하기</button>
      </div>
    </div>
    
    <%@ include file = "../etc/footer.jsp" %>
</body>
</html>