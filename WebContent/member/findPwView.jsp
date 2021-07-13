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
		<c:when test="${finded != null}">
			<script>
			
			Swal.fire({
				  icon: 'success',
				  title: '비밀번호가 변경되었습니다.!',
				  text: '변경된 비밀번호로 로그인 하십시오!',
				}).then(function() {
					
					<%
					session.invalidate();
					%>
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
			    window.location = "member/findPw.jsp";
			});
			</script>
		</c:otherwise>
	</c:choose>

</body>
</html>