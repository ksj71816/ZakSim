<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../../main/header.jsp" %>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/customerCenter/qna_view.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">

	<!-- body -->
	<div class="py-3">
		<div class="container">
			<div class="row">
				<label class="col-md-1"> </label>
				<div class="col-md-11">
					<h1>Q&amp;A</h1>
				</div>
			</div>
		</div>
	</div>
	<div class="py-2">
		<div class="container">
			<div class="row">
				<label class="col-md-1"> </label>
				<div class="col-md-10">
					<div class="table table-responsive">
						<table class="table">
						<c:choose>
							<c:when test="${view.upperIdx eq 0 }">
							<tbody>
								<tr>
									<th class="qnaColor">글번호</th>
									<td>${view.idx }</td>
									<th class="qnaColor">조회수</th>
									<td>${view.hit }</td>
								</tr>
								<tr>
									<th class="qnaColor">작성자</th>
									<td>${view.writerIdx }</td>
									<th class="qnaColor">작성일</th>
									<td><fmt:formatDate value="${view.writtenDate }" pattern="yyyy-MM-dd HH:mm"/></td>
								</tr>
								<tr>
									<th class="qnaColor">제목</th>
									<c:if test="${view.secret eq 'private' }">
										<td>${view.title } <i class="fas fa-lock"></i></td>
									</c:if>
									<c:if test="${view.secret eq 'public' }">
										<td>${view.title }</td>
									</c:if>
									<th class="qnaColor">상태</th>
									<c:if test="${view.status eq 'ready' }">									
										<td>접수 중</td>
									</c:if>
									<c:if test="${view.status eq 'complete' }">									
										<td>답변 완료</td>
									</c:if>
								</tr>
								<tr style="height: 500px">
									<th class="qnaColor">글 내용</th>
									<td colspan="3">${view.content }</td>
								</tr>
								<tr>
									<th class="table-info">파일</th>
									<td colspan="3">파일이 없음</td>
								</tr>
								<tr>
									<td colspan="4" class="text-center">
										<input type="button" class="btn btn-secondary" id="btnQnaWrite" value="답글 쓰기" onclick="qnaWritePage()">
										<input type="button" class="btn btn-secondary" id="btnQnaUpdate" value="수정하기" onclick="qnaUpdatePage()"> 
										<input type="button" class="btn btn-danger" id="btnQnaDelete" value="삭제하기" onclick="qnaDeleteProcess()"> 
										<input type="button" class="btn qnaBtnColor" id = btnQnaList value="목록보기" onclick="qnaListPage()">
									</td>
								</tr>
							</tbody>
							</c:when>
							
							<c:when test="${view.upperIdx ne 0 }">
							<!-- 답변 글일 경우 -->
							<tbody>
								<tr>
									<th class="qnaColor">글번호</th>
									<td>${view.idx }</td>
									<th class="qnaColor">조회수</th>
									<td>${view.hit }</td>
								</tr>
								<tr>
									<th class="qnaColor">작성자</th>
									<td>${view.writerIdx }</td>
									<th class="qnaColor">작성일</th>
									<td><fmt:formatDate value="${view.writtenDate }" pattern="yyyy-MM-dd HH:mm"/></td>
								</tr>
								<tr>
									<th class="qnaColor">제목</th>
									<c:if test="${view.secret eq 'private' }">
										<td>${view.title } <i class="fas fa-lock"></i></td>
									</c:if>
									<c:if test="${view.secret eq 'public' }">
										<td>${view.title }</td>
									</c:if>
									<th class="qnaColor">문의글</th>
									<td><a href="/zaksim/customerCenter/QnA/view?qnaIdx=${view.upperIdx }">${view.upperIdx }</a></td>
								</tr>
								<tr style="height: 500px">
									<th class="qnaColor">글 내용</th>
									<td colspan="3">${view.content }</td>
								</tr>
								<tr>
									<td colspan="4" class="text-center">
										<input type="button" class="btn btn-secondary" id="btnQnaWrite" value="답글 쓰기" onclick="qnaWritePage()">
										<input type="button" class="btn btn-secondary" id="btnQnaUpdate" value="수정하기" onclick="qnaUpdatePage()"> 
										<input type="button" class="btn btn-danger" id="btnQnaDelete" value="삭제하기" onclick="qnaDeleteProcess()"> 
										<input type="button" class="btn qnaBtnColor" id = btnQnaList value="목록보기" onclick="qnaListPage()">
									</td>
								</tr>
							</tbody>
							</c:when>
						</c:choose>
						</table>
					</div>
				</div>
				<label class="col-md-1"> </label>
			</div>
		</div>
	</div>
	<!-- 댓글 입력 영역  -->
<!-- 	<div class="container"> -->
<!-- 		<div class="row"> -->
<!-- 			<label class="col-md-1"> </label> -->
<!-- 			<div class="col-md-10"> -->
<!-- 				<div class="card"> -->
<!-- 					<form action="/reply/reply.do" method="post"> -->
<!-- 						<div class="form-group card-header"> -->
<%-- 							<label style="font-weight: bold">${login_nick }</label> --%>
<!-- 						</div> -->
<!-- 						<div class="form-group "> -->
<!-- 							<input type="text" class="form-control" id="boardNo" -->
<%-- 								name="boardNo" value="${board.boardNo }" readonly="" --%>
<!-- 								hidden="true"> -->
<!-- 						</div> -->
<!-- 						<div class="card-body"> -->
<!-- 							<div class="form-group"> -->
<!-- 								login 체크하여 댓글 입력창 활성화 및 비활성화 -->
<%-- 								<c:choose> --%>
<%-- 									로그인 상태 --%>
<%-- 									<c:when test="${login}"> --%>
<!-- 										<textarea rows="3" class="form-control" id="replyContent" -->
<!-- 											name="replyContent" placeholder="댓글을 입력해주세요."></textarea> -->
<%-- 									</c:when> --%>
<%-- 									비로그인 상태 --%>
<%-- 									<c:when test="${!login || login eq null}"> --%>
<!-- 										<textarea rows="3" class="form-control" id="replyContent" -->
<!-- 											name="replyContent" placeholder="로그인 상태여야 입력 가능합니다." -->
<!-- 											readonly=""></textarea> -->
<%-- 									</c:when> --%>
<%-- 								</c:choose> --%>
<!-- 							</div> -->
<!-- 							<button type="button" class="btn qnaBtnColor  btn-md mr-1">댓글 입력</button> -->
<!-- 						</div> -->
<!-- 					</form> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<label class="col-md-1"> </label> -->
<!-- 		</div> -->
		<!-- 댓글 목록 영역 -->
<!-- 		<div class="row mt-3 justify-content-center"> -->
<!-- 			<label class="col-md-1"> </label> -->
<!-- 			<div class="col-md-10"> -->
<!-- 				<ul class="list-group"> -->
<%-- 					<c:foreach items="" var=""> --%>
<!-- 						<li class="list-group-item"> -->
<!-- 							<div class="d-flex w-100 justify-contents-between"> -->
<!-- 								<p style="font-weight: bold">암욜맨</p> -->
<!-- 								<small>&nbsp; 16:22 &nbsp; </small> -->
<!-- 								<small> <a href="" style="color: blue">수정</a> </small> -->
<!-- 								&nbsp; -->
<!-- 								모든 댓글은 관리자가 삭제할 수 있게끔 설정 -->
<!-- 								<small> <a href="" style="color: red">삭제</a> </small> -->
<!-- 								&nbsp;  -->
<!-- 								<small> <a href="" style="color: green">답댓글쓰기</a> </small> -->
<!-- 							</div> -->
<!-- 							<div> -->
<!-- 								<p class="mb-1">댓글 내용!</p> -->
<!-- 							</div> -->
<!-- 						</li> -->
<%-- 					</c:foreach> --%>
<!-- 				</ul> -->
<!-- 			</div> -->
<!-- 			<label class="col-md-1"> </label> -->
<!-- 		</div> -->
<!-- 	</div> -->

<%@ include file="../../main/footer.jsp" %>

<script type="text/javascript">
	document.getElementById("btnQnaList").onclick = function(){qnaListPage()};
	document.getElementById("btnQnaWrite").onclick = function(){qnaWritePage()};
	document.getElementById("btnQnaUpdate").onclick = function(){qnaUpdatePage()};

	var qnaIdx = <%=request.getParameter("qnaIdx") %>;
		
	function qnaListPage(){
		var curPage = <%=session.getAttribute("curPage") %>;
		if (curPage == "" || curPage == null) {
			curPage = 1;
			location.href = "/zaksim/customerCenter/QnA/list?curPage=" + curPage;
		} else {
			location.href = "/zaksim/customerCenter/QnA/list?curPage=" + curPage;			
		}
	}
	
	function qnaWritePage(){
		console.log("답변할 문의글 인덱스 : " + qnaIdx);
		
		location.href = "/zaksim/customerCenter/QnA/write?upperIdx=" + qnaIdx;
	}	
	
	function qnaUpdatePage(){
		console.log("수정할 문의글(답변) 인덱스 : " + qnaIdx);
		
		location.href = "/zaksim/customerCenter/QnA/update?qnaIdx=" + qnaIdx;
	}
	
	function qnaDeleteProcess() {
		console.log("삭제할 문의글(답변) 인덱스 : " + qnaIdx);
		
		location.href = "/zaksim/customerCenter/QnA/delete?qnaIdx=" + qnaIdx;
	}
</script>