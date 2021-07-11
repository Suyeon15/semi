<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"></link>
<link rel="stylesheet" type="text/css" href="adminMember/css/htmleaf-demo.css">
<link rel="stylesheet" href="adminMember/css/style.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<script src="adminMember/dist/tableExporter.js"></script>
	
</head>
<body>
	
	<div class="htmleaf-container">
		<header class="htmleaf-header">
			<h1>관리자 페이지 입니다.</h1>
		</header>
		<div class="container home">

		    <div class="row">
		    	<h1 class="sub-header">저 버튼으로 다양한 파일로 추출할수 있습니다.</h1>
		  	
		  	
		  	<!-- 추출 버튼 -->
		  	<div class="top-panel">
		      <div class="btn-group">
		        <button type="button" class="btn btn-primary btn-lg dropdown-toggle" data-toggle="dropdown">Export to <span class="caret"></span></button>
		        <ul class="dropdown-menu" role="menu">
		          <li><a onclick="exportTo('csv');" href="javascript://">CSV</a></li>
		          <li><a onclick="exportTo('txt');" href="javascript://">TXT</a></li>
		          <li><a onclick="exportTo('xls');" href="javascript://">XLS</a></li>
		          <li><a onclick="exportTo('sql');" href="javascript://">SQL</a></li>
		        </ul>
		      </div>
		  	</div>
		  	<!------------>

		  	<div class="table-responsive">
		          <table id="firm_table" class="table table-striped table-bordered table-hover">
		            <thead>
		              <tr>
		                <th class="danger">아이디</th>
		                <th class="danger">이름</th>
		                <th class="danger">핸드폰</th>
		                <th class="danger">이메일</th>
		                <th class="danger">우편 번호</th>
		                <th>삭제</th>
		              </tr>
		            </thead>
		            
		            <tbody>
		            
		            <c:forEach var="i" items="${list }">		             
		             <tr>
		                <td class="danger">${i.id}</td>
		                <td class="danger">${i.name}</td>
		                <td class="danger">${i.phone}</td>
		                <td class="danger">${i.email}</td>
		                <td class="danger">${i.postal }</td>
						<td><a href="${pageContext.request.contextPath}/delete1.mem?id=${i.id}">삭제</a></td>
		              
		              </tr>
		            </c:forEach>
		             	
		          			
		            </tbody>
		          </table>
		        </div>

		    </div>
			
		  </div>

	</div>
	
  	<script>
  		
  	function exportTo(type) {
		$('.table').tableExport({
			filename: 'table_%DD%-%MM%-%YY%',
			format: type,
			cols: '2,3,4'
		});
	}	
	
		
	</script>
</body>
</html>