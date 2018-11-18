<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  
      <!-- 상단 로우 -->
      <div class="row text-dark pb-4 py-2 " style="background-color: #dcdcdc70;">
        <div class="col-md-3"></div>
        <div class="col-md-6 rounded" style="height: 220px; background-color: rgba(33, 33, 33, 0.67);">
          <div class="col-md-12 text-center my-4 text-white dohyeon">
            <a class="mt-5 d-flex justify-content-center align-items-end">
            <h3 class="mb-1"> ${sessionScope.login_nick} </h3>님의</a> 
	         <a class="my-2 d-flex justify-content-center align-items-end">  
	         
	        
	         <h4 class="mb-0" id="startDate"><fmt:formatDate value="${info.startDate}" pattern="yyyy-MM-dd"/></h4>&nbsp;부터&nbsp;
	         <h4 class="mb-0" id="endDate"><fmt:formatDate value="${info.endDate}" pattern="yyyy-MM-dd"/></h4>&nbsp;까지 </a>
	           <a class="my-2 d-flex justify-content-center align-items-end"> 
	               <h4 class="mb-1" id="chalTitle">${info.title}</h4> &nbsp;도전의</a>
	            <h3>도전금 정하기!</h3>
            
          </div>
        </div>
        <div class="col-md-3"></div>
      </div>
      <!-- 하단 로우 -->
      <div class="row text-dark pb-5 py-2 " style="background-color: #dcdcdc70;">
        <div class="col-md-1"></div>
        <div class="col-md-10 rounded" style="height: 330px; background-color: rgba(33, 33, 33, 0.67);">
          <div class="col-md-12 pt-3 text-white">
<!--             <p> 결제 정보 입력 </p> -->
            
            <form id="priceChal" class="form-group text-center" >
              <div class=" row mt-5">
                <div  class="col-md-5 col-form-label">
                  <p class="text-right"> 도전 금액 </p>
                </div>
                <div class="col-md-6">
                  <input id="money" name="money" type="number" value="1000" min="1000" max="1000000" step="1000"   class="form-control mt-2 w-50" >
                </div>
              </div>
              <div class=" row">
                <div class="col-form-label col-md-5 mt-3">
                  <p class="text-right"> 결제 방법 </p>
                </div>
                
                <div class="col-md-6 text-left mt-4">
                  
                  
			    <div class="radio">
			      <label><input type="radio" name="optradio" value="카드 결제" checked="checked">카드 결제</label>
			    </div>
			    <div class="radio">
			      <label><input type="radio" name="optradio" value="휴대폰 결제">휴대폰 결제</label>
			    </div>
			    <div class="radio disabled">
			      <label><input type="radio" name="optradio" value="실시간 계좌이체">실시간 계좌이체</label>
			    </div>
			  
                  
                </div>
              </div>
              
              <button type="button" id="payBtn" class="btn text-white my-4 btn-md w-25"   style="background-color: rgb(187, 68, 56);">결제 요청</button>
            </form>
            
          </div>
        </div>
        <div class="col-md-1"></div>
      </div>
      
      