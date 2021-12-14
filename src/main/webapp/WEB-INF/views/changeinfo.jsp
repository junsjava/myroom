<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>JS Blog</title>
</head>
<body>
<jsp:include page="common/header.jsp"/>
<div class="container my-3">
	<div class="col-6" style="margin: 0 auto;">
		<div class="row">
			<form action="infojoin" method="post">
			<label>비밀번호 입력</label>
			<input type="password" name="password">
			<input type="hidden" name="userId" value="${LOGINED_USER.userId }">
			<button>확인</button>
			</form>
		</div>
	</div>
</div>
<%@ include file="common/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

</script>
</body>
</html>