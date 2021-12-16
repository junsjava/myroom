<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>JS Blog || 게시판</title>
<style type="text/css">
/* width */
::-webkit-scrollbar {
  width: 10px;
}

/* Track */
::-webkit-scrollbar-track {
  background: #f1f1f1; 
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background: #888; 
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: #555; 
}
#testtest{
 margin-left: 1200px;
 top: 50px;
}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container my-3">
<div>
<button class="btn btn-primary" id="testtest">목록</button>
<h1 style="text-align:left; font: bold;">게시판</h1>
<hr style="border: 1px solid black; height: 5px; margin-top: 0px; solid :black;">
	<form action="boardchange" method="post">
	<div>
	<h2 style="font-weight: bold;">${boardview.boardTitle }</h2>
	<div><p><fmt:formatDate value="${boardview.createDate }" pattern="yyyy.MM.dd mm:ss"/></p></div>
	<hr style="border: 1px; height: 1px;">
	<div>
	</div>
			<div>
	<div class="col-12">
		<div class="row">
				<h5 style="margin-top: 10px;"><strong> </strong></h5>
				<input type="hidden" value="${boardview.boardArea }" name="textareas">
				<input type="hidden" value="update">
			</div>
				 <%-- <hr width = "100%" color = "blue">--%>
		</div>
		<div style="height: 400px; overflow:auto">
				<pre>${boardview.boardArea }</pre>
		</div>
	</div>
	</div>
	<hr>
		<div style="float: right; margin-top: 30px;"> 
		<a href="modifyboard?title=${boardview.boardTitle }&area=${boardview.boardArea }&userId=${boardview.userId }&boardNo=${boardview.boardNo}" class="btn btn-primary">수정</a>
		<a href="boardDelete?boardNo=${boardview.boardNo }" class="btn btn-primary">삭제</a>
	</div>
	<div>
		<h2>댓글</h2>
		<div><textarea id="subB" name="subB" rows="5" cols="100" style="resize:none;" placeholder="타인을 모방하거나 욕설을 사용할 시 사용에 제제가 가해질수 있습니다"></textarea>
		<span><input type="button" id="test"class="btn btn-outline-primary" value="등록"></span></div>
	</div> <!-- 버튼 을 이용한 댓글 전송 작업해야함 BoardController쪽 subController쪽보셈 -->
	</form>
	<div id="subB2">
	 <c:forEach items="${subitem }" var="lists">
	<div class="card col-9" style="margin-top: 10px; padding: 14px; box-shadow: 2px 2px;">
		<div><span style="font-weight: bold;">${lists.userId }</span><div style="text-align: right; font-size: 11px"><fmt:formatDate value="${lists.createDate }" pattern="yy.MM.dd hh:mm:ss"/></div></div>
		<div>${lists.subBoard }</div>
	</div>
	</c:forEach> 
	</div>
</div>
${list.userId }
<br><br><br><br><br><br>
<%=request.getParameter("boardNo") %>
<%=request.getAttribute("boardview.boardNo") %>
</div>
<%@ include file="../common/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){	
$('#test').on('click',function(){
	//alert($('#subB').val());
	var subB = $('#subB').val();
	var list = $('#subB2')
	var no = "${boardNo}"
	var Id = "${LOGINED_USER.userId }"
	console.log("<%=request.getParameter("boardview")%>")
	$.ajax({
		type:"GET",
		url:"subBoard",
		data:{subB : subB, boardNo :no, userId:Id }, //여기서부터 작업해야함 boardNo 값 넘겨서 insert해서 값 받게하고 그번호를 기준으로 댓글 보이게 작업해야함
		dataType:'json',				//boardNo :no 때메 에러날수있음 현재 파라미터 받는 작업만했고 보내야함 controller 단작업도 필요함
		success :function(list) {		//작업정리 : insert에 boardno값 넘겨서 값 저장하게해서 그 번호에 해당하는 리스트 ajax에 반환값으로 받아야함
			
			$.each(list, function(index, sub){
				console.log(sub)
				console.log('<fmt:formatDate value="${sub.createDate }" pattern="yy.MM.dd hh:mm:ss"/>')
				
				var output = '';
				output += '<div class="card col-9" style="margin-top: 10px; padding: 15px; box-shadow: 2px 2px;">'
				output += '<div>닉네임 : '+sub.userId+' <span style="text-align: right;"></span></div>'
				output += '<div>'+sub.subBoard+'</div>'
				output += '</div>'
				$('#subB2').append(output).history.go(0)
			})
		},
		error :function(){
			alert('조회중 오류발생 현재오류는 : boardNo값 넘길 준비도 안되어있는데 data쪽에 인자값 적어놔서 그렇다 헷갈리지마라')
		}
	})
})
})
$(function(){
	$('#testtest').click(function(){
		history.back();
	})
})
</script>
</body>
</html>