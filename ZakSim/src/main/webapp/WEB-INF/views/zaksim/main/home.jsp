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
 
  <div class="py-5" style="background-image: url(/resources/image/main/back.webp); background-color: rgba(197, 155, 60, 0.4); " >
    <div class="container">
      <div class="row justify-content-center">
       
       
        <div class=" text-center rounded col-md-2 col-lg-2 m-2" style="background-color: rgb(224, 224, 224); border-right-width: 5px;	border-top-width: 5px;	border-bottom-width: 5px;    border-left-width: 5px;	border-style: solid;	border-color: white;">
          <img class="img-fluid d-block my-2 mx-auto rounded-circle" src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg" style="	height: 140px; width: 140px;	border-right-width: 3px;	border-top-width: 3px;	border-bottom-width: 3px;    border-left-width: 3px;	border-style: solid;	border-color: white;	">
          <h5 class="text-center">홍길동</h5>
          <hr class="border border-light my-2">
          <a href="#" class="mx-2">내 그룹</a>
          <a href="#" class="text-left mx-2">내 정보</a>
          <a class="btn btn-sm w-50 my-2 btn-danger" href="#"> 로그아웃 </a>
        </div>
        
        
        <div class="col-md-6 col-lg-6 rounded m-2 mx-5 text-center" 
         style="background-color: blanchedalmond;    border-right-width: 5px;	border-top-width: 5px;	border-bottom-width: 5px;    border-left-width: 5px;	border-style: solid;	border-color: white;">
          <h3 class="text-center my-2 mb-4">도전 정보</h3>
          <p>10월 19일 부터 12월 31일 까지</p>
          <p>도전금 30,000원을 걸고</p>
          <p>헬스,운동하기 도전중</p>
          <a class="btn btn-sm w-50 btn-info my-2 mt-4" href="#"> 도전 정보 확인 </a>
        </div>
        
        
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
    background-color: rgba(197, 155, 60, 0.5);">
    <div class="container">
      <div class="row">
        <div class="mx-3" >
          <h4 class="mx-2" contenteditable="true">인기 그룹</h4>
        </div>
        <div class="col-md-9 px-0 ">
          <hr class="border">
        </div>
        <div class="col-md-1 ml-4"><a href="#" class="btn btn-outline-white text-muted "><b>+더보기</b></a></div>
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
   background-color: rgba(197, 155, 60, 0.6);">
    <div class="container">
    
      <div class="row">
        <div class="mx-3">
          <h4 class="mx-2" contenteditable="true">최신 인증</h4>
        </div>
        <div class="col-md-9  px-0 ">
          <hr class="border">
        </div>
        <div class="col-md-1 ml-4"><a href="#" class="btn btn-outline-white text-muted "><b>+더보기</b></a></div>
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
    
    