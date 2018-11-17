<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- header include -->
<%@include file="/WEB-INF/views/zaksim/main/header.jsp" %>
<link rel="stylesheet" type="text/css" href="/css/mypage/mypage.css">
<link rel="stylesheet" type="text/css" href="/css/main/image_hover.css">


	<div class="py-5 text-center" style="min-height: 700px;">
	    <div class="container">
	    
	    
	    <div class="row mt-5"><!-- third row start -->

	       	  <div class="col-md-2">
	       	  	<div>
	       	  		<h4 class="dohyeon title">${endChal.title}</h4>
	       	  	</div>
	       	  </div>
	       	  
	       	   <div class="col-md-10">
			 	<hr class="mBorder-sub">
			 </div>
		   </div><!-- third row end -->
		   
		   
		   
		   
		   
	       <div class="row mt-3"><!-- forth row start -->

	       
	       <c:if test="${boardList ne null && boardList ne '' }">
	       	<c:forEach items="${boardList}" var="board">
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
	       	
	       	
	       	
       	</div>
       	
  </div>
  
 	 <!-- footer include -->
<%@include file="/WEB-INF/views/zaksim/main/footer.jsp" %>




<!-- alert 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.28.12/sweetalert2.all.js"></script>
<script type="text/javascript">
  
  
  function viewCitation(idx,image,content) {
	  
	  console.log(image);

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
	       