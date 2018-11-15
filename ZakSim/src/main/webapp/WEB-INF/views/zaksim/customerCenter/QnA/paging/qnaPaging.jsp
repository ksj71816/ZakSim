<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row">
	<div class="col-md- mx-auto">
		<ul class="pagination">
			<!-- 페이네이션 계산 - 한 화면에 표시될 페이지 리스트 순서(0부터) -->
 			<fmt:parseNumber var="p" integerOnly="true" value="${((paging.curPage-1)/paging.pageCount)}"/>
 			
			<!-- 이전 페이지 -->
			<c:if test="${paging.curPage eq 1}">
			<!-- 첫 페이지 리스트일 경우, 이전 페이지 아이콘 비활성화 -->
				<li class="page-item disabled">
					<a class="page-link" href="">
						<span>«</span> <span class="sr-only">Previous</span>
					</a>
				</li>
			</c:if>
			<c:if test="${paging.curPage ne 1}">
			<!-- 첫 페이지 리스트가 아닐 경우, 이전 페이지 아이콘 활성화 -->
				<li>
					<c:if test="${p eq 0 }">
						<fmt:parseNumber var="prevPage" integerOnly="true" value="${paging.curPage-1}"></fmt:parseNumber>
					</c:if>
					<c:if test="${p ne 0 }">					
						<fmt:parseNumber var="prevPage" integerOnly="true" value="${(p-1)*paging.pageCount+1}"></fmt:parseNumber>
					</c:if>
					<a class="page-link" href="/zaksim/customerCenter/QnA/list?curPage=${prevPage }">
						<span>«</span> <span class="sr-only">Previous</span>
					</a>
				</li>
			</c:if>
			
			
			<!-- 페이징 번호 -->
			<c:forEach var="page" begin="${paging.startPage }" end="${paging.endPage }">
				<c:if test="${paging.curPage eq page }">
					<li class="page-item active">
						<a class="page-link" href="/zaksim/customerCenter/QnA/list?curPage=${page }">${page }</a>
					</li>
				</c:if>
				<c:if test="${paging.curPage ne page }">
					<li><a class="page-link" href="/zaksim/customerCenter/QnA/list?curPage=${page }">${page }</a></li>
				</c:if>
			</c:forEach>
			
			
			<!-- 다음 페이지 -->
			<c:if test="${paging.curPage eq paging.totalPage }">
			<!-- 마지막 페이지일 경우, 다음 페이지 아이콘 비활성화 --> 
				<li class="disabled">
					<a class="page-link" href="">
						<span>»</span> <span class="sr-only">Next</span>
					</a>
				</li>
			</c:if>
			<c:if test="${paging.curPage ne paging.totalPage }">
			<!-- 마지막 페이지가 아닐 경우, 다음 페이지 아이콘 활성화 -->
				<li>
				<fmt:parseNumber var="t" integerOnly="true" value="${(paging.totalPage/paging.pageCount)}"/>
					<c:if test="${t eq p }">
						<fmt:parseNumber var="nextPage" integerOnly="true" value="${paging.curPage+1 }" />
					</c:if>
					<c:if test="${t ne p }">
						<fmt:parseNumber var="nextPage" integerOnly="true" value="${(p+1)*paging.pageCount+1 }" />
					</c:if>
					<a class="page-link" href="/zaksim/customerCenter/QnA/list?curPage=${nextPage }">
						<span>»</span> <span class="sr-only">Next</span>
					</a>
				</li>
			</c:if>
		</ul>
	</div>
</div>