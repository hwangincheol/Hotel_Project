<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        .container {
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          height: 100vh;
        }

        .message {
          font-size: 60px;
          color: orange;
          margin-bottom: 20px;
        }

        .reservation {
          display: flex;
          align-items: center;
          justify-content: center;
        }

        label {
          font-size: 35px;
          color: orange;
        }

        input[type="text"] {
          width: 250px;
          height: 30px;
          padding: 5px;
          border: none;
          border-radius: 5px;
          margin-right: 20px;
          margin-left: 20px;
          box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
          text-align: center;
          font-size: 20px;
        }

        #copy-button {
          width: 80px;
          height: 45px;
          background-color: orange;
          color: white;
          border: none;
          border-radius: 5px;
          cursor: pointer;
          font-size: 30px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function copyValue() {
            const data = $('#reservation-number').val();
            
            navigator.clipboard.writeText(data)
            .then(() => {
                alert("클립보드에 복사되었습니다.");
            })
            .catch(() => {
                alert("클립보드 저장에 실패했습니다.");
            })
            
        }
    </script>
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/mainCss.css?version=1.7">
    
</head>
<body>
	<%@ include file="../etc/header.jsp"%>
	
    <div class="container">
      <div class="message">예약이 완료 되었습니다.</div>
      <div class="reservation">
        <label for="reservation-number">예매번호</label>
        <input type="text" id="reservation-number" value="<c:out value='${requestScope.reserveNo}' />" readonly>
        <button id="copy-button" type="button" onclick="copyValue();">복사</button>
      </div>
    </div>
    
    <%@ include file="../etc/footer.jsp"%>
</body>
</html>