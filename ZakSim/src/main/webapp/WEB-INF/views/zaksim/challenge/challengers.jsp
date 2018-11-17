<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!-- header include -->
<%@include file="/WEB-INF/views/zaksim/main/header.jsp" %>


<!-- css include -->

<link rel="stylesheet" type="text/css" href="/css/main/image_hover.css">


 <!--body-->
 
  <!--도전자 인증 이미지-->
  <div class="py-5" style="min-height: 700px;">
    <div class="container">
      
       
       <div class="row">
        <div class="mx-3">
          <h4 class="" contenteditable="true"><b>도전자 인증</b></h4>
        </div>
        <div class="px-0 col-md-10">
           <div style="height:2px; background-color:gray;" class="col rounded my-2 mt-3"></div> 
        </div>
      </div>
      
      
      
      
      
      
        <!--이미지 반복문  1페이당 20개씩, 4개당 1줄씩-->
        <div class="row mt-4">
        
        <c:forEach var="citation" items="${citation}" begin="0" end="19" step="1" varStatus="i">
         
         <!--이미지 1개-->
          <div class="col-md-3 col-lg-3 col-sm-3 h-25">
            <div class="hovereffect text-center my-1" > 
              <img class="img-responsive" src="${citation.storedName}" id="image${i.count}">
              <div class="overlay">
                <h2>${citation.title}</h2>
                
              	<c:if test="${sessionScope.login_idx eq citation.writer_idx}">
                	<a class="text-white info" onclick="myCitation(${citation.idx},'${citation.title}','${i.count}','${citation.content}')" style="cursor:pointer;">게시물 확인</a>
               	</c:if>
              
                <c:if test="${sessionScope.login_idx ne citation.writer_idx}">
                	<a class="text-white info" onclick="viewCitation(${citation.idx},'${citation.title}','${i.count}','${citation.content}')" style="cursor:pointer;">게시물 확인</a>
               	</c:if>
              
              </div>
            </div>
          </div>
          <!--이미지 끝-->
         	
         
          </c:forEach>
          
       
        </div>
  
      
      
     
      
      </div>
    </div> <!-- 도전자 인증 end-->
    
    
<!-- 페이징 버튼-->

<div class="pb-4" style="background-image: url(/resources/image/main/back.webp); 
   background-color: rgba(197, 155, 60, 0.3);">
	<jsp:include page="/WEB-INF/views/zaksim/challenge/include/pagingBtn.jsp" />
</div> 
    
    
<!-- <!-- 검색창--> -->
<!-- <div class="pb-5" style="background-image: url(/resources/image/main/back.webp);  -->
<!--    background-color: rgba(197, 155, 60, 0.3);"> -->
    
<!--     <form class="container pl-5 pb-5 pt-3" action="/zaksim/challenge/challengers" method="post"> -->
<!--       <div class="row"> -->
<!--         <div class="col text-right px-0"> -->
          
<!--           <div class="btn-group" > -->
<!--             <button class="btn dropdown-toggle btn-dark" data-toggle="dropdown" aria-expanded="false"> 키워드 </button>
<!--             <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 38px, 0px);"> -->
<!--               <a class="dropdown-item" href="#">도전자</a> -->
             
<!--                 <div class="m-1 dropdown-divider"></div> -->
<!--               <a class="dropdown-item" href="#">도전명</a> -->
               
<!--             </div> --> -->
            
<!--             <select name="select" class="btn mx-2 dropdown-toggle btn-dark d-block my-3" data-toggle="dropdown" aria-expanded="false" required style="will-change: transform; top: 0px; left: 0px; "> -->
<!-- 				<option value="title" selected="selected">도전명</option> -->
<!-- 				<option value="challenger">도전자</option> -->
<!-- 		 	</select> -->
<!--           </div> -->
          
<!--         </div> -->
<!--         <div class="col my-3 px-1"> -->
<!--           <input name="search" type="text" class="form-control border border-dark rounded" placeholder="검색어를 입력해 주세요."> -->
<!--         </div> -->
<!--         <div class="col my-3 px-2"> -->
<!--           <button type="submit" class="btn btn-primary">검색</button> -->
<!--         </div> -->
<!--       </div> -->
<!--     </form> -->
<!-- </div> -->
    
        
    
        <!-- footer include -->
<%@include file="/WEB-INF/views/zaksim/main/footer.jsp" %>


<!-- alert 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.28.12/sweetalert2.all.js"></script>


<!-- 게시물 확인 viewer-->
<script type="text/javascript"> 

	function viewCitation(idx,title,index,content){
		
// 		console.log(idx);
// 		console.log(title);
		
		var image = $("#image"+index).attr("src");
		
// 		console.log(image);
		
		swal({
			  title: title,
			  text: content,
			  imageUrl:image,
			  imageWidth: 800,
			  imageHeight: 400,
			  imageAlt: 'Custom image',
			  confirmButtonText: '닫기'
			})
		
		
	}

	
	
	
	
function myCitation(idx,title,index,content){
		
// 		console.log(idx);
// 		console.log(title);
		var image = $("#image"+index).attr("src");
		
// 		console.log(image);
		
		var rumIdx = idx;
		
// 		console.log(rumIdx);
		
		swal({
			  title: title,
			  text: content,
			  imageUrl:image,
			  imageWidth: 800,
			  imageHeight: 400,
			  imageAlt: 'Custom image',
			  showCancelButton: true,
			  confirmButtonColor: '#FC3A3A',
			  cancelButtonColor: '#2E82CC',
			  confirmButtonText: '삭제',
			  cancelButtonText: '닫기'
			}).then((result) => {
				  if (result.value) {
						
					  $.ajax({
						  type:"get"
						  ,url : "/zaksim/challenge/challengers/delete"
						  ,data : {
							  idx:rumIdx
						  }
						  ,dataType:"text"
						  , success : function(data){
							  					  
							  document.location.href = "/zaksim/challenge/challengers";
						  }
						  , error: function(e){
							  console.log("----error----");
							  console.log(e.responseText);
						  }
					  });
					  
					  
					  
					  
				  }
				})
		
		
	}

</script>