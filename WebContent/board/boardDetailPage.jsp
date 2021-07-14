<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Board Detail Page</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

<!-- 광재CSS 링크 -->
<link rel="stylesheet" type="text/css" href="board/style.css" >

<script src="https://unpkg.com/dayjs"></script>


<style>
body {color: #566787; background: #f5f5f5; font-family: 'Varela Round', sans-serif; font-size: 13px;}
.table-responsive {margin: 30px 0;}
.table-wrapper {
   background: #fff;
   padding: 20px 25px;
   border-radius: 3px;
   min-width: 1000px;
   box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
   margin: 130px 0;
}
.table-title {
   padding-bottom: 15px;
   background: #435d7d;
   color: #fff;
   padding: 16px 30px;
   min-width: 100%;
   margin: -20px -25px 10px;
   border-radius: 3px 3px 0 0;
}
.table-title h2 {margin: 5px 0 0;font-size: 24px;}
.table-title .btn-group {float: right;}
.table-title .btn {
   color: #fff;
   float: right;
   font-size: 13px;
   border: none;
   min-width: 50px;
   border-radius: 2px;
   border: none;
   outline: none !important;
   margin-left: 10px;
}
.table-title .btn i {float: left; font-size: 21px; margin-right: 5px;}
.table-title .btn span {float: left;margin-top: 2px;}
table.table tr th, table.table tr td {border-color: #e9e9e9; padding: 12px 15px; vertical-align: middle;}
table.table tr th:first-child { width: 60px;}
table.table tr th:last-child {width: 100px;}
table.table-striped tbody tr:nth-of-type(odd) {background-color: #fcfcfc;}
table.table-striped.table-hover tbody tr:hover {background: #f5f5f5;}
table.table th i {font-size: 13px; margin: 0 5px; cursor: pointer;}
table.table td:last-child i {opacity: 0.9;font-size: 22px;margin: 0 5px;}
table.table td a {
   font-weight: bold;
   color: #566787;
   display: inline-block;
   text-decoration: none;
   outline: none !important;
}
table.table td a:hover {color: #2196F3;}
table.table td i {font-size: 19px;}
table.table .avatar {border-radius: 50%; vertical-align: middle; margin-right: 10px;}
.pagination {float: right; margin: 0 0 5px;}
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
.pagination li a:hover {color: #666;}
.pagination li.active a, .pagination li.active a.page-link {background: #03A9F4;}
.pagination li.active a:hover {background: #0397d6;}
.pagination li.disabled i {color: #ccc;}
.pagination li i {font-size: 16px;padding-top: 6px}
.hint-text {float: left;margin-top: 10px;font-size: 13px;}
/* Modal styles
--------------------------------------------------------------------------------------------------------------- */
.modal .modal-dialog {max-width: 400px;}
.modal .modal-header, .modal .modal-body, .modal .modal-footer {padding: 20px 30px;}
.modal .modal-content {border-radius: 3px; font-size: 14px;}
.modal .modal-title {display: inline-block;}
.modal .form-control {border-radius: 2px; box-shadow: none; border-color: #dddddd;}
.modal .btn {border-radius: 2px; min-width: 100px;}
.modal .modal-footer {background: #ecf0f1; border-radius: 0 0 3px 3px;}
.modal textarea.form-control {resize: vertical;}
.modal form label {font-weight: normal;}
/* Content Area
--------------------------------------------------------------------------------------------------------------- */
.container{padding:80px 0;}

/* Content */
.container .content{}
.sectiontitle{display:block; max-width:55%; margin:0 auto 80px; text-align:center;}
.sectiontitle *{margin:0;}
.ringcon{display:inline-block; border:1px solid; border-radius:50%;}
.ringcon i{display:block; width:160px; height:160px; line-height:160px; font-size:56px;}
.overview{}
.overview > li{margin-bottom:30px;}
.overview > li:nth-last-child(-n+3){margin-bottom:0;}/* Removes bottom margin from the last three items - margin is restored in the media queries when items stack */
.overview > li:nth-child(3n+1){margin-left:0; clear:left;}/* Removes the need to add class="first" */
.overview > li figure{position:relative; max-width:348px;}/* Uses the one_third width in pixels */
.overview > li figure a::after{position:absolute; top:0; right:0; bottom:0; left:0; content:"";}
.overview > li figure figcaption{display:block; position:absolute; bottom:0; width:100%; padding:15px;}
.overview > li figure a::after, .overview > li figure figcaption{}
.overview > li figure:hover a::after, .overview > li figure:hover figcaption{opacity:0; visibility:hidden;}
.overview > li figure figcaption *{margin:0;}
.overview > li figure .heading{margin-bottom:10px; font-size:1.2rem;}
/* Comments */
#comments ul{margin:0 0 40px 0; padding:0; list-style:none;}
#comments li{margin:0 0 10px 0; padding:15px;}
#comments .avatar{float:right; margin:0 0 10px 10px; padding:3px; border:1px solid;}
#comments address{font-weight:bold;}
#comments time{font-size:smaller;}
#comments .comcont{display:block; margin:0; padding:0;}
#comments .comcont p{margin:10px 5px 10px 0; padding:0;}
#comments form{display:block; width:100%;}
#comments input{width:100%; padding:10px; border:1px solid;}
#comments textarea{width:89%; padding:10px; border:1px solid;}
#comments textarea{overflow:auto;}
#comments input[type="submit"], #comments input[type="reset"]{display:inline-block; width:auto; min-width:95px; margin:5px; padding:8px 5px; cursor:pointer;}
.ringcon{background-color:#FFFFFF; border-color:rgba(0,0,0,.2);}
.overview > li figure a::after{background-color:rgba(0,0,0,.5);}
.overview > li figure figcaption{color:#FFFFFF;}
table, th, td, #comments .avatar, #comments input, #comments{border-color:#D7D7D7;}
#comments input:focus, #comments textarea:focus, #comments *:required:focus{border-color:#F7A804;}
th{color:#FFFFFF; background-color:#373737;}
tr, #comments li, #comments input[type="submit"], #comments input[type="reset"]{color:inherit; background-color:#FBFBFB;}
input #sign{float:right;}
tr:nth-child(even), #comments li:nth-child(even){color:inherit; background-color:#F7F7F7;}
table a, #comments a{background-color:inherit;}
#comments li a.edit{color: #FFC107; align:rigth;} #comments li a.delete{color: #F44336;}
.comcont_btn {text-align: right;}
.btn_wrap {padding-top: 50px; border-top: 1px solid #ddd;}
.contents {padding: 20px; min-height: 300px; background-color: #FBFBFB;}
.title {overflow: hidden; padding-bottom: 10px; border-bottom: 1px solid #ddd;}
.title ul {overflow:hidden; float:right; padding: 0; margin: 0;}
.title ul li {list-style: none; font-size: 13px; float: left; position: relative; margin-right: 11px; color: #666;}
.title ul li:last-child {margin-right: 0;}
.title ul li:after {display: block; width: 1px; height: 12px; background-color: #ddd; content: ''; position: absolute; top: 50%; margin-top: -6px; margin-left: -5px;}
.files{border-bottom: 1px solid #ddd;}
.btn_wrap {margin-top: 10px; padding-top: 30px;}

</style>
<script>
$(document).ready(function(){
      // Activate tooltip
      $('[data-toggle="tooltip"]').tooltip();
      
      $("#backBtn").on("click",function(){
         location.href = "${pageContext.request.contextPath}/list.bor?cpage=1";
      })
      
      
      // modal에 삭제할 seq 값 부여
      $("#deleteEmployeeModal").on("shown.bs.modal",function(e){
         let seq = $(e.relatedTarget).data("seq");
         $("#cmtdelete").attr("seq",seq);
      })
      
      
         // 댓글 등록 및 출력
<<<<<<< HEAD
        $("#sign").click(function(){
=======
  	   $("#sign").click(function(){
>>>>>>> 9d8b222dbb4ece9cd9ccdf628246d4778ceed5e8
         if($("#comment").val() == ""){
            alert("댓글을 입력하세요.");
            $("#comment").val("").focus();
            
         }else{
            $.ajax({
               url:"${pageContext.request.contextPath}/write.cmt",
               type:"post",
               dataType:"json",
               data:{
                  cmt_content : $("#comment").val(),
                  board_seq : $("#board_seq").val()
               },
                 success: function(resp){
                    
                
                    $("#comment").val("");

                       let div1 = $("<div class='comcont'>");
                       let div2 = $("<div class='comcont_btn'>");
                       
                       let ul = $("<ul>");
                       ul.attr("class","cmtlist seq_"+resp.cmt_seq);
                       let li = $("<li>");
                       let article = $("<article>");
                       let header = $("<header>");
                       let address = $("<address>");

                       // 전체 입력 댓글 구현
                       ul.append(li);
                       li.append(article);
                       article.append(header);
                       header.append(address);
                       address.append("By " + resp.id + "<time>" + '&nbsp&nbsp&nbsp&nbsp&nbsp' + dayjs().format("YYYY-MM-DD"));
                       
                       div1.append(resp.cmt_content);
                       
                      
                       
                       // 연필 수정버튼
                       let cmtedita=$("<a href='' class='edit set2' data-toggle='modal' id='cmtModify'>");
                       cmtedita.attr("data-seq",resp.cmt_seq);
                       let cmtediti=$("<i class='material-icons set2' id='cmtModifyViewBtn'>&#xE254;</i>");
                       cmtedita.append(cmtediti); 
                       div2.append(cmtedita);
                       
                       
                       // 휴지통 삭제버튼
                       let cmtdela = $("<a href='#deleteEmployeeModal' class='delete set2' data-toggle='modal' id='cmtDelete' data-target='#deleteEmployeeModal'>");
                       cmtdela.attr("data-seq",resp.cmt_seq);
                       let cmtdeli = $("<i class='material-icons set2' title='Delete' id='cmtDeleteBtn'>&#xE872;</i>");                      
                       cmtdela.append(cmtdeli);
                       div2.append(cmtdela);
                       
                       
                       
                       //엑스 버튼
                       let cancela =$("<a class='set1' href='' style='color:red' id='cmtModifycancelBtn' style='display:none'>");
                       cancela.attr("seq",resp.cmt_seq);
                       let canceli =$("<i class='material-icons set1' id='cancelIcon' style='display:none'>&#xe5c9;</i>");
                       cancela.append(canceli);
                       div2.prepend(cancela);
                       
                       //체크 버튼
                       let checka = $("<a class='set1' href='#CommentsModifyForm' data-toggle='modal' style='color:green' id='cmtModifyDoneBtn' style='display:none'>");
                       checka.attr("seq",resp.cmt_seq);
                       let checki =$("<i class='material-icons set1' id='checkIcon' style='display:none'>&#xe86c;</i>");
                       checka.append(checki);
                       div2.prepend(checka);
                       
                       
                       article.append(div1);
                       article.append(div2);
                       $("#cmt").prepend(ul);
                  
                        
             }

            })
         }
      })
      
      // 모달의 삭제버튼을 통해서 댓글 삭제
      $("#cmtdelete").on("click", function() {  
        let seq = $(this).attr("seq");
        $(".cmtlist.seq_"+seq).remove();
         
         $.ajax({
            url : "${pageContext.request.contextPath}/delete.cmt",
            type : "post",
            dataType : "json",
            data : {"cmt_seq" : seq}
         })
      });

          // ※※Ajax 수정  연필 버튼 클릭 시 이벤트 ※※ 
          $(document).on("click","#cmtModify",function(){   
<<<<<<< HEAD
             let seq = $(this).data("seq");
=======
        	  let seq = $(this).data("seq");
>>>>>>> 9d8b222dbb4ece9cd9ccdf628246d4778ceed5e8
              let parent =  $(this).parent().siblings(".comcont");
              parent.attr("id","modifyCont");
              parent.attr("contenteditable","true");
              parent.focus();
              
              let comcontBtn = $(this).parent();
              comcontBtn.children(".set1").css("display","inline-block");
              comcontBtn.children(".set1").children().css("display","inline-block");
              
              comcontBtn.children(".set2").css("display","none");
  

          })
 
          
          
          
          
//           ※※기존 댓글리스트 수정  연필 버튼 클릭 시 이벤트 ※※ 
          $("#cmtModify").on("click",function(){   
             let seq = $(this).data("seq");
             let parent =  $(this).parent().siblings(".comcont");
             parent.attr("id","modifyCont");
             parent.attr("contenteditable","true");
             parent.focus();
             
             
            
<<<<<<< HEAD
                $(this).closest("#cmtModifyDoneBtn").css("display","inline-block");    
                $(this).closest("#checkIcon").css("display","inline-block"); 
                $(this).closest("#cmtModifycancelBtn").css("display","inline-block"); 
                $(this).closest("#cancelIcon").css("display","inline-block"); 
=======
            	 $(this).closest("#cmtModifyDoneBtn").css("display","inline-block");    
            	 $(this).closest("#checkIcon").css("display","inline-block"); 
            	 $(this).closest("#cmtModifycancelBtn").css("display","inline-block"); 
            	 $(this).closest("#cancelIcon").css("display","inline-block"); 
>>>>>>> 9d8b222dbb4ece9cd9ccdf628246d4778ceed5e8
         
              
             
             
             $(this).css("display","none");
             $(this).children("#cmtModifyViewBtn").css("display","none");
             $(this).next("#cmtDelete").css("display","none");
             $(this).next("#cmtDelete").children("#cmtDeleteBtn").css("display","none");
          })
          
          
          
          
          // ※※modal에 수정할 seq 값 부여 ※※
      $("#CommentsModifyForm").on("shown.bs.modal",function(e){
         let seq = $(e.relatedTarget).attr("seq");
         $(".cmtModifycmpBtn").attr("seq",seq);
      })
          
      
       // ※※모달박스의 수정버튼 클릭 시 ※※
      $(document).on("click","#cmtModifycmpBtn", function() {  
        let seq = $(this).attr("seq");
         $.ajax({
            url : "${pageContext.request.contextPath}/modify.cmt",
            type : "post",
            dataType : "json",
            data : {
               "cmt_content" : $("#modifyCont").text(),
               "cmt_seq" :seq
               }
         }).done(function(){
<<<<<<< HEAD
            let comcont = $("#modifyCont");
            comcont.attr("contenteditable","false");
           
=======
        	 let comcont = $("#modifyCont");
        	 comcont.attr("contenteditable","false");
        	
>>>>>>> 9d8b222dbb4ece9cd9ccdf628246d4778ceed5e8
        
            comcont.next().children(".set1").css("display","none");
            comcont.next().children(".set2").css("display","inline-block");
            comcont.next().children(".set2").children().css("display","inline-block");
           
         })
      });
          


          
   })
</script>
</head>
<body>

   <div class="nav_wrapper"> 
  <!--<a class="menu-link" href="#menu"></a>-->
  
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
          <li ><a href="${pageContext.request.contextPath}/list.bor?cpage=1" title="Link ">자유 게시판</a></li>
<<<<<<< HEAD
          <li ><a href="${pageContext.request.contextPath}/list.bor2?cpage=1" title="Link">후기 게시판</a></li>
=======
          <li ><a href="${pageContext.request.contextPath}/list2.bor?cpage=1" title="Link">후기 게시판</a></li>
>>>>>>> 9d8b222dbb4ece9cd9ccdf628246d4778ceed5e8
        </ul>
      </li>

      <li ><a href="#Link" title="Link">Category Games</a>
        <ul >
          <li ><a href="${pageContext.request.contextPath}/rpgGames.game" title="Link">RPG   </a></li>
          <li ><a href="${pageContext.request.contextPath}/shootingGames.game" title="Link">Shooting</a></li>
          <li ><a href="${pageContext.request.contextPath}/arcadeGames.game" title="Link">Arcade</a></li>
        </ul>
      </li>
      </ul>
      

   
<c:choose>
<<<<<<< HEAD
   
      <c:when test="${login ne null && login.id eq 'admin'}">
=======
	
	<c:when test="${login ne null && login.id eq 'admin'}">
>>>>>>> 9d8b222dbb4ece9cd9ccdf628246d4778ceed5e8
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
<<<<<<< HEAD
       <ul>
       <li><a href="member/index.jsp" title="Link">로그인</a></li>
       <li><a href="member/memberShip.jsp" title="Link">회원 가입</a></li>
=======
   	 <ul>
       <li><a href="index.jsp" title="Link">로그인</a></li>
       <li><a href="memberShip.jsp" title="Link">회원 가입</a></li>
>>>>>>> 9d8b222dbb4ece9cd9ccdf628246d4778ceed5e8
      </ul>
   </c:otherwise>
</c:choose>
  </nav>
</div>

<!-- 광재 Script 링크 -->
<script src="${pageContext.request.contextPath}/script.js"></script>










   <div class="container-xl">
      <div class="table-responsive">
         <div class="table-wrapper">
            <div class="table-title">
               <div class="row">
                  <div class="col-sm-6">
                     <h2>${list.title}</h2>
                  </div>
               </div>
            </div>
            <div class="title">
               <ul>
                  <li class="view_cnt">${list.id}</li>
                  <li class="write_date">${list.write_date}</li>
                  <li class="view_cnt">${list.view_count}</li>
               </ul>
            </div>
            <div class="files">
               <h4>Files</h4>
               <c:forEach var="f" items="${flist}">
                  <a
                     href="${pageContext.request.contextPath}/download.file?file_seq=${f.file_seq}&oriName=${f.oriName}&sysName=${f.sysName}">${f.oriName}</a>
                  <br>
               </c:forEach>
            </div>
            <h4>Contents</h4>
            <div></div>
            <div class="contents">${list.content}</div>
            <div id="comments">
               <h4>Comments</h4>
               <div id="cmt">
                  <c:forEach var="i" items="${cmt}">
                     <ul class="cmtlist seq_${i.cmt_seq}">
                        <li>
                           <article>
                              <header>
                                 <address>
                                    By ${i.id} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <time datetime="">${i.cmt_date}</time>
                                    <!-- <time datetime="2045-04-06T08:15+00:00">Friday, 6<sup>th</sup> April 2045 @08:15:00</time> -->
                                 </address>
                              </header>
                              <div class="comcont" seq="${i.cmt_seq}">${i.cmt_content}</div>
<!--                               <input type='hidden' name='cmt_content' id='cmt_content'> -->
                              <div class="comcont_btn">
                                 <c:if test="${i.id eq login.id}">
<<<<<<< HEAD
                                      <a class='set1' href='#CommentsModifyForm' data-toggle='modal' style='color:green' id='cmtModifyDoneBtn' seq="${i.cmt_seq}" style="display:none;">
=======
                                  	 <a class='set1' href='#CommentsModifyForm' data-toggle='modal' style='color:green' id='cmtModifyDoneBtn' seq="${i.cmt_seq}" style="display:none;">
>>>>>>> 9d8b222dbb4ece9cd9ccdf628246d4778ceed5e8
                                    <i class='material-icons set1' id="checkIcon" style="display:none;">&#xe86c;</i></a>
                                    <a class='set1' href='' style='color:red' id='cmtModifycancelBtn' style="display:none;">
                                    <i class='material-icons set1' id="cancelIcon" style="display:none;">&#xe5c9;</i></a>
                                   
                                   
<!--                                    연필 수정버튼 -->
                                    <a href="" class="edit set2" data-toggle="modal" id="cmtModify" data-seq="${i.cmt_seq}">
                                    <i class="material-icons set2" id="cmtModifyViewBtn">&#xE254;</i></a>
                                    
<!--                                 휴지통 삭제버튼 -->
                                    <a href="#deleteEmployeeModal" class="delete set2" data-toggle="modal" id="cmtDelete" data-seq="${i.cmt_seq}" data-target="#deleteEmployeeModal">
                                    <i class="material-icons set2" data-toggle="" title="Delete" id="cmtDeleteBtn">&#xE872;</i></a>
                                    
                                  
                                    
                                 </c:if>
                              </div>
                           </article>
                        </li>
                     </ul>
                  </c:forEach>
               </div>
               <h4>Write A Comment</h4>
               <input type="hidden" value="${list.board_seq}"
                  name="${list.board_seq}" id="board_seq">
               <div class="block clear">
                  <label for="comment">Your Comment</label> <br>
                  <textarea name="cmt_content" id="comment" cols="25" rows="3"
                     placeholder="댓글 내용을 작성하세요."></textarea>
                     <input type="submit" name="sZubmit" id="sign" class="full-right" value="등록">
               </div>
            </div>

            <div class="btn_wrap" align="right">
               <c:choose>
                  <c:when test="${login.id eq list.id}">
                     <a href="${pageContext.request.contextPath}/modifyPage.bor?board_seq=${list.board_seq}"
                        class="btn btn-warning" style="background-color: #ffc107; color:white">수정</a>
                     <a href="#boardDeleteForm" class="btn btn-danger" data-toggle="modal">삭제</a>
                  </c:when>
               </c:choose>
            <button type="button" id="backBtn" class="btn btn-default pull-left" style="background-color: #00285b; color:white">목록</button>
      </div>
   </div>

   <!-- Comments Delete Modal HTML -->
   <div id="deleteEmployeeModal" class="modal fade">
      <div class="modal-dialog">
         <div class="modal-content">
            <form action="" method="post">
               <div class="modal-header">
                  <h4 class="modal-title">댓글을 삭제하시겠습니까?</h4>
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
               </div>
               <div class="modal-body">

                  
                  <p>삭제된 댓글은 복구할 수 없습니다.</p>
                 
               </div>
               <div class="modal-footer">
                  <input type="button" class="btn btn-default" data-dismiss="modal"
                     value="취소">
                     <input type="hidden" name="${i.cmt_seq}" value="${i.cmt_seq}" id="">
                  <input type="button" class="btn btn-danger" value="삭제" id="cmtdelete"  data-dismiss="modal" class="close">
                  
               </div>
            </form>
         </div>
      </div>
   </div>

   <!-- Board Delete Modal HTML -->
   <div id="boardDeleteForm" class="modal fade">
      <div class="modal-dialog">
         <div class="modal-content">
            <form
               action="${pageContext.request.contextPath}/delete.bor?board_seq=${list.board_seq}"
               method="post">
               <div class="modal-header">
                  <h4 class="modal-title">게시글을 삭제하시겠습니까?</h4>
                  <button type="button" class="close" data-dismiss="modal"
                     aria-hidden="true">&times;</button>
               </div>
               <div class="modal-body">
                  <p>삭제된 게시글은 복구할 수 없습니다.</p>
                  <p class="text-warning">
                     <small>해당 게시글의 댓글 또한 삭제됩니다.</small>
                  </p>
               </div>
               <div class="modal-footer">
                  <input type="button" class="btn btn-default" data-dismiss="modal"
                     value="취소">
                     <input type="submit" class="btn btn-danger" value="삭제" id="boardDelete">
               </div>
            </form>
         </div>
      </div>
   </div>

   <!-- Comments Modify -->
   <div id="CommentsModifyForm" class="modal fade">
      <div class="modal-dialog">
         <div class="modal-content">
            <form action="" method="post">
               <div class="modal-header">
                  <h4 class="modal-title">댓글을 수정하시겠습니까?</h4>
                  <button type="button" class="close" data-dismiss="modal"
                     aria-hidden="true">&times;</button>
               </div>
               <div class="modal-body">
                  <p>수정된 댓글은 복구할 수 없습니다.</p>
               </div>
               <div class="modal-footer">
                  <input type="button" class="btn btn-default" data-dismiss="modal"
                     value="취소">
                     <input type="button" class="btn btn-danger cmtModifycmpBtn" value="수정" id="cmtModifycmpBtn" data-dismiss="modal">
               </div>
            </form>
         </div>
      </div>
   </div>
   
   
</body>
</html>