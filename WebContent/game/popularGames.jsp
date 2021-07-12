<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>popularGame</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="../layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" href="style.css" />
</head>
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
    
      <li ><a href="../member/Main.jsp" title="Link">Home</a></li>
      

      <li ><a href="" title="Link">Game</a>
        <ul >
          <li ><a href="${pageContext.request.contextPath}/allGames.game" title="Link">전체게임</a></li>

          <li ><a href="${pageContext.request.contextPath}/popularGames.game" title="Link">인기 게임</a></li>

        </ul>
      </li>


      <li ><a href="#Link" title="Link">Category</a>
        <ul >
          <li ><a href="${pageContext.request.contextPath}/list.bor?cpage=1" title="Link ">자유 게시판</a></li>
          <li ><a href="${pageContext.request.contextPath}/list2.bor?cpage=1" title="Link">후기 게시판</a></li>
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
       <li><a href="../member/index.jsp" title="Link">로그인</a></li>
       <li><a href="../member/memberShip.jsp" title="Link">회원 가입</a></li>
      </ul>
	</c:otherwise>
</c:choose>
  </nav>
</div>
<script src="script.js"></script>
<body id="top">

<div class="wrapper bgded overlay" style="background-image:url('../images/demo/backgrounds/01.png');"></div>

<div class="wrapper row3">
  <main class="hoc container clear"> 
    <!-- main body -->
    <div class="content"> 
      <!-- ################################################################################################ -->
      <div id="gallery">
        <figure>
          <header class="heading" style="text-align: center;">인기 게임</header>
          <ul class="nospace clear">
         	 <c:forEach var="i" items="${poList }" varStatus="status">
          		<c:set var="gameClsNm" value="one_quarter"/>
          		
          		<c:if test="${status.index%4 == 0 }">
          			<c:set var="gameClsNm" value="one_quarter first"/>
          		</c:if>
          
            <li class="${gameClsNm }"><a href="${pageContext.request.contextPath}/detail.game?game_seq=${i.game_seq}"><img src="../Gameimage/${i.image }" alt=""></a></li>
          </c:forEach>
          </ul>
        </figure>
      </div>
      <!-- ################################################################################################ -->
    </div>
    <!-- / main body -->
    
    
    <div class="wrapper row4">
      <footer id="footer" class="hoc clear">
        <!-- ################################################################################################ -->
        <div class="one_third first">
          <h1 class="logoname"><span>공유 하기</span></h1>
          <p class="btmspace-30">이런 게임을 나만 할수 없다. <br> 생각하시면 여기 공유 하기 버튼을 클릭 하십시오.</p>
            <!-- 네이버 공유 하기 버튼-->
            <span>
              <script type="text/javascript" src="https://ssl.pstatic.net/share/js/naver_sharebutton.js"></script>
              <script type="text/javascript">
              new ShareNaver.makeButton({"type": "f"});
              </script>
            </span>
            <!------------------------->


            <!--트위터 공유 하기 버튼-->
            <a href="#" onclick="javascript:window.open('https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20' +encodeURIComponent(document.URL)+'%20-%20'+encodeURIComponent(document.title), 'twittersharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=400,width=600');return false;" target="_blank" alt="Share on Twitter" ><img src="../Icon/twiter.png"></a>
            <!----------페이스북 공유 하기 -->
            <a href="#" onclick="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u=' +encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=400,width=600');return false;" target="_blank" alt="Share on Facebook" ><img src="../Icon/fackebook.png"></a>
            <!-----------카카오 페이지------------------->
            <a href="#" onclick="javascript:window.open('https://story.kakao.com/s/share?url=' +encodeURIComponent(document.URL), 'kakaostorysharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes, height=400,width=600');return false;" target="_blank" alt="Share on kakaostory"><img src="../Icon/kakao.png"></a>
            <!---------구글 플러스----->
            <a href="#" onclick="javascript:window.open('https://plus.google.com/share?url=' +encodeURIComponent(document.URL), 'googleplussharedialog','menubar=no,toolbar=no,resizable=yes, scrollbars=yes,height=350,width=600');return false;" target="_blank" alt="Share on Google+"><img src="../Icon/google.jpg"></a>
        </div>

        <!------------------------------------------------------------------------------------------------------------->


        <div class="one_third">
          <h1 class="logoname"><span>참고 사이트</span></h1>
          <ul class="nospace linklist">
            <li><a href="https://namu.wiki/w/io%EA%B2%8C%EC%9E%84"><h2>게임 io 나무위키</h2></a></li>
            <li><a href="https://iogames.space/"><h2>아이오 게임즈</h2></li>
            <li><a href="https://archive.org/details/softwarelibrary_msdos_games/v2"><h2>인터넷 아카이브</h2></a></li>
            <li><a href="http://www.thepowernews.co.kr/view.php?ud=20190315170131377101286bacad_7"><h2>웹으로 즐기는 '시간 순삭' io 게임 10가지</h2></a></li>
          </ul>
        </div>



        <div class="one_third">
          <h1 class="logoname"><span style="text-align: center;">후원 하기</span></h1>
          <img src="../Icon/QR.jpg" width="300px" height="300px">
        </div>


        <!-- ################################################################################################ -->
      </footer>
    </div>
      
    </div>
  </main>
</div>

<!-- 하단 바 -->
<div class="wrapper row5">
  <div id="copyright" class="hoc clear">
    <!-- ################################################################################################ -->
    <p class="fl_left">Copyright &copy; 2021 - All Rights Reserved - <a href="#">Domain 방구석 오락실</a></p>
    <p class="fl_right">Template by <a target="_blank" href="https://www.os-templates.com/"
        title="Free Website Templates">OS Templates</a></p>
    <!-- ################################################################################################ -->
  </div>
</div>
<!-- 하단 바  -->
<a id="backtotop" href="#top"><i class="fas fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="../layout/scripts/jquery.min.js"></script>
<script src="../layout/scripts/jquery.backtotop.js"></script>
<script src="../layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>