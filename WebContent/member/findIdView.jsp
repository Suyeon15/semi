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
		<c:when test="${find != null}">
			<script>
			
			Swal.fire({
				  icon: 'success',
				  title: '찾는데 성공하셨습니다!',
				  text: '당신의 아이디는 : ${find.id} 입니다!',
				  
				}).then(function() {
					window.close();
					
					//window.location = "${pageContext.request.contextPath}/mypage.mem";
				});
			
			
			</script>
		</c:when>
		<c:otherwise>
			<script>
			
			Swal.fire({
				  icon: 'error',
				  title: '찾는데 실패 하였습니다.',
				  text: '적으신 내용을 확인해보세요',
			}).then(function() {
			    window.location = "findId.jsp";
			});
			</script>
		</c:otherwise>
	</c:choose>

</body>
</html>