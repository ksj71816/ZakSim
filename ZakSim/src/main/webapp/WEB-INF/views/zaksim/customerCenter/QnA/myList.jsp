<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../../main/header.jsp" %>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/css/customerCenter/qna_list.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
	
	<!-- body -->
	<div class="py-3">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>Q&amp;A</h1>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<label class="col-md-8"> </label>
			<div class="col-md-3">
				<div class="row justify-content-between">
					<a class="btn col-md-5 qnaBtnColor" href="/zaksim/customerCenter/QnA/write">문의하기</a>
					<a class="btn col-md-6 qnaBtnColor" href="/zaksim/customerCenter/QnA/list">전체 문의보기</a>
				</div>
			</div>
			<label class="col-md-1"> </label>
		</div>
	</div>
	<div class="py-2">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<table class="table text-center">
						<thead class="qnaColor">
							<tr>
								<th width="50">번호</th>
								<th width="300">제목</th>
								<th width="80">상태</th>
								<th width="130">작성자</th>
								<th width="150">작성일</th>
								<th width="50">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${qnaList eq null || qnaList eq '' || qnaList eq '[]' }">
								<tr>
									<td colspan="6" style="font-weight: bold">작성한 문의글이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="list" items="${qnaList }">
								<c:forEach var="listDepth" items="${listDepth }">
									<c:if test="${list.idx eq listDepth.upperIdx }">
										<c:set var="upper" value="${listDepth.upperIdx }" />
										<c:set var="idx" value="${listDepth.idx }" />
										<c:set var="secret" value="${listDepth.secret }" />
										<c:set var="title" value="${listDepth.title }" />
										<c:set var="writer" value="${listDepth.writerIdx }" />
										<c:set var="date" value="${listDepth.writtenDate }" />
										<c:set var="hit" value="${listDepth.hit }" />
									</c:if>
								</c:forEach>
								<!-- Date 포멧 설정 -->
								<jsp:useBean id="today" class="java.util.Date" />
								<fmt:formatDate value="${today }" pattern="yyyy-MM-dd"
									var="toDay" />
								<fmt:formatDate value="${list.writtenDate }" pattern="yyyy-MM-dd"
									var="writtenDate" />
								<fmt:formatDate value="${date }" pattern="yyyy-MM-dd"
									var="writtenDateDepth" />
	
								<tr>
									<!--번호 -->
									<td>${list.idx }</td>
	
									<!-- 제목 -->
									<c:if test="${list.secret eq 'private' }">
										<td class="text-left"><a
											href="/zaksim/customerCenter/QnA/view?qnaIdx=${list.idx }"
											id="aSecret">${list.title } <i class="fas fa-lock"></i></a></td>
									</c:if>
									<c:if test="${list.secret eq 'public' }">
										<td class="text-left"><a
											href="/zaksim/customerCenter/QnA/view?qnaIdx=${list.idx }">${list.title }</a></td>
									</c:if>
	
									<!-- 상태 -->
									<c:if test="${list.status eq 'ready' }">
										<td>접수 중</td>
									</c:if>
									<c:if test="${list.status eq 'complete' }">
										<td>답변 완료</td>
									</c:if>
	
									<!-- 작성자 -->
									<td>${list.writerIdx }</td>
	
									<!-- 작성일 -->
									<c:if test="${writtenDate eq toDay }">
										<td><fmt:formatDate value="${list.writtenDate }"
												pattern="HH:mm" /></td>
									</c:if>
									<c:if test="${writtenDate ne toDay }">
										<td>${writtenDate }</td>
									</c:if>
	
									<!-- 조회수 -->
									<td>${list.hit }</td>
								</tr>
	
	
								<%-- 답변이 있을 경우 --%>
								<c:if test="${list.idx eq upper}">
									<tr>
										<!--번호 -->
										<td></td>
	
										<!-- 제목 -->
										<c:if test="${secret eq 'private' }">
											<td class="text-left"><a
												href="/zaksim/customerCenter/QnA/view?qnaIdx=${idx }"
												id="aSecretDepth" style="margin-left: 10px">→ ${title } <i
													class="fas fa-lock"></i></a></td>
										</c:if>
										<c:if test="${secret eq 'public' }">
											<td class="text-left"><a
												href="/zaksim/customerCenter/QnA/view?qnaIdx=${idx }"
												style="margin-left: 10px">→ ${title }</a></td>
										</c:if>
	
										<!-- 상태 -->
										<td></td>
	
										<!-- 작성자 -->
										<td>${writer }</td>
	
										<!-- 작성일 -->
										<c:if test="${writtenDateDepth eq toDay }">
											<td><fmt:formatDate value="${date }" pattern="HH:mm" /></td>
										</c:if>
										<c:if test="${writtenDateDepth ne toDay }">
											<td>${writtenDateDepth }</td>
										</c:if>
	
										<!-- 조회수 -->
										<td>${hit }</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 페이지네이션 -->
	<jsp:include page="./paging/qnaMyPaging.jsp" />
		
	<!-- Modal -->
	<div class="modal fade" id="qnaMyListModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModal3Label">경고</h5>
				</div>
				<div class="modal-body">해당 서비스에 접근할 권한이 없습니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn qnaBtnColor" id="btnRedirectList">확인</button>
				</div>
			</div>
		</div>
	</div>

<%@ include file="../../main/footer.jsp" %>

<script type="text/javascript">
	// --- url로 통해 들어올시 로그인이 안 되어있거나 내 문의가 아닐 경우 접근 막기 ---
	var user = <%=session.getAttribute("login_idx") %>;
	var member = <%=request.getParameter("memberIdx") %>; // 내 문의보기 memberIdx
	var login = <%=session.getAttribute("login") %>;
	
	if ( login == null || !login || login == "" || user != member ) {
		// 로그인이 안 되어있거나 유저와 내 문의보기의 memberIdx가 맞지 않을 경우(내 문의가 아닐경우)
		$('#qnaMyListModal').modal({backdrop: 'static'}); // 모달 밖 영역 클릭할 수 없게 만듦.
		
		$('#btnRedirectList').click(function(){
			location.href = "/zaksim/customerCenter/QnA/list"
		});
	}
	// --------------------------------------------------------
</script>