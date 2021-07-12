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
</head>
<body>
<!-- 다했슴 손대지마셈 -->
<c:if test="${result != null}">
	<c:choose>
		<c:when test="${result>0}">
			<script>
			swal.fire({
				icon: 'success',
			    title: "회원가입 완료했습니다!",
			    text: "방구석에 오신걸 환영합니다!!",
			    type: "success"
			}).then(function() {
			    window.location = "member/index.jsp";
			});
			
			</script>
		</c:when>
		<c:otherwise>
			<script>
			
			Swal.fire({
				  icon: 'error',
				  title: '회원가입 실패했습니다ㅠ',
				  text: '적으신 정보를 다시 확인해보세요 ',
			}).then(function() {
			    window.location = "member/memberShip.jsp";
			});
			</script>
		</c:otherwise>
	</c:choose>
</c:if>
</body>
</html>