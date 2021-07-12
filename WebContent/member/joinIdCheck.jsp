<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	<b><font size="4" color="gray">아이디 중복체크</font></b><br><br>
	
<%//1. 한글처리 & 받아온 파라미터 변수화
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("userid");

//2. MemberDAO객체생성 -> 전달받은 정보 모두 저장
MemberDAO mdao = new MemberDAO();

//3. joinIdCheck(ID)메서드
int result = mdao.joinIdCheck(id);
if (result == 1){
	
	out.print("사용가능한 아이디입니다");
	//5. 아이디사용하기버튼추가 => 동기방식사용 but 요즘은 비동기방식을 더 많이사용한다
	%>
	 <input type="button" value="아이디 사용하기"  class="btn btn-primary" onclick="func();">
	<%
	
}else if(result == 0){
	%>
	<input type="text" class="btn btn-primary" value="중복된 아이디 입니다">
	
	<% 
}else{
	out.print("에러 발생!!!"); 
}

%>
<br><br>

<fieldset>	
	<form action="joinIdCheck.jsp" method="post" name="wfr">
		ID : <input type="text" name="userid" id="<%=id%>" value="<%=id%>">
		<input type="submit" value="중복 확인" class="btn btn-primary" style="background: red">	 
	</form>
</fieldset>

<!-- 선택된아이디는 중복확인창에서 회원가입 페이지로 정보전달  -->
 <script>
    function func(){
    	opener.id.value = document.wfr.userid.value;
    	opener.id.readOnly=true;
    	window.close();
    }
    
    
    
    
    
 
 </script>
</body>
</html>





