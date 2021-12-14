<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/496bb7aab6.js" crossorigin="anonymous"></script>
<title>JS Blog || 공지사항</title>
<style type="text/css">
.box{
display: flex;
font-style: italic;
}
#list{
font-weight: bold;
}
</style>
</head>
<body>
<%@ include file="common/header.jsp"%>
<main>
<div class="container my-3">
<div>
	<h1 style="margin-bottom: 45px; margin-top: 55px;">공지사항</h1>
	<div class="card" style="border: solid 0px; height: 350px; padding: 8px;">
		<div class="row" style="margin-bottom: 100px;">
			<h5>반갑습니다</h5>
			<p>신입개발자 <strong>안준상</strong>이라고합니다</p>
			<p>간단한 블로그 형태의 홈페이지 입니다</p>
			<p>취업 하기전까지 지속적으로 실력향상도 하고 기본지식 갖춤을 보여드리고자 제작하게 되었습니다</p>
			<div>
			<p>제작 과정 소개</p>
			<div id="list">
			<ul>
				<li>Spring FrameWork 활용</li>
				<li>MVC 패턴을 활용한 Model2 방식 개발(유지보수의 편리함을 이해하고 실무에서 활용되는 기술이기에 사용)</li>
				<li>Bootstrap 활용한 navbar 및 UI</li>
				<li>aJax를 활용한 사용자 정보 표시</li>
				<li>DBMS Oracle (V.20.4.1.407)을 활용 </li>
				<li>Apache Tomcat v9.0 사용
				<li>Daum OpenApi 사용 (주소검색)</li>
				<li>Maven 빌드툴 사용</li>
				<li>현재 까지 제작 된 상태  로그인,회원가입, 게시판, 게시글작성, 수정, 삭제, 게시물 검색, 회원정보 수정 및 탈퇴  </li>
				<li>그 이외에 추가 개발예정 (자료실[업로드, 다운로드] , 카카오,네이버 로그인(api활용), 필요에 의한 open api 사용, 웹소켓 실시간 채팅 및 연동구현 )</li>
			</ul>
			</div>
			<p>학원에서 배운걸 토대로 웹페이지를 만든것이며,개발 과정을 이해하며 제작한 결과다보니 디자인적인 부분에서 작업이 전혀 안된 상태임을 참고하여 봐주시면 감사하겠습니다.</p>
			</div>
</div>
<div>
<h3>보유 기술</h3>
<div class="box">
	<div class="item"> <img src="../../resources/css/img/ajax.png" style="height: 56px;  width: 96px;"> </div>
	<div class="item"> <img src="../../resources/css/img/css.png"> </div>
	<div class="item"> <img src="../../resources/css/img/html5.png"> </div>
	<div class="item"> <img src="../../resources/css/img/java.png"> </div>
	<div class="item"> <img src="../../resources/css/img/jqu.png"> </div>
	<div class="item"> <img src="../../resources/css/img/jsc.png"> </div>
	<div class="item"> <img src="../../resources/css/img/spring.png" style="height: 56px;  width: 96px;"> </div>
	<div class="item"> <img src="../../resources/css/img/tomcat.png"> </div>
	<div class="item"> <img src="../../resources/css/img/ora.png"> </div>
</div>
</div>
<div>
<div>
<div style="margin-top: 65px;">
<span style="font: bold; font-size: 30px;">프로젝트 계획 이유</span>
<p>국비지원훈련을 5개월동안 받으면서 배운 기술들을<p>
<p>스스로 복습과 부족한 부분을 찾기위해 , 어떤 프로젝트를 만들지 고민하였습니다</p>
<p>가장 기본이되는 회원가입, 탈퇴, 게시글 작성,수정 등 블로그형 사이트를 제작하게되었습니다</p> 
</div>
</div>
</div>
			<br><br><br><br><br><br>
			
		</div>
	</div>
</div>
</main>
<footer style="height: 50px;">
<%@ include file="common/footer.jsp" %>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://unpkg.com/vue@next"></script>
<script>

</script>
</body>
</html>