<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	String javaContextPath = request.getContextPath();
%>
<!DOCTYPE>
<html>
<head>
   <meta charset="UTF-8">
   <title>Ezen Hotel 회원 로그인</title>
    
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/mainCss.css?version=1.7">
	<link rel="shortcut icon" href="#">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			
			$('#username').focus();
			
			$('#loginBtn').on('click', function(e) {
				e.preventDefault();
				
				var id = $('#username').val();
				var pwd = $('#password').val();
				
				const id_regex = /^[a-z0-9]{5,20}$/;
		        
		        if(id == "") {
		        	alert("아이디를 입력해주세요.");
		        	$('#username').focus();
		        	return;
		        }
		        
		        if(!id_regex.test(id)) {
		        	alert("입력하신 아이디 형식이 맞지 않습니다.");
		        	$('#username').focus();
		        	return;
		        }
		        
		        if(pwd == "") {
		        	alert("비밀번호를 입력해주세요.");
		        	$('#password').focus();
		        	return;
		        }
		       
		        // 회원 아이디가 존재하는지 확인
		        $.ajax({
					url : '${contextPath}/idCheck',
					type : 'get',
					data : {id: id},
					dataType : 'text',
					success: function(result) {
						const isExists = JSON.parse(result);
						console.log(isExists);
						if(isExists == 'false') {
							alert("가입된 회원이 존재하지 않습니다.");
							$('#username').focus();
							return;
							
						} else {
							
							// 로그인 체크 확인
							$.ajax({
								url : '${contextPath}/loginCheck',
								type : 'post',
								data : {id: id, pwd: pwd},
								dataType : 'text',
								success: function(result) {
									const member = JSON.parse(result);
									if(member == null) {
										alert("비밀번호가 올바르지 않습니다.");
										$('#password').focus();
										return;
										
									} else {
										alert("로그인 되었습니다.");
										$('#loginForm').submit();
									}
								},
								error: function(request, status, error) {
									alert('서버와의 통신에 실패하였습니다.');
								}
							}); // end 로그인 체크 ajax
							
						}
					},
					error: function(request, status, error) {
						console.log(error);
					}
				}); // 회원 아이디 체크 ajax
				
				
			})
		});
	</script>
	<style>
    body {
      font-family: Arial, sans-serif;
      background-color: #F6F6F6;
    }

    .container {
      width: 450px;
      margin: 5% auto;
      background-color: white;
      border-radius: 5px;
      padding: 20px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    h2 {
      font-size: 24px;
      margin-bottom: 20px;
      text-align: center;
    }

    .form-group {
      margin-bottom: 15px;
    }

    .form-group label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
      margin-left: 30px;
    }

    .form-group input[type="text"], input[type="password"], input[type="email"], input[type="tel"]{
      width: 80%;
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 3px;
      margin-left: 30px;
    }
      .form-group p {
          margin-left: 30px;
      }

    .additional-info {
      font-size: 5px;
      margin-top: 5px;
    }

    .btn-container {
      text-align: center;
    }

    .btn-container button {
      padding: 10px 20px;
      background-color: #4CAF50;
      color: #fff;
      border: none;
      border-radius: 3px;
      cursor: pointer;
      font-size: 16px;
    }
  </style>
</head>

<body>
	<%@ include file="../etc/header.jsp" %>
         
      <div class="container">
	    <h2>로그인</h2>
	
	    <form action="${contextPath}/login" id="loginForm" method="post">
	      <div class="form-group">
	        <label for="id">아이디</label>
	        <input type="text" id="username" name="username" required>
	        <p class="additional-info" id="idCheck"></p>
	      </div>
	
	      <div class="form-group">
	        <label for="password">비밀번호</label>
	        <input type="password" id="password" name="password" required>
	      </div>
	
	      <div class="btn-container">
	        <button type="submit" id="loginBtn">로그인</button>
	      </div>
	    </form>
	  </div>

      <%@ include file="../etc/footer.jsp" %>
</body>
</html>