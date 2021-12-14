<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>JS Blog ||게시글 수정</title>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container my-3">
	<h3><strong>게시글 작성</strong></h3>
	<div>
		<form method="post" action="modify" class="form-control" id="board">
			<label>제목</label>
			<input type="text" class="form-control" id="text-title" name="title" value="${board.boardTitle }"/> 
			<hr>
			<div><label>내용</label></div>
			<textarea class="form-control" rows="20" style="resize:none;" id="text-area" name="textarea">${board.boardArea }</textarea>
			<input type="hidden" name="userId" value="${LOGINED_USER.userId }">
			<input type="hidden" name="boardNo" value="${board.boardNo }">
			<div></div>
			<div><button class="btn btn-primary" type="submit" style="float: right;">수정</button></div>
		</form>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="../../../resources/ckeditor/ckeditor.js"></script>
<script>
CKEDITOR.replace('text-area'
        , {height: 350                                                  
         });
$(function(){
	$("#board").submit(function(){
		var title = $.trim($("#text-title").val());
		if(!title){
			alert("제목을 입력해주세요");
			$("#text-title").focus();
			return false;
		}
		var textarea = $.trim($("#text-area").val());
		if(!textarea){
			alert("내용을 입력해주세요");
			$("#text-area").focus();
			return false;
		}
	})
})
</script>
</body>
</html>