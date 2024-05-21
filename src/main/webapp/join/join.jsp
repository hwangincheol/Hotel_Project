<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE>
<html>
<head>
   <meta charset="UTF-8">
   <title>Ezen Hotel 회원 가입 페이지</title>
	<link rel="stylesheet" type="text/css" href="../css/mainCss.css?version=1.7">
	<link rel="shortcut icon" href="#">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
        $('#btn').on('click', function(e) {
           e.preventDefault();

           var id = $('#id').val();
           var pwd = $('#password').val();
           var name = $('#name').val();
           var phone = $('#phone').val();
           var email = $('#email').val();
           
           const id_regex = /^[a-z]+[a-z0-9]{5,19}$/g;
           const pwd_regex = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
           const name_regex = /^[가-힣]+$/;
           const phone_regex = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
           const email_regex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        	     
        	 
           if(id == "") {
        	   alert("아이디를 입력해주세요");
        	   $('#id').focus();
        	   return;
           }
           
           if(!id_regex.test(id)) {
        	   alert("영어 소문자와 숫자로 5자리 이상 입력해주세요.");
        	   $('#id').focus();
        	   return;
           }
           
           if(pwd == "") {
        	   alert("비밀번호를 입력해주세요");
        	   $('#password').focus();
        	   return;
           }
          
           if(!pwd_regex.test(pwd)) {
        	   alert("소문자와 숫자 특수문자를 넣어 8자리 이상 입력해주세요.");
        	   $('#password').focus();
        	   return;
           }
           
           if(name == "") {
        	   alert("이름를 입력해주세요");
        	   $('#name').focus();
        	   return;
           }
           
           if(!name_regex.test(name)) {
        	   alert("한글로 입력해주세요.");
        	   $('#name').focus();
        	   return;
           }
           
           if(phone == "") {
        	   alert("전화번호를 입력해주세요");
        	   $('#phone').focus();
        	   return;
           }
           
           if(!phone_regex.test(phone)) {
        	   alert("하이픈(-)을 포함하여 작성해주세요.\n '010-0000-0000'");
        	   $('#phone').focus();
        	   return;
           }
           
           if(email == "") {
        	   alert("이메일를 입력해주세요");
        	   $('#email').focus();
        	   return;
           }
           
           if(!email_regex.test(email)) {
        	   alert("이메일 형식으로 입력해주세요 \n 'ezen@naver.com'");
        	   $('#email').focus();
        	   return;
           }
           
           $.ajax({
        	   url : '${contextPath}/idCheck',
        	   type : 'get',
        	   data : {id: id},
        	   dataType : 'text',
        	   success: function(result) {
        		  const isExist = JSON.parse(result);
        		  if(isExist == 'true') {
        			  alert("아이디가 존재합니다.");
        		  } else {
        			  alert("회원가입이 가능한 아이디입니다.");
        			  alert("회원가입 완료.");
        			  $('#regForm').submit();
        		  }
        	   }
           });
          
        });
     });
	</script>
	
	
	<%-- 로그인이 된 상태에서 회원가입 폼으로 이동하기 방지 --%> 
	<%
		MemberVo object = (MemberVo)session.getAttribute("member");
		if(object != null) {
			
	%>
		<script type="text/javascript">
			alert("로그아웃 후 진행해주세요.");
			window.location.href = "${contextPath}/main/main.jsp";
		</script>
	<%
		} else {
	%>
		<script type="text/javascript">
			alert("회원가입 창으로 이동합니다.");
		</script>
	<%
		}
	%>
	
	
	<%-- 실시간 아이디 중복 검사 --%>
	<script type="text/javascript">
        $(document).ready(function() {
            
            const input = document.getElementById('id');
        
            
            input.addEventListener('keyup', function(event) {
                const input_id = event.target.value;
                const checkText = document.getElementById('idCheck');
                
             // 회원 아이디가 존재하는지 확인
		        $.ajax({
					url : '${contextPath}/idCheck',
					type : 'get',
					data : {id: input_id},
					dataType : 'text',
					success: function(result) {
						const isExists = JSON.parse(result);
						if(isExists == 'false') {
							checkText.innerHTML = "사용가능한 아이디입니다.";
							checkText.style.color = "green";
							return;
						} else {
							checkText.innerHTML = "이미 가입된 아이디입니다.";
							checkText.style.color = "red";
							return;
						}
					},
					error: function(request, status, error) {
						console.log(error);
					}
				}); // 회원 아이디 체크 ajax
				
				
            });
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
      <!--LoginServlet으로 이동-->
      <%@ include file="../etc/header.jsp" %>
      
      <div class="container">
	    <h2>회원가입</h2>
	
	    <form action="${contextPath}/join" id="regForm" method="post">
	      <div class="form-group">
	        <label for="id">아이디</label>
	        <input type="text" id="id" name="id" required>
	        <p class="additional-info" id="idCheck"></p>
	      </div>
	
	      <div class="form-group">
	        <label for="password">비밀번호</label>
	        <input type="password" id="password" name="pwd" required>
	      </div>
	
	      <div class="form-group">
	        <label for="name">이름</label>
	        <input type="text" id="name" name="name" required>
	      </div>
	
	      <div class="form-group">
	        <label for="phone">전화번호</label>
	        <input type="tel" id="phone" name="phone" required>
	      </div>
	
	      <div class="form-group">
	        <label for="email">이메일</label>
	        <input type="email" id="email" name="email" required>
	      </div>
	
	      <div class="btn-container">
	        <button type="submit" id="btn">회원가입</button>
	      </div>
	    </form>
	  </div>
     
      <%@ include file="../etc/footer.jsp" %>
</body>
</html>