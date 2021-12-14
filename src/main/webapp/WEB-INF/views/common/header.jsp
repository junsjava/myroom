<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/496bb7aab6.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">
	#nav{
		position: sticky;
		top:0;
	}
	body{
	background-color: white;
	}

	#maintitle{
		margin-top: 45px;
		margin-bottom: 40px;
		text-align: center;
	}
	#mainname{
	margin-top: 50px;
	}

	#registerlist{
	list-style-type: none; 
	margin-right: 40px;
	margin-top:10px;
	text-decoration: none;
	}
	
	#registerlist .register{
		list-style-type: none; 
		float:left;
		margin-left: 20px;
		text-decoration: none;
		}
		
</style>
</head>
<body>

<div style="float: right;" id="header">
	<ul>
		<li id="registerlist">
			<ul id="registerlist">
			<c:choose>
				<c:when test="${empty LOGINED_USER }">
					<li class="register"><a href="register" id="regi" style="text-decoration: none;"><strong><i class="fas fa-user-plus"></i> 회원가입</strong></a></li>
					<li class="register"><a href="login"style="text-decoration: none;"><strong><i class="fas fa-key"></i> 로그인</strong></a></li>
				</c:when>
				<c:otherwise>
					<li class="register"><a href="logout"style="text-decoration: none;"><strong><i class="fas fa-sign-in-alt"></i> 로그아웃</strong></a></li>
					<li class="register"><a href="#" style="text-decoration: none;"><strong><i class="fas fa-user"></i> ${LOGINED_USER.userName }</strong></a></li>
					<li class="register"><a href="mypage?userId=${LOGINED_USER.userId }" style="text-decoration: none; "><strong><i class="fas fa-address-card"></i> 마이 페이지</strong></a></li>
				</c:otherwise>
			</c:choose>
			</ul>
		</li>
	</ul>
</div><br>
	<div><h1 style="text-align: center; font: italic 3em TmonMonsori;" id="maintitle"><a href="/" style="text-decoration: none;"><strong>JS BLOG</strong></a></h1></div>
<div>
<nav class="navbar navbar-expand-lg navbar-light bg-light" id="nav">
  <div class="container-fluid">
    <a class="navbar-brand" href="/" >JSBLOG</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/">메인페이지</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="gong">공지사항</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            	커뮤니티
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="board">게시판</a></li>
            <li><a class="dropdown-item" href="downloadpage">자료실</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">문의</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <%-- <a class="nav-link disabled">작업중</a>--%>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="userListss">Ajax StudyRoom</a>
        </li>        
      </ul>
      <form class="d-flex" action="search" method="post">
        <input class="form-control me-2" type="text" name="search" placeholder="게시물 제목을 입력해주세요" id="searchbar"aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>	
<%-- 
<ul class="nav nav-tabs nav-pills nav-justify-content-center nav-fill">
  <li class="nav-item">
    <a class="nav-link" aria-current="page" href="/">메인페이지</a>
  </li>
  <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">커뮤니티</a>
    <ul class="dropdown-menu">
      <li><a class="dropdown-item" href="#">자료실</a></li>
      <li><a class="dropdown-item" href="board">게시판</a></li>
      <li><a class="dropdown-item" href="#">질문  & 답변</a></li>
      <li><hr class="dropdown-divider"></li>
      <li><a class="dropdown-item" href="#">%작 업 중%</a></li>
    </ul>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">도움말</a>
  </li>
  <li class="nav-item">
    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">비활성화</a>
  </li>
</ul>
--%>
</div>
<script type="text/javascript">
$(function(){
	$("#regi").click(function(){
		alert("회원가입 페이지로 이동합니다.")
	});

});
</script>
</body>
</html>