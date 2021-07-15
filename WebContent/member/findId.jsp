<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">


 <title>아이디 찾기</title>
    <style>
        @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
	
	
	
	body {
	    width:100%;
	    height:50%;
	    margin: 0;

  		padding-bottom: 60px;
  		font-family: 'Noto Sans KR';
  		background-repeat: no-repeat;
	}
	
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 15px; /* Added */
	}

    #btn-Yes{
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
    .card-title{
        margin-left: 8px;
    }
	 .links{
        text-align: center;
        margin-bottom: 30px;
    }

    a{ 
    	color: #f58b34; text-decoration: none; 
    }
    .text2{
    	color : blue;
    }
    </style>
  </head>

  <body cellpadding="0" cellspacing="0" marginleft="10px" margintop="0" width="100%" height="100%" align="center">

	<div class="card align-middle" style="width:25rem;">
		<div class="card-title" style="margin-top:20px;">
			<h2 class="card-title" style="color:#f58b34;"><img src="../member_Img/img/id.jpg"/></h2>
		</div>
        
		<div class="card-body">
      <form action="${pageContext.request.contextPath}/findid.mem" class="form-signin" method="POST">
  		 <p class="text2"> ${findid2}</p>
        <input type="text" name="name" id="name" class="form-control" placeholder="이름" required autofocus><BR>
        <input type="text" name="phone" id="phone" class="form-control" placeholder="휴대폰 번호" required><br>
        	<p class="check" id="check">${check}</p><br/>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">아 이 디 찾 기</button>
      
      </form>
        
		</div>
        <div class="links">
            <a href="findPw.jsp">비밀번호 찾기</a>

        </div>
	</div>
   
  </body>
  <script src="../js/f5_attack.js"></script>
  <script src="../js/right.js"></script>
  <script type="text/javascript">
	 		
  		
  
  		$("#name").focusout(function(){
  			
	     if($('#name').val() == "" && $('#name').val() == "운영자"){
	   		$('#check').text('이름을 입력해주세요.');
	   	  	$('#check').css('color', 'red');
	   
	     }else{
	    	 $('#check').hide();
	     }
	     });
	     
  		$("#phone").focusout(function(){
  			
	     if($('#phone').val() == ""){
	   		$('#check').text('휴대폰 번호를 입력해주세요.');
	   	  	$('#check').css('color', 'red');
	     }else{
	    	 $('#check').hide();
	     }
	     });
  
  </script>
</html>