<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
   
   	<!-- 댓글 입력 영역  -->
	<div class="container">
		<div class="row">
			<label class="col-md-1"> </label>
			<div class="col-md-10">
				<div class="card">
					<form action="/zaksim/customerCenter/QnA/comment_write" method="post">
						<div class="form-group card-header">
							<label style="font-weight: bold">${login_nick }</label>
						</div>
						<div class="form-group ">
							<input style="display: none;" name="qnaIdx" value="${view.idx}"/>
							<input type="text" class="form-control" id="boardNo"
								name="boardNo" value="${board.boardNo }" readonly=""
								hidden="true">
						</div>
						<div class="card-body">
							<div class="form-group">
								<c:choose>
									<c:when test="${login}">
										<textarea rows="3" class="form-control" id="replyContent"
											name="replyContent" placeholder="댓글을 입력해주세요."></textarea>
									</c:when>
									<c:when test="${!login || login eq null}">
										<textarea rows="3" class="form-control" id="replyContent"
											name="replyContent" placeholder="로그인 상태여야 입력 가능합니다."
											readonly=""></textarea>
									</c:when>
								</c:choose>
							</div>
							<c:if test="${sessionScope.login}">
								<button type="submit" class="btn qnaBtnColor btn-md mr-1">댓글 입력</button>
							</c:if>
						</div>
					</form>
				</div>
			</div>
			<label class="col-md-1"> </label>
		</div>
		
   <!--       댓글 목록 영역 -->
      <div style="margin-bottom: 8rem;">
         <c:forEach items="${commentList}" var="comment" varStatus="i">
         <div class="row mt-1 justify-content-center">
            <label class="col-md-1"> </label>
            <div class="col-md-10">
               <ul class="list-group">
                  <li class="list-group-item">
                     <div class="d-flex w-100 justify-content-between">
                        <div>
                        	<c:if test="${comment.depth > 0}">
                        		<img alt="" src="/resources/image/qna/arrow.png" style="width: 12px;">
                        		<strong style="color: blue; font-weight: 700 !important;">@${comment.upperIdx}</strong><br>
                        	</c:if>
                           <input style="display: none;" name="upperIdx" value="${comment.idx}"/>
                           <input style="display: none;" name="order" value="${comment.order}"/>
                           <input style="display: none;" value="${comment.writerIdx}">
                           <strong style="font-weight: 700 !important;">${comment.zakSimMember.id}</strong>
                           <small class="ml-4"><fmt:formatDate pattern = "yyyy-MM-dd" value = "${comment.writtenDate}" /></small>
                           <small><fmt:formatDate type="time" timeStyle="short" value = "${comment.writtenDate}"/></small>
                        </div>
                        
                        <div>
                           <c:if test="${sessionScope.login_idx ne null }">
                              <c:if test="${sessionScope.login_idx eq comment.writerIdx}">
                                 <small> <a href="" style="color: blue">수정</a> </small>
                                 <small class="ml-1"> <a style="color: red" onclick="deleteComment(${comment.order})">삭제</a> </small>                  
                              </c:if>
                              <small class="ml-1 mouseOver" onclick="reReplyLi(${i.count-1})" style="color: green">답댓글쓰기</small>
                           </c:if>
                        </div>
                     </div>
                     <div>
                        <p class="mb-1">${comment.content}</p>
                     </div>
                  </li>
                  
                  
                  <!-- 답댓글 -->
                  
                  <li class="list-group-item" id="reReplyLi${i.count-1}" hidden="">
                  <form>
                     <div style="margin-left: 20px; margin-right: 20px">
                        <div class="d-flex w-100 justify-content-between">
                        	<input style="display: none;" name="qnaIdx" value="${view.idx}"/>
                           <input style="display: none;" name="upperIdx" value="${comment.idx}"/>
                           <input style="display: none;" name="depth" value="${comment.depth}"/><!-- upper의 depth -->
                           <input style="display: none;" value="${comment.writerIdx}"><!-- upper의 작성자 -->
                           <p style="color: blue">@${comment.zakSimMember.id}</p>
                           <small class="ml-1 mouseOver" onclick="reReplyLiClose(${i.count-1})" style="color: gray">X</small>
                        </div>
                        <div class="form-group">
                           <textarea rows="2" class="form-control" id="reReplyContent"
                              name="content"></textarea>
                        </div>
                           <button type="button" class="btn qnaBtnColor btn-md mr-1 writeRe"><small>댓글 입력</small></button>
                     </div>
                     </form>
                  </li>
               </ul>
            </div>
            <label class="col-md-1"> </label>
         </div>
         </c:forEach>
      </div>
      
      
   </div>