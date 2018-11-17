<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- header include -->
<%@include file="/WEB-INF/views/zaksim/main/header.jsp" %>
<link rel="stylesheet" type="text/css" href="/css/mypage/mypage.css">
<link rel="stylesheet" type="text/css" href="/css/main/image_hover.css">


	<div class="py-5 text-center">
	    <div class="container">
	    
	    <div class="row mt-5">
	    	<h2 class="ml-3 pl-2 pt-1 title dohyeon">마이페이지</h2>
	    </div>
	    
	      <div class="row mt-5 mb-3"> <!-- first row start-->
	      
	      <div class="col-md-1"></div>
	        
	        <div class="col-md-2 mt-5 pl-3">
		        <i class="fas fa-child fa-5x" style="color: indianred;"></i>
			    <div>    
			        <p class="mt-3 dohyeon">${sessionScope.login_nick}</p>
		        </div>
        	</div>
        	
        	 <div class="col-md-1 pl-0 pt-5">
        	 	<div class="row" style="padding-top: 50px;">
				    <a href="/zaksim/mypage/update" class="btn btn-sm btn-outline-danger pt-1" style="width: 100px;">회원 정보수정</a>    	 	
        	 	</div>
        	 	<div class="row pt-1">
				    <p class="mDeleteBtn" onclick="deleteModal()">> 회원 탈퇴</p>     	 	
        	 	</div>
         	</div>
	        
	        
	        <div class="col-md-8" style="padding-left: 7rem!important;">
		        <c:if test="${ingChal ne null}">
		        	<div class="mt-3 dohyeon">
			        	<p>
			        	<fmt:formatDate pattern = "yyyy-MM-dd" value = "${ingChal.startDate}"/> 부터 
			        	<fmt:formatDate pattern = "yyyy-MM-dd" value = "${ingChal.endDate}"/> 까지</p>
		                 	<p>${ingChal.title}에</p>
		      			<p>${ingChal.money}원을 걸고 도전 중</p>
			        </div>
			        
		       		<div class="progress mx-4">
			  			<div class="progress-bar bg-danger" style="width: ${100*rate.boardNum/rate.dateNum}%;"><fmt:formatNumber value="${100*rate.boardNum/rate.dateNum}" pattern=".00"/>%</div>
					</div>
	
		          	<div class="mt-3 mb-3">
		          		<a href="/zaksim/challenge/citation" class="btn btn-sm btn-outline-danger"><i class="fas fa-check" style="color: #ff3d00;"></i> 인증하기</a>
		          	</div>
		        </c:if>
		        
		        <c:if test="${ingChal eq null}">
		        	<div class="row mt-3" style="background-color: #f6f6f6;">
		        		<div class="col-md-12 pt-4 pb-4">
			        		<p class="dohyeon">진행중인 도전이 없습니다.</p>
			        		<p class="dohyeon">새로운 도전을 시작해보세요!</p>
				        	<button class="btn btn-danger">도전 시작</button>
		        		</div>
		        	</div>
		        </c:if>
	        </div>
	        
	        
	      </div><!-- first row end -->
	      
	      <div class="row">
	      	<div class="col-md-12">
			 	<hr class="mBorder">	      	
	      	</div>
		  </div>
	                 
	       <div class="row mt-4 mb-3"><!-- second row start -->
			 
			 
			 
			 <div class="col-md-5">
				 <div>
		      	 	<h5 class="dohyeon mb-4">도전 현황</h5>
		      	 </div>
				<div class="row justify-content-center" id="chalDiv">
					<canvas id="chalChart" width="300" height="200"></canvas>
				</div>
	      	 </div>
	      	 
	      	 
	      	 
	      	 <div class="col-md-7"> 
	      	 <div>
	      	 	<h5 class="dohyeon mb-4">최근 문의 내역</h5>
	      	 </div>
	      		<table class="table table-hover text-center">
						<thead>
							<tr>
								<th style="display: none;">idx</th>
								<th>제목</th>
								<th>작성날짜</th>
								<th>답변상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${qnaList}" var="qna">
								<tr>
									<td style="display: none;">${qna.idx}</td>
									<td><a href="/zaksim/customerCenter/QnA/view?qnaIdx=${qna.idx}">${qna.title}</a></td>
									<td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${qna.writtenDate}"/></td>
									<c:if test="${qna.status eq 'ready'}">
										<td>대기중</td>
									</c:if>
									<c:if test="${qna.status eq 'complete'}">
										<td>답변 완료</td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
	       	</div>
	      	
	 	   </div><!-- second row end -->
	      
	      
	      
	      
	       <div class="row mt-5"><!-- third row start -->

	       	  <div class="col-md-2">
	       	  	<div>
	       	  		<h4 class="dohyeon title">도전 기록</h4>
	       	  	</div>
	       	  </div>
	       	  
	       	   <div class="col-md-9">
			 	<hr class="mBorder-sub">
			 </div>
	       	  
	       	  <div class="col-md-1">
	       	  	<div>
	       	  	<c:if test="${boardList ne null && boardList ne '[]' }">
			  		<a href="/zaksim/mypage/challenge" class="btn btn-outline-white text-muted"><b>+더보기</b></a>
			  	</c:if>
			  	</div>
			  </div>
			  
		   </div><!-- third row end -->
		   
	       <div class="row mt-3"><!-- forth row start -->
	       
	       <c:if test="${boardList eq null || boardList eq '[]' }">
	       	  <div class="col-md-12 d-flex align-items-center justify-content-center" style="height: 200px; background-color: #f6f6f6;">
	       	  	<div class="dohyeon">
	       	  	<i class="far fa-sad-tear fa-5x mb-3"></i>
	       	  	<div class="align-self-center" style="font-size: x-large;">도전 기록이 존재하지 않습니다.</div>
	       	  	</div>
	       	  </div>
	       </c:if>
	       
	       <c:if test="${boardList ne null && boardList ne '[]' }">
	       	<c:forEach items="${boardList}" var="board" begin="0" end="3" step="1">
		       	<div class="col-md-3 col-lg-3 col-sm-3">
		         <div class="hovereffect text-center my-1">
		           <img class="img-responsive" src="${board.storedName}" >
		           <div class="overlay">
		             <h2>${board.title}</h2>
		             <a class="info" onclick="viewCitation(${board.idx}, '${board.storedName}','${board.content}')" style="cursor:pointer;">상세 보기</a>
		           </div>
		         </div>
		       </div>    
	       	</c:forEach>
	       </c:if>	
	       	</div><!-- forth row end -->
	       	
	       	
	       	 <div class="row mt-5"><!-- five row start -->

	       	  <div class="col-md-2">
	       	  	<div>
	       	  		<h4 class="dohyeon title">참여중인 그룹</h4>
	       	  	</div>
	       	  </div>
	       	  
	       	   <div class="col-md-9">
			 	<hr class="mBorder-sub">
			 </div>
	       	  
	       	  <div class="col-md-1">
	       	  	<div>
	       	  	<c:if test="${groupList ne null && groupList ne '[]' }">
			  		<a href="/zaksim/community/joinCommunity" class="btn btn-outline-white text-muted" ><b>+더보기</b></a>
			  	</c:if>
			  	</div>
			  </div>
			  
		   </div><!-- five row end -->
		   
		    <div class="row mt-3 mb-5"><!-- six row start -->
		    
		    <c:if test="${groupList eq null || groupList eq '[]' }">
	       	  <div class="col-md-12 d-flex align-items-center justify-content-center" style="height: 200px; background-color: #f6f6f6;">
	       	  	<div class="dohyeon">
	       	  	<i class="far fa-sad-tear fa-5x mb-3"></i>
	       	  	<div class="align-self-center" style="font-size: x-large;">참여 그룹이 존재하지 않습니다.</div>
	       	  	</div>
	       	  </div>
	       </c:if>
		    
		    <c:if test="${groupList ne null && groupList ne '[]' }">
	       	 <c:forEach items="${groupList}" var="group" begin="0" end="3" step="1">
		       	<div class="col-md-3 col-lg-3 col-sm-3">
		         <div class="hovereffect text-center my-1">
		           <img class="img-responsive" src="${group.storedName}" >
		           <div class="overlay">
		             <h2>${group.title}
		             	<c:if test="${group.secret==1 }">
							<img src="/resouces/image/community/자물쇠.png">
						</c:if>
					</h2>
					
		             <a class="info" href="/zaksim/community/enrollCommunity?idx=${group.idx}">상세 보기</a>
		           </div>
		         </div>
		       </div>    
	       	</c:forEach>
		    </c:if>
		      
	       	</div><!-- six row end -->
	       	
	       	
	       	
	       	<div class="row mt-5"><!-- 7 row start -->

	       	  <div class="col-md-2">
	       	  	<div>
	       	  		<h4 class="dohyeon title">지난 도전들</h4>
	       	  	</div>
	       	  </div>
	       	  
	       	   <div class="col-md-10">
			 	<hr class="mBorder-sub">
			 </div>
			  
		   </div><!-- 7 row end -->
		   
		    <div class="row mt-3 mb-5"><!-- 8 row start -->
		    
	       	 <table class="table table-hover text-center">
				<thead>
					<tr>
						<th style="display: none;">idx</th>
						<th>No.</th>
						<th>도전 목표</th>
						<th>시작일</th>
						<th>종료일</th>
						<th>도전금</th>
						<th>결과</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${endChalList}" var="endChal">
						<tr>
							<td style="display: none;">${endChal.idx}</td>
							<td>${endChal.rnum}</td>
							<td><a href="/zaksim/mypage/pastChallenge?endChalIdx=${endChal.idx}">${endChal.title}</a></td>
							<td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${endChal.startDate}"/></td>
							<td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${endChal.endDate}"/></td>
							<td>${endChal.money}원</td>
							<c:if test="${endChal.status eq 'halt'}">
								<td>도전 취소</td>
							</c:if>
							<c:if test="${endChal.status ne 'halt'}">
								<c:if test="${endChal.result eq 'success'}">
									<td>도전 성공</td>
								</c:if>
								<c:if test="${endChal.result eq 'fail'}">
									<td>도전 실패</td>
								</c:if>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		      
	       	</div><!-- 8 row end -->
		      
	       	
	      </div>
	</div>
	
	
	
<!-- The Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" style="font-family: Dohyeon; font-weight: 300;">회원 탈퇴</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
    	<div class="row ml-1 mr-1">
    		<p>비밀번호 확인 후 회원 탈퇴가 진행됩니다.</p>
    		<p style="font-size: 0.9em; color: red;">* 탈퇴 시에는 관련된 모든 정보가 삭제되어 복구할 수 없습니다.</p>
    	</div> 
    	<div class="row">
    		<div class="col-md-3">비밀번호</div>
    		<div class="col-md-9"><input type="password" id="password"/></div>
    	</div>
    	<div class="row" style="height: 30px;">
    		<div class="col-md-3"></div>
    		<div class="col-md-9"><p id="checkText" style="font-size: 0.9em;"></p></div>
    	</div>          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-danger" id="deleteBtn" onclick="deleteMem();">탈퇴</button>
      </div>
    </div>
  </div>
</div>
<!-- modal end -->
						
						
	 <!-- footer include -->
<%@include file="/WEB-INF/views/zaksim/main/footer.jsp" %>

<!-- alert 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.28.12/sweetalert2.all.js"></script>


<script type="text/javascript">

$(document).ready(function() {
	console.log('${boardList}');
	changeDoughnutChart();
});

function changeDoughnutChart() {
	$("#chalDiv").html("<canvas id='chalChart'></canvas>");
	var ctx = document.getElementById("chalChart").getContext('2d');
	
	var myDoughnutChart = new Chart(ctx, {
	    type: 'doughnut',
	    data : {
    	    datasets: [{
    	        data: ['${chal.successChal}', '${chal.failChal}', '${chal.ingChal}'],
    	        backgroundColor: [
                    "#FF6384",
                    "#FFCE56",
                    "#3993f4"
                ],
                hoverBackgroundColor: [
                    "#FF6384",
                    "#FFCE56",
                    "#3993f4"
                ]
    	    }],
    	    labels: [
    	        '도전 성공',
    	        '도전 실패',
    	        '진행중'
    	    ]
    	},
    	options: {
            legend: {
      		  position:'bottom', 
      	      labels:{
      	    	  pointStyle:'circle',
      	    	  usePointStyle:true
      	      }
      	 	},
        	cutoutPercentage:60
    	}
	});
}

function deleteModal() {
	$("#password").val("");
	$("#checkText").text("");
	$("#deleteModal").modal('show');
}

$('#password').keyup(function(){
	checkPw();
});

function checkPw() {
	var password = $("#password").val();
	
	$.ajax({
		type: "post"
		, url : "/zaksim/mypage/checkPw"
		, data : {
			password : password
		}
		, dataType: "json"
		, success: function( data ) {
			
			if(data.result == true){
				$("#checkText").css("color", "green");
				$("#checkText").text("비밀번호가 일치합니다. 정말 떠나시나요?ㅠㅠ");
				$("#deleteBtn").prop("disabled", false);
			} else {
				$("#checkText").css("color", "red");
				$("#checkText").text("비밀번호가 일치하지 않습니다.");
				$("#deleteBtn").prop("disabled", true);
			}
			
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

function deleteMem() {
	$.ajax({
		type: "post"
		, url : "/zaksim/mypage/delete"
		, dataType: "json"
		, success: function( data ) {
			
			if(data.result) {

				$("#deleteModal").modal('hide');
				
				$(location).attr('href', '/zaksim/main/home');
					
			}
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

function viewCitation(idx,image,content) {

	swal({
		  text: content,
		  imageUrl:image,
		  imageWidth: 800,
		  imageHeight: 400,
		  imageAlt: 'Custom image',
		  confirmButtonText: '닫기'
		});
}

</script>
