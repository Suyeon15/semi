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
			    title: "수정에 성공 했습니다!",
			    text: "한번 확인해보세요!",
			    type: "success"
			}).then(function() {
			    window.location = "member/Main.jsp";
			});
			
			</script>
		</c:when>
		<c:otherwise>
			<script>
			
			Swal.fire({
				  icon: 'error',
				  title: '수정에 실패했습니다ㅠ',
				  text: '적으신 정보를 다시 확인해보세요 ',
			}).then(function() {
			    window.location = "member/Modify_Membership.jsp";
			});
			</script>
		</c:otherwise>
	</c:choose>
</c:if>
</body>
</html>