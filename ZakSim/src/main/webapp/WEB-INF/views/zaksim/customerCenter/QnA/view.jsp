<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../../main/header.jsp" %>
<link rel="stylesheet" type="text/css"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/customerCenter/qna_view.css?ver=1">
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
								<c:if test="${fileList eq null || fileList eq '' }">
								<tr>
									<th class="table-info">파일</th>
									<td colspan="3">파일 없음</td>
								</tr>
								</c:if>
								<c:forEach var="file" items="${fileList }">
								<tr>
									<th class="table-info">파일</th>
									<td colspan="3">${file.original }</td>
								</tr>
								</c:forEach>
								<tr>
									<td colspan="4" class="text-center">
										<c:if test="${login_idx eq 1 && view.status eq 'ready' }">
										<!-- 관리자일 경우, 답변 쓰기 버튼 활성화 -->
											<input type="button" class="btn btn-secondary" id="btnQnaWrite" value="답글 쓰기" onclick="qnaWritePage()">
										</c:if>
										<c:if test="${login_idx eq view.writerIdx }">
										<!-- 작성자일 경우, 수정하기 버튼 활성화 -->
											<input type="button" class="btn btn-secondary" id="btnQnaUpdate" value="수정하기" onclick="qnaUpdatePage()">
										</c:if>
										<c:if test="${login_idx eq view.writerIdx || login_idx eq 1 }">
										<!-- 작성자나 관리자일 경우, 삭제하기 버튼 활성화 -->
											<input type="button" class="btn btn-danger" id="btnQnaDelete" value="삭제하기" onclick="qnaDeleteProcess()"> 												
										</c:if> 
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
										<c:choose>
											<c:when test="${login_idx eq 1 }">
											<!-- 관리자일 경우, 수정하기 버튼 활성화 -->
												<input type="button" class="btn btn-secondary" id="btnQnaUpdate" value="수정하기" onclick="qnaUpdatePage()"> 
											</c:when>
										</c:choose>
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

		
		<div id="recommendDiv">
			<%@include file="./recommend.jsp" %>
		</div>
		
		


<!-- Modal -->
<div class="modal fade" id="qnaViewModal" tabindex="-1" role="dialog">
   <div class="modal-dialog" role="document">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title" id="exampleModal3Label">안내</h5>
         </div>
         <div class="modal-body">이 글은 비밀글입니다. 이 글을 읽을 권리가 없습니다.</div>
         <div class="modal-footer">
            <button type="button" class="btn qnaBtnColor" id="btnRedirectList">확인</button>
         </div>
      </div>
   </div>
</div>

<%@ include file="../../main/footer.jsp" %>

<script type="text/javascript">


   var qnaIdx = <%=request.getParameter("qnaIdx") %>;
   var user = <%=session.getAttribute("login_idx") %>;

   if ( "${view.secret }" == "private"  ){
      // 비밀글일 경우, 작성자와 관리자만 읽을 수 있게끔
      if ( user != 1 && user != '${view.writerIdx}' && user !='${view.upperIdx}' ) { 
            $('#qnaViewModal').modal({backdrop: 'static'}); // 모달 밖 영역 클릭할 수 없게 만듦.
            $('#btnRedirectList').click(function(){
               location.href = "/zaksim/customerCenter/QnA/list";
            });
      }
   }
   
   // ------- 버튼 이벤트 -------
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
   
   function reReplyLi(i) {
      var hidden = $('#reReplyLi'+i).attr("hidden");
      console.log("hidden 값 : " + hidden);
      
      if ( hidden == "hidden" ) {         
         $('#reReplyLi'+i).removeAttr("hidden"); // hidden 풀기(답댓글 창 보이기)
      } else if ( hidden != "hidden" ) {
         $('#reReplyLi'+i).attr("hidden", "hidden"); // hidden 속성추가(답댓글창 닫기(숨기기))
      }
   }
   
   function reReplyLiClose(i) {
      var hidden = $('#reReplyLi'+i).attr("hidden");
      console.log("hidden 값 : " + hidden);
      $('#reReplyLi'+i).attr("hidden", "hidden"); // hidden 속성추가(답댓글창 닫기(숨기기))
   }
   
   function deleteComment(order) {
	   $.ajax({
			type: "post"
			, url : "/zaksim/customerCenter/QnA/comment_delete"
			, data : {
				order : order
			}
			, dataType: "json"
			, success: function( data ) {
				
				console.log('success');
				
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
   
   
   $("#recommendDiv").on("click", ".writeRe", function() {
	   
	   var formData = $(this).parent().parent().serialize();
	   
	   console.log(formData);
	   console.log($(this).parent().parent());
	  
	   $.ajax({
			type: "post"
			, url : "/zaksim/customerCenter/QnA/re_comment_write"
			, data : {
				formData : formData
			}
			, dataType: "html"
			, success: function( data ) {
				
				$("#recommendDiv").html(data);
				
			}
			, error: function( e ) {
				console.log("--- error ---");
				console.log( e.responseText );
			}
			, complete: function() {
				//입력 창 초기화
			}
		});	
   });

</script>