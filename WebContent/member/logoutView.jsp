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
	<script>
	Swal.fire({
				  icon: 'success',
				  title: '로그아웃 되었습니다!',
				  text: '방구석 오락실을 이용해 주셔서 감사합니다.',
				}).then(function() {
					window.location = "index.jsp";
				});
	</script>
	
</body>
</html>