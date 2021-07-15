<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="layout.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- 폰트 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>

<style>
    html {
        height: 100%;
    }

    body {
        margin: 0;
        height: 100%;
        background: rgb(255, 206, 1);
        font-family: 'Noto Sans KR';
        font-size: 20px;
    }
    
   
    #logo {
        width: 240px;
        height: 44px;
        cursor: pointer;
    }

    #header {
        padding-top: 62px;
        padding-bottom: 20px;
        text-align: center;
    }


    #footer {
        padding-bottom: 40px;
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
    
    /*찾기 버튼 만들기*/
    #search {
        border: solid 1px #dadada;
        padding: 10px 14px 10px 14px;
        box-sizing: border-box;
        float: right;
        padding-top: 10px;
        padding-bottom: 15px;
        background-color: rgb(84, 37, 212);
    }
    
    #check {
        border: solid 1px #dadada;
        padding: 10px 14px 10px 14px;
        box-sizing: border-box;
        float: right;
        padding-top: 10px;
        padding-bottom: 15px;
        background-color: rgb(84, 37, 212);
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


    /*사진이미지*/
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
        margin: 30px 0 91px;
    }


    /*버튼 색 조절*/
    #btnJoin {
        width: 100%;
        padding: 21px 0 17px;
        border: 0;
        cursor: pointer;
        color: #fff;
        background-color: rgb(84, 37, 212);
        font-size: 20px;
        font-weight: 400;
        font-family: Dotum, '돋움', Helvetica, sans-serif;
    }
</style>
<script>
	
	</script>



<body>
    <!-- 제목 (header) -->
    <div id="header">
        <!-- 사진 입력 -->
        <h1>방구석 오락실</h1>
    </div>


    <!-- 틀 (wrapper) -->
    <div id="wrapper">

        <!-- content-->
        <div id="content">
		<form action="${pageContext.request.contextPath}/join.mem" method="post" id="checkForm">
            <!-- 아이디 (id) -->
            <div>
                <h3 class="join_title">
                    <label for="id">아이디</label>
                </h3>
                <span class="box1 int_postal">
                    <input type="text" id="id" name="id" class="int" maxlength="20">
                </span>
                <button type="button" class="btn btn-primary" id="check" onclick="openIdChk()">확인</button>
                
                <input type="hidden" name="idDuplication" value="idUncheck">
                <span class="error_next_box"></span>
            </div>

            <!-- 패스워드 (pswd1) -->
            <div>
                <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                <span class="box int_pass">
                    <input type="password" id="pswd1" name="pswd1" class="int" maxlength="20">
                    <span id="alertTxt">사용불가</span>
                    <img src="../member_Img/Icon/pass.png" id="pswd1_img1" class="pswdImg">
                </span>
                <span class="error_next_box"></span>
            </div>

            <!-- 패스워드 확인(pswd2) -->

            <div>
                <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                <span class="box int_pass_check">
                    <input type="password" id="pswd2" name="pswd2" class="int" maxlength="20">
                    <!--자물쇠 아이콘-->
                    <img src="../member_Img/Icon/check.png" id="pswd2_img1" class="pswdImg">
                </span>
                <span class="error_next_box"></span>
            </div>

            <!-- 이름 (name) -->
            <div>
                <h3 class="join_title"><label for="name">이름</label></h3>
                <span class="box int_name">
                    <input type="text" id="name" name="name" class="int" maxlength="20">
                </span>
                <span class="error_next_box"></span>
            </div>

               
              <!-- 이메일 (email)-->
             <div>
                <h3 class="join_title"><label for="email">본인확인 이메일</label></h3>
                <span class="box int_email">
                    <input type="text" id="email" name="email" class="int" maxlength="100">
                </span>
                <span class="error_next_box"></span>    
            </div>
            
			
			<!-- 핸드폰 (phone) -->
            <div>
                <h3 class="join_title"><label for="phoneNo">핸드폰</label></h3>
                <span class="box int_phone">
                    <input type="tel" id="phone" name="phone" class="int" maxlength="16" placeholder="필수 입력">
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



            <!-- 가입하기 (JOIN BTN) -->
            <div class="btn_area">
                <button type="button" id="btnJoin" class="btn btn-primary">
                    <span>가입하기</span>
                </button>
            </div>
            </form>
            <div id="footer">
                <h2>방구석 오락실</h2>
            </div>
        </div>
    </div>

    <script>
        /*함수 얻기위해 보다 정확하기 위해 querySelector 사용*/
        var id = document.querySelector("#id");
        var pw1 = document.querySelector('#pswd1');
        var pwMsg = document.querySelector('#alertTxt');
        var pwImg1 = document.querySelector('#pswd1_img1');
        var pw2 = document.querySelector('#pswd2');
        var pwImg2 = document.querySelector('#pswd2_img1');
        var pwMsgArea = document.querySelector('.int_pass');
        var userName = document.querySelector('#name');
        var phone = document.querySelector('#phone');
        var email = document.querySelector('#email');
        /*에러창입니다*/
        var error = document.querySelectorAll('.error_next_box');

        /*알아보기 편하게 변경*/
        id.addEventListener("change", checkId);
        pw1.addEventListener("change", checkPw);
        pw2.addEventListener("change", comparePw);
        userName.addEventListener("change", checkName);
        phone.addEventListener("change", checkPhoneNum);
        email.addEventListener("change", isEmailCorrect);

        
        // 정규식
        //id
        var idPattern = /[a-zA-Z0-9_-]{5,20}/;
        var pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}/;
        var emailPattern = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/;
        var isPhoneNum = /([01]{2,})([01679]{1,})([0-9]{3,4})([0-9]{4})/;
        var namePattern = /[a-zA-Z가-힣]/;
        
        
        /*아이디 설정하기*/
        function checkId() {
            if (id.value === "") {
                error[0].innerHTML = "필수 정보입니다.";
                error[0].style.color = "red"
                error[0].style.display = "block";
            } else if (!idPattern.test(id.value)) {
                error[0].innerHTML = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
                error[0].style.color = "red"
                error[0].style.display = "block";
            } else {
                error[0].innerHTML = "이쁜 아이디 입니다. 중복검사도 해보세요!";
                error[0].style.color = "#08A600";
                error[0].style.display = "block";
            } 
        }
        
        
        // 아이디 중복성 체크
        function openIdChk(){
            
        	if(id.value =="" || id.value.length < 0){
        		Swal.fire({
					  icon: 'error',
					  title: '아이디를 입력하세요',
					  text: '한번 확인해보세요!',
					  
					})
        		id.focus();
        	}else{
        		//2. 회원정보아이디를 가지고 있는 지 체크하려면 DB에 접근해야한다.
        		//자바스크립트로 어떻게 DB에 접근할까? => 파라미터로 id값을 가져가서 jsp페이지에서 진행하면 된다.
        		window.open("joinIdCheck.jsp?userid="+id.value,"","width=500, height=200");
        		
        	}
        }

        
        
        /*비밀번호 설정하기*/
        function checkPw() {
            
            if (pw1.value === "") {
                error[1].innerHTML = "필수 정보입니다.";
                pwMsg.style.display = "block";
                pwMsgArea.style.paddingRight = "40px";
                pwImg1.src = "../icon/pass.png";
                error[1].style.display = "block";
            } else if (!pwPattern.test(pw1.value)) {
                error[1].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
                pwMsg.innerHTML = "사용불가";
                pwMsgArea.style.paddingRight = "93px";
                error[1].style.display = "block";
                pwMsg.style.color = "red";
                pwMsg.style.display = "block";
                pwImg1.src = "../member_Img/Icon/not_use.png";
            } else {
                error[1].style.display = "none";
                pwMsg.innerHTML = "안전";
                pwMsgArea.style.paddingRight = "93px";
                pwMsg.style.color = "#03c75a";
                pwMsg.style.display = "block";
                pwImg1.src = "../member_Img/Icon/safe.png";
            }
        }
        
        
        
        
        /*비밀번호 확인*/
        function comparePw() {
            if(pw2.value === pw1.value) {
                pwImg2.src = "../member_Img/Icon/check_safe.png";
                error[2].style.display = "none";
            } else if(pw2.value !== pw1.value) {
                pwImg2.src = "../member_Img/Icon/check_no.png";
                error[2].innerHTML = "비밀번호가 일치하지 않습니다.";
                error[2].style.display = "block";
            } 
        
            if(pw2.value === "") {
                error[2].innerHTML = "필수 정보입니다.";
                error[2].style.display = "block";
            }
        }
		
        
        
        
        
        
        
        /*이름*/
        function checkName() {
            if(userName.value === "") {
                error[3].innerHTML = "필수 정보입니다.";
                error[3].style.display = "block";
            } else if(!namePattern.test(userName.value) || userName.value.indexOf(" ") > -1) {
                error[3].innerHTML = "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)";
                error[3].style.display = "block";
            } else {
                error[3].innerHTML = "훌륭한 이름 입니다.";
                error[3].style.color = "#08A600";
                error[3].style.display = "block";
            }
        }
        
        
        /*이메일*/
        function isEmailCorrect() {
       
        
            if(email.value === ""){ 
            	error[4].innerHTML = "필수 정보입니다.";
                error[4].style.display = "none"; 
            } else if(!emailPattern.test(email.value)) {
            	error[4].innerHTML = "이메일 형식에 맞지 않습니다.";
                error[4].style.display = "block";
            } else {
                error[4].style.display = "none"; 
            }
        
        }
        
        
        /*전화번호*/
        function checkPhoneNum() {
      
            if(phone.value === "") {
                error[5].innerHTML = "필수 정보입니다.";
                error[5].style.display = "block";
            } else if(!isPhoneNum.test(phone.value)) {
                error[5].innerHTML = "형식에 맞지 않는 번호입니다.";
                error[5].style.display = "block";
            } else {
                error[5].style.display = "none";
            }
        }

        


        
        /*우편번호 기능*/
        document.getElementById("search").onclick = function () {
			new daum.Postcode({
				oncomplete: function (data) {
					let roadAddr = data.roadAddress; 

					document.getElementById('postcode').value = data.zonecode;
					document.getElementById("address1").value = roadAddr;
				}
			}).open();
		};
		
		//보내기 폼
		document.getElementById("btnJoin").onclick = function() {
			
			let idInput = document.getElementById("id");
			let pwInput = document.getElementById("pswd1");
			let pw2Input = document.getElementById("pswd2");
			
			let nameInput = document.getElementById("name");
			let phone1Input = document.getElementById("phone1");
			let phone2Input = document.getElementById("phone2");
			let emailInput = document.getElementById("email");
			var form = document.userInfo;
			
			let resultId = idPattern.test(idInput.value);
			let resultPw = pwPattern.test(pwInput.value);
			let resultPw2 = pwPattern.test(pw2Input.value);
			let resultName = namePattern.test(nameInput.value);

			let resultPhone = isPhoneNum.test(phone.value);

			let resultEmail = emailPattern.test(email.value);
		
			if (!resultId) {
				Swal.fire({
					  icon: 'error',
					  title: '아이디가 잘못됐습니다.',
					  text: '한번 확인해보세요!',
					  
					})
				return;
			} 
			
			
			
			if (!resultPw) {
				Swal.fire({
					  icon: 'error',
					  title: '비밀번호가 잘못됐습니다.',
					  text: '한번 확인해보세요!',
					  
					})
				return;
			}
			
			if (!resultPw2) {
				Swal.fire({
					  icon: 'error',
					  title: '비밀번호 재확인이 잘못됐습니다.',
					  text: '한번 확인해보세요!',
					  
					})
				return;
			}
			
			
			
			
			
			if (!resultName) {
				Swal.fire({
					  icon: 'error',
					  title: '이름이 잘못됐습니다.',
					  text: '한번 확인해보세요!',
					  
					})
				return;
			}
			
			if (!resultEmail) {
				Swal.fire({
					  icon: 'error',
					  title: '이메일이 잘못됐습니다.',
					  text: '한번 확인해보세요!',  
					})
				return;
			}
			
			if (!resultPhone) {
				Swal.fire({
					  icon: 'error',
					  title: '전화번호가 잘못됐습니다.',
					  text: '한번 확인해보세요!',
					  
					})
				return;
			}
			document.getElementById("checkForm").submit();
		};
		
		
		
		


    </script>
	<script>
    $("#checkForm").keypress(function (e) {
        if (e.keyCode === 13) {
            Login();
        }
    });
	</script>
<script src="../js/right.js"></script>
<script src="../js/f5_attack.js"></script>





</body>

</html>