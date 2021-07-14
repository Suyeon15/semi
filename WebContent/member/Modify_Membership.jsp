<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">



<style>
html {
	height: 100%;
}

body {
	margin: 0;
	height: 100%;
	background: rgb(255, 206, 1);
	font-family: Georgia, "맑은 고딕", serif;
}

#logo {
	width: 240px;
	height: 44px;
	cursor: pointer;
}

#header {
	padding-top: 40px;
	text-align: left;
}

#minihead {
	padding-top: 20px;
	font-size: 14px;
}

#minitext {
	color: gray;
	padding-top: 10px;
	padding-bottom: 10px;
	font-size: 12px;
}

#footer {
	padding-bottom: 40px;
	text-align: center;
}

#deletetext {
	text-align: center;
}

#wrapper {
	position: relative;
	height: 100%;
}

#content {
	position: absolute;
	left: 50%;
	transform: translate(-50%);
	width: 460px;
}

/* 입력폼 */
h3 {
	margin: 19px 0 8px;
	font-size: 14px;
	font-weight: 700;
}

/*text 박스 사이즈*/
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

/*우편번호 텍스트 박스 사이즈*/
.box1 {
	display: inline-block;
	width: 85%;
	height: 51px;
	border: solid 1px #dadada;
	padding: 10px 14px 10px 14px;
	box-sizing: border-box;
	background: #fff;
	position: relative;
}
/*버튼 만들기*/
.btn {
	height: 51px;
	border: solid 1px #dadada;
	padding: 10px 14px 10px 14px;
	box-sizing: border-box;
	position: relative;
	float: right;
}

.int {
	display: block;
	position: relative;
	width: 100%;
	height: 29px;
	border: none;
	background: #fff;
	font-size: 15px;
}

input {
	font-family: Dotum, '돋움', Helvetica, sans-serif;
}

/*아이디 text 설정*/
.box.int_id {
	padding-right: 40px;
}

/*비밀번호 text 설정*/
.box.int_pass {
	padding-right: 40px;
}

/*비밀번호 text 확인 */
.box.int_pass_check {
	padding-right: 40px;
}

.pswdImg {
	width: 18px;
	height: 20px;
	display: inline-block;
	position: absolute;
	top: 50%;
	right: 16px;
	margin-top: -10px;
	cursor: pointer;
}

/* 에러메세지 */
.error_next_box {
	margin-top: 9px;
	font-size: 12px;
	color: red;
	display: none;
}

/*에러 메시지*/
#alertTxt {
	position: absolute;
	top: 19px;
	right: 38px;
	font-size: 12px;
	color: red;
	display: none;
}

/* 버튼 */
.btn_area {
	margin: 30px 0 110px;
}

.btn_area1 {
	margin: 10px 0 200px;
}

/*가입하기 색 조절*/
#btnJoin {
	width: 100%;
	border: 0;
	cursor: pointer;
	color: #fff;
	background-color: rgb(0, 40, 91);
	font-size: 20px;
	font-weight: 400;
	font-family: Dotum, '돋움', Helvetica, sans-serif;
}
/*탈퇴하기 버튼*/
#btnJoin2 {
	width: 100%;
	cursor: pointer;
	margin-top: 10px;
	color: #fff;
	background-color: rgb(0, 40, 91);
	font-size: 20px;
	font-weight: 100;
	font-family: Dotum, '돋움', Helvetica, sans-serif;
}
</style>

</head>
<body>
	<!-- 틀 (wrapper) -->
	<div id="wrapper">
		<form action="${pageContext.request.contextPath}/update.mem"
			method="post" id="checkForm">
			<!-- content-->
			<div id="content">
				<div id="header">
					<h2>내정보 관리</h2>
				</div>
				<hr>
				<div id="minihead">
					<strong>로그인 정보</strong>
				</div>
				<div id="minitext">방구석 오락실에 등록한 계정은 방구석 오락실 서비스에서 활용됩니다.</div>

				<!-- 이름 (name) -->
				<div>
					<h3 class="join_title">
						<label for="name">이름</label>
					</h3>
					<span class="box int_name">
						<div id="name" class="int" maxlength="20">${my.name}</div>
					</span>
				</div>


				<!-- 회원 아이디 (id) -->
				<div>
					<h3 class="join_title">
						<label for="id">아이디</label>
					</h3>
					<span class="box int_id">
						<div id="id" class="int" maxlength="20">${my.id}</div>
					</span>

				</div>

				<!-- 핸드폰 (phone) -->
				<div>
					<h3 class="join_title">
						<label for="phoneNo">핸드폰</label>
					</h3>
					<span class="box int_phone">
						<div id="phone" class="int" maxlength="16">${my.email}</div>
					</span>

					<!-- 이메일 (email)-->
					<div>
						<h3 class="join_title">
							<label for="email">이메일</label>
						</h3>
						<span class="box int_email">
							<div id="email" class="int" maxlength="100">${my.phone}</div>
						</span>
					</div>




				</div>

				<div id="minihead">
					<strong>수정 가능 정보</strong>
				</div>
				<div id="minitext">'비밀번호나 우편번호 수정이 가능하게 합니다' </div>


				<!-- 패스워드 (pswd1) -->
            <div>
                <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                <span class="box int_pass">
                    <input type="password" id="pswd1" name="pswd1" class="int" maxlength="20">
                    <span id="alertTxt">사용불가</span>
                    <img src="member_Img/Icon/pass.png" id="pswd1_img1" class="pswdImg">
                </span>
                <span class="error_next_box"></span>
            </div>

            <!-- 패스워드 확인(pswd2) -->

            <div>
                <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                <span class="box int_pass_check">
                    <input type="password" id="pswd2" name="pswd2" class="int" maxlength="20">
                    <!--자물쇠 아이콘-->
                    <img src="member_Img/Icon/check.png" id="pswd2_img1" class="pswdImg">
                </span>
                <span class="error_next_box"></span>
            </div>



				<!-- 우편번호 (Postal) -->
            <div>
                <h3 class="join_title"><label for="postal">우편번호</label></h3>
                <span class="box1 int_postal">
                    <input type="text" id="postcode" name="postal" class="int" maxlength="16">
                </span>
                <button type="button" class="btn btn-primary" id="search"> 찾기</button>
        

                <span class="error_next_box"></span>
            </div>

            <!-- 주소 (adress1)-->
            <div>
                <h3 class="join_title"><label for="address1">기본주소</label></h3>
                <span class="box int_adress1">
                    <input type="tel" id="address1" name="address1" class="int" maxlength="16">
                </span>
                <span class="error_next_box"></span>
            </div>


            <!-- 주소 (adress2)-->
            <div>
                <h3 class="join_title"><label for="address2">상세주소</label></h3>
                <span class="box int_adress2">
                    <input type="tel" id="adress2" name="adress2" class="int" maxlength="16">
                </span>
                <span class="error_next_box"></span>
            </div>



				<!-- 수정하기 (JOIN BTN) -->
				<div class="btn_area">
					<button type="submit" id="btnJoin" class="btn btn-primary">
						<span>수정하기</span>
					</button>
				</div>
		</form>


		<div class="deletetext">
			<div
				style="text-align: center; color: blue; padding-top: 10px; font-size: 10px;">방구석
				오락실 탈퇴 원하십니까?</div>
			<div style="text-align: center; padding-top: 10px; font-size: 10px;">
				<b>- 유의사항</b>
			</div>
			<div style="text-align: center; padding-top: 10px; font-size: 10px;">당신의
				게임 정보가 사라질 수 있습니다. 괜찮으시다면 깔끔하게 "회원 탈퇴" 버튼을 누르시오</div>
		</div>
		<div class="btn_area1">
			<button type="button" id="btnJoin2" class="btn btn-primary">
				<span>탈퇴하기</span>
			</button>
		</div>

		<div id="footer">
			<h2>방구석 오락실</h2>
		</div>
	</div>



	<!-------------------------------정규식------------------------------------->
	<script>
		var pw1 = document.querySelector('#pswd1');
		var pwMsg = document.querySelector('#alertTxt');
		var pwImg1 = document.querySelector('#pswd1_img1');
		var pw2 = document.querySelector('#pswd2');
		var pwImg2 = document.querySelector('#pswd2_img1');
		var pwMsgArea = document.querySelector('.int_pass');

		/*에러창입니다*/
		var error = document.querySelectorAll('.error_next_box');

		/*알아보기 편하게 변경*/
		pw1.addEventListener("change", checkPw);
		pw2.addEventListener("change", comparePw);

		/*비밀번호 설정하기*/
		function checkPw() {
			var pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}/;
			if (pw1.value === "") {
				error[0].innerHTML = "필수 정보입니다.";
				pwMsg.style.display = "block";
				pwMsgArea.style.paddingRight = "40px";
				pwImg1.src = "member_Img/Icon/pass.png";
				error[0].style.display = "block";
			} else if (!pwPattern.test(pw1.value)) {
				error[0].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
				pwMsg.innerHTML = "사용불가";
				pwMsgArea.style.paddingRight = "93px";
				error[0].style.display = "block";
				pwMsg.style.color = "red";
				pwMsg.style.display = "block";
				pwImg1.src = "member_Img/Icon/not_use.png";
			} else {
				error[0].style.display = "none";
				pwMsg.innerHTML = "안전";
				pwMsgArea.style.paddingRight = "93px";
				pwMsg.style.color = "#03c75a";
				pwMsg.style.display = "block";
				pwImg1.src = "member_Img/Icon/safe.png";
			}
		}
		/*비밀번호 확인*/
		function comparePw() {
			if (pw2.value === pw1.value) {
				pwImg2.src = "member_Img/Icon/check_safe.png";
				error[1].style.display = "none";
			} else if (pw2.value !== pw1.value) {
				pwImg2.src = "member_Img/Icon/check_no.png";
				error[1].innerHTML = "비밀번호가 일치하지 않습니다.";
				error[1].style.display = "block";
			}

			if (pw2.value === "") {
				error[1].innerHTML = "필수 정보입니다.";
				error[1].style.display = "block";
			}
		}

		/*우편번호 기능*/
		document.getElementById("search").onclick = function() {
			new daum.Postcode({
				oncomplete : function(data) {
					let roadAddr = data.roadAddress;

					document.getElementById('postcode').value = data.zonecode;
					document.getElementById("address1").value = roadAddr;
				}
			}).open();
		};

		document.getElementById("btnJoin").onclick = function() {

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


	// 회원 탈퇴 합니다!
	$("#btnJoin2").on("click", function() {
		const swalWithBootstrapButtons = Swal.mixin({
			customClass : {
				confirmButton : 'btn btn-success',
				cancelButton : 'btn btn-danger'
			},
			buttonsStyling : false
		})
		swalWithBootstrapButtons
				.fire({
					title : '탈퇴 하실건가요?',
					text : "방구석 오락실 정말 삭제인가요?",
					icon : 'warning',
					showCancelButton : true,
					confirmButtonText : '탈퇴하겠습니다.',
					cancelButtonText : '실수입니다.',
					reverseButtons : true
				})
				.then(
						function(result) {
							if (result.isConfirmed) {
								swalWithBootstrapButtons
										.fire('탈퇴가 완료 됬습니다.',
												'지금까지 사용해주셔서 감사합니다.',
												'success')
										.then(
												function() {
													window.location = "${pageContext.request.contextPath}/delete.mem";
												})

							} else if (
							/* Read more about handling dismissals below */
							result.dismiss === Swal.DismissReason.cancel) {
								swalWithBootstrapButtons.fire('취소',
										'취소가 됬습니다.',
										'error').then(function() {
									return;
								})
							}
						})
	})
	</script>
		<script>
    $("#checkForm").keypress(function (e) {
        if (e.keyCode === 13) {
            Login();
        }
    });
	</script>
	<script src="js/right.js"></script>
	<script src="js/f5_attack.js"></script>
</body>
</html>