<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>JS Blog || 게시판</title>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container my-3">
<div class="card">
<h1 style="text-align:center; font: bold;">JS BLOG 게시물</h1>
	<form action="boardchange" method="post">
	<div>
	<div class="card card" >
		<div class="col-12">
			<div class="row">
				<div><span style="float:center; font-weight: bold">작성자   : [ ${boardview.userId } ]</span><span style="text-align: center; margin-left: 85px;">작성일    :<fmt:formatDate value="${boardview.createDate }" pattern="yyyy/MM/dd"/></span></div>
				<input type="hidden" value="${boardview.boardTitle }" name="titles">
			</div>
				<strong>제목  :   <span style="margin-left: 15px;">${boardview.boardTitle }</span></strong>
				<div></div>
		</div>
	</div>
			<div>
	<div class="col-12">
		<div class="row">
				<h5 style="margin-top: 10px;"><strong>내 용 </strong></h5>
				<input type="hidden" value="${boardview.boardArea }" name="textareas">
				<input type="hidden" value="update">
			</div>
				 <%-- <hr width = "100%" color = "blue">--%>
		</div>
		<div class="card" style="height: 400px;">
				<pre>${boardview.boardArea }</pre>
		</div>
	</div>
	</div>
	<div style="float: right;">
		<a href="modifyboard?title=${boardview.boardTitle }&area=${boardview.boardArea }&userId=${boardview.userId }&boardNo=${boardview.boardNo}" class="btn btn-primary">수정</a>
		<a href="boardDelete?boardNo=${boardview.boardNo }" class="btn btn-primary">삭제</a>
	</div>
	</form>
</div>
<br><br><br><br><br><br>
</div>
<%@ include file="../common/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

</script>
</body>
</html>