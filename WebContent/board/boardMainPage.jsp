<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BoardMainPage</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>


<!-- 광재CSS 링크 -->
<link rel="stylesheet" type="text/css" href="board/style.css" >



<style>


.table-striped>tbody>tr:nth-child(odd) {
    background-color: LemonChiffon;
}
.table-hover tbody tr:hover {
    background-color: #D3D3D3;
}




body {
	color: #566787;
	background: #f5f5f5;
	font-family: 'Varela Round', sans-serif;
	font-size: 13px;
} 
 .table-wrapper {
    margin: 130px 0;
}
.table-title {        
	background: #435d7d;
	color: #fff;
	padding: 16px 30px;
	border-radius: 3px 3px 0 0;
}
.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
} 


.pagination {
	justify-content: center;
}
.pagination li a {
	border: none;
	font-size: 13px;
	min-width: 30px;
	min-height: 30px;
	color: #999;
	margin: 0 2px;
	line-height: 30px;
	border-radius: 2px !important;
	text-align: center;
	padding: 0 6px;
}
.pagination li a:hover {
	color: #666;
}	
.pagination li.active a, .pagination li.active a.page-link {
	background: #435d7d;
}
.pagination li.active a:hover {        
	background: #0397d6;
}
.pagination li.disabled i {
	color: #ccc;
}
.pagination li i {
	font-size: 16px;
	padding-top: 6px
}

.search{
	overflow: hidden;
	margin-top: 45px;
	padding:2px;
}
.float1{
	float:left;
	width:90px
}
.float2{
	float:left;
	width:320px
}


#writeBtnDiv{ 
padding:0;
}

#writeBtn{
float:right;
}

</style>

<script>
$(function(){
	
	$("#writeBtn").on("click",function(){
		location.href ="${pageContext.request.contextPath}/write.bor"
	})
	
	
	
	
})
</script>

</head>
<body>

<div class="nav_wrapper"> 
 
  
  <div class="spinner-master">
    <input type="checkbox" id="spinner-form" />
    <label for="spinner-form" class="spinner-spin">
    <div class="spinner diagonal part-1"></div>
    <div class="spinner horizontal"></div>
    <div class="spinner diagonal part-2"></div>
    </label>
  </div>
 
  <nav id="menu" class="menu">
    <ul class="dropdown">
      
      <li ><div class="nabar_logo">방구석 오락실</div></li>
    
      <li ><a href="Main.jsp" title="Link">Home</a></li>
      

      <li ><a href="" title="Link">Game</a>
        <ul >
          <li ><a href="${pageContext.request.contextPath}/allGames.game" title="Link">전체게임</a></li>

          <li ><a href="${pageContext.request.contextPath}/popularGames.game" title="Link">인기 게임</a></li>

        </ul>
      </li>


      <li ><a href="#Link" title="Link">Category</a>
        <ul >
          <li ><a href="#Link" title="Link ">자유 게시판</a></li>
          <li ><a href="#Link" title="Link">후기 게시판</a></li>
        </ul>
      </li>

      <li ><a href="#Link" title="Link">Category Games</a>
        <ul >
          <li ><a href="${pageContext.request.contextPath}/rpgGames.game" title="Link">RPG	</a></li>
          <li ><a href="${pageContext.request.contextPath}/shootingGames.game" title="Link">Shooting</a></li>
          <li ><a href="${pageContext.request.contextPath}/arcadeGames.game" title="Link">Arcade</a></li>
        </ul>
      </li>
      </ul>
      

	
<c:choose>
	
	<c:when test="${login ne null && login.id eq 'admin'}">
    <ul>
       <li><a href="index.jsp" title="Link">${login.id } 님</a></li>
       <li><a href="${pageContext.request.contextPath}/adminlist.mem" title="Link">관리자 모드</a></li>
       <li><a href="${pageContext.request.contextPath}/mypage.mem" title="Link">내 정보 수정</a></li>
       <li><a href="${pageContext.request.contextPath}/logoutProc.mem" title="Link">로그 아웃</a></li>
      </ul>
	</c:when>
	
	
	<c:when test="${login != null}">
      <ul>
       <li><a href="index.jsp" title="Link">${login.id } 님</a></li>
       <li><a href="${pageContext.request.contextPath}/mypage.mem" title="Link">내 정보 수정</a></li>
       <li><a href="${pageContext.request.contextPath}/logoutProc.mem" title="Link">로그 아웃</a></li>
      </ul>
    </c:when>
   
    

    <c:otherwise>
   	 <ul>
       <li><a href="member/index.jsp" title="Link">로그인</a></li>
       <li><a href="member/memberShip.jsp" title="Link">회원 가입</a></li>
      </ul>
	</c:otherwise>
</c:choose>
  </nav>
</div>
<!-- 광재 Script 링크 -->
<script src="board/script.js"></script>





	<div class ="container">
		<div class="table-wrapper">
		<div class="row">
			<div class="table-title col-12">
				<h2><b>자유 게시판</b></h2>
			</div>			
		</div>

		<div class="row">
			<table class="table table-striped table-hover" id="table">
			<thead>
			<tr>
				<th class="d-sm-table-cell" style="width:7%">글번호</th>
				<th class="d-sm-table-cell" style="width:50%">제목</th>
				<th class="d-sm-table-cell" style="width:13%">작성자</th>
				<th class="d-none d-md-table-cell" style="width:20%">작성일</th>
				<th class="d-none d-md-table-cell" style="width:10%">조회수</th>
			</tr>
			</thead>
			<tbody>
			
			
			<!-- 게시글 리스트 뽑아오기  -->
			<c:choose>
				<c:when test="${list != null}" >
					<c:forEach var="list" items="${list}">
						
						
						<c:choose>
						<c:when test="${list.notice eq 'Y'}">
						<tr style="background-color:#FFFACD" onMouseOver="this.style='background-color:#D3D3D3'" onMouseOut="this.style='background-color:#FFFACD'">
							<td class="d-sm-table-cell"><i class="material-icons notification_important" style="font-size:20px">&#xe004;</i></td>
							<td class="d-sm-table-cell" style="width:50%"><a href="${pageContext.request.contextPath}/detail.bor?board_seq=${list.board_seq}">${list.title}</a></td>
							<td class="d-sm-table-cell" style="width:13%">${list.id}</td>
							<td class="d-none d-md-table-cell" style="width:20%">${list.write_date}</td>
							<td class="d-none d-md-table-cell" style="width:10%">${list.view_count}</td>
						</tr>
						</c:when>
						
						<c:otherwise>
						<tr>
							<td class="d-sm-table-cell" style="width:7%">${list.board_seq}</td>
							<td class="d-sm-table-cell" style="width:50%"><a href="${pageContext.request.contextPath}/detail.bor?board_seq=${list.board_seq}">${list.title}</a></td>
							<td class="d-sm-table-cell" style="width:13%">${list.id}</td>
							<td class="d-none d-md-table-cell" style="width:20%">${list.write_date}</td>
							<td class="d-none d-md-table-cell" style="width:10%">${list.view_count}</td>
						</tr>
						</c:otherwise>
						</c:choose>
							
						
					</c:forEach>
				</c:when>
		
		
				<c:otherwise>
					<c:forEach var="searchlist" items="${searchList}">
					<tr>
					<td class="d-sm-table-cell" style="width:7%">${searchlist.board_seq}</td>
					<td class="d-sm-table-cell" style="width:50%"><a href="${pageContext.request.contextPath}/detail.bor?seq=${searchlist.board_seq}">${searchlist.title}</a></td>
					<td class="d-sm-table-cell" style="width:13%">${searchlist.id}</td>
					<td class="d-none d-md-table-cell" style="width:20%">${searchlist.write_date}</td>
					<td class="d-none d-md-table-cell" style="width:10%">${searchlist.view_count}</td>
					</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>


			
			</tbody>
			</table>
		</div>
		</div>
		
		<div class="row">
		<div class="col-12" id="writeBtnDiv">
			<button class="btn btn-info" type="button" id="writeBtn" style="float:right">글쓰기</button>
		</div>
		</div>


		<div class="row" style="text-align: center;">
		<div class="col-12" >
			<ul class="pagination">	
		
				<c:forEach var="i" items="${navi}" varStatus="s">	
					<c:choose>
						<c:when test="${i=='>'}">
							<li class="page-item"><a href="${pageContext.request.contextPath}/list.bor?cpage=${navi[s.index-1]+1}&category=${category}&searchWord=${searchWord}">Next</a>
						</c:when>
						<c:when test="${i=='<'}">
							<li class="page-item"><a href="${pageContext.request.contextPath}/list.bor?cpage=${navi[s.index+1]-1}&category=${category}&searchWord=${searchWord}">Previous</a>
						</c:when>
                       	<c:when test="${i==cpage}">
                           	<li class="page-item" id="currentPage" style="background-color:#17a2b8"><a style="color:white" href="${pageContext.request.contextPath}/list.bor?cpage=${i}&category=${category}&searchWord=${searchWord}">${i}</a>
                        </c:when>
                        <c:otherwise>
                           	<li class="page-item" id="currentPage"><a href="${pageContext.request.contextPath}/list.bor?cpage=${i}&category=${category}&searchWord=${searchWord}">${i}</a>
                        </c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
		</div>
		

		
		
		
		<div class="controls col-12 search">
		<form action="${pageContext.request.contextPath}/list.bor?cpage=1" method="post" style="display: inline-block;">
			<div class="float1">
			<select name="category" class="form-control form-control-inline">
				<option value="title">제목</option>
				<option value="id">작성자</option>
				<option value="content">내용</option>
			</select>
			</div>
			<div class="input-group controls float2">
			  <input type="text" class="form-control searchWord" style="width:100px; display: inline-block;" placeholder="검색어를 입력하세요" name="searchWord">
			  <div class="input-group-btn" style="display: inline;">
				<button class="btn btn-info" type="submit" style="margin:0; padding:0; width:80px; height:38px">
				  <i class="glyphicon glyphicon-search"></i> 검색
				</button>
			  </div>
			</div>
		</form>
		</div>
		
		</div>
		

		</div>



	

</body>
</html>