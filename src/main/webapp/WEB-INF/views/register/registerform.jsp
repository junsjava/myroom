<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/496bb7aab6.js" crossorigin="anonymous"></script>
<title>회원 가입</title>
<style type="text/css">

	/* 중복아이디 존재하지 않는경우 */
	.id_input_re_1{
		color : green;
		display : none;
	}
	/* 중복아이디 존재하는 경우 */
	.id_input_re_2{
		color : red;
		display : none;
	}
		.form-control{
		margin-bottom: 1px;
	}
	</style>
	

</head>
<body>
<%@ include file="../common/header.jsp" %>
<div class="container my-3">
	<div><br></div>
	<div class="form-control" style="padding: 40px; margin-top: 15px;">
	<div style="text-align: center;"><h2><strong>회원가입</strong></h2></div>
	<form action="/registerform" id="registerform" method="post">
		<div class="form">
		<div>
		<div><i class="fas fa-user-tag"></i>  아이디 <%--<button class="btn" id="idch">중복확인</button> --%><input class="form-control" type="text" id="user-id" name="userId"></div>
		<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
		<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
		<span class="id_input_re_3"> </span>
		</div>
		<div>
		<i class="fas fa-user"></i>  이름<input class="form-control" type="text" id="user-name" name="userName">
		</div>
		<div>
		<i class="fas fa-key"></i>  비밀번호<input class="form-control" type="password" id="user-password" name="userPassword">
		</div>
		<div>
		<i class="fas fa-key"></i>  비밀번호 확인<input class="form-control" type="password" id="user-passwordcheck" name="userPasswordcheck">
		</div>
		<div>
		<i class="fas fa-mobile-alt"></i>  핸드폰 번호<input class="form-control" type="text" id="user-phone" name="userPhone">
		</div>
		<div>
		<i class="fas fa-envelope"></i>  이메일 주소<input class="form-control" type="email" id="user-email" name="userEmail">
		</div>
		<div>
		<i class="fas fa-map"></i>  주소<br>
		<input type="text" id="sample4_postcode" name="postnum"placeholder="우편번호">
		<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
		<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
		<input class="form-control" type="text" id="sample4_roadAddress"  name="adress"placeholder="도로명주소" size="60" ><br>
		<input class="form-control" type="hidden" id="sample4_jibunAddress" placeholder="지번주소"  size="60">
		<span id="guide" style="color:#999;display:none"></span>
		<i class="fas fa-map"></i>  상세주소<br>
		<input class="form-control" type="text" id="user-adress" name="infoadress"placeholder="상세주소"  size="60"><br>
		<input class="form-control" type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60">
		<input class="form-control" type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="60" ><br>
		<%-- 		<i class="fas fa-map"></i>  주소<input class="form-control" type="text" id="user-adress" name="userAdress">
		<input type="button" class="btn btn-secondary" id="sample4_daumPostCode()" value="주소검색"> --%>
		</div>
		<label><i class="fas fa-venus-mars"></i>  성별 : 
		<select class="form-control" name="gender">
			<option value="남자">남자</option>
			<option value="여자">여자</option>
		</select>
		</label>
		</div>
		
		<div style="margin-top: 5px;"><a class="btn btn-primary" href="/" style="float:right; margin-left: 5px;">취소</a><button class="btn btn-primary" style="float: right" type="submit">회원가입</button></div>
	</form>
	</div>
	<Br><br><br><br><br><br><br><br>
</div>
<%@ include file="../common/footer.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function sample5_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
     
            document.getElementById("sample4_engAddress").value = data.addressEnglish;
                   
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}
$(function() {
	$('#user-id').on("propertychange change keyup paste input", function(){

		//console.log("keyup 테스트");	
		var userId = $('#user-id').val();			// .id_input에 입력되는 값
		var data = {userId : userId}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
			
			$.ajax({
				type : "post",
				url : "/memberIdChk",
				data : data,
				success : function(result){
					console.log("성공여부" + result);
					if(result != 'fail'){
						$('.id_input_re_1').css("display","inline-block");
						$('.id_input_re_2').css("display","none");
						
					}else if(userId == ""){
						$('.id_input_re_3').css("display","inline-block");
						$('.id_input_re_2').css("display","none");
	
					}else{
						$('.id_input_re_2').css("display","inline-block");
						$('.id_input_re_1').css("display","none");
					}
				}
			}); 
	});
	
	$("#registerform").submit(function(){
		
		
		var id = $.trim($("#user-id").val());
		if (!id){
			alert("아이디를 입력해주세요.");
			$("#user-id").focus();
			return false;
		}
		var idcheck = $.trim($("#user-id").val());
		if(!(idcheck >='0' && idcheck <='9') && !(idcheck >='a' && idcheck <= 'z')&& !(idcheck >='A' && idcheck <='Z') ){
			alert("아이디는 영문 대소문자, 숫자만 입력이 가능합니다");
			$("#user-id").val("");
			$("#user-id").focus();
			return false;
		}
		var name = $.trim($("#user-name").val());
		if(!name){
			alert("이름을 입력해주세요");
			$("#user-name").focus();
			return false;
		}

		var password = $.trim($("#user-password").val());
		if(!password){
			alert("비밀번호를 입력해주세요");
			$("#user-password").focus();
			return false;
		}
		var pw = $.trim($("#user-password").val());
		if(pw.length<8||pw.length>20){
			alert ("비밀번호는 8자리 ~ 20자리 이내로 입력해주세요");
			$("#user-password").val("");
			$("#user-password").focus();
			return false;
		}
		var passwordcheck = $.trim($("#user-passwordcheck").val());
		if(!passwordcheck){
			alert("비밀번호 확인에 입력해주세요");
			$("#user-passwordcheck").focus();
			return false;
		}
		
		if(password != passwordcheck){
			alert("비밀번호가 일치하지 않습니다");
			$("#user-passwordcheck").val("")
			$("#user-password").val("").focus();
			return false;
		}

		var phone = $.trim($("#user-phone").val());
		if(!phone){
			alert("핸드폰번호를 입력해주세요");
			$("#user-phone").focus();
			return false;
		
		}
		var email = $.trim($("#user-email").val());
		if(!email){
			alert("이메일을 입력해주세요");
			$("#user-email").focus();
			return false;
		}
		
		var adress = $.trim($("#user-adress").val());
		if(!adress){
			alert("주소를 입력해주세요");
			$("#user-adress").focus();
			return false;
		}
		alert("회원가입이 완료되었습니다 .");
		return true; // 위에 유효성검사가 끝나면 폼입력값이 제출되게한건 submit
	});
	
});
</script>
</body>
</html>