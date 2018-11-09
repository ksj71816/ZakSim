<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- header include -->
<%@include file="/WEB-INF/views/zaksim/main/header.jsp" %>


 
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
            
            <div class="col-md-2 mt-3 ">
              
            </div>
            
            <div class="col-md-2 mt-3 data-cmenu" id="cmenu1" style="background-color:rgb(154, 28, 15); padding-top:7px; ">
              <h5 class="mt-1 "> 도전 정보입력 </h5>
            </div>
            
            <div class="col-md-2 mt-3 data-cmenu" id="cmenu2">
              <h5 class="mt-1 "> 도전금 결제 </h5>
            </div>
            
            <div class="col-md-2 mt-3 data-cmenu" id="cmenu3">
              <h5 class="mt-1"> 도전 안내사항 </h5>
            </div>
            
            <div class="col-md-1 mt-3">
            </div>
            
            <div style="height:5px; background-color:rgb(154, 28, 15);" class="col rounded">
            </div>
          </div>
        </div>
        <div class="col-md-1"> <img class="img-fluid d-block rounded-circle ml-3" src="/resources/image/challenge/exitBT.png" style="cursor:pointer;	height: 45px; width: 45px;"></div>
      </div>
      
      <div id="chageDiv">
      
      <!-- 인클루드 -->
      <%@include file="/WEB-INF/views/zaksim/challenge/include/doInclude.jsp" %>
      
      </div>
      
      
    </div>
  </div>
            
<!--바디 끝-->

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
  src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"
  integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30="
  crossorigin="anonymous"></script>


<script type="text/javascript">
$(document).ready(function() {
	$( "#startDate" ).datepicker({
		minDate: 0
		, dateFormat: "yy-mm-dd"
		});
	
	$( "#endDate" ).datepicker({
		minDate: 0
		, dateFormat: "yy-mm-dd"
		});
	
	
	});
	

</script>



<script type="text/javascript">

// var J = $.noConflict('true');

$(document).ready(function() {
	$("[name='title']").attr("required", true);
	$("[name='startDate']").attr("required", true);
	$("[name='endDate']").attr("required", true);
});

// J(document).ready(function() {
// 	J("[name='title']").attr("required", true);
// 	J("[name='startDate']").attr("required", true);
// 	J("[name='endDate']").attr("required", true);
// });

</script>




<!-- 도전정보 입력 -->
<script type="text/javascript">

	
	
	
		
		
	function toPriceChallenge(){
		
		if( $("#doChal [name='title']").val() == '' || $("#doChal [name='title']").val() == null ) {
			alert("도전명을 입력해 주세요!");
			return false;
		}
		
		
		if( $( "#startDate" ).val()== null || $( "#endDate" ).val()== null ) {
			alert("도전 날짜를 입력해 주세요!");
			
			return false;
		}
		
		
		if( $( "#startDate" ).val()==$( "#endDate" ).val() ) {
			alert("도전 시작일과 종료일이 같습니다!");
			
			return false;
		}
		
		if(  $( "#startDate" ).val()  >  $( "#endDate" ).val() ){
			alert("도전 종료일이 시작일보다 빠릅니다.");
			
			return false;
		}
		
		
		var params= $('#doChal').serialize();
		
		 $.ajax({
		      type: "get"
		      , url : "/zaksim/challenge/priceChallenge"
		      , data : params
		      , dataType: "html"
		      , success: function( data ) {
// 		         console.log(data);
		         $(".data-cmenu").attr("style","");
		         $("#cmenu2").attr("style","background-color:rgb(154, 28, 15); padding-top:7px; ");
		         
		         $("#chageDiv").html(data);
		      }
		      , error: function( e ) {
		         console.log("--- error ---");
		         console.log( e.responseText );
		      }
		      , complete: function() {
		         //입력 창 초기화
		      }
		   });  
	}

	
	
    
</script>
   
 
<!-- iamport.payment.js 결제 모듈-->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<script type="text/javascript">
$("[name='money']").attr("required", true);

  var IMP = window.IMP; // 생략해도 괜찮습니다.
  IMP.init("imp14263647"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
  
  
  $('#chageDiv').on("click","#payBtn",function() {
	  
	  console.log("버튼 활성화");
	  console.log($("#money").val());
	  console.log($("#startDate").text());
	  console.log($("#endDate").text());
	  console.log($("#chalTitle").text());
	  console.log('${user.email}');
	  console.log('${user.name}');
	  console.log('${user.phone}');
	  
		
//      var msg = "";
    
    // 결제 정보 설정 
     IMP.request_pay({ // param
          pg: "html5_inicis",   // PG사 - 'html5_inicis':이니시스(웹표준결제)
          pay_method: "card",   // 결제방식 - 'card':신용카드
          merchant_uid: 'merchant_' + new Date().getTime(), // 고유주문번호 - random, unique
          
          name: $("#chalTitle").text(), // 도전 명
          amount: $("#money").val(),   // 결제금액
          
          buyer_email: '${user.email}',   // 주문자Email - db에서 가져오기
          buyer_name: '${user.name}',               // 주문자명 - db에서 가져오기
          buyer_tel: '${user.phone}'      // 주문자연락처 - db에서 가져오기
      }, function (rsp) { // callback - 결제 이후 호출됨, 이곳에서 DB에 저장하는 로직을 작성한다
      
          if (rsp.success) {   // 결제 성공 로직
             
            
             
             //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
            
       
            /*  챌린지 insert
            	결제 insert
            	정보 취합 넘겨 주는 역할 - post역활
            */	
        
             jQuery.ajax({
                url: "/zaksim/challenge/priceChallenge", //cross-domain error가 발생하지 않도록 주의해주세요
                type: 'post',
                dataType: 'html',
                data: {
                	
                	
//                 	var obj = {};
//                 	obj["id"] = '${user.id}';
//                 	obj["challenge"] = '${info}';
                	
                	
//                 	var data = JSON.stringify(obj); // 데이터를 컨트롤러에 data라는 문자열로 전달하기 위함
                	// 컨트롤러에서 받는 방법 ------------
//                 	public ModelAndView myMethod(String data){
//                 		mav.setViewName('jsonView');
//                 	}
                	//-------------------
//                 	result = JSON.parse(responseData);// 결과값(String)을 JsonObject로 바꾸는 방법 (만약 jsonView로 지정했을시 불필요)
//                 	result.challenge  // 객체 자원에 key값으로 접근하는 방법 (Json object)
                 	
                 	
                   impUid : rsp.imp_uid,
                   merchantUid : rsp.merchant_uid,
                  
                // 도전 정보 , 타이틀, 시작일, 종료일, 도전금
               	   title : $("#chalTitle").text() , /* 도전 정보 전달 */
				   startDate : $("#startDate").text() ,
				   endDate : $("#endDate").text() ,
               
                   // 도전자 정보
                   buyerIdx : '${sessionScope.login_idx}',
                   name : '${user.name}',
                   email : '${user.email}',
                   phone : '${user.phone}',
                   
                   // 결제 시각
                   paidAt : new Date(rsp.paid_at),  
                   
                   
                   // 결제 상태
                   status : rsp.status,
                   
                   //기타 필요한 데이터가 있으면 추가 전달
                   
                   // 결제 금액 - 도전금
                   price : rsp.paid_amount,
                   paymentOption : 'card' 
                	  
                }
                , success: function( data ) {
                   console.log(data);
                   
                  /*  msg = '결제가 완료되었습니다.';
                  msg += '\n고유ID : ' + rsp.imp_uid;
                   msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                   msg += '\n결제 금액 : ' + rsp.paid_amount;
                  msg += '\n카드 승인번호 : ' + rsp.apply_num;
                   
                   alert(msg); */
                   
                   $("#chageDiv").html(data);
                   
                }
             });
             
//  --------------------------------  여기까지 주석 
             
             
             
             
//              .done(function(data) {
//                 console.log(data);
//                 //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
//                 if ( everythings_fine ) {
//                    var msg = '결제가 완료되었습니다.';
//                    msg += '\n고유ID : ' + rsp.imp_uid;
//                    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
//                    msg += '\n결제 금액 : ' + rsp.paid_amount;
//                    msg += '\n카드 승인번호 : ' + rsp.apply_num;
                   
//                    alert(msg);
//                 } else {
//                    //[3] 아직 제대로 결제가 되지 않았습니다.
//                    //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
//                 }
//              });

            var msg = '결제가 완료되었습니다.';
             msg += '\n고유ID : ' + rsp.imp_uid;
             msg += '\n상점 거래ID : ' + rsp.merchant_uid;
             msg += '\n결제 금액 : ' + rsp.paid_amount;
             msg += '\n카드 승인번호 : ' + rsp.apply_num;
             
             
             /* $("#모달 아이디").modal("show"); */
             
             alert(msg);
             
             $(".data-cmenu").attr("style","");
	         $("#cmenu3").attr("style","background-color:rgb(154, 28, 15); padding-top:7px; ");
	         
	        
             
          } else {
             console.log('fail');
              var msg = '결제에 실패하였습니다.';
              msg += '\n에러내용 : ' + rsp.error_msg;
              alert(msg); 
          }
           
      });
     
//      alert(msg); 
     
  });
  
  </script>
  
  
  
 <!--  
  서약서 작성
<script type="text/javascript">

	function toEndChallenge(){
		
		$.ajax({
		      type: "get"
		      , url : "/zaksim/challenge/endChallenge"
		  //    , data : params
		      , dataType: "html"
		      , success: function( data ) {
//		         console.log(data);
		         $(".data-cmenu").attr("style","");
		         $("#cmenu4").attr("style","background-color:rgb(154, 28, 15); padding-top:7px; ");
		         
		         $("#chageDiv").html(data);
		      }
		      , error: function( e ) {
		         console.log("--- error ---");
		         console.log( e.responseText );
		      }
		      , complete: function() {
		         //입력 창 초기화
		      }
		   });  
		
		
		
	}


</script>
   -->    
    

   
        <!-- footer include -->   <div class=" text-white" style="background-color: rgb(33, 33, 33)">
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
                    <h6>
                        <p style="margin-bottom: 5px;">
                            <i class="fa d-inline mr-3 text-secondary fa-phone text-white" style="padding-left: 30px;"></i>☎&nbsp; 02 - 1234 - 5678
                        </p>
                    </h6>
                    <h6>
                        <p style="margin-bottom: 5px;">
                            <i class="fa d-inline mr-3 text-secondary fa-envelope-o text-white" style="padding-left: 30px;"></i>✉ info@KHAcademy.com
                        </p>
                    </h6>
                    <h6>
                        <p style="margin-bottom: 5px;">
                            <i class="fa d-inline mr-3 fa-map-marker text-secondary text-white" style="padding-left: 30px;"></i>▼&nbsp;서울특별시 강남구 역삼동123
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