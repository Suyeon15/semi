<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
* {
	color: wheat;
}

html {
	background: url(../member_Img/img/바탕화.jpg) no-repeat 50% 50% fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

.container {
	position: absolute;
	width: 400px;
	height: 00px;
	background-color: white;
	text-align: center;
	margin-left: -200px;
	margin-top: -200px;
	left: 50%;
	top: 62%;
	color: white;
}

.login_box {
	padding-bottom: 20px;
	margin: 0 auto;
	z-index: 2;
}

.login_title {
	padding: 15px 0px 15px 0px;
	font-size: 25px;
	font-weight: bold;
	text-align: center;
	z-index: 1;
}

.login_id, .login_pwd {
	width: 100%;
	text-align: center;
}

.inp {
	width: 80%;
	font-size: 17px;
	background: none;
	border: 0px;
	border-bottom: 1px solid #777;
	outline: none;
	margin-top: 1em;
	margin: 10px 0px 10px 0px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.inp:focus {
	border-bottom: 1px solid #4a4a4a;
}

.inp::placeholder {
	color: white;
}

.login_input {
	margin-bottom: 3em;
}

.btn_login {
	text-align: center;
}

.btn_login>button {
	width: 80%;
	padding: 10px 0px 10px 0px;
	border: 0px;
	background: #ffce01;
	font-size: 17px;
	font-weight: bold;
	color: white;
}
/*------*/
.others {
	text-align: center;
}

.others ul {
	padding-left: 0px;
}

.others ul>span {
	color: #DEDEDE;
}

.others ul>li {
	display: inline-block;
}

.others ul>li a {
	color: white;
	text-decoration: none;
	font-size: 15px;
}
</style>
</head>
<body>
<body>
	<form action="${pageContext.request.contextPath}/loginProc.mem" method="post">
		<div class="container">
			<div class="helper"></div>
			<div class="login_box">
				<div class="login_input">
					<div class="login_id">
						<input class="inp" type="text" name="id" id="id" placeholder="아이디">
					</div>
					<div class="login_pwd">
						<input class="inp" type="password" name="pw" name="pw" placeholder="비밀번호">
					</div>
				</div>
				<div class="btn_box">
					<div class="btn_login">
						<button style='cursor: pointer;' id="checkForm" type="submit">로그인</button>
					</div>
					<div class="others">
						<ul>
							<li><a href="membership.mem">회원가입</a></li>
							<span> &nbsp;|</span>
					
							<li><a href='#' onclick="window.open('${pageContext.request.contextPath}/member/findId.jsp','window','location=no, directories=no,resizable=no,status=no,toolbar=no,menubar=no, width=600,height=760,left=0, right=500, top=0, scrollbars=yes');return false">
							아이디 찾기</a></li>
							<span> &nbsp;|</span>
							<li><a href='#' onclick="window.open('${pageContext.request.contextPath}/member/findPw.jsp','window','location=no, directories=no,resizable=no,status=no,toolbar=no,menubar=no, width=600,height=760,left=0, right=500, top=0, scroll=no');return false">
							비밀번호 찾기</a></li>

							<span> &nbsp;|</span>
							<li><a href="${pageContext.request.contextPath}/guest.mem?id=guest&pw=1234">게스트 모드</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</form>
	<script src="../js/right.js"></script>
	<script src="../js/f5_attack.js"></script>
	
	
	

	
	
	
</body>








</html>