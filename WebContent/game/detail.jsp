<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Game Page</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
<style>

    
body {
   color: #566787;
   background: #f5f5f5;
   font-family: 'Varela Round', sans-serif;
   font-size: 13px;
}
.table-responsive {
    margin: 30px 0;
}
.table-wrapper {
   background: #fff;
   padding: 20px 25px;
   border-radius: 3px;
   min-width: 1000px;
   box-shadow: 0 1px 1px rgba(0,0,0,.05);
   margin: 50px 0 0 0;
}

.table-title h2 {
   margin: 5px 0 0;
   font-size: 24px;
}
.table-title .btn-group {
   float: right;
}

body, input, textarea, select {
    font-family: Verdana, Geneva, sans-serif;
}

#namebox {
    padding: 1% 0;
    margin: 0 10px;
}

#contentsbox{
    margin: 2% 0 0 0;
}

#imgbox{
   float:left;
   width:65%;
   hidth:100%;
   margin:0 1% 0 1%;
}

#gameimg{
   max-width:100%;
   min-widh:100%;   
}

#gamebox{
   width:30%;
   hidth:100%;
   margin:0 1%;
   max-width:100%;
   min-widh:100%;   
}

#playbtn{
    color: #FFFFFF;
    background-color: #F7A804;
    border-color: #F7A804;
    display: inline-block;
    padding: 8px 18px 10px;
    text-decoration-line : none;
    text-transform: uppercase;
    border: 1px solid;
    width: 300px;
    height: 90px;
    cursor: pointer;

}

#btnbox {
    padding: 20% 0 0 7%;
    width: 100%;
    height: 30%;
}

#starbox{
   width:65%;
   height:15%;
   text-align:right;
}

#exbox{
   width:100%;
   height:70%;
   padding: 10px 4px;
   background-color: ;
}


#replybox{
   display:block;
    width: 100%;
    padding: 10px;
    margin:0;
}
#commentname{
   margin: 0 1%;
}

#comment{
   width:85%;
   height: 100px;
   float:left;
   margin: 0 1%;
}


#submitbtn{
   color: inherit;
    background-color: #FBFBFB;
    width: 100px;
    height: 100px;
    margin: 0 2px;
}

#comments {
   padding: 0 3%;
   max-width:100%;
   min-width:50%;
}

tr:nth-child(even), #comments li:nth-child(even) {
    color: inherit;
    background-color: #F7F7F7;
}
tr, #comments li, #comments input[type="submit"], #comments input[type="reset"] {
    color: inherit;
    background-color: #FBFBFB;
}
#comments li {
    margin: 0 0 10px 0;
    padding: 15px;
}
*, *::before, *::after {
    transition: all .3s ease-in-out;
}
*, *::before, *::after {
    box-sizing: border-box;
}
사용자 에이전트 스타일시트
li {
    display: list-item;
    text-align: -webkit-match-parent;
}

#comments ul {
    padding: 0;
    list-style: none;
}

#comments address {
    font-weight: bold;
    margin: 0 10px 0 0;
    float: left;
    color: blue;
}

.cmt_seq{
   float:left;
   color: gray;
   padding-right:5px;
}

.cmt_id{
   float:left;
}

.material-icons {
    font-family: 'Material Icons';
    font-weight: normal;
    font-style: normal;
    font-size: 24px;
    line-height: 1;
    letter-spacing: normal;
    text-transform: none;
    display: inline-block;
    white-space: nowrap;
    word-wrap: normal;
    direction: ltr;
    -webkit-font-feature-settings: 'liga';
    -webkit-font-smoothing: antialiased;
}

.comcont {
    width: 92%;
    height: 100%;
    float: left;
    margin-top: 5px;
}


#cmedit {
    color: #FFC107;
    cursor:pointer;
}

#cmdel {
   color: #F44336;
   cursor:pointer;
}


.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 35px;
    height: 35px;
    background-image: url('detailimage/starrate.png');
    background-repeat: no-repeat;
    background-size: 35px 35px;
    cursor: pointer;
    background-color: #D5D5D5;
    float:left;
}


.rating{
    padding: 0 0 0 60%;
}

#ratingnum{
   float:left;
   padding: 0.4% 0 0 1%;
}

.rating .rate_radio:checked + label {
    background-color:#FF2424;
}

.rating .rate_radio {
    position: relative;
    display: inline-block;
    z-index: 20;
    opacity: 0.001;
    width: 50px;
    height: 50px;
    background-color: #fff;
    cursor: pointer;
    vertical-align: top;
    display: none;
}

.cmd{
    width: auto;
    margin: 0 0 0 0;
    padding: 1% 0 0 0;
    display: inline-block;
    text-decoration-line : none;
    text-transform: uppercase;
    cursor: pointer;
}


html {
  font-family: sans-serif;
  color: #4b5f65;
  background: #f5f7fa;
}

body { overflow-x:hidden}

nav { width: 100%; }

.nav_wrapper {
  position: fixed;
  left: 0;
  top: 0;
  width: 100%;
  transition: top .5s ease-out;
  background: #2f3b3f;
  z-index: 9998;
}

.scroll { top: -90px; }

.no-scroll {
  top: 0;
  z-index: 9999;
}

.btn {
  padding: 10px 1%;
  margin: 5px;
  color: #fff;
  text-decoration: none;
  font-family: sans-serif;
  transition: all 0.1s ease;
}

.btn:hover { transition: all 0.1s ease; }

main {
  max-width: 800px;
  margin: 0 auto;
}



#search {
  float: right;
  font-size: 30px;
  padding: 2px 15px;
  line-height: 40px;
  color: #fff;
  margin: 0;
  font-weight: 700;
  -webkit-transform: rotate(181deg);
  -moz-transform: rotate(181deg);
  -ms-transform: rotate(181deg);
  -o-transform: rotate(181deg);
  transform: rotate(181deg);
}

#search:hover { color: #efa666; }

.search_box {
  clear: both;
  width: 100%;
  background: #e8ebf0;
  padding: 0;
  margin: 0;
  height: 0;
  overflow: hidden;
  transition: all 0.1s ease-in-out;
}

.search_box.active {
  height: auto;
  padding: 15px 0;
}

.search_box input {
  width: 80%;
  font-size: 13px;
  margin: 0 0 0 15px;
  padding: 10px;
  border: none;
  background: #fff;
}

.search_box input:focus { outline: none; }

.search_box input.search_icon {
  clear: both;
  width: 10%;
  height: auto;
  padding: 10px;
  margin: 0;
  margin-left: -5px;
  border: none;
  color: #fff;
  cursor: pointer;
  background: #8c949d;
  opacity: 1;
  transition: all 0.1s ease;
}

.search_box input.search_icon:hover { background: #efa666; }

.menu-link { display: none; }

.spinner-master input[type=checkbox] { display: none; }

.menu {
  width: 100%;
  height: auto;
  background: #2f3b3f;
  transition: all 0.3s ease;
  justify-content: space-between;
  display: flex;
}

.nabar_logo{
  font-size: 20px;
  color: #fff;
  right: 10px;
}

.login{
  float: right;
  padding: 18px 13px;
}


.menu ul {
  padding: 3px 25px;
  margin: 0px;
  list-style: none;
  position: relative;
  display: inline-block;
}

.menu > li > ul.sub_menu {
  min-width: 10em;
  padding: 4px 0;
  background-color: #f4f4f4;
  border: 1px solid #fff;
}

.menu ul li { padding: 2px; }

.menu > ul > li { display: inline-block; }

.menu ul li a {
  display: block;
  text-decoration: none;
  color: #fff;
  font-size: 15px;
}

.menu ul li a:hover {
  background: #efa666;
  color: #fff;
}

.menu ul li.hover > a {
  background: #efa666;
  color: #fff;
}

.menu ul li > a { padding: 15px; }

.menu ul ul {
  display: none;
  position: absolute;
  top: 100%;
  min-width: 160px;
  background: #39484d;
}

.menu ul li:hover > ul { display: block; }

.menu ul ul > li { position: relative; }

.menu ul ul > li a {
  padding: 10px 15px;
  height: auto;
  background: #39484d;
}

.menu ul ul > li a:hover {
  background: #efa666;
  color: #fff;
}

.menu ul ul ul {
  position: absolute;
  left: 100%;
  top: 0;
}

#hero {
  width: 100%;
  height: auto;
  background: #e8ebf0;
  margin: 70px 0 20px 0;
}

#hero img {
  width: 100%;
  height: auto;
}


 @media all and (max-width: 768px) {

.example-header .container { width: 100%; }

#search { padding: 10px; }

.spinner-master * {
  transition: all 0.3s;
  box-sizing: border-box;
}

.spinner-master {
  position: relative;
  margin: 15px;
  height: 30px;
  width: 30px;
  float: left;
}

.spinner-master label {
  cursor: pointer;
  position: absolute;
  z-index: 99;
  height: 100%;
  width: 100%;
  top: 8px;
  left: 0;
}

.spinner-master .spinner {
  position: absolute;
  height: 4px;
  width: 100%;
  padding: 0;
  background-color: #fff;
}

.spinner-master .diagonal.part-1 {
  position: relative;
  float: left;
}

.spinner-master .horizontal {
  position: relative;
  float: left;
  margin-top: 4px;
}

.spinner-master .diagonal.part-2 {
  position: relative;
  float: left;
  margin-top: 4px;
}

.spinner-master input[type=checkbox]:checked ~ .spinner-spin > .horizontal { opacity: 0; }

.spinner-master input[type=checkbox]:checked ~ .spinner-spin > .diagonal.part-1 {
  transform: rotate(135deg);
  -webkit-transform: rotate(135deg);
  margin-top: 10px;
}

.spinner-master input[type=checkbox]:checked ~ .spinner-spin > .diagonal.part-2 {
  transform: rotate(-135deg);
  -webkit-transform: rotate(-135deg);
  margin-top: -12px;
}

a.menu-link {
  display: block;
  color: #fff;
  float: left;
  text-decoration: none;
  padding: 10px 16px;
  font-size: 1.5em;
}

a.menu-link:hover { color: #efa666; }

a.menu-link:after {
  content: "\2630";
  font-weight: normal;
}

a.menu-link.active:after { content: "\2715"; }

.menu {
  clear: both;
  min-width: inherit;
  float: none;
}

.menu,
.menu > ul ul {
  overflow: hidden;
  max-height: 0;
  background-color: #39484d;
}

.menu > li > ul.sub-menu {
  padding: 0px;
  border: none;
  width: 100px;
}

.menu.active,
.menu > ul ul.active { max-height: 55em; }

.menu ul { display: inline; }

.menu li,
.menu > ul > li { display: block; }

.menu > ul > li:last-of-type a { border: none; }

.menu li a {
  color: #fff;
  display: block;
  padding: 0.8em;
  position: relative;
}

.menu li.has-submenu > a:after {
  content: '+';
  position: absolute;
  top: 0;
  right: 0;
  display: block;
  font-size: 1.5em;
  padding: 0.55em 0.5em;
}

.menu li.has-submenu > a.active:after { content: "-"; }

.menu ul ul > li a {
  background-color: #39484d;
  padding: 10px 18px 10px 30px;
}

.menu ul li a:hover {
  background: #4b5f65;
  color: #fff;
}

.navbar_icons{
    list-style: none;
    color: white;
    display: flex;
    float: right;
}

.navbar_icons li {
    padding: 9px 13px;
}



.menu ul li.hover > a {
  background: #4b5f65;
  color: #fff;
  
}

.menu ul ul,
.menu ul ul ul {
  display: inherit;
  position: relative;
  left: auto;
  top: auto;
  border: none;
}

.search_box {
  position: absolute;
  top: 60px;
  left: 0;
  z-index: 10;
}

.search_box input { width: 70%; }
.search_box input.search_icon { width: 17%; }
#hero { height: 200px; }

}

</style>
    <script>
       $(function(){

         //값 변수에 저장
            let contentmsg = $("#comment").val();
            console.log(contentmsg);

          //댓글 등록
          $("#submitbtn").on("click",function(){ 

                $.ajax({
                      url : "${pageContext.request.contextPath}/writeProc.com",
                      type : "get",
                      dataType : "Json",
                      data : {"comment" :  $("textarea#comment").val()
                      }

                      }).done(function(resp) {
                         console.log(resp.game_seq);
                          //댓글창 비워주기
                          location.href="${pageContext.request.contextPath}/detail.game?game_seq="+resp.game_seq;
               
                alert("댓글이 등록됐습니다!");
              })

           });           

           
           //댓글 삭제
           $(document).on("click","#cmdel",function(){
              var result = confirm('댓글을 정말 삭제하시겠습니까?'); 
              
              if(result){
                 
                   $(this).parents("#cmtbox").remove();
                   let cmt_seq = $(this).parent().attr("seq");
                
                   $.ajax({ 
                       url : "${pageContext.request.contextPath}/delete.com",
                       type : "get",
                       dataType : "Json",
                       data : {"cmt_seq" : cmt_seq}
                       }); 
                   
              }else { 
                 
              }

           })

           //댓글 수정
           $(document).on("click","#cmedit",function(){
    
                    let cmt_seq = $(this).parent().attr("seq");
                    
                    let parent =  $(this).parent().siblings(".comcont");
                    parent.attr("contenteditable","true");
                    parent.focus();
                    
                    $("#cmtModifycmpBtn").on("click",function(){
                        var content = $('.comcont').html();
                          $('#cmt_content').val( content );
                        $.ajax({
                             url: "${pageContext.request.contextPath}/modify.com",
                             dataType:"json",
                                type: "post",
                                data: {
                                   cmt_content : $("#cmt_content").val(),
                                    cmt_seq : $("#cmt_seq").val()
                                }
                          })
                     })

               })
               

           
           // 별점 클릭
           $("input[name='rating']").on("click",function(){
                    
                        clickrate = $("input[name='rating']:checked").val();
                       for(let i=1; i<6; i++){
                          let rate = $("input[id='rating"+i+"']").val();
                          
                      if(clickrate>=rate){
                         $("input[id='rating"+i+"']").prop('checked', true); 
                      }
                       } 

              })
                                     
           
                // 별점 데이터 보내기
                $("#save").on("click", function() {
               console.log("hi?");
                $.ajax({
                         url : "${pageContext.request.contextPath}/rating.game",
                         type : "get",
                         dataType : "Json",
                         data : {"newrating" : clickrate }

                         })
                })

             

   
      
       })
    </script>
</head>
<body>
<!-- 네비바 -->
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
          <li ><a href="#Link" title="Link ">자유 게시판</a></li>
          <li ><a href="#Link" title="Link">후기 게시판</a></li>
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
       <li><a href="index.jsp" title="Link">로그인</a></li>
       <li><a href="memberShip.jsp" title="Link">회원 가입</a></li>
      </ul>
   </c:otherwise>
</c:choose>
  </nav>
</div>
<script src="Resource/script.js"></script>
  
  
  
  
<div class="container-xl">
   <div class="table-responsive">
      <div class="table-wrapper">
     
            <div class="row" id=namebox>
               <div class="col-sm-12">
                  <h1><b>${list.game_name}</b></h1>
                  </div>
             </div>
             <div class="row" id=contentsbox>
                 <div id=imgbox>
            <figure>
               <img src= "detailimage/${list.detail_image}" alt id=gameimg>
            </figure>
            </div>
         
            <div id=gamebox>
            <div id=exbox>
            <fieldset id=explain>
            <legend> <h2>조작법 및 게임 소개</h2></legend>
                ${list.explain}
            </fieldset>
            </div>         
            <div id=btnbox>
               <a class=btn id=playbtn href="${list.link}"><h1>Play!</h1></a>
            </div>   
            </div>
         
         </div>
         
         <!-- 별점 박스 -->
            <div id=starbox>
                  <div class="rating">
                      <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                      <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
                      <label for="rating1"></label>
                      <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
                      <label for="rating2"></label>
                         <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
                         <label for="rating3"></label>
                         <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
                         <label for="rating4"></label>
                      <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
                      <label for="rating5"></label>
                     </div>
                     <h4><div id="ratingnum"> (${list.rating})</div></h4>
                      <div class="cmd">
                        <input type="button" name="save" id="save" value="등록">
                    </div>
                 </div>
            
             </div>
             <hr>
             <!-- -------------------댓글 쓰기------------------------------ -->
         <div class=row id=replybox>
            <div id=commentname><h4>댓글</h4></div>
                    <textarea name="comment" id="comment"></textarea>
                <div id=inputbtnbox>
                  <input type="submit" name="submit" id=submitbtn value="등록">
                 </div>
         </div>
         <!-- --------------------댓글창 -------------------->
         <div id="comments">
        <ul id=cmtlist>
        <c:forEach var="list" items="${cmtlist}">
          <li class="${list.cmt_seq}" id="cmtbox">
            <article>
                <address>
                <div class="cmt_seq"> ${list.cmt_seq} </div>
                <div class="cmt_id"> <p2>${list.id}</p2></div>
                </address>
                <div id="datebox">${list.reg_date}</div>
                <div class="comcont" id="comcont">
                      ${list.comments}
                 </div>
                 <div id=iconbox seq="${list.cmt_seq}">
                   <i class="material-icons" data-toggle="tooltip" title="" data-original-title="Edit" id="cmedit"></i>
                   <i class="material-icons" data-toggle="tooltip" title="" data-original-title="Delete" id="cmdel"></i>
                </div>
            </article>
          </li>
          </c:forEach>
        </ul>
        
      </div>
            </div>
      </div> <!-- container -->


</body>
</html>