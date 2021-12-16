<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/496bb7aab6.js" crossorigin="anonymous"></script>
<title>JS Blog</title>
<style type="text/css">
#a{
	text-align: center;
 
	 
}
#b{
	text-align: center;
}
</style>
</head>
<body>
<%@ include file="common/header.jsp" %>
<!-- <img alt="테스트용" src="/resources/css/img/ScreenShot_21-08-22_15-10-30-000.jpg" width="100%" height="250px"> -->
<div class="container my-3">
	<c:choose>
		<c:when test="${empty LOGINED_USER }">
		<div id="a">
			<br><br><br><br><br>
			<h1>로그인 이후에 사용이 가능합니다</h1>
			<div id="b"><a class="btn btn-primary btn-lg" href="login">로그인</a></div>
		</div>
		</c:when>
		<c:otherwise>
		<div>
			<h3 style="text-align: center; font: italic 3em TmonMonsori;" > WelCome To JSblog </h3>
		</div>
		<h2><strong>최근 올라온 게시물</strong></h2>
		<table class="table">
	<thead>
		<tr>
			<td width="20%">번호</td>
			<td width="50%">제목</td>
			<td>작성일</td>
			<td>작성자</td>
		</tr>
	</thead>
	<tbody>
		<c:choose>
		<c:when test="${!empty list }">
		<c:forEach var="lists" items="${list }" varStatus="status">
		<tr>
			<td width="20%">${status.count }</td>
			<td width="50%"><a href="boardview?boardNo=${lists.boardNo }">${lists.boardTitle }</a></td>
			<td><fmt:formatDate value="${lists.createDate }" pattern="yyyy/MM/dd"/></td>
			<td>${lists.userId }</td>
		</tr>
		</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="4" style="text-align: center;">게시물이 없습니다</td>
			</tr>
		</c:otherwise>
		</c:choose>
	</tbody>
</table>
<%--
<h2><strong>자료실</strong></h2>
<table class="table">
	<thead>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성일</td>
			<td>작성자</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</tbody>
</table>
<h2><strong>질문&답변</strong></h2>
<table class="table">
	<thead>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성일</td>
			<td>작성자</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</tbody>
</table>  --%>
			<p><strong>${LOGINED_USER.userName }</strong>님 환영합니다</p>
			
		</c:otherwise>
	</c:choose>
</div>
<Br><Br><Br><Br>
<footer>
<%@ include file="common/footer.jsp" %>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

</script>
</body>
</html>