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
				    <p class="mDeleteBtn" data-toggle="modal" data-target="#myModal">> 회원 탈퇴</p>     	 	
        	 	</div>
         	</div>
	        
	        
	        <div class="col-md-8" style="padding-left: 7rem!important;">
		        <c:if test="${chal.ingChal ne 0}">
		        	<div class="mt-3 dohyeon">
			        	<p>
			        	<fmt:formatDate pattern = "yyyy-MM-dd" value = "${ingChal.startDate}"/> 부터 
			        	<fmt:formatDate pattern = "yyyy-MM-dd" value = "${ingChal.endDate}"/> 까지</p>
		                 	<p>${ingChal.title}에</p>
		      			<p>${ingChal.money}원을 걸고 도전 중</p>
			        </div>
			        
		       		<div class="progress mx-4">
			  			<div class="progress-bar bg-danger" style="width:${100*rate.boardNum/rate.dateNum}%;">${100*rate.boardNum/rate.dateNum}%</div>
					</div>
	
		          	<div class="mt-3 mb-3">
		          		<a href="#" class="btn btn-sm btn-outline-danger"><i class="fas fa-check" style="color: #ff3d00;"></i> 인증하기</a>
		          	</div>
		        </c:if>
		        
		        <c:if test="${chal.ingChal eq 0}">
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
									<td>${qna.title}</td>
									<td>${qna.writtenDate}</td>
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
			  		<a href="/zaksim/mypage/challenge" class="btn btn-outline-white text-muted"><b>+더보기</b></a>
			  	</div>
			  </div>
			  
		   </div><!-- third row end -->
		   
	       <div class="row mt-3"><!-- forth row start -->
	       
	       	<c:forEach items="${boardList}" var="board">
		       	<div class="col-md-3 col-lg-3 col-sm-3">
		         <div class="hovereffect text-center my-1">
		           <img class="img-responsive" src="${board.image}" >
		           <div class="overlay">
		             <h2>${board.title}</h2>
		             <a class="info" href="#">상세 보기</a>
		           </div>
		         </div>
		       </div>    
	       	</c:forEach>
	         	
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
			  		<a href="/zaksim/mypage/groups" class="btn btn-outline-white text-muted" ><b>+더보기</b></a>
			  	</div>
			  </div>
			  
		   </div><!-- five row end -->
		   
		    <div class="row mt-3 mb-5"><!-- six row start -->
		    
	       	 <c:forEach items="${groupList}" var="group">
		       	<div class="col-md-3 col-lg-3 col-sm-3">
		         <div class="hovereffect text-center my-1">
		           <img class="img-responsive" src="${group.image}" >
		           <div class="overlay">
		             <h2>${group.title}</h2>
		             <a class="info" href="#">상세 보기</a>
		           </div>
		         </div>
		       </div>    
	       	</c:forEach>
		      
	       	</div><!-- six row end -->
		      
	       	
	      </div>
	</div>
	
	
	
	<!-- The Modal -->
	<div class="modal fade" id="myModal">
	  <div class="modal-dialog modal-dialog-centered">
	  
	    <div class="modal-content">
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">회원 탈퇴</h4>
	      </div>  
	
	      <!-- Modal body -->
	      <div class="modal-body">
		      
		      <form action="/zaksim/mypage/delete" method="post" id="deleteform">
		      	<div class="form-group">
					<label for="pwd" style="float:left;">비밀번호</label>
				    <input type="password" class="form-control" id="passwordck" name="passwordck"/>
					<input type="submit" style="float:right;" class="btn btn-danger" id="deletebtn" value="탈퇴" data-dismiss="modal">
					<a class="btn btn-warning" style="float:right;"><button class="close" data-dismiss="modal">취소</button></a>
				</div>
			  </form>
			  
	      </div>
	    </div>
	    
	  </div>
	</div>
	<!-- modal end -->
						
						
	 <!-- footer include -->
<%@include file="/WEB-INF/views/zaksim/main/footer.jsp" %>



<script type="text/javascript">

$(document).ready(function() {
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

</script>
