<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
<title>게시물 내용</title>

<style>

/*  body {
  padding:2.5em;
  background: #f5f5f5
}  */

table {
  border: 1px #a39485 solid;
  font-size: .9em;
  box-shadow: 0 2px 5px rgba(0,0,0,.25);
  width: 100%;
  border-collapse: collapse;
  border-radius: 5px;
  overflow: hidden;
}

th {
  text-align: center;
}
  
thead {
  font-weight: bold;
  color: #fff;
  background: #73685d;
}
  
 td, th {
  padding: 1em .5em;
  vertical-align: middle;
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
  
  thead {
    float: left;
    white-space: nowrap;
  }
  
  tbody {
    overflow-x: auto;
    overflow-y: hidden;
    position: relative;
    white-space: nowrap;
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
	
	<script type="text/javascript">
		function goUrl(url) {
			location.href = url;
		}
		// 삭제 체크
		function deleteCheck(url) {
			if (confirm('정말 삭제하시겠어요?')) {
				location.href = url;
			}
		}
	</script>
	
	
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/mainCss.css?version=1.7">
</head>
<body>
<%@ include file="../etc/header.jsp" %>
	<h1 style="text-align:center;">게시물 내용</h1>
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
				<col width="100" />
				<col width="500" />
			</colgroup>
			<tbody>
				<tr>
					<th align="center">제목</th>
					<td><c:out value="${board.title}" escapeXml="false"/></td>
				</tr>
				<tr>
					<th align="center">작성자</th>
					<td><c:out value="${board.id}" /></td>
				</tr>
				
				<tr>
					<th align="center">등록 일시</th>
					<td><c:out value="${board.regdate}" /></td>
				</tr>
				<tr>
					<th align="center">조회수</th>
					<td><c:out value="${board.hit}" /></td>
				</tr>
	

				<tr>
					<th align="center">내용</th>
					<td height="200px">
						<c:out value="${board.content}" escapeXml="false" />
					</td>
				</tr>
			</tbody>
		</table>
		<p class="btn_align">
			<input type="button" value="목록" onclick="goUrl('<c:url value="/boardList" />');" />
			<input type="button" value="수정" onclick="goUrl('<c:url value="/boardModify?no=${board.no}" />');" />
			<input type="button" value="삭제" onclick="deleteCheck('<c:url value="/boardDelete?no=${board.no}" />');" />
			<input type="button" value="답글쓰기" onclick="goUrl('<c:url value="/boardReplyWrite?no=${board.no}" />');" />
		</p>
	</div>	
	<%@ include file="../etc/footer.jsp" %>
</body>
</html>