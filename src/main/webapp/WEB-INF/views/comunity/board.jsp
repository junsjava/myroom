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
<h2><strong>게시판</strong></h2>
<table class="table" style="width: 1200px;" id="boardTable">
	<thead style="background-color: gray; color: white;">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
		</tr>
	</thead>
	<tbody>
	<c:choose>
	<c:when test="${!empty boardList }">
		<c:forEach var="list" items="${boardList }" varStatus="a">
			<tr>
				<td>${a.count }</td>
				<td><a href="boardview?boardNo=${list.boardNo }&userId=${LOGINED_USER.userId }">${list.boardTitle }</a></td>
				<td><button class="btn btn-link btn-sm" data-user-id="${list.userId }">${list.userId }</button></td>
				<td><fmt:formatDate value="${list.createDate }" pattern="yyyy/MM/dd"/> </td>
			</tr>	
		</c:forEach>
	</c:when>
	<c:otherwise>
		<tr>
			<td colspan='4' style="text-align: center;">게시물이 없습니다.</td>
		</tr>
	</c:otherwise>
	</c:choose>
	</tbody>
</table>
<span style="float: right;"><a class="btn btn-primary" href="boardcreate">게시글작성</a></span>	

<%-- <h1>ajax로 json 데이터 받기 테스트</h1>
<button class="btn btn-primary" id="bt">클릭 1</button>
<button class="btn btn-primary" id="close">닫기</button>
<div class="box">
	<p id="userids"></p>
	<p id="usernames"></p>
</div>
--%>
<div class="modal fade" id="modal-User-Info" tabindex="-1" aria-hidden="true">
	  		<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">사용자 정보</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th>사용자이름</th>
									<td><span id="modal-user-name"></span></td>
									<th>사용자아이디</th>
									<td><span id="modal-user-id"></span></td>
								</tr>																																
							</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<%@ include file="../common/footer.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	
	
	var userInfo = new bootstrap.Modal(document.getElementById('modal-User-Info'),{
		keyboard :false
	});
	$("#boardTable .btn-link").click(function(event){
		event.preventDefault();
		var usinfo = $(this).data('user-id');

		$("#modal-user-id").text(usinfo)
		
		$.ajax({
			type:"GET",
			url:"../board/json",
			data:{userId:usinfo},
			dataType:"json"
		})
		.done(function(user){
			console.log(user)
			$("#modal-user-name").text(user.userName);
			$("#modal-user-id").text(user.userId);
		})
		.fail(function(){
			
		})
		.always(function(){
			
		});
		
		userInfo.show();
	})
	$("#bt").click(function(){
		$.ajax({
			type:"GET",
			url:"../board/json",
			data:{userId:'sskfilld'},
			dataType:"json",
			success:function(user){
				$("#userids").text(user.userId);
				$("#usernames").text(user.userName);
			}
		});
	})
	$("#close").click(function(){
		$("#usernames").text("반가워요");
	})
})
</script>
</body>
</html>