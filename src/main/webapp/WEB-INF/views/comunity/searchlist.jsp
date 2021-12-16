<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>JS BLOG || 검색 결과</title>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<div class="container my-3">
<div>
<table class="table" style="width: 1200px;" id="boardTable">
	<thead style="background-color: gray; color: white;">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
		</tr>
	</thead>
	
	<c:choose>
	<c:when test="${empty search }">
	<div><h2><strong>찾으시는 내용이 없습니다.</strong></h2></div>
	<tbody>
		
	</c:when>
	<c:when test="${'' }">
		<div><h2><strong>찾으시는 내용이 없습니다.</strong></h2></div>
	</c:when>
	<c:when test="${searchtitle} }">
		<div><h2><strong>'${j.boardTitle }'로 찾으신 결과 입니다</strong></h2></div>
	</c:when>
	<c:otherwise>
					<div><h2><strong>${searchtext }로 찾으신 결과 입니다</strong></h2></div>
		<c:forEach var="list" items="${search }" varStatus="a">
			<tr>
				<td>${a.count }</td>
				<td><a href="boardview?boardNo=${list.boardNo }">${list.boardTitle }</a></td>
				<td>${list.userId }</td>
				<td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.createDate }"></fmt:formatDate></td>
			</tr>	
		</c:forEach>
	</tbody>
	</c:otherwise>
	</c:choose>
</table>
</div>
</div>
<%@ include file="../common/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</body>
</html>