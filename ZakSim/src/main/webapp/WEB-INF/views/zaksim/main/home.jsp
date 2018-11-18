<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!-- header include -->
<%@include file="/WEB-INF/views/zaksim/main/header.jsp" %>

<!-- css include -->
<link rel="stylesheet" type="text/css" href="/css/main/image_hover.css">


<!-- 바디 -->

    <!-- 슬라이드 이미지 carousel slide--> 
    <div id="carouselExampleIndicators" class="carousel slide mt-3" data-ride="carousel">
    
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
 
  <div class="py-5 mt-5">
    <div class="container">
      <div class="row justify-content-center">
       
       
   <c:if test="${empty login }">
       
       <!-- 비로그인 상태 -->
        <div class=" text-center col-md-2 col-lg-2 m-3 dohyeon">
          <div class="row my-1 mb-4">
          </div>
          <div class="border border-light rounded py-4 my-1">
            <a class="btn btn-outline-danger btn-lg w-75 my-2 mx-auto" href="/zaksim/login/login"> 로그인 </a>
            <a class="btn btn-sm w-75 btn-outline-success my-2" href="/zaksim/login/join"> 회원가입 </a>
            <div class="mt-3">
              <a href="/zaksim/login/findId" class="mx-1 mr-2">ID찾기</a>
              <a href="/zaksim/login/findPw" class="text-left mx-1 ml-2">PW찾기</a>
            </div>
          </div>
        </div>
       
       
		<div class="col-md-6 col-lg-6 rounded m-2 mx-5 text-center dohyeon">
          <h3 class="text-center my-4 mb-4"><b>도전 정보</b></h3>
          <hr  style="border:2px white solid;">
          <h4 class="mt-5" style="margin-top: 80px!important;"> 로그인 후 이용해 주세요! </h4>
        </div>
       
    </c:if><%-- 비로그인 --%>
       
       
   <c:if test="${login }">
       <!-- 로그인 상태 -->
        <div class="mt-5 pt-4 text-center rounded col-md-2 col-lg-2 m-2 dohyeon">
          <h5 class="text-center">${sessionScope.login_nick }</h5>
          <hr class="border border-light my-2">
          <a href="#" class="mx-2">내 그룹</a>
          <a href="#" class="text-left mx-2">내 정보</a>
          <a class="btn btn-sm w-50 my-2 btn-outline-danger" href="/zaksim/login/logout"> 로그아웃 </a>
        </div>
        
        
      <c:if test="${ sessionScope.status ne 'ing'}">
      
        <!-- 비도전 중일때 -->
		<div class="col-md-6 col-lg-6 rounded m-2 mx-5 text-center dohyeon">
          <h3 class="text-center my-4">도전 정보</h3>
          <hr  style="border:2px white solid;">
          <h5 class="my-2 mt-5"> 아직 도전을 시작하지 않으셨군요.</h5>
          <h5 class="my-2">  멋진 도전을 시작해 보세요! </h5>
          
          <a class="btn btn-sm w-50 btn-info my-2 mt-4" href="/zaksim/challenge/doChallenge"> 도전 시작하기 </a>
          
        </div>
       
      </c:if> <%-- 비도전 --%>

        
       <c:if test="${ sessionScope.status eq 'ing' }">
        <!-- 도전중일때 -->
        <div class="col-md-6 col-lg-6 rounded m-2 mx-5 text-center dohyeon">
          <h4 class="text-center mt-4 mb-3">도전 정보</h4>
           <hr  style="border:2px white solid;">
          
             <a class="my-2 d-flex justify-content-center align-items-end">  
             	<h5 class="mb-0 text-danger"><fmt:formatDate value="${info.startDate}" pattern="yyyy-MM-dd"/></h5>&nbsp;부터&nbsp; 
         		<h5 class="mb-0 text-danger"><fmt:formatDate value="${info.endDate}" pattern="yyyy-MM-dd"/></h5>&nbsp;까지 </a>
         
         	 <a class="my-2 d-flex justify-content-center align-items-end"> 도전금&nbsp;<h4 class="mb-0 text-info"> ${info.money}원</h4>을 걸고</a>
          
        	 <a class="my-2 d-flex justify-content-center align-items-end"><h5 class="mb-0 text-danger"><b>${info.title}</b></h5>&nbsp;도전중 </a>  
        
          	<a class="btn btn-sm w-50 btn-info my-2 mt-4" href="/zaksim/challenge/challengeInfo"> 도전 정보 확인 </a>
        </div>
      </c:if> <%-- 도전중 --%>
          
    </c:if> <%-- login 상태 --%>
          
        
        <div class="rounded col-md-3 col-lg-3 m-2">
<!--           <div class="border-secondary rounded"> -->
<!--             <h5 class="text-center mt-2"><b>도전자 랭킹</b></h5> -->
<!--             <hr class="border border-light "> -->
<!--             <ol class="border rounded border-light mt-4"> -->
<!--               <li class="my-2">One</li> -->
<!--               <li class="my-2">One</li> -->
<!--               <li class="my-2">One</li> -->
<!--               <li class="my-2">One</li> -->
<!--               <li class="my-2">One</li> -->
<!--             </ol> -->
<!--           </div> -->
        </div>
        
      </div>
    </div>
  </div>
 
 <!--인기 그룹-->
 
 <div class="py-5">
    <div class="container">
      <div class="row">
        <div class="mx-3" >
          <h4 class="mx-2 dohyeon zaksim-title"><b>인기 그룹</b></h4>
        </div>
        <div class="col-md-9 px-0 ">
          
         <div class="col rounded my-2 mt-3"></div> 
         
        </div>
        <div class="col-md-1 ml-4"><a href="/zaksim/community/popularCommunity" class="btn btn-outline-white text-muted "><b>+더보기</b></a></div>
      </div>
    </div>
    <div class="container">
     
     
     
<!--           인기모임 -->
     <!--이미지 반복문 1행-->
	<div class="row mt-4">
	   <c:forEach var="popularGroupList" items="${popularGroupList }" begin="0" step="1" end="2">
	   		<div class="col-md-4">
             <div class="card" style="">
             <input type="hidden" class="idxx" value="${popularGroupList.idx }">
             <input type="hidden" class= "memberIdxx" value="${popularGroupList.member_idx }">
                <div class="hovereffect">
                   <img class="card-img-top"
                      src="${popularGroupList.image }"
                      alt="Card image">
                   <div class="card-body">
                      <span>
                         <h3 class="card-title">${popularGroupList.title }
                      
                         </h3>
                      </span> <span class="form-inline justify-content-center"> <span style="color: red;">
                            <h4>♥ &nbsp;${popularGroupList.likeNum }</h4>
                      </span>
                      </span>
                      <p class="card-text">
                         <c:if test="${empty keywordList }">키워드 : 
                         </c:if>
                         <c:forEach items="${keywordList }" var="keyword">
                            <c:if
                               test="${popularGroupList.idx eq keyword.group_idx}">
                               #${keyword.keyword }
                            </c:if>
                         </c:forEach>
                      </p>
                   </div>
          <div class="overlay">
                      <br> <br> 
                      <a class="info">
                         <% boolean groupFlag =  false; %>
                         <c:forEach var="groupMemberExist" items="${groupMemberExist }">

                               <c:if test="${groupMemberExist.group_idx eq popularGroupList.idx }">
                                  <% groupFlag = true; %>
                               </c:if>
                         </c:forEach>   
                         
                         <!-- 로그인 했을 때 -->
                         <c:if test="${sessionScope.login }">
                            
                         <!-- 가입했을 때 -->
                            <c:if test="<%=groupFlag  %>">
                               <button type="button" class="btn btn-danger" 
                            onclick="moveURL(${popularGroupList.idx }, 0)">상세보기</button>
                            </c:if>
                            
                            <!-- 가입 안 했을 때 -->
                            <c:if test="<%=!groupFlag  %>">
                            
                            <!-- 비공개일 떄 -->
                               <c:if test="${popularGroupList.secret == 1 }">
                               <button type="button"  class="btn btn-primary secretJoin">가입하기</button>
                               <br>
                               <br>
                            </c:if>
                            
                            <!-- 공개일 때 -->
                              <c:if test="${popularGroupList.secret == 0 }"> 
                               <button type="button" class="btn btn-primary join" id ="noPassJoin">가입하기</button> 
                               <br> 
                               <br>  
                             </c:if>    
                               
                               <button type="button" class="btn btn-danger" 
                            onclick="moveURL(${popularGroupList.idx }, ${popularGroupList.secret })">상세보기</button>
                            
                         
                            </c:if>
                         
                         </c:if>
                         
                         <!-- 로그인 안했을 때 -->
                         <c:if test="${!sessionScope.login }">
                                <button type="button" class="btn btn-danger" 
                            onclick="moveURL(${popularGroupList.idx }, ${popularGroupList.secret })">상세보기</button>
                         </c:if>
                         
                      </a>
                   </div>
                </div>
             </div>
            </div>
          </c:forEach>
   
      </div><!--1행 끝-->
      
    </div>
  </div><!--인기 그룹 세션 끝-->
  
  
 
 
 
 <!--최신 인증-->
 
 <div class="py-5">
    <div class="container">
    
      <div class="row">
        <div class="mx-3" >
          <h4 class="mx-2 dohyeon zaksim-title"><b>최신 인증</b></h4>
        </div>
        <div class="col-md-9 px-0 ">
          
         <div class="col rounded my-2 mt-3"></div> 
        </div>
        <div class="col-md-1 ml-4"><a href="/zaksim/challenge/challengers" class="btn btn-outline-white text-muted "><b>+더보기</b></a></div>
      </div>
    </div>
    <div class="container">
     
     
     
      <!--이미지 반복문 1행-->
      <div class="row mt-4">
       
       
       <c:forEach var="citation" items="${citation}" begin="0" end="7" step="1" varStatus="i">
         
         <!--이미지 1개-->
          <div class="col-md-3 col-lg-3 col-sm-3 h-25">
            <div class="hovereffect text-center my-1" >
              <img class="img-responsive" src="${citation.storedName}" id="citation${i.count}">
              <div class="overlay">
<%--                 <h2>${citation.title}</h2> --%>
               
                	<a class="text-white info" style="margin-top: 70px;" onclick="viewCitation(${citation.idx},'${citation.title}','${i.count}','${citation.content}')" style="cursor:pointer;">게시물 확인</a>
              
              </div>
            </div>
          </div>
          <!--이미지 끝-->
         
          </c:forEach>
        
      </div><!--1행 끝-->
      
    </div>
  </div> <!-- 최신 인증글 end-->

<!-- Banner feat. Lips -->
<div class="container-fluid my-3">
	<div class="row">
		<div class="col-12">
			<span class="badge badge-info">AD</span><small>Sponsored by Team Flecha - Linked to github</small>
			<a href="https://github.com/jihoonys82/LipsProject" target="_blank">
				<img src="/resources/image/lips_banner.png" class="img-fluid" alt="Lips Banner" />
			</a>
		</div>
	</div>
</div>
  

    <!-- 바디끝 -->
    
        <!-- footer include -->
<%@include file="/WEB-INF/views/zaksim/main/footer.jsp" %>
      

<!-- alert 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.28.12/sweetalert2.all.js"></script>


<!-- 게시물 확인 viewer-->
<script type="text/javascript">

	function viewCitation(idx,title,index,content){
		
// 		console.log(idx);
// 		console.log(title);
// 		console.log(image);

		var image = $("#citation"+index).attr("src");
		
		swal({
			  title: "",
			  text: content,
			  imageUrl:image,
			  imageWidth: 800,
			  imageHeight: 400,
			  imageAlt: 'Custom image',
			  confirmButtonText: '닫기'
			})
	
	}
	
	function moveURL(url, secret) {
		
		if(secret == 1){
			swal({
					type: 'error',
					title: 'Oops...',
					text: '비밀커뮤니티입니다'
			});
			return;
		}
		else{
		document.location.href = "/zaksim/community/enrollCommunity?idx="+url;
		}
	}
	
	

	$(".joinedComm").click(function() {

		var idxx = $(".idxxx").val();
		var commPass = $("#commPass").val();
		

		
		$.ajax({
			type: "post"
			, url: "/zaksim/community/secretCommunityJoin"
			, dataType: "json"
			, data: {
				idx: idxx,
				password: commPass
			}
			, success: function(data) {
				
				if(commPass == null || commPass==''){
					swal({
						type: 'error',
						title: 'Oops...',
						text: '비밀번호를 입력하세요.'
					});
					
					return false;
				}
				
				if(data.result =='1'){
					swal({
						type: 'success',
						title: 'success !',
						text: data.success
					}).then((result) => {
						  if (result.value) {
// 								console.log("안쪽!!!");
								window.location.reload();
// 								location.href = "/zaksim/community/enrollCommunity?idx="+idxx;
							  }
							})
				}
				else{
					swal({
						type: 'error',
						title: 'Oops...',
						text: '비밀번호가 틀립니다.'
					});
				return false;
				}
				
			}
			, error: function(e) {
				console.log("fail");
				console.log(e.responseText);
			}
		});
	
		
	});
	
	
	

	// 비밀커뮤니티 가입하기 눌렀을 때 인덱스 넘기기
	$(".secretJoin").click(function() {
		var idxx = $(this).parent().parent().parent().parent().children("input").eq(0).val();
		
		console.log(idxx);
		
		$("#join").modal('show');
		// value 추가
		$(".idxxx").attr({
				value : idxx
		});
		
	});
	
	
	
	
	
	
$(".join").click(function() {
		
		var idxx = $(this).parent().parent().parent().parent().children("input").eq(0).val();
		
		$.ajax({
			type: "post"
			, url: "/zaksim/community/join"
			, dataType: "json"
			, data: {
				idx: idxx
			}
			, success: function(data) {
				
				console.log(idxx);
				console.log(data.success);
				swal({
					type: 'success',
					title: 'success !',
					text: data.success
				}).then((result) => {
					  if (result.value) {
							console.log("안쪽!!!");
							location.href = "/zaksim/community/enrollCommunity?idx="+idxx;
						  }
						})
				
			}
			, error: function(e) {
				console.log("fail");
				console.log(e.responseText);
			}
		});
		
		
		
	});	
	
	
</script>
      
    