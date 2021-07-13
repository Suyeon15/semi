<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WritePage</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>


<!-- 광재CSS 링크 -->
<link rel="stylesheet" type="text/css" href="style.css" >



<style>
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

 .table-wrapper {
    margin-top: 100px;
}

label{
  padding:3px;
  margin-top: 2px;
  vertical-align: center;
}
.writeDiv{
  padding:0px;
}
.pull-left{
  margin:15px;
}
.pull-right{
  margin-top:15px;
}

input[type=file]{
width:450px;
height:35px;
display:inline;
}


</style>


<script>
$(function(){
	let i=0;
	$("#backBtn").on("click",function(){
		location.href = "${pageContext.request.contextPath}/list.bor?cpage=1";
	})
	
	
	$("#saveBtn").on("click",function(){
		
		let title = $("#bbs_title").val();
		let content = $("#summernote").val();
		
		
		let blankRegex = /.*\S+/;
		let titleLengthRegex = /^.{0,66}$/;
		let contentLengthRegex = /^.{0,1333}$/;
		
		let bresult1 = blankRegex.test(title);
		let bresult2 = blankRegex.test(content);
		
		let titleResult = titleLengthRegex.test(title);
		let contentResult = contentLengthRegex.test(content);
		
		if(!bresult1){
			alert("제목을 반드시 입력해주세요!");
		}else if(!bresult2){
			alert("내용을 입력해주세요!");
		}else if(!titleResult){
			alert("제목은 66글자 이내로 작성해주세요.")
		}else if(!contentResult){
			alert("내용은 1,333글자 이내로 작성해주세요.")
		}
		else{
			$("input[name=files]").remove();
			$("#frm").submit();
		}
	})
	
	$("#btn1").on("click",function(){
		$("#file1").val("");
	})
	$("#btn2").on("click",function(){
		$("#file2").val("");
	})
	$("#btn3").on("click",function(){
		$("#file3").val("");
	})	
	
	
	
	 $('#summernote').summernote({
	        placeholder: 'Write contents',
	        height: 400,
	        minHeight: 300,             // set minimum height of editor
	        maxHeight: 300,             // set maximum height of editor
	        codeviewFilter: true,
	        codeviewIframeFilter: true,
	        callbacks:{
	            onImageUpload:function(files) {
	                  
	                 let editor = this;  
	                 let file = files[0];      
	               
	                 let form = new FormData()    
	                 form.append("file",file);    
	      
	                 
	                 
	                 $.ajax({
	                    data:form,
	                    type:"post",
	                    url:"${pageContext.request.contextPath}/upload.file",
	                    contentType:false,   
	                    processData:false,  
	                	dataType:"json",
	           
	                 }).done(function(resp){
	                  
	                   $(editor).summernote('insertImage',"${pageContext.request.contextPath}"+resp.returnPath); //editor 인스턴스의 insertImage 기능으로 이미지를 화면에 출력
	   
	                   
	                   // input type=hidden 노드
	                   let input = $("<input type='hidden'>");
	                   input.attr("name","summerImg");
	                   input.attr("value",[resp.oriName,resp.sysName]);
	                  
	                   
	                   $("#frm").append(input);
	                   
	                   
	                 });
	                 
	                 
	                 
	               }
	              
	           }
	        
	      });

	
	
	
	$(window).on("unload",function(){
		navigator.sendBeacon("${pageContext.request.contextPath}/unload.file");
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


      <li ><a href="#Link" title="Link">Board</a>
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
          <li ><a href="${pageContext.request.contextPath}/etcGames.game" title="Link">ETC</a></li>
        </ul>
      </li>
      </ul>
      

	
<c:choose>
	
		<c:when test="${login ne null && login.id eq 'admin'}">
    <ul>
       <li><a href="#" title="Link">${login.id } 님</a></li>
       <li><a href="${pageContext.request.contextPath}/adminlist.mem" title="Link">관리자 모드</a></li>
       <li><a href="${pageContext.request.contextPath}/mypage.mem" title="Link">내 정보 수정</a></li>
       <li><a href="${pageContext.request.contextPath}/logoutProc.mem" title="Link">로그 아웃</a></li>
      </ul>
	</c:when>
	
	
	<c:when test="${login ne null && login.id eq 'guest'}">
      <ul>
       	<li><a href="#" title="Link">${login.id } 님</a></li>
       	<li><a href="${pageContext.request.contextPath}/logoutProc.mem" title="Link">로그 아웃</a></li>
      </ul>
    </c:when>
	
	
	<c:when test="${login != null}">
      <ul>
       <li><a href="#" title="Link">${login.id } 님</a></li>
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
<script src="script.js"></script>







 <div class ="container">
		
    <div class="table-wrapper">
		<div class="row">
			<div class="table-title col-12">
				<h2><b>Write Contents</b></h2>
			</div>			
		</div>
    </div>

	<form id="frm" action="${pageContext.request.contextPath}/save.bor" method="post" enctype="multipart/form-data">
    <div class="row"> 
      <div class="form-group">
        <label for="inputEmail3" class="col-sm-2 control-label">Title</label>
        <div class="col-sm-10 writeDiv">
          <input type="text" class="form-control" id="bbs_title" name="title" placeholder="Title" >
        </div>
      </div>
 
      <div class="form-group">
        <label for="inputPassword3" class="col-sm-2 control-label">contents</label>
        <div class="col-sm-10 writeDiv">
          <textarea cols="3" name="content" id="summernote"></textarea>
        </div>
      </div>
       
       <div class="form-group">
        <label for="inputEmail3" class="col-sm-2 control-label">첨부파일</label>
        <div class="col-sm-10 writeDiv">

       
        <div class="input-group" >
			  <input type="file" class="form-control" id="file1"  name="file1" style="display:inline; width:430px">
			  <div class="input-group-btn" style="display: inline;">
				<button class="btn btn-danger" type="button" id="btn1">삭제</button>
			  </div>
		</div>
		<div class="input-group" >
			  <input type="file" class="form-control" id="file2"  name="file2" style="display:inline; width:430px" >
			  <div class="input-group-btn" style="display: inline;">
				<button class="btn btn-danger" type="button" id="btn2">삭제</button>
			  </div>
		</div>
		<div class="input-group" >
			  <input type="file" class="form-control" id="file3"  name="file3" style="display:inline; width:430px">
			  <div class="input-group-btn" style="display: inline;">
				<button class="btn btn-danger" type="button" id="btn3">삭제</button>
			  </div>
		</div>
       
        </div>
          
  </div>
</div>


  
  
  

<c:choose>
	<c:when test="${login ne null && login.id eq 'admin'}">
		<div class="row" style="margin-top:15px">
			<label class="col-sm-2 control-label">공지 등록 여부</label>
        	<div class="col-sm-10 writeDiv" >
          	<input type="radio" name="notice" value="Y" style="margin-left:8px">등록  &nbsp; &nbsp; &nbsp;<input type="radio" name="notice" value="N" checked>등록안함
        	</div>
		</div> 
	</c:when>
	<c:otherwise>
		<input type="hidden" name="notice" value="N">
	</c:otherwise>
</c:choose>





	<div id="imgtest">
		
	</div>
		


    <div class="row">
      <hr>
      <div class="col-12">
        <button type="button" id="backBtn" class="btn btn-default pull-left" style="background-color: #00285b; color:white">목록</button>
        
        <div class="pull-right"><a id="saveBtn" class="btn btn-info boardAddBtn"><span class="glyphicon glyphicon-pencil"></span> 등록</a></div>
      </div> 
    </div>
</form>
    </div>





</body>
</html>