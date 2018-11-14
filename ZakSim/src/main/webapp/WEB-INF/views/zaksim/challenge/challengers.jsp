<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!-- header include -->
<%@include file="/WEB-INF/views/zaksim/main/header.jsp" %>


<!-- css include -->

<link rel="stylesheet" type="text/css" href="/css/main/image_hover.css">


 <!--body-->
 
  <!--도전자 인증 이미지-->
  <div class="py-5" style="background-image: url(/resources/image/main/back.webp); 
   background-color: rgba(197, 155, 60, 0.3);">
    <div class="container">
      
       
       <div class="row">
        <div class="mx-3">
          <h4 class="" contenteditable="true"><b>도전자 인증</b></h4>
        </div>
        <div class="px-0 col-md-10">
           <div style="height:2px; background-color:gray;" class="col rounded my-2 mt-3"></div> 
        </div>
      </div>
      
      
      
      
      
      
        <!--이미지 반복문 1행-->
        <div class="row mt-4">
          <!--이미지 1개-->
          <div class="col-md-3 col-lg-3 col-sm-3 h-25">
            <div class="hovereffect text-center my-1" style="">
              <img class="img-responsive" src="https://picsum.photos/1200/350/?image=144">
              <div class="overlay">
                <h2>Hover effect 1v2</h2>
                <a class="info" href="#">link here</a>
              </div>
            </div>
          </div>
          <!--이미지 끝-->
          <!--이미지 1개-->
          <div class="col-md-3 col-lg-3 col-sm-3 h-25">
            <div class="hovereffect text-center my-1" style="">
              <img class="img-responsive" src="https://picsum.photos/1200/350/?image=132">
              <div class="overlay">
                <h2>Hover effect 1v2</h2>
                <a class="info" href="#">link here</a>
              </div>
            </div>
          </div>
          <!--이미지 끝-->
          <!--이미지 1개-->
          <div class="col-md-3 col-lg-3 col-sm-3 h-25">
            <div class="hovereffect text-center my-1" style="">
              <img class="img-responsive" src="https://picsum.photos/1200/350/?image=133">
              <div class="overlay">
                <h2>Hover effect 1v2</h2>
                <a class="info" href="#">link here</a>
              </div>
            </div>
          </div>
          <!--이미지 끝-->
          <!--이미지 1개-->
          <div class="col-md-3 col-lg-3 col-sm-3 h-25">
            <div class="hovereffect text-center my-1" style="">
              <img class="img-responsive" src="https://picsum.photos/1200/350/?image=134">
              <div class="overlay">
                <h2>Hover effect 1v2</h2>
                <a class="info" href="#">link here</a>
              </div>
            </div>
          </div>
          <!--이미지 끝-->
        </div>
        <!--1행 끝-->
      
      
     
      
      </div>
    </div> <!-- 도전자 인증 end-->
    
    
<!-- 페이징 버튼-->

<div class="pb-4" style="background-image: url(/resources/image/main/back.webp); 
   background-color: rgba(197, 155, 60, 0.3);">
	<jsp:include page="/WEB-INF/views/zaksim/challenge/include/pagingBtn.jsp" />
</div> 
    
    
<!-- 검색창-->
<div class="pb-5" style="background-image: url(/resources/image/main/back.webp); 
   background-color: rgba(197, 155, 60, 0.3);">
    <form class="container pl-5 pb-5 pt-3">
      <div class="row">
        <div class="col text-right px-0">
          <div class="btn-group" >
            <button class="btn dropdown-toggle btn-dark" data-toggle="dropdown" aria-expanded="false"> 키워드 </button>
            <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 38px, 0px);">
              <a class="dropdown-item" href="#">도전자</a>
             
                <div class="m-1 dropdown-divider"></div>
              <a class="dropdown-item" href="#">도전명</a>
               
            </div>
          </div>
        </div>
        <div class="col p-0 px-1">
          <input type="text" class="form-control border border-dark rounded" placeholder="검색어를 입력해 주세요.">
        </div>
        <div class="col px-2">
          <button type="submit" class="btn btn-primary">검색</button>
        </div>
      </div>
    </form>
</div>
    
        
    
        <!-- footer include -->
<%@include file="/WEB-INF/views/zaksim/main/footer.jsp" %>
    