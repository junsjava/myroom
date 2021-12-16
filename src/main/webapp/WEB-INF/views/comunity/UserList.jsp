<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>샘플 애플리케이션</title>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container my-3">
	<h2>회원 리스트</h2>
	<div id="ajax">
	<button id="userlist"class="btn btn-primary">회원리스트 불러오기</button>
	<button class='btn btn-secondary' onclick="del()">리스트 삭제</button>
		<table class="table table">
			<thead>
			<tr>
				<th>회원 아이디</th>
			</tr>
			</thead>
			<tbody id="h">
	
			</tbody>			
		</table>
	</div>
	<div class="row">
		<div id="searchuser-1">
		<form id="c">
			<h2>회원 조회하기</h2>
			<input type="text" name="userId"/>
			<span><button id="a"class="btn btn-primary">조회 </button></span>
		</form>
		</div>
		<div>
		<div>조회된결과</div>
			<table class="table table">
				<thead>
					<tr>
						<th>아이디</th>
					</tr>
				</thead>			
				<tbody>
				</tbody>
			</table>
		</div>
		<div id="b">
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>

<script>
$('#userlist').click(function(){
	
		$.ajax({
				type:'POST',
				url:'jsonuserlist',
				//data:보낼 데이터 명 컨트롤러로?
				dataType:'json',
				success:(function(res){
				$.each(res, function(index,user){
					console.log(user);
					var item = ""
						item +="<tr id='userlists'>"
						item +="<td id='here'>"+user.userId+"</td>"
						item +="</tr>"
						$(h).append(item);
				})	
			})
			
	  })
})
function del(){
	$("#h").empty();
}
$('#a').click(function (){
	$.ajax({
		type:"POST",
		url:"searchs",
		data:$('#c').serialize(), //serialize() form 안에 내용 전체 전송하라는 함수 
		datatype:'json',
		success: (function(res){
			
		$.each(res, function(index,user){
			console.log(user);
			
			var item = ""
				item += "<ol>"
				item += "<li>"+user.userId+"</li>"
				item +="</ol>"
				$(b).append(item)
			})	
			
		})
	})
	return false;
})
</script>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</html>