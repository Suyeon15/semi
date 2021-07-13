<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <!-- ---- -->
  
  <link href="../layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">


  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


  <!------------------------슬라이드 script-------------------------->
  <!--부트 스트랩-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <!--제이쿼리-->
  
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <!--a-->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>
  
  
  
  <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
 <!-- 스타일 -->
  <link rel="stylesheet" href="style.css" />

  <!--------------------------------------------------------------------------------------------------------------->
  <!-- 카테고리 기능 script-->
  <script>
    $(function () {
      $('ul.tab li').click(function () {
        var activeTab = $(this).attr('data-tab');
        $('ul.tab li').removeClass('current');
        $('.tabcontent').removeClass('current');
        $(this).addClass('current');
        $('#' + activeTab).addClass('current');
        return false;
      })

      $('.carousel').carousel({ interval: 3000 })

    });
  </script>
  <!----------------------------->

  <style>
    /*-----------------슬라이드----------------------------------*/
    .carousel-indicators li,
    .carousel-indicators li.active {
      margin: 0px 20px !important;

    }

    .carousel-indicators {
      margin-left: 20%;
    }

    .carousel-inner>.carousel-item>img {
      width: 100%;
      height: 400px;
    }

    /*-------------------탭 하는 스타일!!-------------------------*/
    #containers {
      width: 1350px;
      margin: 0 auto;
      text-align: center;
    }

    .tab {
      list-style: none;
      margin: 0;
      padding: 0;
      overflow: hidden;
    }

    /* Float the list items side by side */
    .tab li {
      float: left;
    }

    /* Style the links inside the list items */
    .tab li a {
      display: inline-block;
      color: #000;
      text-align: center;
      text-decoration: none;
      padding: 14px 16px;
      font-size: 17px;
      transition: 0.3s;
      width: 450px;
    }

    /* Style the tab content */
    .tabcontent {
      display: none;
      padding: 6px 12px;
      color: #000;
    }

    ul.tab li.current {
      background-color: rgb(0, 154, 200);
      color: #222;
    }

    .tabcontent.current {
      display: block;
    }

    /*-------------------------------------------------------------*/

    /*-------------------이미지 카드 스타일-------------------------*/
    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      user-select: none;
    }

    @media (min-width: 768px) {
      .bd-placeholder-img-lg {
        font-size: 3.5rem;
      }
    }

    .card-img-top {
      width: 100%;
      height: 15vw;
      object-fit: cover;
    }

    /*---------------------------------------------------------------*/
    .one_third ul li h2 {
      color: #000;
    }

    .one_third ul a {
      text-decoration: none;
    }

    /*----------------------------------------------------------------*/
    
	.btn btn-sm btn-outline-secondary {
		background-color: blue;
	}
 
 	<!--- 지워지면 망한다> 
  </style>
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
    
      <li ><a href="Main.jsp" title="Link">Home</a></li>
      

      <li ><a href="" title="Link">Game</a>
        <ul >
          <li ><a href="${pageContext.request.contextPath}/allGames.game" title="Link">전체게임</a></li>

          <li ><a href="${pageContext.request.contextPath}/popularGames.game" title="Link">인기 게임</a></li>

        </ul>
      </li>


      <li ><a href="#Link" title="Link">Board</a>
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
       <li><a href="index.jsp" title="Link">로그인</a></li>
       <li><a href="memberShip.jsp" title="Link">회원 가입</a></li>
      </ul>
	</c:otherwise>
</c:choose>
  </nav>
</div>
<script src="script.js"></script>
<script src="../js/right.js"></script>
<script src="../js/f5_attack.js"></script>



<body id="top">
  <!--상단바 넣을공간---------->
	
	
  <!--------------------------------------------------------------------------------------------------------->
	<br>
	<br>
	<br>
	<br>
  <div id="demo" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
      <!-- 슬라이드 쇼 -->
      <div class="carousel-item active">
        <!--가로--> <img class="d-block w-100" src="../member_Img/slide/slide1.png" alt="First slide">

      </div>
      <div class="carousel-item"> <img class="d-block w-100" src="../member_Img/slide/slide2.png" alt="Second slide">
      </div>

      <div class="carousel-item"><img class="d-block w-100" src="../member_Img/slide/slide3.png" alt="Third slide">

      </div> <!-- / 슬라이드 쇼 끝 -->


      <!-- 왼쪽 오른쪽 화살표 버튼 -->
      <a class="left carousel-control" href="#demo" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
          aria-hidden="true"></span> <!-- <span>Previous</span> --> </a>
      <a class="right carousel-control" href="#demo" data-slide="next"> <span class="glyphicon glyphicon-chevron-right"
          aria-hidden="true"></span>
        <!-- <span>Next</span> --> </a>
      <!-- / 화살표 버튼 끝 -->


      <!-- 인디케이터 -->
      <ul class="carousel-indicators">
        <li data-target="#demo" data-slide-to="0" class="active"></li>
        <!--0번부터시작-->
        <li data-target="#demo" data-slide-to="1"></li>
        <li data-target="#demo" data-slide-to="2"></li>
      </ul>
      <!-- 인디케이터 끝 -->
    </div>
</div>
    <!--------------------------------------------------------------------------------------------------------->
  

    <!-- 메인 몸통 -->
    <div class="wrapper row3">
      <main class="hoc container clear">

        <!--게임 이름 박스-->
        <div class="sectiontitle">
          <h6 class="heading">인기 게임</h6>
        </div>

        <!--------------------------게임 3x3 화면----------------------------->
        <ul class="nospace group overview">
          <li class="one_third">
            <figure><a href="#"><img src="../member_Img/game_img/game1.png" alt=""></a>
              <figcaption>
                <h6 class="heading">slither.io</h6>
                <p>장르: 웹 게임, 액션 게임, 대규모 다중 사용자 온라인 게임, 캐주얼 게임</p>
              </figcaption>
            </figure>
          </li>

          <li class="one_third">
            <figure><a href="#"><img src="../member_Img/game_img/game2.png" alt=""></a>
              <figcaption>
                <h6 class="heading">agar.io</h6>
                <p>장르: 액션 게임, 대규모 다중 사용자 온라인 게임</p>
              </figcaption>
            </figure>

          </li>
          <li class="one_third">
            <figure><a href="#"><img src="../member_Img/game_img/game3.png" alt=""></a>
              <figcaption>
                <h6 class="heading">depo.io</h6>
                <p>장르: 액션 게임</p>
              </figcaption>
            </figure>
          </li>

          
          <li class="one_third">
            <figure><a href="#"><img src="../member_Img/game_img/game4.png" alt=""></a>
              <figcaption>
                <h6 class="heading">좀비로얄아이오</h6>
                <p>장르: 배틀 로얄 게임, 생존 게임</p>
              </figcaption>
            </figure>
          </li>
          
          <li class="one_third">
            <figure><a href="#"><img src="../member_Img/game_img/game5.png" alt=""></a>
              <figcaption>
                <h6 class="heading">Creatur.io</h6>
                <p>장르: 생존 게임</p>
              </figcaption>
            </figure>
          </li>
          <li class="one_third">
            <figure><a href="#"><img src="../member_Img/game_img/game6.png" alt=""></a>
              <figcaption>
                <h6 class="heading">Starve.io</h6>
                <p>플랫폼: 안드로이드</p>
              </figcaption>
            </figure>
          </li>
        </ul>
        <!------------------------------------------------------------------------------------------>
        <div class="clear"></div>
      </main>
    </div>
    <!--------------------------------------------->




    <!-- 카테 고리 넣는 공간입니다.  102 오류 -->
    <div class="sectiontitle">
      <h2 class="heading">카테고리</h2>
    </div>
    <div id="containers">
      <ul class="tab">
        <li class="current" data-tab="tab1"><a href="#">방구석 news</a></li>
        <li data-tab="tab2"><a href="#">방구석 Play</a></li>
        <li data-tab="tab3"><a href="#">방구석 Hot</a></li>
      </ul>
      <!----------------------------------1번 테이블--------------------------------------->
      <!-------------------------------1page 1 --------------------->
      <div id="tab1" class="tabcontent current">

        <div class="album py-5 bg-light">
          <div class="album py-3 bg-light">

            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
              <div class="col">
                <div class="card shadow-sm">

                  <div class="card">
                    <img class="card-img-top" src="../member_Img/Categories/1-1.jpeg" alt="Card image cap">
                    <div class="card-body">
                      <a
                        href="https://www.google.co.kr/search?q=Agar.io&stick=H4sIAAAAAAAAAGVSPYjUQBjdXby92-wd3Oa0WQRlEdTjcDeTzZ8I5yGiwh3KeWoZNpPMZLP5nYQkk1IsLQ6Ls1MUQQsrwcZCRAvRwsLCThE7RRSsbAT3wJ3sYfnmPd735n3f3ExnoYu7gmBAOHJM2wSNYXD425Ob3-_ceFvdS00wFHUh01CfYQmIgm4zjCQFx1Q1JthG2PDtyGZ6QFU37yVMP8qUlMq9Ccay5Ml-VvrZLqRiyLBtQpBIyJvSIxU5gOGCKFFmMt4oIjHWkD81X8n8SGV-MArzLJWn-aLnkum8akKF8j8-jB2gs3l2mOuJARkPbNcIc6ZHuSGnVCqY3sscBEzm76NQRgnJpv-TyqazJ08IYsarOTZzWZpgMzepFuZq2adX5CBk-WzV6WPBZ304oY49HEVMn9nYQ1Ja5kU9VZAx0wuQKEbB8iMR-r6mp2VeMiKRzvYzKhBVU4n5R2Gfilrp79C-UCDfnWAi2D1MCLsvAvsJ8Emp77ueiSC7F0eT07GA9evEQO8riPFhlOZ4pBV7-jQI6ycMIY4Qzab3awqROK2HslHeq6ykmh-O-252vW5PAJmkULYdjBHJIp18qd6rNRe__v601L5du_X4zYfqdo1bXA-C2HLppuUOEsvcCvhTXP2snwwTyh_kFtqNXcO-IqXCsUq7yZUQ7Of-lSmPoG2q4eLdzztVHnHNy1ayFWwE5hBR_hp_hWtsWJ5hkfgi4k9y3JnAdS2YDAOfX-EOtFtdyB66eOBZ8XjOEvf_c2d-k9sdLhrJ-J47V8G5Z-933tXXWidalQp6del0-_gyz81eiNcDOHBbs0dk_defH6vLS9zc1iAP_MCjrRXvaOXpw5-rnUbjwfmPh-rg9epy5UW1dv35o5f1fXPVxcr8_ZnZNTwgJ4bBdr36F6ElfSR8BAAA&sa=X">
                        <h5 class="card-title">Agar.io</h5>
                      </a>
                      <p class="card-text">《Agar.io》는 Zeach에 의해 개발된 top-down 관점의<br> 대규모 온라인 웹 게임이다</p>
                      <p class="card-text"><small class="text-muted">Last updated 11 mins ago</small></p>
                    </div>
                  </div>

                </div>
              </div>


              <div class="col">
                <div class="card shadow-sm">

                  <div class="card">

                    <img class="card-img-top" src="../member_Img/Categories/1-2.png" alt="Card image cap">
                    <div class="card-body">
                      <a href="https://www.inven.co.kr/webzine/news/?news=194694&site=mapleblitzx">
                        <h5 class="card-title">그래서 io게임이 뭔데?</h5>
                      </a>
                      <p class="card-text">게임 주소(URL)이 곧 제목이며,<br> 대부분 끝에 .io가 붙는 그런 게임을 말합니다.</p>
                      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                    </div>

                  </div>

                </div>
              </div>


              <div class="col">
                <div class="card shadow-sm">

                  <div class="card">
                    <img class="card-img-top" src="../member_Img/Categories/1-3.png" alt="Card image cap">
                    <div class="card-body">
                      <a href="https://www.inven.co.kr/webzine/news/?news=194694&site=mapleblitzx">
                        <h5 class="card-title">io게임/시리즈 모음 (16개)</h5>
                      </a>
                      <p class="card-text">여러가지 io 게임 추천하고, 한 주소에<br> 모아놓았습니다.</p>
                      <p class="card-text"><small class="text-muted">Last updated 40 mins ago</small></p>
                    </div>
                  </div>
                </div>
              </div>


              <!-------------------------------1page 2 ---------------------------------------------------->



              <div class="col">
                <div class="card shadow-sm">

                  <div class="card">
                    <img class="card-img-top" src="../member_Img/Categories/1-4.png" alt="Card image cap">
                    <div class="card-body">
                      <a href="https://www.youtube.com/watch?v=lgY5SXyfX8E">
                        <h5 class="card-title">세계정복이 제일 쉬웠어요</h5>
                      </a>
                      <p class="card-text">[스테이트.io - 전략게임에서 세계를 정복하라]<br>
                        <hr><strong>youtube 영상</strong>
                      </p>
                      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                    </div>
                  </div>

                </div>
              </div>


              <div class="col">
                <div class="card shadow-sm">

                  <div class="card">
                    <img class="card-img-top" src="../member_Img/Categories/1-5.png" alt="Card image cap">
                    <div class="card-body">
                      <a href="https://www.youtube.com/watch?v=zSotH7M0U5g&list=RDCMUC0kTZ3JppUFIitb7KhuDx7g&index=1">
                        <h5 class="card-title">.io Games of All Time!</h5>
                      </a>
                      <p class="card-text">Ah, .io games. Years ago they used to be extremely popular<br>
                        <hr><strong>youtube 영상</strong>
                      </p>
                      <p class="card-text"><small class="text-muted">Last updated 39 mins ago</small></p>
                    </div>
                  </div>

                </div>
              </div>



              <div class="col">
                <div class="card shadow-sm">

                  <div class="card">
                    <img class="card-img-top" src="../member_Img/Categories/1-6.png" alt="Card image cap">
                    <div class="card-body">
                      <a href="https://www.youtube.com/watch?v=zSotH7M0U5g&list=RDCMUC0kTZ3JppUFIitb7KhuDx7g&index=1">
                        <h5 class="card-title">매력있는 게임 땅따먹기</h5>
                      </a>
                      <p class="card-text">구독자 279따리 민유준에 io게임 탐방기<br>
                        <hr><strong>youtube 영상</strong>
                      </p>
                      <p class="card-text"><small class="text-muted">Last updated 40 mins ago</small></p>
                    </div>
                  </div>

                </div>
              </div>
            </div>


          </div>
        </div>
      </div>
      <!---------------------------------------------------------------------------------->

      <!----------------------------------2번 테이블--------------------------------------->
      <div id="tab2" class="tabcontent">

        <div class="album py-5 bg-light">
          <div class="album py-5 bg-light">

            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
              <div class="col">
                <div class="card shadow-sm">
                  <img src="../member_Img/Categories/2-1.png">
                  <div class="card-body">
                    <p class="card-text">Iogames(아이오게임즈)</p>
                    <div class="d-flex justify-content-between align-items-center">
                      <div class="btn-group">
                        <button type="button" onClick="location.href='https://iogames.space/'"
                          class="btn-sm btn-outline-secondary">사이트 이동</button>
                      </div>
                      <small class="text-muted">9 mins</small>
                    </div>
                  </div>
                </div>
              </div>


              <div class="col">
                <div class="card shadow-sm">
                  <img src="../member_Img/Categories/2-2.png">

                  <div class="card-body">
                    <p class="card-text">인터넷 아카이브</p>
                    <div class="d-flex justify-content-between align-items-center">
                      <div class="btn-group">
                        <button type="button"
                          onClick="location.href='https://archive.org/details/softwarelibrary_msdos_games/v2'"
                          class="btn-sm btn-outline-secondary">사이트 이동</button>
                      </div>
                      <small class="text-muted">9 mins</small>
                    </div>
                  </div>
                </div>
              </div>


              <div class="col">
                <div class="card shadow-sm">
                  <img src="../member_Img/Categories/2-3.png">

                  <div class="card-body">
                    <p class="card-text">크레이지 게임즈</p>
                    <div class="d-flex justify-content-between align-items-center">
                      
                      <div class="btn-group">
                        <button type="button" onClick="location.href='https://www.crazygames.com/c/io'"
                          class="btn-sm btn-outline-secondary">사이트 이동</button>
                      </div>
                      <small class="text-muted">9 mins</small>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col">
                <div class="card shadow-sm">
                  <img src="../member_Img/Categories//2-4.png">

                  <div class="card-body">
                    <p class="card-text">스크레치</p>
                    <div class="d-flex justify-content-between align-items-center">
                      <div class="btn-group">
                        <button type="button" onClick="location.href='https://scratch.mit.edu/studios/2245688/'"
                          class="btn-sm btn-outline-secondary">사이트 이동</button>
                      </div>
                      <small class="text-muted">9 mins</small>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col">
                <div class="card shadow-sm">
                  <img src="../member_Img/Categories/2-5.png">

                  <div class="card-body">
                    <p class="card-text">비게임즈</p>
                    <div class="d-flex justify-content-between align-items-center">
                      <div class="btn-group">
                        <button type="button" onClick="location.href='https://www.bgames.com/'"
                          class="btn-sm btn-outline-secondary">사이트 이동</button>
                      </div>
                      <small class="text-muted">9 mins</small>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col">
                <div class="card shadow-sm">
                  <img src="../member_Img/Categories/2-6.png">

                  <div class="card-body">
                    <p class="card-text">와플레시</p>
                    <div class="d-flex justify-content-between align-items-center">
                      <div class="btn-group">
                        <button type="button" onClick="location.href='https://vidkidz.tistory.com/'"
                          class="btn-sm btn-outline-secondary">사이트 이동</button>
                      </div>
                      <small class="text-muted">9 mins</small>
                    </div>
                  </div>
                </div>
              </div>


            </div>
          </div>
        </div>
      </div>

      <!---------------------------------------------------------------------------------->


      <!-----------------------------------------3번 테이블----------------------------------------->
      <div id="tab3" class="tabcontent">

        <div class="album py-5 bg-light">
          <div class="album py-5 bg-light">

            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
              <div class="col">
                <div class="card shadow-sm">

                  <div class="card">
                    <a href="https://diep.io/">
                      <img class="card-img-top" src="../member_Img/Categories/3-1.png" alt="Card image cap">
                    </a>
                    <div class="card-body">
                      <h5 class="card-title">Diep.io</h5>
                      <p class="card-text">1위</p>
                      <p class="card-text"><small class="text-muted">이미지 눌러서 하실 수 있습니다.</small></p>
                    </div>
                  </div>

                </div>
              </div>


              <div class="col">
                <div class="card shadow-sm">

                  <div class="card">
                    <a href="http://slither.io/">
                      <img class="card-img-top" src="../member_Img/Categories/3-2.png" alt="Card image cap">
                    </a>
                    <div class="card-body">
                      <h5 class="card-title">slither.io</h5>
                      <p class="card-text">2위</p>
                      <p class="card-text"><small class="text-muted">이미지 눌러서 하실 수 있습니다.</small></p>
                    </div>
                  </div>

                </div>
              </div>


              <div class="col">
                <div class="card shadow-sm">

                  <div class="card">
                    <a href="https://surviv.io/">
                      <img class="card-img-top" src="../member_Img/Categories/3-3.png" alt="Card image cap">
                    </a>
                    <div class="card-body">
                      <h5 class="card-title">Krunker</h5>
                      <p class="card-text">3위</p>
                      <p class="card-text"><small class="text-muted">이미지 눌러서 하실 수 있습니다.</small></p>
                    </div>
                  </div>

                </div>
              </div>

              <div class="col">
                <div class="card shadow-sm">

                  <div class="card">
                    <a href="https://mope.io/">
                      <img class="card-img-top" src="../member_Img/Categories/3-4.png" alt="Card image cap">
                    </a>
                    <div class="card-body">
                      <h5 class="card-title">몹 아이오</h5>
                      <p class="card-text">4위</p>
                      <p class="card-text"><small class="text-muted">이미지 눌러서 하실 수 있습니다.</small></p>
                    </div>
                  </div>

                </div>
              </div>


              <div class="col">
                <div class="card shadow-sm">

                  <div class="card">
                    <a href="https://zombsroyale.io/">
                      <img class="card-img-top" src="../member_Img/Categories/3-5.png" alt="Card image cap">
                    </a>
                    <div class="card-body">
                      <h5 class="card-title">좀비로얄아이오</h5>
                      <p class="card-text">5위</p>
                      <p class="card-text"><small class="text-muted">이미지 눌러서 하실 수 있습니다.</small></p>
                    </div>
                  </div>

                </div>
              </div>



              <div class="col">
                <div class="card shadow-sm">

                  <div class="card">
                    <a href="https://hole-io.com/">
                      <img class="card-img-top" src="../member_Img/Categories/3-6.png" alt="Card image cap">
                    </a>
                    <div class="card-body">
                      <h5 class="card-title">싱크홀 키우기</h5>
                      <p class="card-text">6위</p>
                      <p class="card-text"><small class="text-muted">이미지 눌러서 하실 수 있습니다.</small></p>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!------------------------------------------------------------------------------>



    <!--------------------------------공유하기 틀--------------------------------->

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
              new ShareNaver.makeButton({ "type": "f" });
            </script>
          </span>

          <!--트위터 공유 하기 버튼-->
          <a href="#"
            onclick="javascript:window.open('https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20' +encodeURIComponent(document.URL)+'%20-%20'+encodeURIComponent(document.title), 'twittersharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=400,width=600');return false;"
            target="_blank" alt="Share on Twitter"><img src="../member_Img/Icon/twiter.png"></a>
          <!----------페이스북 공유 하기 -->
          <a href="#"
            onclick="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u=' +encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=400,width=600');return false;"
            target="_blank" alt="Share on Facebook"><img src="../member_Img/Icon/fackebook.png"></a>
          <!-----------카카오 페이지------------------->
          <a href="#"
            onclick="javascript:window.open('https://story.kakao.com/s/share?url=' +encodeURIComponent(document.URL), 'kakaostorysharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes, height=400,width=600');return false;"
            target="_blank" alt="Share on kakaostory"><img src="../member_Img/Icon/kakao.png"></a>
          <!---------구글 플러스----->
          <a href="#"
            onclick="javascript:window.open('https://plus.google.com/share?url=' +encodeURIComponent(document.URL), 'googleplussharedialog','menubar=no,toolbar=no,resizable=yes, scrollbars=yes,height=350,width=600');return false;"
            target="_blank" alt="Share on Google+"><img src="../member_Img/Icon/google.jpg"></a>
        </div>

        <!------------------------------------------------------------------------------------------------------------->

        <!---- 참고 사이트 -->
        <div class="one_third">
          <h1 class="logoname"><span>참고 사이트</span></h1>
          <ul class="nospace linklist">
            <li><a href="https://namu.wiki/w/io%EA%B2%8C%EC%9E%84">
                <h2>게임 io 나무위키</h2>
              </a></li>
            <li><a href="https://iogames.space/">
                <h2>아이오 게임즈</h2>
            </li>
            <li><a href="https://archive.org/details/softwarelibrary_msdos_games/v2">
                <h2>인터넷 아카이브</h2>
              </a></li>
            <li><a href="http://www.thepowernews.co.kr/view.php?ud=20190315170131377101286bacad_7">
                <h2>웹으로 즐기는 '시간 순삭' io 게임 10가지</h2>
              </a></li>
          </ul>
        </div>


        <!--QR 코드-->
        <div class="one_third">
          <h1 class="logoname"><span style="text-align: center;">후원 하기</span></h1>
          <img src="../member_Img/Icon/QR.jpg" width="300px" height="300px">
        </div>
        <!-- ################################################################################################ -->
      </footer>
    </div>





    <!--방구석 오락실 설명-->
    <div class="wrapper row5">
      <div id="copyright" class="hoc clear">
        <!-- ################################################################################################ -->
        <p class="fl_left">Copyright &copy; 2021 - All Rights Reserved - <a href="#">Domain 방구석 오락실</a></p>
        <p class="fl_right">Template by <a target="_blank" href="https://www.os-templates.com/"
            title="Free Website Templates">OS Templates</a></p>
        <!-- ################################################################################################ -->
      </div>
    </div>



    <a id="backtotop" href="#top"><i class="fas fa-chevron-up"></i></a>
    
    
    <script>
    function myFunction() {
      var x = document.getElementById("myTopnav");
      if (x.className === "topnav") {
        x.className += " responsive";
      } else {
        x.className = "topnav";
      }
    }
  </script>
  
  
  
  
</body>

</html>