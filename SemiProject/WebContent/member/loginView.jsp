<%@page import="dao.MemberDAO"%>
<%@page import="java.lang.reflect.Member"%>
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





	<c:choose>
		<c:when test="${login != null}">
			<input type="hidden" name="id" value="${login.id }">
			<input type="hidden" name="pw" value="${login.pw }">
			<script>
			Swal.fire({
				  icon: 'success',
				  title: '로그인 성공하셨습니다!',
				  text: '${login.id}님  환영합니다!',
				  showConfirmButton: false,
				  timer: 1500
				  
				 
				}).then(function() {
					window.location = "loginView.mem";
					//window.location = "${pageContext.request.contextPath}/mypage.mem";
				});

			
			</script>
		</c:when>
		<c:otherwise>
			<script>
			
			Swal.fire({
				  icon: 'error',
				  title: '로그인 실패했습니다ㅠ',
				  text: 'id나 pw를 확인해보세요. ',
			}).then(function() {
			    window.location = "index.jsp";
			});
			</script>
		</c:otherwise>
	</c:choose>

</body>
</html>