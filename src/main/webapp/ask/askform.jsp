<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>고객의 소리</title>
	
	<!-- 부트스트랩 link -->
   <link rel="stylesheet" 
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

	<!-- 헤더 -->
	<link rel="stylesheet" type="text/css" href="../css/mainCss.css?version=1.7">
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			//폼에서 submit 이벤트 발생시 작동
	        $("#regform").on('submit', function() {
	        		alert("문의 해주셔서 감사합니다. 확인 후 연락드리겠습니다.")
	        });
	    });
    </script>
</head>
<body>

	<%@ include file="../etc/header.jsp" %>
	<br>
	
	<div style="margin:auto;text-align:center;">
	<form style="display:inline-block;" 
		id="regform" 
		method="post" 
		action="${contextPath}/askServlet">
		<h1 style="text-align: center; font-weight: bold; color: #696969;">고객의 소리</h1>
		<hr color="orange">
		<br>
		<table>
			<tr style="align-self: center">
				<td><label for="exampleFormControlInput1" class="form-label">이름</label></td>
				<td><input type="text" class="form-control" name="ask_name" id="ask_name" style="width: 600px;" required></td>
			</tr>
			<tr>
				<td><label for="exampleFormControlInput1" class="form-label">제목</label></td>
				<td><input type="text" class="form-control" name="ask_title" id="ask_title" style="width: 600px;" required></td>
			</tr>
			<tr>
				<td><label for="exampleFormControlInput1" class="form-label">전화번호</label></td>
				<td><input type="text" class="form-control" name="ask_phone" id="ask_content" style="width: 600px;" required></td>
			</tr>
			<tr>
				<td><label for="exampleFormControlInput1" class="form-label">이메일</label></td>
				<td><input type="text" class="form-control" name="ask_email" id="ask_content" style="width: 600px;" required></td>
			
			</tr>
			<tr>
				<td><label for="exampleFormControlInput1" class="form-label">문의 내용</label></td>
				<td><textarea name="ask_content" class="form-control" id="ask_content" style="width: 600px;height: 300px;" required ></textarea></td>
			</tr>
			<tr>
				<td><br></td>
				<td>
				<div class="d-flex gap-2 justify-content-center py-5">
					<button class="btn btn-outline-secondary d-inline-flex align-items-center" type="submit">
					문의하기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="btn btn-outline-secondary d-inline-flex align-items-center" type="reset">
					다시입력</button>
				</div> 
				</td>
			</tr>
		</table>
	</form>
	</div>
	
	<%@ include file="../etc/footer.jsp" %>

</body>
</html>