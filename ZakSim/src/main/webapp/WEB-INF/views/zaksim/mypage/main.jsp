<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- header include -->
<%@include file="/WEB-INF/views/zaksim/main/header.jsp" %>
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
	
	<title>MyPage</title>
	
    <style type="text/css">
    	body {
    		text-align: center;
    	}
    	
    	p {
    		font-family: "Helvetica Nene", Helvetica, Arial, 맑은 고딕,"malgun gothic", sans-serif;
    	}	
    		
        #navbar {
            background-color: rgb(154, 28, 15)
        }

		.carousel-inner img {

			height: 300px;
		}
		
		.card, .h-100 {
    		background-color: rgb(204, 204, 255);
    	}
		
    </style>

	<div class="py-5" style="background-image: url(/resources/image/main/back.webp); background-color: rgba(197, 155, 60, 0.4); ">
	    <div class="container">
	    
	      <div class="row mt-1 mb-3"> <!-- first row start-->
	        
	        <div class="col-md-12">
		        <div class="card">
			        <h3 class="mt-3">회원 정보</h3>
				        <div>
					        <img class="rounded-circle" style="height:80px; width:100px;" src="https://data.ac-illust.com/data/thumbnails/78/7877e8c81ac0a942265a9b65a049b784_t.jpeg"/>
					    </div>
					    <div>    
					        <p>${sessionScope.login_nick}</p>
				        </div>
				        
				     <div class="btn-group btn-group-sm mt-2 mb-3"  style="margin:auto;">
					     <a href="/zaksim/mypage/update" class="btn btn-sm btn-outline-danger">회원 정보수정</a>
					     <button type="button" class="btn btn-sm btn-outline-danger" data-toggle="modal" data-target="#myModal">회원 탈퇴</button>
					     
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
						</div><!-- modal end -->
					
			         </div>
		        </div>
	        </div>
	        
	        
	      </div><!-- first row end -->
	                 
	       <div class="row mt-3 mb-3"><!-- second row start -->
			 
			 <div class="col-12">
			 	<hr class="border">
			 </div>
			 
			 <div class="col-md-7">

	        	<div class="card">
			        <div class="mt-3">,,
			        	<p>OO/OO 부터 OO/OO 까지</p>
		                 	<p>OOOOO에</p>
		      			<p>10000원을 걸고 도전 중</p>
			        </div>
			        
		       		<div class="progress mx-4">
			  			<div class="progress-bar progress-bar-striped progress-bar-animated bg-danger" style="width:80%;">80%</div>
					</div>
	
		          	<div class="mt-3 mb-3">
		          		<a href="#" class="btn btn-sm btn-outline-danger">인증하기</a>
		          	</div>
	          	</div>
	
	      	 </div>
	      	 
	      	 
	      	 <!-- 도넛 그래프 들어갈 곳 -->
	      	 <div class="col-md-5"> 
	      		 <div class="text-center">
					<span class="min-chart" id="chart-sales" data-percent="60">도넛 그래프 들어갈돗</span>
				 </div>	
				 <span id="percent"></span>	
	       	</div>
	      	
	 	   </div><!-- second row end -->
	      
	      
	       <div class="row mt-5"><!-- third row start -->

	       	  <div class="col-md-2">
	       	  	<div>
	       	  		<h4>도전 기록</h4>
	       	  	</div>
	       	  </div>
	       	  
	       	   <div class="col-md-9">
			 	<hr class="border">
			 </div>
	       	  
	       	  <div class="col-md-1">
	       	  	<div>
			  		<a href="/zaksim/mypage/challenge" class="btn btn-outline-white text-muted" ><b>+더보기</b></a>
			  	</div>
			  </div>
			  
		   </div><!-- third row end -->
		   
	       <div class="row"><!-- forth row start -->
	       	  <div class="col-md-3">
	       		<div class="card" style="width:100%; background-color: rgb(204, 204, 255);">
	       		  <a href="/mypage/challengedetail">
		              <img class="img-thumbnail" src="https://i.imgur.com/R5EdVui.jpg" alt="Card image cap" style="width:100%; height:100%;"> 
	              </a>
	              <p class="card-text">이미지1</p>
	            </div>
	          </div>
	            
	          <div class="col-md-3">
	       		<div class="card" style="width:100%; background-color: rgb(204, 204, 255);">
	       		  <a href="/mypage/challengedetail">
	              	<img class="img-thumbnail" src="https://i.imgur.com/R5EdVui.jpg" alt="Card image cap" style="width:100%; height:100%;">
	              </a>
	              <p class="card-text">이미지2</p>
	            </div>
	          </div>
	          
	          <div class="col-md-3">
	       		<div class="card" style="width:100%; background-color: rgb(204, 204, 255);">
	       		  <a href="/mypage/challengedetail">
	              	 <img class="img-thumbnail" src="https://i.imgur.com/R5EdVui.jpg" alt="Card image cap" style="width:100%; height:100%;">
	              </a>
	              <p class="card-text">이미지3</p>
	            </div>
	          </div>
	          
	          <div class="col-md-3">
	       		<div class="card" style="width:100%; background-color: rgb(204, 204, 255);">
	       		  <a href="/mypage/challengedetail">
	              	 <img class="img-thumbnail" src="https://i.imgur.com/R5EdVui.jpg" alt="Card image cap" style="width:100%; height:100%;">
	              </a>
	              <p class="card-text">이미지4</p>
	            </div>
	          </div>       	
	         	
	       	</div><!-- forth row end -->
	       	
	       	
	       	 <div class="row mt-5"><!-- five row start -->

	       	  <div class="col-md-2">
	       	  	<div>
	       	  		<h4>참여중인 그룹</h4>
	       	  	</div>
	       	  </div>
	       	  
	       	   <div class="col-md-9">
			 	<hr class="border">
			 </div>
	       	  
	       	  <div class="col-md-1">
	       	  	<div>
			  		<a href="/zaksim/mypage/groups" class="btn btn-outline-white text-muted" ><b>+더보기</b></a>
			  	</div>
			  </div>
			  
		   </div><!-- five row end -->
		   
		    <div class="row"><!-- six row start -->
	       	  <div class="col-md-3">
	       		<div class="card" style="width:100%; background-color: rgb(204, 204, 255);">
	       		  <a href="/mypage/challengedetail">
		              <img class="img-thumbnail" src="https://i.imgur.com/R5EdVui.jpg" alt="Card image cap" style="width:100%; height:100%;"> 
	              </a>
	              <p class="card-text">그룹1</p>
	            </div>
	          </div>
	            
	          <div class="col-md-3">
	       		<div class="card" style="width:100%; background-color: rgb(204, 204, 255);">
	       		  <a href="/mypage/challengedetail">
	              	<img class="img-thumbnail" src="https://i.imgur.com/R5EdVui.jpg" alt="Card image cap" style="width:100%; height:100%;">
	              </a>
	              <p class="card-text">그룹2</p>
	            </div>
	          </div>
	          
	          <div class="col-md-3">
	       		<div class="card" style="width:100%; background-color: rgb(204, 204, 255);">
	       		  <a href="/mypage/challengedetail">
	              	 <img class="img-thumbnail" src="https://i.imgur.com/R5EdVui.jpg" alt="Card image cap" style="width:100%; height:100%;">
	              </a>
	              <p class="card-text">그룹3</p>
	            </div>
	          </div>
	          
	          <div class="col-md-3">
	       		<div class="card" style="width:100%; background-color: rgb(204, 204, 255);">
	       		  <a href="/mypage/challengedetail">
	              	 <img class="img-thumbnail" src="https://i.imgur.com/R5EdVui.jpg" alt="Card image cap" style="width:100%; height:100%;">
	              </a>
	              <p class="card-text">그룹4</p>
	            </div>
	          </div>       	
	         	
	       	</div><!-- six row end -->
		      
	       	
	      </div>
	</div>

	 <!-- footer include -->
<%@include file="/WEB-INF/views/zaksim/main/footer.jsp" %>
	
<!-- 	<script type="text/javascript"> -->
// 		$('#myForm').on('submit', function(e){
// 		  $('#myModal').modal('show');
// 		  e.preventDefault();
// 		});

<!--     </script> -->
