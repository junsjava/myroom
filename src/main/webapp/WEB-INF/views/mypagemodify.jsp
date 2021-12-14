<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>회원정보 수정</title>
</head>
<body>
<jsp:include page="common/header.jsp"/>
<div class="container my-3">
<h1>마이 페이지</h1>
  <div class="col-8" style="margin: 0 auto;">
  <div class="card" style="padding: 30px;">
  <form action="updateinfo" method="post" id="updateuser">
  <h1 style="text-align: center; margin-bottom: 80px"><strong>JSBLOG</strong></h1>
	 <div class="row">
		<div class="col" style="margin-bottom: 5px;">아이디</div>
			<input type="text" value="${user.userId }" disabled="disabled" >
			<input type="hidden" name="userIds" value="${user.userId }">
		<div class="col" style="margin-bottom: 5px;">비밀번호</div>
			<input type="password" name="password" id="password">
		<div class="col" style="margin-bottom: 5px;">비밀번호 확인</div>
			<input type="password" name="passwordcheck" id="passwordcheck">
			<div class="col" style="margin-bottom: 5px;">이름</div>
			<input type="text" value="${userinfo.userName }"  disabled="disabled">
			<div class="col" style="margin-bottom: 5px;">이메일</div>				
			<input type="email" name="userEmail" value="${userinfo.userEmail }" >
			<div class="col" style="margin-bottom: 5px;">주소</div>				
			<input type="text" name="userAdress" value="${userinfo.userAdress }" >
		</div>
		<div style="margin: 0 auto; margin-top: 20px;">
		<button type="submit" class="btn btn-secondary">회원정보 변경</button>
		<a href="deleteuser?userId=${user.userId }" class="btn btn-danger" id="cl">탈퇴</a>
		</div>
  </form>
 	 </div>
  </div>
</div>
<%@ include file="common/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	$("#cl").click(function(){
		var a = confirm("정말 탈퇴하시겠습니까?")
		if(a == true){
		var greeting = prompt('동의하실경우 : "동의" 를 작성해주세요', '');
		alert("탈퇴되셧습니다");
			
		}else{
			return false;
		}
	})
	
	$("#updateuser").submit(function(){
		
	var pass = $.trim($("#password").val());
	if(!pass){
		alert("비밀번호를 입력해주세요");
		$("#password").focus();
		return false;
		}
	var passwordcheck = $.trim($("#passwordcheck").val());
	if(!passcheck){
		alert("비밀번호를 입력해주세요");
		$("#password").focus();
		return false;
		}
	
	if(passcheck != passwordcheck){
		alert("비밀번호를 입력해주세요");
		$("#password").focus();
		return false;
		}
	
	return true;
	})
	

})
</script>
</body>
</html>