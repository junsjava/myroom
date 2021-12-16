<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>JS Blog || 로그인</title>
<style type="text/css">
input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
input[type=password], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
#ab {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
</head>
<body>
<%@ include file="common/header.jsp"%>
<div class="container my-3">
	<h1>로그인</h1>
	<form id="login-form" action="loginform" method="post">
	<div id="ab">
		<div>아이디 <input  type="text" id="user-Id" name="userId" placeholder="아이디를 입력하세요"></div>
		<div>패스워드<input type="password" id="user-Password" name="userPassword" placeholder="비밀번호를 입력하세요"></div>
		<div style="float: right; margin-top: 35px;">
		<a href="register" class="btn btn-primary" id="re">회원가입</a>
		<button class="btn btn-primary" type="submit">로그인</button>
		</div>
	</div>	
	</form>	
</div>
<%@ include file="common/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(function() {
	$("#login-form").submit(function(){
		var id = $.trim($("#user-Id").val());
		if(!id){
			alert("아이디를 입력해주세요");
			$("#user-Id").focus();
			return false;
		}
		var password = $.trim($("#user-Password").val());
		if(!password){
			alert("비밀번호를  입력해주세요");
			$("#user-Password").focus();
			return false;
		}
		return ture;
	});
	
})
$('#re').click(function(){
	alert('회원가입 페이지로 이동합니다');
})
</script>
</body>
</html>