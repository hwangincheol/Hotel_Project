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
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/loginCss.css?version=1.7">
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
										$('#regForm').submit();
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
</head>

<body>
	<%@ include file="../etc/header.jsp" %>
      <!--LoginServlet으로 이동-->
      <div id="loginComment">
         회원 로그인 화면입니다<br />
         
      </div>
      
      <form id="regForm" action="${contextPath}/login" method="post">
         <table align="center" class="log">
            <tr>
               <th align="center" colspan="2">LOGIN</th>
            </tr>
            <tr id="loginTr">
               <td id="text">아이디</td>
               <td><input type="text" name="username" id="username" /></td>
            </tr>
            <tr>
               <td id="text">비밀번호</td>
               <td><input type="password" name="password" id="password" /></td>
            </tr>
            <tr>
               <td colspan="2" align="center">
                  <input type="submit" value="로그인" id="loginBtn" />
               </td>
            </tr>
         </table>
         
      </form>
      <br /><br /><br /><br /><br />

      <%@ include file="../etc/footer.jsp" %>
</body>
</html>