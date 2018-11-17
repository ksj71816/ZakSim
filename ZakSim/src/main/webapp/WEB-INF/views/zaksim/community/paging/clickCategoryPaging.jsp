<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!-- pagination -->
<div> 
	<nav>
		<ul class="mb-0 pagination justify-content-center">
		
		<!-- 이전페이지 -->
		<!-- 첫 페이지라면 금지 표시 -->
		
		<c:if test="${map.paging.curPage eq 1 }" > <!-- 첫 페이지 일 때 -->
			<li class="page-item disabled">
		   		<a class="page-link" href="/zaksim/community/clickCategoryCommunity" aria-label="Previous">
		   			<span aria-hidden="true">&laquo;</span>
		   		</a>
		   	</li>
		</c:if>
		<c:if test="${map.paging.curPage ne 1 }" > <!-- 첫 페이지가 아닐 때 -->
			<li class="page-item">
		   		<a class="page-link" href="/zaksim/community/clickCategoryCommunity?category_idx=${map.idx }&curPage=${map.paging.curPage-1 }" aria-label="Previous">
		   			<span aria-hidden="true">&laquo;</span>
		   		</a>
		   	</li>
		</c:if>
		  
		  	<!-- 페이징 번호 -->
		  	
		  	<c:forEach begin="${map.paging.startPage }" end="${map.paging.endPage }" var="page">
	
			<c:if test="${map.paging.curPage eq page }">
		    	<li class="page-item active">
		    </c:if>
		    <c:if test="${map.paging.curPage ne page }">
		    	<li class="page-item">
		    </c:if>
		    		<a class="page-link" href="/zaksim/community/clickCategoryCommunity?category_idx=${map.idx }&curPage=${page }">
		    			${page }
		    		</a>
		    	
		    	
		    </c:forEach>
		   	
		   	
		 <c:if test="${map.paging.curPage eq map.paging.totalPage }" > <!-- 마지막 페이지 일 때 -->
		   	<li class="page-item disabled">
		   		<a class="page-link" href="/zaksim/community/clickCategoryCommunity?category_idx=${map.idx }&curPage=${map.paging.totalPage }" aria-label="Next">
		   			<span aria-hidden="true">&raquo;</span>
		   		</a>
		   	</li>
		 </c:if>
		 <c:if test="${map.paging.curPage ne map.paging.totalPage }" > <!-- 마지막 페이지가 아닐 때 -->
		   	<li class="page-item">
		   		<a class="page-link" href="/zaksim/community/clickCategoryCommunity?category_idx=${map.idx }&curPage=${map.paging.curPage+1 }" aria-label="Next">
		   			<span aria-hidden="true">&raquo;</span>
		   		</a>
		   	</li>
		 </c:if>
		   	
		  </ul>
	</nav>
</div> <!-- end of pagination -->
