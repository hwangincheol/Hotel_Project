<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.javalab.vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	MemberVo member = (MemberVo)session.getAttribute("member");
	String loginUrl = "";
	String reserveUrl = "";
	
	String contextPath = request.getContextPath();
	
	if(member == null) {
		loginUrl = "<a href='" + contextPath + "/loginCheck'>로그인</a>";
		reserveUrl = "<a href='#' onclick='loginCheck();'>예약</a>";
	} else {
		loginUrl = "<a href='#' onclick='logoutCheck();'>로그아웃</a>";
		reserveUrl = "<a href='../reserve/reserveMain.jsp'>예약</a>";
	}
	
%>

<script type="text/javascript"> // 로그인 세션 만료 체크
	var member = '<%= session.getAttribute("member") %>';
	// member에 값이 존재할 때만 인터벌 실행
	if(member != 'null') {
		var timer = setInterval(() => {
				
				var createTime = '<%= session.getAttribute("createTime") %>';
				console.log("세션 접근 시간: " + createTime);
				
				var maxInactiveInterval = '<%= session.getMaxInactiveInterval() * 1000 %>';
				console.log("세션 만료 시간: " + maxInactiveInterval);
				
				var now = new Date().getTime(); // 현재 시간을 millisecond 값으로 치환
				console.log("현재 시간: " + now);
				
				var elapsed = now - createTime;
				console.log("현재 시간 - 세션 마지막 접근 시간: " + elapsed);
				
				if(elapsed > maxInactiveInterval) {
					alert("세션이 만료되었습니다. 다시 로그인해주세요.");
					clearInterval(timer);
					window.location.href = '<%= request.getContextPath() %>/logout';
				}
			}, 1000);
		}
</script>


<script type="text/javascript">
	function logoutCheck() {
		if(confirm("로그아웃 하시겠습니까?")) {
			alert("로그아웃 되었습니다.");
			window.location.href = '<%= contextPath %>/logout';
		} else {
			alert("취소되었습니다.");
		}
	}
	
	function loginCheck() {
		if(sessionStorage.getItem("member") === null) {
			alert("로그인이 필요한 기능입니다.");
			window.location.href = '<%= contextPath %>/loginCheck';
		}
	}
</script>
<table width="100%" bgcolor="#F29661" class="header">
        <tr>
        	<th><a href="${contextPath}/main/main.jsp"><img src="${contextPath}/images/main/logo_white.png" width="110" height="110"></a></th>
            <th><a href="${contextPath}/room/Roominfo.jsp">객실정보</a></th>
            <th><%= reserveUrl %></th>
            <th><a href="${contextPath}/reserve/reserveCheckForm.jsp">예약내역</a></th>
            <th><a href="${contextPath}/ask/askform.jsp">고객의소리</a></th>
            <th><a href="<%=request.getContextPath()%>/boardList">이용후기</a></th>
            <th><%= loginUrl %></th>
            <th><a href="${contextPath}/join/join.jsp">회원가입</a></th>
        </tr>
</table>
