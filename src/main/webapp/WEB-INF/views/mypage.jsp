<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>JS Blog || 회원정보</title>
</head>
<body>
<jsp:include page="common/header.jsp"/>
<div class="container my-3">
<h1>마이 페이지</h1>
  <div class="col-8" style="margin: 0 auto;">
  <div class="card" style="padding: 30px;">
  <h1 style="text-align: center; margin-bottom: 80px"><strong>JSBLOG</strong></h1>
	 <div class="row">
		<div class="col" style="margin-bottom: 5px;">아이디</div>
			<input type="text" value="${user.userId }" disabled="disabled" >
			<div class="col" style="margin-bottom: 5px;">이름</div>
			<input type="text" value="${user.userName }" disabled="disabled">
			<div class="col" style="margin-bottom: 5px;">이메일</div>				
			<input type="text" value="${user.userEmail }" disabled="disabled" >
		</div>
		<div style="margin: 0 auto; margin-top: 20px;">
		<a href="changeinfo" class="btn btn-secondary">회원정보 변경</a>
		<a href="/" class="btn btn-danger">메인페이지로 이동</a>
		</div>
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