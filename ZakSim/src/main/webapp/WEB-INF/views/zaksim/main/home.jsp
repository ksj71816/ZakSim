<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!-- header include -->
<%@include file="/WEB-INF/views/zaksim/main/header.jsp" %>

<!-- css include -->
<link rel="stylesheet" type="text/css" href="/css/main/image_hover.css">


<!-- 바디 -->

    <!-- 슬라이드 이미지 carousel slide--> 
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  
  <div class="carousel-inner">
    
     <div class="carousel-item active">
      <img class="d-block w-100" src="https://picsum.photos/1200/350/?image=106" alt="First slide"
      style=" min-height: 350px;	max-height: 350px;	">
    </div>
    
    <div class="carousel-item">
      <img class="d-block w-100" src="https://picsum.photos/1200/350/?image=2" alt="Second slide"
      style=" min-height: 350px;	max-height: 350px;	">
    </div>
    
    <div class="carousel-item">
      <img class="d-block w-100" src="https://picsum.photos/1200/350?image=1050" alt="Third slide" style=" min-height: 350px;	max-height: 350px;	">
    </div>
    
  </div>
  
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
 <!-- 슬라이드 이미지 끝-->
 
 
 
 <!--미들 세션 - 로그인-->
 
  <div class="py-5" style="background-image: url(/resources/image/main/back.webp); background-color: rgba(197, 155, 60, 0.0); " >
    <div class="container">
      <div class="row justify-content-center">
       
       
   <c:if test="${empty login }">
       
       <!-- 비로그인 상태 -->
        <div class=" text-center  col-md-2 col-lg-2 m-2" style="	background-color: rgb(224, 224, 224);	border-right-width: 5px;	border-top-width: 5px;	border-bottom-width: 5px;	border-left-width: 5px;	border-color: white;	border-style: solid;" >
          <div class="row my-1 mb-4">
          </div>
          <div class="border border-light rounded py-4 my-1" style=" border-style: solid;	border-color: white;	border-right-width: 5px;	border-top-width: 5px;	border-bottom-width: 5px;	border-left-width: 5px;">
            <a class="btn btn-danger btn-lg w-75 my-2 mx-auto" href="/zaksim/login/login"> 로그인 </a>
            <a class="btn btn-sm w-75 btn-success my-2" href="/zaksim/login/join"> 회원가입 </a>
            <div class="mt-3">
              <a href="/zaksim/login/findId" class="mx-1 mr-2">ID찾기</a>
              <a href="/zaksim/login/findPw" class="text-left mx-1 ml-2">PW찾기</a>
            </div>
          </div>
        </div>
       
       
		<div class="col-md-6 col-lg-6 rounded m-2 mx-5 text-center" style="background-color: blanchedalmond;    border-right-width: 5px;	border-top-width: 5px;	border-bottom-width: 5px;    border-left-width: 5px;	border-style: solid;	border-color: white;">
          <h3 class="text-center my-4 mb-4"><b>도전 정보</b></h3>
          <hr  style="border:2px white solid;">
          <h4 class="mt-5" style="margin-top: 80px!important;"> 로그인 후 이용해 주세요! </h4>
        </div>
       
    </c:if>
       
       
   <c:if test="${login }">
       <!-- 로그인 상태 -->
        <div class=" text-center rounded col-md-2 col-lg-2 m-2" style="background-color: rgb(224, 224, 224); border-right-width: 5px;	border-top-width: 5px;	border-bottom-width: 5px;    border-left-width: 5px;	border-style: solid;	border-color: white;">
          <img class="img-fluid d-block my-2 mx-auto rounded-circle" src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg" style="	height: 140px; width: 140px;	border-right-width: 3px;	border-top-width: 3px;	border-bottom-width: 3px;    border-left-width: 3px;	border-style: solid;	border-color: white;	">
          <h5 class="text-center">${sessionScope.login_nick }</h5>
          <hr class="border border-light my-2">
          <a href="#" class="mx-2">내 그룹</a>
          <a href="#" class="text-left mx-2">내 정보</a>
          <a class="btn btn-sm w-50 my-2 btn-danger" href="/zaksim/login/logout"> 로그아웃 </a>
        </div>
        
        
      <c:if test="${ sessionScope.status ne 'ing'}">
      
        <!-- 비도전 중일때 -->
		<div class="col-md-6 col-lg-6 rounded m-2 mx-5 text-center" style="background-color: blanchedalmond;    border-right-width: 5px;	border-top-width: 5px;	border-bottom-width: 5px;    border-left-width: 5px;	border-style: solid;	border-color: white;">
          <h3 class="text-center my-2">도전 정보</h3>
          <hr  style="border:2px white solid;">
          <h5 class="my-2 mt-5"> 아직 도전을 시작하지 않으셨군요.</h5>
          <h5 class="my-2">  멋진 도전을 시작해 보세요! </h5>
          
          <a class="btn btn-sm w-50 btn-info my-2 mt-4" href="/zaksim/challenge/doChallenge"> 도전 시작하기 </a>
          
        </div>
       
      </c:if>
        
        
        
       <c:if test="${ sessionScope.status eq 'ing' }">
        <!-- 도전중일때 -->
        <div class="col-md-6 col-lg-6 rounded m-2 mx-5 text-center" 
         style="background-color: blanchedalmond;    border-right-width: 5px;	border-top-width: 5px;	border-bottom-width: 5px;    border-left-width: 5px;	border-style: solid;	border-color: white;">
          <h4 class="text-center mt-2 mb-3">도전 정보</h4>
           <hr  style="border:2px white solid;">
          
             <a class="my-2 d-flex justify-content-center align-items-end">  <h5 class="mb-0 text-danger"> <fmt:formatDate value="${info.startDate}" pattern="yyyy-MM-dd"/></h5>&nbsp;부터&nbsp; 
         		<h5 class="mb-0 text-danger"><fmt:formatDate value="${info.endDate}" pattern="yyyy-MM-dd"/></h5>&nbsp;까지 </a>
         
         	 <a class="my-2 d-flex justify-content-center align-items-end"> 도전금&nbsp;<h4 class="mb-0 text-info"> ${info.money}원</h4>을 걸고</a>
          
        	 <a class="my-2 d-flex justify-content-center align-items-end"><h5 class="mb-0 text-danger"><b>${info.title}</b></h5>&nbsp;도전중 </a>  
        
          	<a class="btn btn-sm w-50 btn-info my-2 mt-4" href="/zaksim/challenge/challengeInfo"> 도전 정보 확인 </a>
        </div>
      </c:if>
        
        
    </c:if>
        
        
        
        <div class="rounded col-md-2 col-lg-2 m-2" style="background-color: rgb(156, 177, 198);    border-right-width: 5px;	border-top-width: 5px;	border-bottom-width: 5px;    border-left-width: 5px;	border-style: solid;	border-color: white;">
          <div class="border-secondary rounded">
            <h5 class="text-center mt-2"><b>도전자 랭킹</b></h5>
            <hr class="border border-light ">
            <ol class="border rounded border-light mt-4">
              <li class="my-2">One</li>
              <li class="my-2">One</li>
              <li class="my-2">One</li>
              <li class="my-2">One</li>
              <li class="my-2">One</li>
            </ol>
          </div>
        </div>
        
        
      </div>
    </div>
  </div>
 
 <!--인기 그룹-->
 
 <div class="py-5" style="background-image: url(/resources/image/main/back.webp); 
    background-color: rgba(197, 155, 60, 0.1);">
    <div class="container">
      <div class="row">
        <div class="mx-3" >
          <h4 class="mx-2" contenteditable="true"><b>인기 그룹</b></h4>
        </div>
        <div class="col-md-9 px-0 ">
          
         <div style="height:2px; background-color:gray;" class="col rounded my-2 mt-3"></div> 
         
        </div>
        <div class="col-md-1 ml-4"><a href="/zaksim/community/popularCommunity" class="btn btn-outline-white text-muted "><b>+더보기</b></a></div>
      </div>
    </div>
    <div class="container">
     
     <!--이미지 반복문 1행-->
      <div class="row mt-4">
       
       
        
        
        <!--이미지 1개-->
        <div class="col-md-3 col-lg-3 col-sm-3">
          <div class="hovereffect text-center my-1" style="">
            <img class="img-responsive" src="https://picsum.photos/1200/350/?image=123" >
            <div class="overlay">
              <h2>게시물 이름</h2>
              <a class="info" href="#">게시물 이동</a>
            </div>
          </div>
        </div>
        <!--이미지 끝-->
        
       <!--이미지 1개-->
        <div class="col-md-3 col-lg-3 col-sm-3">
          <div class="hovereffect text-center my-1" style="">
            <img class="img-responsive" src="https://picsum.photos/1200/350/?image=124" >
            <div class="overlay">
              <h2>Hover effect 1v2</h2>
              <a class="info" href="#">link here</a>
              
             
            </div>
          </div>
        </div>
        <!--이미지 끝-->
        
        <!--이미지 1개-->
        <div class="col-md-3 col-lg-3 col-sm-3">
          <div class="hovereffect text-center my-1" style="">
            <img class="img-responsive" src="https://picsum.photos/1200/350/?image=125" >
            <div class="overlay">
              <h2>Hover effect 1v2</h2>
              <a class="info" href="#">link here</a>
            </div>
          </div>
        </div>
        <!--이미지 끝-->
        
        <!--이미지 1개-->
        <div class="col-md-3 col-lg-3 col-sm-3">
          <div class="hovereffect text-center my-1" style="">
            <img class="img-responsive" src="https://picsum.photos/1200/350/?image=126" >
            <div class="overlay">
              <h2>Hover effect 1v2</h2>
              <a class="info" href="#">link here</a>
            </div>
          </div>
        </div>
        <!--이미지 끝-->
        
   
      
      </div><!--1행 끝-->
      
     
     
       <!--이미지 반복문 1행-->
      <div class="row mt-4">
       
       
        
        
        <!--이미지 1개-->
        <div class="col-md-3 col-lg-3 col-sm-3">
          <div class="hovereffect text-center my-1" style="">
            <img class="img-responsive" src="https://picsum.photos/1200/350/?image=127" >
            <div class="overlay">
              <h2>Hover effect 1v2</h2>
              <a class="info" href="#">link here</a>
            </div>
          </div>
        </div>
        <!--이미지 끝-->
        
       <!--이미지 1개-->
        <div class="col-md-3 col-lg-3 col-sm-3">
          <div class="hovereffect text-center my-1" style="">
            <img class="img-responsive" src="https://picsum.photos/1200/350/?image=128" >
            <div class="overlay">
              <h2>Hover effect 1v2</h2>
              <a class="info" href="#">link here</a>
            </div>
          </div>
        </div>
        <!--이미지 끝-->
        
        <!--이미지 1개-->
        <div class="col-md-3 col-lg-3 col-sm-3">
          <div class="hovereffect text-center my-1" style="">
            <img class="img-responsive" src="https://picsum.photos/1200/350/?image=129" >
            <div class="overlay">
              <h2>Hover effect 1v2</h2>
              <a class="info" href="#">link here</a>
            </div>
          </div>
        </div>
        <!--이미지 끝-->
        
        <!--이미지 1개-->
        <div class="col-md-3 col-lg-3 col-sm-3">
          <div class="hovereffect text-center my-1" style="">
            <img class="img-responsive" src="https://picsum.photos/1200/350/?image=130" >
            <div class="overlay">
              <h2>Hover effect 1v2</h2>
              <a class="info" href="#">link here</a>
            </div>
          </div>
        </div>
        <!--이미지 끝-->
        
   
      
      </div><!--1행 끝-->
      
      
    </div>
  </div><!--인기 그룹 세션 끝-->
  
  
 
 
 
 <!--최신 인증-->
 
 <div class="py-5" style="background-image: url(/resources/image/main/back.webp); 
   background-color: rgba(197, 155, 60, 0.2);">
    <div class="container">
    
      <div class="row">
        <div class="mx-3" >
          <h4 class="mx-2" contenteditable="true"><b>최신 인증</b></h4>
        </div>
        <div class="col-md-9 px-0 ">
          
         <div style="height:2px; background-color:gray;" class="col rounded my-2 mt-3"></div> 
        </div>
        <div class="col-md-1 ml-4"><a href="/zaksim/challenge/challengers" class="btn btn-outline-white text-muted "><b>+더보기</b></a></div>
      </div>
    </div>
    <div class="container">
     
     
     
      <!--이미지 반복문 1행-->
      <div class="row mt-4">
       
       
        
        
        <!--이미지 1개-->
        <div class="col-md-3 col-lg-3 col-sm-3">
          <div class="hovereffect text-center my-1" style="">
            <img class="img-responsive" src="https://picsum.photos/1200/350/?image=144" >
            <div class="overlay">
              <h2>Hover effect 1v2</h2>
              <a class="info" href="#">link here</a>
            </div>
          </div>
        </div>
        <!--이미지 끝-->
        
       <!--이미지 1개-->
        <div class="col-md-3 col-lg-3 col-sm-3">
          <div class="hovereffect text-center my-1" style="">
            <img class="img-responsive" src="https://picsum.photos/1200/350/?image=132" >
            <div class="overlay">
              <h2>Hover effect 1v2</h2>
              <a class="info" href="#">link here</a>
            </div>
          </div>
        </div>
        <!--이미지 끝-->
        
        <!--이미지 1개-->
        <div class="col-md-3 col-lg-3 col-sm-3">
          <div class="hovereffect text-center my-1" style="">
            <img class="img-responsive" src="https://picsum.photos/1200/350/?image=133" >
            <div class="overlay">
              <h2>Hover effect 1v2</h2>
              <a class="info" href="#">link here</a>
            </div>
          </div>
        </div>
        <!--이미지 끝-->
        
        <!--이미지 1개-->
        <div class="col-md-3 col-lg-3 col-sm-3">
          <div class="hovereffect text-center my-1" style="">
            <img class="img-responsive" src="https://picsum.photos/1200/350/?image=134" >
            <div class="overlay">
              <h2>Hover effect 1v2</h2>
              <a class="info" href="#">link here</a>
            </div>
          </div>
        </div>
        <!--이미지 끝-->
        
   
      
      </div><!--1행 끝-->
      
       <!--이미지 반복문 1행-->
      <div class="row mt-4">
       
       
        
        
        <!--이미지 1개-->
        <div class="col-md-3 col-lg-3 col-sm-3">
          <div class="hovereffect text-center my-1" style="">
            <img class="img-responsive" src="https://picsum.photos/1200/350/?image=135" >
            <div class="overlay">
              <h2>Hover effect 1v2</h2>
              <a class="info" href="#">link here</a>
            </div>
          </div>
        </div>
        <!--이미지 끝-->
        
       <!--이미지 1개-->
        <div class="col-md-3 col-lg-3 col-sm-3">
          <div class="hovereffect text-center my-1" style="">
            <img class="img-responsive" src="https://picsum.photos/1200/350/?image=136" >
            <div class="overlay">
              <h2>Hover effect 1v2</h2>
              <a class="info" href="#">link here</a>
            </div>
          </div>
        </div>
        <!--이미지 끝-->
        
        <!--이미지 1개-->
        <div class="col-md-3 col-lg-3 col-sm-3">
          <div class="hovereffect text-center my-1" style="">
            <img class="img-responsive" src="https://picsum.photos/1200/350/?image=137" >
            <div class="overlay">
              <h2>Hover effect 1v2</h2>
              <a class="info" href="#">link here</a>
            </div>
          </div>
        </div>
        <!--이미지 끝-->
        
        <!--이미지 1개-->
        <div class="col-md-3 col-lg-3 col-sm-3">
          <div class="hovereffect text-center my-1" style="">
            <img class="img-responsive" src="https://picsum.photos/1200/350/?image=139" >
            <div class="overlay">
              <h2>Hover effect 1v2</h2>
              <a class="info" href="#">link here</a>
            </div>
          </div>
        </div>
        <!--이미지 끝-->
        
        
      </div><!--1행 끝-->
      
    
    </div>
  </div> <!-- 최신 인증글 end-->
  

    <!-- 바디끝 -->
    
    
    
        <!-- footer include -->
<%@include file="/WEB-INF/views/zaksim/main/footer.jsp" %>
      
    