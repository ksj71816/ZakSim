<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!-- header include -->
<%@include file="/WEB-INF/views/zaksim/main/header.jsp" %>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- 바디 -->

   <div class="py-5" style="background-image: url(/resources/image/challenge/back.jpg);">
    <div class="container">
      <div class="row text-white py-3" style="background-color: rgba(94, 94, 94, 0.64);">
        <div class="col-md-1"> </div>
        <div class="col-md-10">
          <div class="row text-center rounded" style="background-color: rgba(33, 33, 33, 0.67);">
            <div class="mt-2 col-md-3">
              <h2 class="text-left ml-4 mt-1"> <b>ZakSim</b> </h2>
            </div>
          
             
              
            <div class="col-md-1 mt-3 " >
              
            </div>
            <div class="col-md-7 mt-3 rounded" style=" background-color:rgb(154, 28, 15); padding-top:7px; ">
              <h5 class="mt-1 "> ${sessionScope.login_nick }의 도전 인증 </h5>
            </div>
           
            <div class="col-md-0 mt-3 " >
              <h5 class="mt-1">  </h5>
            </div>
            <div class="col-md-1 mt-3">
            </div>
            
            <div style="height:5px; background-color:rgb(154, 28, 15);" class="col rounded">
            </div>
          </div>
          
        </div>
        <div class="col-md-1"> <img class="img-fluid d-block rounded-circle ml-3" src="/resources/image/challenge/exitBT.png" style="cursor:pointer;	height: 45px; width: 45px;"></div>
      </div>
   


  <div class="row text-dark pb-5 py-2 " style="background-color: rgba(94, 94, 94, 0.64);">
       
          <div class="col-md-2"> </div>
          
        <div class="col-md-8 border-white my-3 px-5 py-4 rounded" style="background-color: rgba(33, 33, 33, 0.5); border-right-width: 5px;	border-top-width: 5px;	border-bottom-width: 5px;    border-left-width: 5px;	border-style: solid;">
          <div class="row ">
            
            <div class="col-md-12 mt-2 text-white">
                <h3 class="text-center">${info.title}</h3>
                <h5  class="mt-3 mb-0 p-0 d-flex">작성일 :&nbsp;&nbsp;<span  class="m-0 " id="nowdate" style=" color: tan;"> </span></h5>
            <!-- 
                <div class="mt-3">
                <a>공개 설정 : <img class="img-fluid d-block mt-2 rounded-circle justify-content-start" src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg" style="	height: 30px; width: 30px;" >
                </a>
                </div>
            -->
            </div>
            
          </div>
          
            <div style="height:2px; background-color:white;" class="col rounded my-2">
            </div>
          
    <form id="upload" action="/zaksim/challenge/citation" method="POST" enctype="multipart/form-data">
         
            
          <div class="text-left text-center text-white">
            <p class="mx-1 text-left" >이미지 </p>
            <img name="file" id="blah" class="w-100 h-100 img-fluid d-block rounded" src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg" style=" border-right-width: 3px;	border-top-width: 3px;	border-bottom-width: 3px;    border-left-width: 3px;	border-style: solid;	border-color: white; ">
          </div>
          
          
          <!--파일 드래그 앤 드랍-->
          
          
          <%@include file="/WEB-INF/views/zaksim/challenge/include/dragNdrop.jsp" %>
          
          
          <!-- 파일 드래그 앤 드랍 end -->
            
            <div style="height:2px; background-color:white;" class="col rounded my-2 mt-4">
            </div>
            
          <div class="form-group text-center text-white">
            <label for="exampleFormControlTextarea1" class="d-flex mx-1">메세지</label>
            <textarea class="form-control" id="textarea" rows="3"></textarea>
            
            <div class="row">
            <!-- <div class="col-md-4">
            <a class="btn  mt-5  btn-success " href="#"> 파일 올리기 </a>
            </div>
            <div class="col-md-4"> </div> -->
            	<div class="col-md-12">
            	<button type="button" onclick="toCitation();" class="btn btn-primary mt-5 " >인증 하기</button>
            	</div>
            </div>
              
          </div>
          
    </form>
        
        </div>
        
        <div class="col-md-2"> </div>
     
        
      </div>
      
        
    </div>
  </div>
            
<!--바디 끝-->
     
     
<script type="text/javascript">

// 1초마다 재실행
setInterval(

		function sysdate(){
			
			console.log("현재 시각 함수");
			
			var nowDate = document.getElementById("nowdate");

			var now = new Date();

			var nowTime = now.getFullYear();	

//			console.log(nowTime);	
			
			nowTime += '-' + (now.getMonth()+1);	//년도 0=1월, 11=12월이므로 +1

//			console.log(nowTime);
			nowTime += '-' + now.getDate();		 // 날짜

//			console.log(nowTime);
//			nowTime += ' ' + now.getHours();	 // 시간
			nowTime += ' ' + addZeros(now.getHours(),2);
			
//			console.log(nowTime);
//			nowTime += ':' + now.getMinutes();	 // 분
			nowTime += ':' + addZeros(now.getMinutes(),2);
			
//			console.log(nowTime);
//			nowTime += ':' + now.getSeconds();	 // 초
			nowTime += ':' + addZeros(now.getSeconds(),2);
			
//			console.log(nowTime);

//			console.log(now.getDate());
//			console.log(nowTime);
			
			nowDate.innerHTML=nowTime;
			
			
			
//			setTimeout("sysdate()",1000);         // 1초마다 printClock() 함수 호출
		}
		
		,1000);


function addZeros(num, digit) { // 자릿수 맞춰주기
	  var zero = '';
	  num = num.toString();
	  if (num.length < digit) {
	    for (i = 0; i < digit - num.length; i++) {
	      zero += '0';
	    }
	  }
	  return zero + num;
}


</script>
     
     

      
     
     
   
     
  
        <!-- footer include -->
<%@include file="/WEB-INF/views/zaksim/main/footer.jsp" %>