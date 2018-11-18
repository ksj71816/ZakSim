<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- header include -->
<%@include file="/WEB-INF/views/zaksim/main/header.jsp" %>


 
<!-- 바디 -->

   <div class="py-5">
    <div class="container">
      <div class="row text-white py-3" style="background-color: #dcdcdc70;">
        <div class="col-md-1"> </div>
        <div class="col-md-10">
          <div class="row text-center rounded" style="background-color: rgba(33, 33, 33, 0.67);">
            <div class="mt-2 col-md-3">
              <h2 class="text-left ml-4 mt-1"> <b>ZakSim</b> </h2>
            </div>
            
            <div class="col-md-2 mt-3 ">
              
            </div>
            
            <div class="col-md-2 mt-3 data-cmenu dohyeon" id="cmenu1" style="background-color:rgb(154, 28, 15); padding-top:7px; ">
              <h5 class="mt-1 "> 도전 정보입력 </h5>
            </div>
            
            <div class="col-md-2 mt-3 data-cmenu dohyeon" id="cmenu2">
              <h5 class="mt-1 "> 도전금 결제 </h5>
            </div>
            
            <div class="col-md-2 mt-3 data-cmenu dohyeon" id="cmenu3">
              <h5 class="mt-1"> 도전 안내사항 </h5>
            </div>
            
            <div class="col-md-1 mt-3">
            </div>
            
            <div style="height:5px; background-color:rgb(154, 28, 15);" class="col rounded">
            </div>
          </div>
        </div>
        <div class="col-md-1"> <a onclick="alert();"> <img class="img-fluid d-block rounded-circle ml-3" src="/resources/image/challenge/exitBT.png" style="cursor:pointer;	height: 45px; width: 45px;"></a></div>
      </div>
      
      <div id="chageDiv">
      
      <!-- 인클루드 -->
      <%@include file="/WEB-INF/views/zaksim/challenge/include/doInclude.jsp" %>
      
      </div>
      
      
    </div>
  </div>
            
<!--바디 끝-->

<!-- pay Modal -->
<div class="modal fade" id="payModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" style="font-family: Dohyeon; font-weight: 300;">결제 완료</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
    	<div class="row ml-1 mr-1">
    		<p id="modalBody"></p>
    	</div>        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- pay Modal -->

<!-- footer include -->
        
<%@include file="/WEB-INF/views/zaksim/main/footer.jsp" %>



<!-- 스크립트 시작 -->

<script
  src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"
  integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30="
  crossorigin="anonymous"></script>

<!-- alert 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.28.12/sweetalert2.all.js"></script>



<!-- alert 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.28.12/sweetalert2.all.js"></script>


<!-- alert 스크립트-->
<script type="text/javascript">


function alert(){
	
	swal({
		  title: '도전을 취소 하시겠습니까?',
		  text: '작성중인 정보가 초기화 되며, 메인 화면으로 이동 합니다!',
		  type: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#2E82CC',
		  cancelButtonColor: '#FC3A3A',
		  confirmButtonText: '확인',
		  cancelButtonText: '취소'
		}).then((result) => {
		  if (result.value) {
	
			  document.location.href = "/zaksim/main/home";
			  
		  }
		})
	
}
		
</script>


<!-- jQuery ui datepicker -->
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



<!-- 도전정보 입력 -->
<script type="text/javascript">
		
	function toPriceChallenge(){
		
		if( $("#doChal [name='title']").val() == '' || $("#doChal [name='title']").val() == null ) {
			
			swal({
				  type: 'error',
				  title: '도전명을 입력해 주세요.'
				 // footer: '<a href>Why do I have this issue?</a>'
				})
			
			
			return false;
		}
		
		
		if( $( "#startDate" ).val()== "" || $( "#endDate" ).val()== "" ) {
			//alert("도전 날짜를 입력해 주세요!");
			
			
			swal({
				  type: 'error',
				  title: '도전 날짜를 입력해 주세요.' 
				 // footer: '<a href>Why do I have this issue?</a>'
				})
			
			
			return false;
		}
		
		
		if( $( "#startDate" ).val()==$( "#endDate" ).val() ) {
			//alert("도전 날짜를 확인해 주세요!");
			
			swal({
				  type: 'error',
				  title: '도전 날짜를 확인해 주세요.' 
				 // footer: '<a href>Why do I have this issue?</a>'
				})
			
			
			return false;
		}
		
		if(  $( "#startDate" ).val()  >  $( "#endDate" ).val() ){
			//alert("도전 날짜를 확인해 주세요!");
			
			swal({
				  type: 'error',
				  title: '도전 날짜를 확인해 주세요.' 
				 // footer: '<a href>Why do I have this issue?</a>'
				})
			
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

// 얜 뭐지?
$("[name='money']").attr("required", true);

var IMP = window.IMP; // 생략해도 괜찮습니다.
IMP.init("imp14263647"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
// IMP.init("imp29063736"); 	// 권수정 아이디용 가맹점 식별코드


$('#chageDiv').on("click","#payBtn",function() {
	
	var radio = $("[name=optradio]:checked").val();
	
	if(radio == '카드 결제') {
		pay("html5_inicis", "card", "card");
	} else if(radio == '휴대폰 결제') {
		pay("danal", "phone", "phone");
	} else if(radio == '실시간 계좌이체') {
		pay("danal_tpay", "trans", "bank");
	}
	
});


function pay(pg, pay_method, paymentOption) {
    // 결제 정보 설정 
    IMP.request_pay({ // param
         pg: pg,   // PG사 - 'html5_inicis':이니시스(웹표준결제)
         pay_method: pay_method,   // 결제방식 - 'card':신용카드
         merchant_uid: 'merchant_' + new Date().getTime(), // 고유주문번호 - random, unique
         
         name: $("#chalTitle").text(), // 도전 명
         amount: $("#money").val(),   // 결제금액
         
         buyer_email: '${user.email}',   // 주문자Email - db에서 가져오기
         buyer_name: '${user.name}',     // 주문자명 - db에서 가져오기
         buyer_tel: '${user.phone}'      // 주문자연락처 - db에서 가져오기
     }, function (rsp) { // callback - 결제 이후 호출됨, 이곳에서 DB에 저장하는 로직을 작성한다
     
         if (rsp.success) {   // 결제 성공 로직
            
            jQuery.ajax({
               url: "/zaksim/challenge/priceChallenge", //cross-domain error가 발생하지 않도록 주의해주세요
               type: 'post',
               dataType: 'html',
               data: {
                  impUid : rsp.imp_uid,
                  merchantUid : rsp.merchant_uid,
              	   title : $("#chalTitle").text() , /* 도전 정보 전달 */
				   startDate : $("#startDate").text() ,
				   endDate : $("#endDate").text() ,
                  buyerIdx : '${sessionScope.login_idx}',
                  name : '${user.name}',
                  email : '${user.email}',
                  phone : '${user.phone}',
                  paidAt : new Date(rsp.paid_at),  
                  status : rsp.status,
                  price : rsp.paid_amount,
                  paymentOption : paymentOption 
               }
               , success: function( data ) {
//                   console.log(data);
                  
                  $("#chageDiv").html(data);
                  
               }
            });
         
            $("#modalBody").html("결제가 완료되었습니다.<br>결제 금액 : " + rsp.paid_amount + "<br>${sessionScope.login_nick}님의 도전을 응원합니다!");
			$("#payModal").modal('show');            
            
            $(".data-cmenu").attr("style","");
	         $("#cmenu3").attr("style","background-color:rgb(154, 28, 15); padding-top:7px; ");
            
         } else {
        	 
        	 $("#modalBody").html("결제 실패!<br>에러 : " + rsp.error_msg);
 			 $("#payModal").modal('show');
 			 
 			 
         }
     });
}
</script>
  
  