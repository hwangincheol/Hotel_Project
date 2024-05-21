<%@page import="com.javalab.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	
<meta charset="UTF-8">
<title>이용 후기</title>

	<script type="text/javascript">
		function goUrl(url) {
			var id = '${sessionScope.member.user_id}';
			if(id != null && id.length > 0){
				location.href = url;
			}else{
				alert('로그인 사용자만 글을 작성할 수 있습니다.');
				if (confirm("로그인 하시겠습니까?")){
					location.href = "${contextPath}/loginCheck";
				}
			}
		}	
	</script>
	
<style>
	table {
	  border: 1px #a39485 solid;
	  font-size: .9em;
	  box-shadow: 0 2px 5px rgba(0,0,0,.25);
	  width: 100%;
	  border-collapse: collapse;
	  border-radius: 5px;
	  overflow: hidden;
	}
	
	
	  
	thead {
	  font-weight: bold;
	  color: #fff;
	  background: #73685d;
	}
	  
	  td, th {
	  padding: 1em .5em;
	 
	} 
	  
	a {
	  color: #73685d;
	  text-decoration-line : none;
	}
	  
	 @media all and (max-width: 768px) {
	    
	  table, thead, tbody, th, td, tr {
	    display: block;
	  }
	  
	  th {
	    text-align: right;
	  }
	  
	  table {
	    position: relative; 
	    padding-bottom: 0;
	    border: none;
	    box-shadow: 0 0 10px rgba(0,0,0,.2);
	  }
	  
	  tr {
	    display: inline-block;
	    vertical-align: top;
	  }
	  
	  th {
	    border-bottom: 1px solid #a39485;
	  }
	  
	  td {
	    border-bottom: 1px solid #e5e5e5;
	  }
  
</style>
	
	
	
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/mainCss.css?version=1.7">
   <link rel="shortcut icon" href="#">
  

</head>
<body>
<%@ include file="../etc/header.jsp" %>
	<h1 style="text-align:center;">이용 후기</h1>
	<div style="text-align: right;">
		<c:if test="${not empty sessionScope.member.user_id}" >
			<strong>${sessionScope.member.name}(${sessionScope.member.user_id})님</strong>
			<a href="${pageContext.request.contextPath}/logout"><strong>로그아웃</strong></a>
		</c:if>
		<c:if test="${empty sessionScope.member.user_id}" >
			<a href="${pageContext.request.contextPath}/loginCheck"><strong>로그인</strong></a>
		</c:if>
	</div>
	<div>
		<table>
			<colgroup>
				<col width="50" />
				<col width="200" />
				<col width="80" />
				<col width="100" />
				<col width="70" />
		<%-- 		<col width="70" />
				<col width="70" />
				<col width="70" /> --%>
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>등록 일시</th>

<!-- 					<th>그룹번호</th>
					<th>그룹내순서</th>
					<th>들여쓰기</th> -->
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${boardList.size() <= 0}">
						<tr>
							<td align="center" colspan="5">등록된 게시물이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="board" items="${boardList}" varStatus="i">
							<tr>
								<td align="center">
									<c:out value="${i.count}" />
								</td>
								<td align="left">
									<c:if test="${board.reply_indent > 0}">
										<c:forEach begin="1" end="${board.reply_indent}">
											&nbsp;&nbsp; <!-- 답변글일경우 글 제목 앞에 공백을 준다. -->
										</c:forEach>
										<img src="${contextPath}/images/review/re.gif">
									</c:if>
									<a href="<c:url value='/boardView?no=${board.no}' />">
									<c:out value="${board.title}" />
									</a>
								</td>
								<td align="center">
									<c:out value="${board.id}" />
								</td>	
								<td align="center">
									<c:out value="${board.hit}" />
								</td>							
								<td align="center">
									<c:out value="${board.regdate}" />
								</td>
					
<%-- 								<td align="center">
									<c:out value="${board.reply_group}" />
								</td>
								<td align="center">
									<c:out value="${board.reply_order}" />
								</td>
								<td align="center">
									<c:out value="${board.reply_indent}" />
								</td> --%>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<br>
	<input type="button" value="게시물 작성" onclick="goUrl('<c:url value="/boardWrite" />');" />
	<%@ include file="../etc/footer.jsp" %>
</body>
</html>