<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

        <c:forEach items="${commentList}" var="comment" varStatus="i">
         <div class="row mt-1 justify-content-center mx-3">
            <label class="col-md-1"> </label>
            <div class="col-md-10">
               <ul class="list-group">
                  <li class="list-group-item">
                     <div class="d-flex w-100 justify-content-between">
                        <div>
                        	<c:if test="${comment.depth > 0}">
                        		<img alt="" src="/resources/image/qna/arrow.png" style="width: 12px;">
                        		<strong style="color: blue; font-weight: 700 !important;">@${comment.upperId}</strong><br>
                        	</c:if>
                           <input style="display: none;" name="upperIdx" value="${comment.idx}"/>
                           <input style="display: none;" name="order" value="${comment.order}"/>
                           <input style="display: none;" value="${comment.writer_idx}">
                           <strong style="font-weight: 700 !important;">${comment.zakSimMember.id}</strong>
                           <small class="ml-4"><fmt:formatDate pattern = "yyyy-MM-dd" value = "${comment.written_date}" /></small>
                           <small><fmt:formatDate type="time" timeStyle="short" value = "${comment.written_date}"/></small>
                        </div>
                        
                        <div>
                           <c:if test="${sessionScope.login_idx ne null }">
                              <c:if test="${sessionScope.login_idx eq comment.writer_idx}">
                                 <small class="mouseOver" style="color: blue" onclick="reReplyUpdate(${i.count-1})">수정</small>
                                 <small class="ml-1"> <a style="color: red" onclick="deleteComment(${board.idx}, ${comment.order})">삭제</a> </small>                  
                              </c:if>
                              <small class="ml-1 mouseOver" onclick="reReplyLi(${i.count-1})" style="color: green">답댓글쓰기</small>
                           </c:if>
                        </div>
                     </div>
                     <div>
                        <p class="mb-1">${comment.content}</p>
                     </div>
                  </li>
                  
                  
<!--                   답댓글 작성 -->
                  
                  <li class="list-group-item" id="reReplyLi${i.count-1}" hidden="">
                  <form>
                     <div style="margin-left: 20px; margin-right: 20px">
                        <div class="d-flex w-100 justify-content-between">
                        	<input style="display: none;" name="qnaIdx" value="${view.idx}"/>
                           <input style="display: none;" name="upperIdx" value="${comment.idx}"/>
                           <input style="display: none;" name="depth" value="${comment.depth}"/><!-- upper의 depth -->
                           <input style="display: none;" value="${comment.writer_idx}"><!-- upper의 작성자 -->
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
                  
<!--                   수정용 폼 -->
                  <li class="list-group-item" id="reReplyUpdate${i.count-1}" hidden="">
                  <form>
                     <div style="margin-left: 20px; margin-right: 20px">
                        <div class="d-flex w-100 justify-content-between">
                        	<input style="display: none;" name="qnaIdx" value="${view.idx}"/>
                           <input style="display: none;" name="idx" value="${comment.idx}"/>
                           <input style="display: none;" name="depth" value="${comment.depth}"/><!-- upper의 depth -->
                           <input style="display: none;" value="${comment.writer_idx}"><!-- upper의 작성자 -->
                           <p style="color: blue">@${comment.zakSimMember.id}</p>
                           <small class="ml-1 mouseOver" onclick="reReplyUpdateClose(${i.count-1})" style="color: gray">X</small>
                        </div>
                        <div class="form-group">
                           <textarea rows="2" class="form-control" id="content"
                              name="content">${comment.content}</textarea>
                        </div>
                           <button type="button" class="btn qnaBtnColor btn-md mr-1 updateRe"><small>댓글 수정</small></button>
                     </div>
                     </form>
                  </li>
                  
               </ul>
            </div>
            <label class="col-md-1"> </label>
         </div>
         </c:forEach>