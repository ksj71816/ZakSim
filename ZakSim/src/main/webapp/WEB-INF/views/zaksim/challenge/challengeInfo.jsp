<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- header include -->
<%@include file="/WEB-INF/views/zaksim/main/header.jsp" %>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  

  <!--바디-->
   
   <div class=" pt-5" style="background-image: url(/resources/image/main/back.webp); 
   background-color: rgba(240, 200, 240, 0.7);">
    <div class="container">
      <div class="row  py-4">
        <div class="col-md-4" >
          <img class="img-fluid d-block my-2 rounded-circle float-right" src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg" style="	height: 140px; width: 140px;	border-right-width: 3px;	border-top-width: 3px;	border-bottom-width: 3px;    border-left-width: 3px;	border-style: solid;	border-color: white;">
        </div>
        <div class="col-md-6 row" >
          <div class="col-md-12 mt-2 mx-3 text-center">
            <h4>${sessionScope.login_nick }의 <b class="text-danger">도전 24일차</b></h4>
          </div>
       <div class=" mx-3 col-md-12" style=" height:70px;"> 
		
		<div class="m-0">
		<h6 class="mt-1"><b>도전 인증률</b></h6>
		<div class="progress mb-2" style="height: 25px; border-right-width: 1px;	border-top-width: 1px;	border-bottom-width: 1px;    border-left-width: 1px;	border-style:solid;	border-color: white;"> 
		    <div class="progress-bar progress-bar-striped progress-bar-animated active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:40%">
		      40%
		    </div>
		</div>
		</div>
		
	</div>
        </div>
        <div class="col-md-2" >
        </div>     
       </div>
    </div>
  </div>
  
  
  
  <div class="py-1" style="background-image: url(/resources/image/main/back.webp); 
   background-color: rgba(240, 200, 240, 0.7);">
    <div class="container " >
      <hr class="my-5">
      <div class="row  py-3">
        <div class="col-md-2">
        </div>
        <div class="col-md-8 col-lg-8 rounded  text-center" style="background-color: blanchedalmond;    border-right-width: 5px;	border-top-width: 5px;	border-bottom-width: 5px;    border-left-width: 5px;	border-style: solid;	border-color: white;">
         
         
          <h4 class="text-center my-2 mb-4">도전 정보</h4>
          <hr style="border:2px white solid;"> 
        
             <a class="my-2 d-flex justify-content-center align-items-end">  <h5 class="mb-0 text-danger"> <fmt:formatDate value="${info.startDate}" pattern="yyyy-MM-dd"/></h5>&nbsp;부터&nbsp; 
         		<h5 class="mb-0 text-danger"><fmt:formatDate value="${info.endDate}" pattern="yyyy-MM-dd"/></h5>&nbsp;까지 </a>
         
         	 <a class="my-2 d-flex justify-content-center align-items-end"> 도전금&nbsp;<h4 class="mb-0 text-info"> ${info.money}원</h4>을 걸고</a>
          
        	 <a class="my-2 d-flex justify-content-center align-items-end"><h5 class="mb-0 text-danger"><b>${info.title}</b></h5>&nbsp;도전중 </a>  
           
          	 <a class="btn btn-sm w-25 my-4 btn-primary text-white" href="/zaksim/challenge/citation"> 도전 인증 </a>
        
        
        </div>
        <div class="col-md-2">
  
        </div>
      </div>
      <hr class="my-5">
    </div>
  </div>
  
  
  <div class="py-3 pb-5" style="background-image: url(/resources/image/main/back.webp); 
   background-color: rgba(240, 200, 240, 0.7);">
    <div class="container mb-5 ">
      <div class="row mb-5">
      
      <!-- 캘린더 추가 -->
        <div class="col-md-5 px-0">
     
        <%@include file="/WEB-INF/views/zaksim/challenge/include/calendar.jsp" %>
        
        </div>
        <div class="col-md-1">
        </div>
        <div class="col-md-6 h-50 p-0" style="border-right-width: 5px;	border-top-width: 5px;	border-bottom-width: 5px;    border-left-width: 5px;	border-style: solid;	border-color: white; ">
          <div id="myCarousel" class="carousel slide rounded border" data-ride="carousel" style="height: 337px;">
            <!-- Indicators -->
            <ul class="carousel-indicators">
              <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
              <li data-target="#myCarousel" data-slide-to="1" class=""></li>
              <li data-target="#myCarousel" data-slide-to="2" class=""></li>
            </ul>
            <!-- The slideshow -->
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="https://picsum.photos/500/300/?image=135" alt="Los Angeles" style="width: 100%; height: 100%;">
              </div>
              <div class="carousel-item">
                <img src="https://picsum.photos/500/300/?image=136" alt="Chicago" style="width: 100%; height: 100%;">
              </div>
              <div class="carousel-item">
                <img src="https://picsum.photos/500/300/?image=137" alt="New York" style="width: 100%; height: 100%;">
              </div>
            </div>
            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
              <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#myCarousel" data-slide="next">
              <span class="carousel-control-next-icon"></span>
            </a>
          </div>
        </div>
      </div>
      
       <hr class="my-5">
      
      
        <div class="row mb-5 ">
           
           <div class="col-md-6 text-center">
           
            <c:if test="${sessionScope.status eq 'ing' }">
                <a class="btn btn-lg  my-4 ml-0 btn-primary text-white " href="/zaksim/challenge/vow">서약서 작성</a>
            </c:if>
            
            <c:if test="${sessionScope.status ne 'ing' }">
                <a class="btn btn-lg  my-4 ml-0 btn-primary text-white " href="#modal">서약서 확인</a>
            </c:if>
            
            </div>
            
            <div class="col-md-6 text-center"> 
                <a class="btn btn-lg my-4 ml-0 btn-dark text-white " href="#modal">도전 포기</a>
            </div>
            
        </div>
      
    </div>
  </div>

   
 <!--바디 끝-->
    




<!-- footer include -->

   <div class=" text-white" style="background-color: rgb(33, 33, 33)">
        <div class="container">


            <div class="row justify-content-center">

                <div class="col pt-4 text-center">
                    <a href="#" class="text-secondary" style="margin-bottom: 5px;"> <b>회사소개</b></a>
                </div>
                <div class="col pt-4 text-center">
                    <a href="#" class="text-secondary" style="margin-bottom: 5px;"> <b>이용약관</b></a>
                </div>
                <div class="col pt-4 text-center">
                    <a href="#" class="text-secondary" style="margin-bottom: 5px;"> <b>개인정보처리방침</b></a>
                </div>
                <div class="col pt-4 text-center">
                    <a href="#" class="text-secondary " style="margin-bottom: 5px;"> <b>운영정책</b></a>
                </div>

            </div>

            <hr style="border-style: solid; border-color: dimgray;">

            <div class="row justify-content-center">

                <div class="row text-center">
                    <div class="col-xl-12">
                        <h5>
                            <p class="text-white" style="margin-top: 11px; margin-bottom: 11px;"> Project : ZakSim thirty day</p>
                        </h5>
                    </div>
                </div>

                <div class=" row text-center">
                    <div class="col-xl-12">
                        <h6>
                            <p class="text-white"> Header : 권수정</p>
                        </h6>
                        <h6>
                            <p class="text-white" style="padding-left: 30px;"> Member : 권미현, 김진섭, 김혁수, 배창환 </p>
                        </h6>
                    </div>
                </div>
                
                <div class="row " style="padding-bottom: 0rem!important;">
                    <h6 class="mx-4">
                        <p style="margin-bottom: 5px;">
                            <i class="fa d-inline mr-3 text-secondary fa-phone text-white" style="padding-left: 30px;"></i>02 - 1234 - 5678
                        </p>
                    </h6>
                    <h6 class="mx-4">
                        <p style="margin-bottom: 5px;">
                            <i class="fa d-inline mr-3 text-secondary fa-envelope-o text-white" style="padding-left: 30px;"></i> info@KHAcademy.com
                        </p>
                    </h6>
                    <h6 class="mx-4">
                        <p style="margin-bottom: 5px;">
                            <i class="fa d-inline mr-3 fa-map-marker text-secondary text-white" style="padding-left: 30px;"></i>서울특별시 강남구 역삼동123
                        </p>
                    </h6>
                </div>

            </div>

            <div class="row">
                <div class="col-md-12 mt-1">
                    <p class="text-center text-white">© Copyright 2018 ZakSim thirty day - All rights reserved </p>
                </div>
            </div>
        </div>
    </div>

<!-- jquery 충돌? -->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> --> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>	
</body>


</html>        
        