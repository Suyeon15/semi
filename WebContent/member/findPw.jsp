<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="layout.css">
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css"
	rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>비밀번호 찾기</title>
<style>
@import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");




body {
	width: 100%;
	height: 50%;
	margin: 0;
	padding-bottom: 60px;
	font-family: 'Noto Sans KR';
	background-repeat: no-repeat;
}

h3 {
	margin: 19px 0 8px;
	font-size: 14px;
	font-weight: 700;
}

.card {
	margin: 0 auto; /* Added */
	float: none; /* Added */
	margin-bottom: 10px; /* Added */
}

#btn-Yes {
	background-color: #e4932b;
	border: none;
}

.form-signin .form-control {
	position: relative;
	height: auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 10px;
	font-size: 16px;
}

.card-title {
	margin-left: 8px;
}

.links {
	text-align: center;
	margin-bottom: 30px;
}

a {
	color: #f58b34;
	text-decoration: none;
}

.text2 {
	color: blue;
}

.box {
	display: block;
	width: 100%;
	height: 51px;
	border: solid 1px #dadada;
	padding: 10px 14px 10px 14px;
	box-sizing: border-box;
	background: #fff;
	position: relative;
}

#alertTxt {
	position: absolute;
	top: 19px;
	right: 38px;
	font-size: 12px;
	color: red;
	display: none;
}

.box.int_pass {
	padding-right: 40px;
}

.box.int_pass_check {
	padding-right: 40px;
}

.error_next_box {
	margin-top: 9px;
	font-size: 12px;
	color: red;
	display: none;
}

#alertTxt {
	position: absolute;
	top: 19px;
	right: 38px;
	font-size: 12px;
	color: red;
	display: none;
}
</style>


<script src="../js/f5_attack.js"></script>
<script src="../js/right.js"></script>
</head>

<!-- 비밀번호 성공시 이쪽으로 변경하기 !!! -->
<c:choose>
	<c:when test="${finded != null }">
		<form action="${pageContext.request.contextPath}/findpw2.mem"
			method="post" id="checkForm" name="mod">
			<div id="member_modify">
				<input type="hidden" name="uId" value=${finded.id}>

				<div id="header">
					<!-- 사진 입력 -->
					<h1>방구석 오락실</h1>
				</div>

				<!-- 패스워드 (pswd1) -->

				<div>
					<h3 class="join_title">
						<label for="pswd1">비밀번호</label>
					</h3>
					<span class="box int_pass"> <input type="password"
						id="pswd1" name="uPassword" class="int" maxlength="20"> <span
						id="alertTxt">사용불가</span> <img src="../member_Img/Icon/pass.png"
						id="pswd1_img1" class="pswdImg">
					</span> <span class="error_next_box"></span>
				</div>

				<!-- 패스워드 확인(pswd2) -->
				<div>
					<h3 class="join_title">
						<label for="pswd2">비밀번호 재확인</label>
					</h3>
					<span class="box int_pass_check"> <input type="password"
						id="pswd2" name="uPassword2" class="int" maxlength="20"> <!--자물쇠 아이콘-->
						<img src="../member_Img/Icon/check.png" id="pswd2_img1"
						class="pswdImg">
					</span> <span class="error_next_box"></span>
				</div>

				<div class="btn_area">
					<button type="button" id="member_modify_btn"
						class="btn btn-primary">
						<span>변경하기</span>
					</button>
				</div>


			</div>
		</form>
		<script>
			var pw1 = document.querySelector('#pswd1');
			var pwMsg = document.querySelector('#alertTxt');
			var pwImg1 = document.querySelector('#pswd1_img1');
			var pw2 = document.querySelector('#pswd2');
			var pwImg2 = document.querySelector('#pswd2_img1');
			var pwMsgArea = document.querySelector('.int_pass');
			var error = document.querySelectorAll('.error_next_box');

			pw1.addEventListener("change", checkPw);
			pw2.addEventListener("change", comparePw);

			var pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}/;

			/*비밀번호 설정하기*/
			function checkPw() {

				if (pw1.value === "") {
					error[0].innerHTML = "필수 정보입니다.";
					pwMsg.style.display = "block";
					pwMsgArea.style.paddingRight = "40px";
					pwImg1.src = "../icon/pass.png";
					error[0].style.display = "block";
				} else if (!pwPattern.test(pw1.value)) {
					error[0].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
					pwMsg.innerHTML = "사용불가";
					pwMsgArea.style.paddingRight = "93px";
					error[0].style.display = "block";
					pwMsg.style.color = "red";
					pwMsg.style.display = "block";
					pwImg1.src = "../member_Img/Icon/not_use.png";
				} else {
					error[0].style.display = "none";
					pwMsg.innerHTML = "안전";
					pwMsgArea.style.paddingRight = "93px";
					pwMsg.style.color = "#03c75a";
					pwMsg.style.display = "block";
					pwImg1.src = "../member_Img/Icon/safe.png";
				}
			}

			/*비밀번호 확인*/
			function comparePw() {
				if (pw2.value === pw1.value) {
					pwImg2.src = "../member_Img/Icon/check_safe.png";
					error[1].style.display = "none";
				} else if (pw2.value !== pw1.value) {
					pwImg2.src = "../member_Img/Icon/check_no.png";
					error[1].innerHTML = "비밀번호가 일치하지 않습니다.";
					error[1].style.display = "block";
				}

				if (pw2.value === "") {
					error[1].innerHTML = "필수 정보입니다.";
					error[1].style.display = "block";
				}
			}

			document.getElementById("member_modify_btn").onclick = function() {
				let pwInput = document.getElementById("pswd1");
				var form = document.userInfo;
				let resultPw = pwPattern.test(pwInput.value);

				if (!resultPw) {
					Swal.fire({
						icon : 'error',
						title : '비밀번호가 잘못됐습니다.',
						text : '한번 확인해보세요!',

					})
					return;
				}
				document.getElementById("checkForm").submit();
			};
		</script>

	</c:when>



	<c:otherwise>
		<body cellpadding="0" cellspacing="0" marginleft="10px" margintop="0"
			width="100%" height="100%" align="center">
			<div class="card align-middle" style="width: 25rem;">
				<div class="card-title" style="margin-top: 20px;">

					<h2 class="card-title" style="color: #f58b34;">
						<img src="../member_Img/img/id.jpg" />
					</h2>

				</div>

				<div class="card-body">
					<form action="${pageContext.request.contextPath}/findpw.mem"
						class="form-signin" method="POST">
						<p class="text2">${findpw2}</p>
						<input type="text" name="name" id="name" class="form-control"
							placeholder="이름" required autofocus><BR> <input
							type="text" name="phone" id="phone" class="form-control"
							placeholder="휴대폰 번호" required><br>
						<p class="check" id="check">${check}</p>
						<br />
						<button id="btn-Yes" class="btn btn-lg btn-primary btn-block"
							type="submit">비 밀 번 호 찾 기</button>

					</form>

				</div>
				<div class="links">
					<a href="findId.jsp">아이디 찾기</a>

				</div>
			</div>
	</c:otherwise>
	
</c:choose>
</body>




<script type="text/javascript">
	$("#name").focusout(function() {

		if ($('#name').val() == "") {
			$('#check').text('이름을 입력해주세요.');
			$('#check').css('color', 'red');

		} else {
			$('#check').hide();
		}
	});

	$("#phone").focusout(function() {

		if ($('#phone').val() == "") {
			$('#check').text('휴대폰 번호를 입력해주세요.');
			$('#check').css('color', 'red');
		} else {
			$('#check').hide();
		}
	});
	
	
</script>



</html>