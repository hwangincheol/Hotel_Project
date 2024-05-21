<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8"></meta>
<title>글수정</title>

	<script type="text/javascript"
		src="<c:url value="/ckeditor/ckeditor.js" />">
	</script>
	
	<style type="text/css">


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
  
  
  }
	</style>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/mainCss.css?version=1.7">

	<script type="text/javascript">
		function goUrl(url) {
			location.href = url;
		}
		// 수정 폼 체크
		function boardModifyCheck() {
			var form = document.modifyForm;
			if (form.title.value == '') {
				alert('제목을 입력하세요.');
				form.title.focus();
				return false;
			}
			if (form.writer.value == '') {
				alert('작성자을 입력하세요');
				form.writer.focus();
				return false;
			}
			return true;
		}
	</script>
	
	
</head>
<body>
<%@ include file="../etc/header.jsp" %>
	<h1 style="text-align:center;">게시물 수정</h1>
	<div style="text-align: right;">
		<c:if test="${not empty sessionScope.member.user_id}" >
			<strong>${sessionScope.member.name}(${sessionScope.member.user_id})님</strong>
			<a href="${pageContext.request.contextPath}/logout"><strong>로그아웃</strong></a>
		</c:if>
		<c:if test="${empty sessionScope.member.user_id}" >
			<a href="${pageContext.request.contextPath}/login"><strong>로그인</strong></a>
		</c:if>
	</div>
	<div>
		<form name="modifyForm"
			action="<c:url value="/boardModify" />" method="post"
			onsubmit="return boardModifyCheck();">
			
			<input type="hidden" name="no" value="<c:out value="${board.no}" />" />
				
			<table border="1" style="width:100%">
				<colgroup>
					<col width="100" />
					<col width="500" />
				</colgroup>
				<tbody>
					<tr>
						<th align="center">제목</th>
						<td><input type="text" name="title" size="80"
							maxlength="100" value="<c:out value="${board.title}" />" /></td>
					</tr>
					<tr>
						<th align="center">작성자</th>
						<td><input type="text" name="id" maxlength="20"
							value="<c:out value="${board.id}" />" /></td>
					</tr>
					<tr>
						<th align="center">조회수</th>
						<td><c:out value="${board.hit}" /></td>
					</tr>
					
					<tr>
						<td colspan="2">
							<textarea name="content" cols="80" rows="10">
								<c:out	value="${board.content}" escapeXml="false" />
							</textarea> 
							<script>CKEDITOR.replace('content');</script>
						</td>
					</tr>
				</tbody>
			</table>
			<p class="btn_align">
				<input type="button" value="목록" onclick="goUrl('<c:url value="/boardList" />');" />
				<input type="submit" value="저장" />
			</p>
		</form>
	</div>	
	<%@ include file="../etc/footer.jsp" %>
</body>
</html>