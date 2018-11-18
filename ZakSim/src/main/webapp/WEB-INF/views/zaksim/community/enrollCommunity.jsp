<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- header include -->
<%@include file="/WEB-INF/views/zaksim/main/header.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/community/button.css">
<link rel="stylesheet" type="text/css" href="/css/community/enrollCommunity.css">


<div class="container mt-5">
	<div class="row mt-5">
		<div class="col"></div>
		<c:forEach var="groupInfo" items="${groupInfo }">
			
			<input type="hidden" id ="idxx"value="${groupInfo.idx }">

			<div class="col-sm-11 clearfix" style="margin-right: 50px;" id="btnDiv">
				<strong class="zaksim-title pl-2" style="font-size: 2em;">${groupInfo.title }</strong>
				<div style="float:right;">
					<c:if test="${ groupInfo.member_idx eq sessionScope.login_idx}">
						<button type="button" class="btn btn-outline-danger ml-1" style="" data-toggle="modal" data-target="#updateCommunityModal">수정하기</button>
					</c:if>
					<% boolean memberFlag = false; %>
					<c:forEach items="${groupMember }" var="member">
						<c:if test="${member.idx eq sessionScope.login_idx }">
							<% memberFlag = true; %>
							<c:if test="${groupInfo.member_idx ne sessionScope.login_idx }">
								<button type="button" class="btn btn-link" id="withdraw"><small style="vertical-align: -webkit-baseline-middle; color:gray;">&gt;탈퇴하기</small></button>
						    </c:if>
						</c:if>
					</c:forEach>
				
				</div>
				<c:if test="${ null ne sessionScope.login_idx}">
					<c:if test="<%=!memberFlag%>">
						<button type="button" class="btn btn-outline-info ml-2" style="float: right; color: red; border-color: red;" data-toggle="modal" data-target="#updateCommunityModal">
							가입하기
						</button>
					</c:if>
					<c:if test="${like }">
						<button type="button" class="btn btn-outline-info noBtnRecommend ml-1" style="float: right;" id="recommendBtn">
				          	좋아요 취소&nbsp; ${groupLike.likeNum }
						</button>
					</c:if>
					<c:if test="${!like }">
						<button type="button" class="btn btn-outline-success btnRecommend ml-1" style="float: right;" id="recommendBtn">
							좋아요 &nbsp; ${groupLike.likeNum }
						</button>
					</c:if>					   
				</c:if>				
				<div class="dohyeon" style="margin-top: 100px;">

					<div style="margin-left: 50px; margin-right: 50px;">
						<c:if test="${groupInfo.storedName ne null && groupInfo.storedName ne ''}">
				   			<img src="${groupInfo.storedName }" id="photo">               	
						</c:if>
					</div>
					<div style="margin-top: 40px; margin-left: 190px; margin-right: 190px;">
						<div style="margin-bottom: 20px; text-align:center;">
							<strong style="font-size: 150%; margin-left: 30px; margin-right: 30px; cursor: pointer;"
							   id="communityIntroduce">모임 소개</strong>    
							<strong style="font-size: 150%; margin-left: 30px; margin-right: 30px; cursor: pointer;"
							   id="communityJoinPeople">참여자 </strong> 
							<strong style="font-size: 150%; margin-left: 30px; margin-right: 30px; cursor: pointer;"
							   id="communityKeyword">키워드 </strong> 
<!-- 							<strong style="font-size: 150%; margin-left: 30px; margin-right: 30px; cursor: pointer;" -->
<!-- 							   id="communityAchievement">모임 달성도 </strong> -->
                 		</div>
                 
						<div style="margin-left: 50px; margin-right: 50px; margin-bottom: 50px; display: none;" id="communityIntroduceComment">
							${groupInfo.content }
						</div>
						<div style="margin-left: 50px; margin-right: 50px; margin-bottom: 50px; display: none;" id="communityJoinPeopleComment">
							<span style="font-size: 150%;">${cntMember}명 </span> 
							<span style="font-size: 150%;">/ ${groupInfo.max}명</span>
							<br>
							<c:forEach items="${groupMember}" var="member">
								<span style="margin-right:3px;">${member.nick }</span>
							</c:forEach>
						</div>

						<div style="margin-left: 50px; margin-right: 50px; margin-bottom: 50px; display: none;" id="communityKeywordComment">
							<span> 
								<c:forEach var="keywordList" items="${keywordList }">
							       	<c:if test="${groupInfo.idx eq keywordList.group_idx}">
										#${keywordList.keyword } 
									</c:if>
								</c:forEach>
							</span>
						</div>

<!-- 						<div style="margin-left: 50px; margin-right: 50px; margin-bottom: 50px; display: none;" id="communityAchievementComment"> -->
						
<!-- 							<button type="button" class="btn btn-outline-danger" id="detailView">자세히 보기</button> -->
<!-- 							<br><br> -->
<!-- 							<div class="progress"> -->
<!-- 								<div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="" aria-valuemin="0" aria-valuemax="100">25%</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
					</div>
				</div>
			</div><!-- end of col-11 -->
       	</c:forEach>
	</div><!-- end of row -->

	<hr style="margin-top: 10px; margin-bottom: 30px; border-color: indianred;">
	<div style="margin-bottom: 100px;">
		<c:forEach items="${groupMember }" var="member">
			<c:if test="${member.idx eq sessionScope.login_idx }">
				<button type="button" class="btn btn-outline-secondary" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample" style="float: right; margin-right: 30px;">
					작성하기
				</button>
			</c:if>
		</c:forEach>
	</div>
	<br>

	<div class="collapse" id="collapseExample" style="margin-left: 150px; margin-right: 150px; margin-bottom: 50px;">
		<div class="card card-body">
			<form id="boardForm" action="/zaksim/community/enrollBoard" method="post" enctype="multipart/form-data">
				<div>
					<div class="form-group">
						<input type="hidden" class="idxxx" name ="group_idx">
						<label for="recipient-name" class="form-control-label"><strong>게시글을 작성하세요</strong></label>
						<br>
						<div class="form-inline" style="margin-left: auto; margin-right: auto;">
							<div class="radio" style="margin-left: 200px; margin-right: 100px; display: none;">
								<label>
									<input type="radio" name="certification" class="textKind" value=0 checked> 일반 글
                                   </label>
							</div>
<!-- 							<div class="radio"> -->
<!-- 								<label> -->
<!-- 									<input type="radio" name="certification" class="textKind" value=1> 인증 글 -->
<!-- 								</label> -->
<!-- 							</div> -->
							<div class="custom-file" style="text-align: left;">
								<input class="custom-file-input" type="file" name="file" id="filee"/>
								<label class="custom-file-label" for="customFile">Choose file</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="board-text1" class="form-control-label" ><strong>Content:</strong></label>
						<textarea class="form-control" id="board-text1" name="content" onkeydown="boardCommnet(this)" onkeyup="boardCommnet(this)"></textarea>
					</div>
				</div><!-- end of form-group -->
				<div style="float: right;">
					<button type="submit" class="btn btn-danger" id="enrollBoardBtn">등록</button>
                       <button type="reset" class="btn btn-secondary" data-dismiss="modal">초기화</button>
				</div>
			</form><!-- end of form -->
		</div><!-- end of card body -->
	</div><!-- end of collapse  -->

<!-- 게시글 -->
	<c:forEach items="${boardList}" var="board">
		<div class="card mb-5" style="margin-left: 150px; margin-right: 150px;">
			<div class="ml-4 mr-4">
				<div class="row">
					<div class="col-md-10">
						<h4 class="card-title mt-4" style="font-family: Dohyeon;">${board.zakSimMember.nick}</h4>
					</div>
					<div class="col-md-2 align-self-center" style="text-align: right;">
						<c:if test="${sessionScope.login_idx eq board.writer_idx }">
							<small style="text-decoration: underline;">
								<a style="color: red !important;" href="/zaksim/community/deleteBoard?group_idx=${groupInfo[0].idx}&idx=${board.idx}">삭제</a>
							</small>
						</c:if>
						<c:if test="${board.writer_idx ne sessionScope.login_idx }">
						<small style="color: blue; cursor:pointer; text-decoration: underline;" onclick="report(${board.idx}, ${board.writer_idx});">신고</small>
						</c:if>
					</div>
				</div>
				<hr class="m-0">
				<p class="card-text mt-4">${board.content}</p>
				<p class="card-text mb-3">
				   <small class="text-muted"><fmt:formatDate pattern = "yyyy-MM-dd" value = "${board.written_date}" /></small>
				</p>
			</div>      
			<!-- 인증 사진 -->
			<c:if test="${board.storedName ne null && board.storedName ne ''}">
			    <img class="card-img-bottom" src="${board.storedName}" alt="Image...">                  
			</c:if>
		</div>
	</c:forEach>
	<div class="col" style="margin-bottom: 300px;"></div>
</div><!-- end of zz -->

<!-- 위로가기 버튼 -->
<div class="top-button">
   <a href=""><img id="upImg" src="/resources/image/community/위로.png" style="width: 50px; height: 50px;"></a>
</div>

<!-- footer include -->
<%@include file="/WEB-INF/views/zaksim/main/footer.jsp"%>

<!-- 신고 모달 -->
<div class="modal fade" id="reportModal" tabindex="-1" role="dialog"
   aria-labelledby="reportModalLabel" aria-hidden="true">
   <div class="modal-dialog" role="document">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">
               <strong>신고하기</strong>
            </h5>
            <button type="button" class="close" data-dismiss="modal"
               aria-label="Close">
               <span aria-hidden="true">&times;</span>
            </button>
         </div>
         <div class="modal-body">
            <div class="mx-3">
               <div>
                  <span><strong>작성자 : </strong></span> <span> ${sessionScope.login_nick }</span>
               </div>


               <hr>
               
               <div>
               	<strong style="color: red;" id="reportError"></strong>
               </div>

               <div>
                  <span><strong>사유선택 : </strong></span> <span
                     style="color: lightgray; font-size: 12px;">
                     여러 사유에 해당하는 경우, 대표적인 사유 1개를 선택해주세요</span>
               </div>
               <br>
               <div class="radio" style="margin-left: 80px;">
                  <input type="radio" name="category" value="부적절한 홍보 게시글" checked="checked"> 부적절한 홍보 게시글 <br> <input
                     type="radio" name="category" value="음란성 또는 청소년에게 부적합한 내용"> 음란성 또는 청소년에게 부적합한 내용 <br>
                  <input type="radio" name="category" value="명예회손 / 사생활 침해 저작권침해 등"> 명예회손 / 사생활 침해 저작권침해 등 <br>
                  <input type="radio" name="category" value="기타"> 기타

               </div>
               <div class="mt-4">
               	<textarea rows="5" cols="65" id="reason"></textarea>
               </div>
               <div>
               	<input type="text" id="boardIdx" style="display: none;"/>
               	<input type="text" id="memberIdx" style="display: none;"/>
               </div>
            </div>
         </div>
         <div class="modal-footer">
            <div>
               <button type="button" class="btn btn-danger" id="reportBtn">신고하기</button>
               <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
            </div>
         </div>
      </div>
   </div>
</div>



<!-- 커뮤니티 수정 모달 -->
<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" id="updateCommunityModal" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<form id="form1" action="/zaksim/community/updateCommunity" method="post" runat="server" enctype="multipart/form-data" onsubmit="return update();">
				<c:forEach var="groupInfo" items="${groupInfo }">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel" style="font-size: 30px;">
							<strong>모임 수정하기</strong>
						</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div><!-- end of modal header -->
					<!-- 모달 바디-->
					<div class="modal-body">
						<div class="container">
							<div class="row">
                        		<div class="col-sm-2"></div>
                        		<div class="">
									<div class="form-inline">
                           				<div>
											<input type="hidden" name="idx" value="${groupInfo.idx }" /> 
											<img id="image" src="${groupInfo.storedName }" alt="..." class="img-thumbnail" style="width: 200px; height: 150px; margin-bottom: 10px;">
											<br>
											<div class="imgInp btn btn-primary" style="position: relative; overflow: hidden; padding-right: 17px; margin-left: 40px;">
												<b>이미지 변경</b> 
												<input type="file" id="imgInp" name="file" value="${groupInfo.storedName }" style="align-content: center; margin-left: 40px; position: absolute; font-size: 0px; opacity: 0; right: 0; top: 0; cursor: pointer; height: 36px; width: 100px;"/>
											</div>
											<input type="hidden" name="image" value="${groupInfo.storedName }" />
										</div>
										<div style="padding-bottom: 0px; margin-left: 50px;">
											<span style="font-size: 20px;">
											<strong>모임명 :</strong></span> 
											<input class="form-control" type="text" style="height: 30px;" name="title" maxlength="20" id="commName" value="${groupInfo.title }"/>
											<br> <br>
											<span style="font-size: 20px;"><strong>최대 모임 인원 : </strong></span> 
											<input class="form-control" type="number" style="width: 80px; height: 30px;" value="${groupInfo.max }" min="1" id="commMax" max="100" name="max"/>
											<strong>명</strong>
											<br>
											<span style="margin-left: 50px; font-size: 15px; color: gray;">※ 최대 100명까지 가능</span>
										</div>
									</div><!-- end of form-inline -->
									<div style="margin-top: 30px;">
										<span style="margin-left: 50px; margin-right: 102px;"><strong>공개</strong></span>
										<input type="radio" name="secret" id="screctRadio1" value=0 <c:if test="${groupInfo.secret==0}">checked="checked"</c:if> />
										<label> 공개</label>
										<input type="radio" style="margin-left: 100px;" id="screctRadio2" name="secret" value=1 <c:if test="${groupInfo.secret==1}">checked="checked"</c:if> />
										<label> 비공개</label>
										<br> <br>
										
										<!-- 기존 비밀번호가 존재 시 -->
										<c:if test="${groupInfo.secret==1}">
											<div style="margin-left: 30px; margin-right: 30px;">
												<div class="screctRadio" style="vertical-align: top;">
													<div class="card-body">
														<div class="form-inline">
															<span><strong>기존 비밀번호</strong></span> 
															<input type="password" class="form-control" style="margin-left: 37px;" id="pass">
														</div>
														<span style="margin-left: 140px; display: none;" id="passComment" onkeypress="isSame(${groupInfo.idx})"></span>
													</div>
												</div>
											</div>
										</c:if>

										<div style="margin-left: 30px; margin-right: 30px;">
											<div class="screctRadio" style="vertical-align: top;">
												<div class="card-body">
													<div class="form-inline">
														<span><strong>새로운 비밀번호</strong></span> 
														<input type="password" class="form-control" style="margin-left: 22px;" id="password1" name="password1">
													</div>
													<span style="margin-left: 140px; display: none;" id="pass1Comment"></span>
												</div>
											</div>
										</div>

										<div style="margin-left: 30px; margin-right: 30px;">
											<div class="screctRadio" style="vertical-align: top;">
												<div class="card-body">
													<div class="form-inline">
														<span><strong>비밀번호 확인</strong></span> 
														<input type="password" name="password2" class="form-control" id="password2" style="margin-left: 37px;">
													</div>
													<span style="margin-left: 140px; display: none;" id="pass2Comment"></span> 
													<br>
												</div>
											</div>
										</div>

										<span style="margin-left: 50px; margin-right: 70px;"><strong>카테고리</strong></span>
										<select name="category_idx" class="custom-select mb-2 mr-sm-2 mb-sm-0" style="height: 40px; width: 150px;">
											<c:set var="catego" value="${groupInfo.idx}" />
											<option value=1>운동</option>
											<option value=2 <c:if test="${catego eq 2}">selected</c:if>>금연</option>
											<option value=3 <c:if test="${catego eq 3}">selected</c:if>>다이어트</option>
											<option value=4 <c:if test="${catego eq 4}">selected</c:if>>스터디</option>
											<option value=5 <c:if test="${catego eq 5}">selected</c:if>>도서</option>
										</select> 
										<br> <br>
										<div class="form-inline">
										   <span style="margin-left: 50px; margin-right: 90px;"><strong>키워드</strong></span>
										
										   <input type="text" class="form-control" style="width: 300px;" name="keyword" id="keyword" placeholder="ex) #키워드1#키워드2" onkeyup="this.value=this.value.replace(/[^#0-9가-힣a-zA-Z]/g,'')"/>
										</div>
										<br>
										<div class="form-inline">
											<span style="margin-left: 50px; margin-right: 90px;"><strong>소개글</strong></span>
											<br>
											<textarea class="form-control" name="content" id="contentText" onkeydown="boardCommnet(this)" style="width: 300px; margin-bottom: 20px;"
										      onkeyup="boardCommnet(this)" placeholder="내용을 입력하세요">
												${groupInfo.content}
											</textarea>
										</div>
									</div>
									<div class="col-sm-1"></div> 
								</div><!-- end of class="" -->
							</div><!-- end of row -->
						</div><!-- end of container  -->
					</div><!-- modal body -->

					<div class="modal-footer">
						<input type="submit" class="btn btn-danger" id="update" value="수정" />
						<button type="reset" class="btn btn-secondary" onclick="updateCancel()">취소</button>
						<button type="button" class="btn btn-success" onclick="deleteCommnunity(${groupInfo.idx})">삭제</button>
					</div><!-- end of modal-footer -->
				</c:forEach>
			</form>
		</div>
	</div>
</div>

<!-- <script type="text/javascript" -->
<!--    src="http://code.jquery.com/jquery-3.3.1.min.js"></script> -->
<!-- jQuery Form Plugin -->
<script src="http://malsup.github.com/min/jquery.form.min.js"></script> 
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.28.12/sweetalert2.all.js"></script>

<script type="text/javascript">
   $(function() {
      $("#imgInp").on('change', function() {
         readURL(this);
      });
   });

   function readURL(input) {
      if (input.files && input.files[0]) {
         var reader = new FileReader();
         reader.onload = function(e) {
            $('#image').attr('src', e.target.result);
         }
         reader.readAsDataURL(input.files[0]);
      }
   }

   function content(obj) {
      obj.style.height = "1px";
      obj.style.height = (12 + obj.scrollHeight) + "px";
   }
</script>

<script type="text/javascript">
$(document).ready(function() {
	$("button#withdraw").on('click', function(){
		
	       swal({
	           type: 'success',
	           title: 'success ! ',
	           text: '삭제 되었습니다.'
	        }).then((result) => {
				  if (result.value) {
					  document.location.href = "/zaksim/community/deleteCommunity?idx="+obj;
					  }
					});
	       
	       swal({
	    	   title: 'Are you sure?',
	    	   text: "탈퇴 하시겠어요 ??",
	    	   type: 'warning',
	    	   showCancelButton: true,
	    	   confirmButtonColor: '#3085d6',
	    	   cancelButtonColor: '#d33',
	    	   confirmButtonText: 'Yes, delete it!'
	    	 }).then((result) => {
	    	   if (result.value) {
	    		   
	    		
	    		   
	    		   swal({
	    			   position: 'top-end',
	    			   type: 'success',
	    			   title: '다음에 또 만나요 ~',
	    			   showConfirmButton: false,
	    			   timer: 2500
	    			 });
	    		   
	    		   setTimeout(function(){ 
	    			   var $withdraw = $("<form>").attr("id","withdrawForm").attr("action","/zaksim/community/outCommunity").attr("method", "post");
			  			$withdraw.append("<input type='text' name='group_idx' value='"+${param.idx}+"'/>");
			  			$("body").append($withdraw);
			  			$('#withdrawForm').submit();	
	    			   }, 1500);
	    		  	
	    		   

	    	   }
	    	 })
		
		
//		if(confirm("정말로 그룹을 탈퇴 하시겠습니까?")){ 
// 			var $withdraw = $("<form>").attr("id","withdrawForm").attr("action","/zaksim/community/outCommunity").attr("method", "post");
// 			$withdraw.append("<input type='text' name='group_idx' value='"+${param.idx}+"'/>");
// 			$("body").append($withdraw);
// 			$('#withdrawForm').submit();
// 		}
	}); 
//    $("#enrollBoardBtn").click(function() {
//       var radioVal = $('input[name="certification"]:checked').val();
//       var file = $("#filee").val();
//       var boardContent = $("#board-text1").val();
      
//       var idx = $("#idxx").val();
      
      
//       console.log('라디오 값 : ' + radioVal);
//       console.log('파일 : '+ file);
//       console.log("게시 글  : "+ boardContent);
      
//       $(".idxxx").attr({
//          value : idx
//       });
      
//       if(radioVal == 1){
//          if(file == null || file ==''){
//                swal({
//                      type: 'error',
//                      title: 'Oops...',
//                      text: '사진을 등록하세요.'
//                });
//                return false;
//          }
//          else    if(boardContent == null || boardContent ==''){
//                swal({
//                      type: 'error',
//                      title: 'Oops...',
//                      text: '게시글을 등록하세요.'
//                });
//                return false;
//          }
//       }
//       else{
//             if(boardContent == null || boardContent ==''){
//                swal({
//                      type: 'error',
//                      title: 'Oops...',
//                      text: '게시글을 등록하세요.'
//                });
//                return false;
//          }
//       }
      
//    });
   
   
   
   
   
// //    $("#boardForm").ajaxForm({
// // //       type: "post" //form에 설정한 값이 기본값 
// // //       , url: "/zaksim/community/enrollBoard" //form에 설정한 값이 기본값
// //       data: {
         
// //       }
// //       , dataType: "json"
// //       , success: function( res ) {
// //          console.log("성공");
// //          console.log(res);
// //       }
// //       , error: function() {
// //          console.log("실패");
// //       }
      
      
// //    });
	
	$("#enrollBoardBtn").click(function() {
		var radioVal = $('input[name="certification"]:checked').val();
		var file = $("#filee").val();
		var boardContent = $("#board-text1").val();
		
		var idx = $("#idxx").val();
		
		
		console.log('라디오 값 : ' + radioVal);
		console.log('파일 : '+ file);
		console.log("게시 글  : "+ boardContent);
		
		$(".idxxx").attr({
			value : idx
		});
		
		if(radioVal == 1){
			if(file == null || file ==''){
	            swal({
	                  type: 'error',
	                  title: 'Oops...',
	                  text: '사진을 등록하세요.'
	            });
	            return false;
			}
			else 	if(boardContent == null || boardContent ==''){
	            swal({
	                  type: 'error',
	                  title: 'Oops...',
	                  text: '게시글을 등록하세요.'
	            });
	            return false;
			}
		}
		else{
				if(boardContent == null || boardContent ==''){
	            swal({
	                  type: 'error',
	                  title: 'Oops...',
	                  text: '게시글을 등록하세요.'
	            });
	            return false;
			}
		}
		
	});
	
	
	
	
	
// 	$("#boardForm").ajaxForm({
// // 		type: "post" //form에 설정한 값이 기본값 
// // 		, url: "/zaksim/community/enrollBoard" //form에 설정한 값이 기본값
// 		data: {
			
// 		}
// 		, dataType: "json"
// 		, success: function( res ) {
// 			console.log("성공");
// 			console.log(res);
// 		}
// 		, error: function() {
// 			console.log("실패");
// 		}
		
		
// 	});
});
</script>




<script type="text/javascript">

   $(document).ready(function() {

      // 댓글 더 보기
      $("#commentOpen").click(function() {
    	 //var i = $(this).
         if($("#openComment").css("display")=="none"){
        	 ajaxBoardComment();
        	 
            $("#openComment").fadeIn();
         }
         else {
            $('#openComment').css("display", "none");
         }
      });
      
      // 댓글 쓰기
      $("#commentWrite").click(function() {
         
         
         if($("#writeComment").css("display")=="none"){
            $("#writeComment").fadeIn();
         }
         else {
            $('#writeComment').css("display", "none");
         }
         
      });
      
      // 대댓글 쓰기
      $("#comment2Open").click(function() {
         if($("#open2Comment").css("display")=="none"){
            $("#open2Comment").fadeIn();
         }
         else {
            $('#open2Comment').css("display", "none");
         }
      });


      // 자세히 보기 페이지
      $("#detailView").click(function() {
         document.location.href = "/zaksim/community/detailCommunity";
      });

      
//       // 커뮤니티 삭제 ;;
//       $("#deleteCommnunity").click(function() {
//          document.location.href = "/zaksim/community/communityMain";
//       });

      // 공개 클릭 시 숨기기 / 비공개 클릭 시 보이기
      var radioVal = $('input[name="secret"]:checked').val();
      if(radioVal==0){
         $(".screctRadio").hide();
      }
      else {
         $(".screctRadio").show();
      }

      // 공개 클릭 시 비밀번호 텍스트 비활성화
      $("#screctRadio1").click(function() {
         $("#pass").val("");
         $("#password1").val("");
         $("#password2").val("");
         $("#pass").attr("disabled", false);
         $("#password1").attr("disabled", false);
         $("#password2").attr("disabled", false);
         $(".screctRadio").hide();
      });

      // 비공개 클릭 시 비밀번호 보이기
      $("#screctRadio2").click(function() {
//          $("#pass").attr("required", true);
//          $("#password1").attr("required", true);
//          $("#password2").attr("required", true);
         $(".screctRadio").fadeIn();
      });

      // 위로가기 action
      $(window).scroll(function() {
         if ($(this).scrollTop() > 200) {
            $('.top-button').fadeIn();
         } else {
            $('.top-button').fadeOut();
         }
      });

      $('.top-button').click(function() {
         $('html,body').animate({
            scrollTop : 0
         }, 400);
         return false;
      });
   });
</script>

<script type="text/javascript">
// 추천 버튼 클릭 이벤트 처리
$("#btnDiv").on("click", ".btnRecommend", function() {
   var idxx = $('#idxx').val();
   console.log("yes");

   $.ajax({
      type: "post"
      , url: "/zaksim/community/recommend"
      , dataType: "json"
      , data: {
         idx: idxx
      }
      , success: function(data) {
         $("#recommendBtn").removeClass("btnRecommend").addClass("noBtnRecommend");
         console.log(data.groupLike);
         $(".noBtnRecommend").text("좋아요 취소 "+data.groupLike.likeNum);
         
         
      }
      , error: function(e) {
         console.log("fail");
         
         console.log(e.responseText);
      }
   });
});
   
   // 추천 버튼 취소 클릭 이벤트 처리   
$("#btnDiv").on("click", ".noBtnRecommend", function() {

      var idxx = $('#idxx').val();

      $.ajax({
         type: "post"
         , url: "/zaksim/community/noRecommend"
         , dataType: "json"
         , data: {
            idx: idxx
         }
         , success: function(data) {
            
            $("#recommendBtn").removeClass("noBtnRecommend").addClass("btnRecommend");
            
            console.log(data.groupLike);
            $(".btnRecommend").text("좋아요 "+data.groupLike.likeNum);
            
         }
         , error: function(e) {
            console.log("fail");
            
            console.log(e.responseText);
         }
      });
   
   
   
});
   

</script>


<script type="text/javascript">
   $(document).ready(function() {
      
      // 모임 소개 클릭 시
      $('#communityIntroduce').click(function() {
         if ($("#communityIntroduceComment").css("display") == "none") {
            $("#communityIntroduceComment").fadeIn();
            $("#communityJoinPeopleComment").hide();
            $("#communityKeywordComment").hide();
            $("#communityAchievementComment").hide();
         } else {
            $('#communityIntroduceComment').css("display", "none");
         }
      });

      // 모임 인원 클릭 시
      $('#communityJoinPeople').click(function() {
         if ($("#communityJoinPeopleComment").css("display") == "none") {
            $("#communityJoinPeopleComment").fadeIn();
            $("#communityIntroduceComment").hide();
            $("#communityKeywordComment").hide();
            $("#communityAchievementComment").hide();
         } else {
            $('#communityJoinPeopleComment').css("display", "none");
         }
      });

      // 키워드 클릭 시
      $('#communityKeyword').click(function() {
         if ($("#communityKeywordComment").css("display") == "none") {
            $("#communityKeywordComment").fadeIn();
            $("#communityIntroduceComment").hide();
            $("#communityJoinPeopleComment").hide();
            $("#communityAchievementComment").hide();
         } else {
            $('#communityKeywordComment').css("display", "none");
         }
      });

      // 달성도 클릭 시
      $('#communityAchievement').click(function() {
         if ($("#communityAchievementComment").css("display") == "none") {
            $("#communityAchievementComment").fadeIn();
            $("#communityIntroduceComment").hide();
            $("#communityJoinPeopleComment").hide();
            $("#communityKeywordComment").hide();
         } else {
            $('#communityAchievementComment').css("display", "none");
         }
      });
   });
   
   // 텍스트박스 오버할 시 자동으로 줄 수 증가
   function boardCommnet(obj) {
      obj.style.height = "1px";
      obj.style.height = (12 + obj.scrollHeight) + "px";
   }
   
   // 안됌
//    function content(obj) {
//       obj.style.height = "1px";
//       obj.style.height = (12 + obj.scrollHeight) + "px";
//    }
   
   
   // 커뮤니티 삭제 ;;
   function deleteCommnunity(obj) {
       swal({
           type: 'success',
           title: 'success ! ',
           text: '삭제 되었습니다.'
        }).then((result) => {
			  if (result.value) {
				  document.location.href = "/zaksim/community/deleteCommunity?idx="+obj;
				  }
				});
	   
      
   }
   
   // 참여하고 있는 맴버 페이지로 이동
   function joinMemberView(obj) {
      document.location.href = "/zaksim/community/joinMember?idx="+obj;
   }
   
   // 커뮤니티 정보 모달 창 취소
   function updateCancel() {
       $("#updateCommunityModal").modal('hide');
   }


   

   function update() {
      var commName = document.getElementById("commName").value;
      var commMax = document.getElementById("commMax").value;
      var pass = document.getElementById("pass").value;
      var pw1 = document.getElementById("password1").value;
      var pw2 = document.getElementById('password2').value;
      var keyword= document.getElementById('keyword').value;
      var contentText= document.getElementById('contentText').value;
      
      var radioVal = $('input[name="secret"]:checked').val();
      
      if(radioVal ==0 ){

         
         if(commName == null || commName==''){
            swal({
                  type: 'error',
                  title: 'Oops...',
                  text: '커뮤니티명을 입력하세요.'
            });
            return false;
            
         }
         if(commMax == null || commMax==''){
            swal({
                  type: 'error',
                  title: 'Oops...',
                  text: '최대인원을 입력하세요.'
            });
            return false;
            
         }
         if(keyword == null || keyword==''){
            swal({
                  type: 'error',
                  title: 'Oops...',
                  text: '키워드를 입력하세요.'
            });
            return false;
            
         }
         else if(contentText== null || contentText==''){
            swal({
                  type: 'error',
                  title: 'Oops...',
                  text: '소개글을 입력하세요.'
            });
            return false;
         }
         else{
            swal({
               type: 'success',
               title: 'success ! ',
               text: '수정되었습니다.'
         });
            return true;
         }
         
      }
      
      else{         
         if(commName == null || commName==''){
         swal({
            type: 'error',
            title: 'Oops...',
            text: '커뮤니티명을 입력하세요.'
         });
         return false;
      
   }
   if(commMax == null || commMax==''){
      swal({
            type: 'error',
            title: 'Oops...',
            text: '최대인원을 입력하세요.'
         });
         return false;
      
   }
         if(pw1 == null || pw1==''){
            swal({
                  type: 'error',
                  title: 'Oops...',
                  text: '비밀번호를 입력하세요.'
            });
            return false;
         }
      
         else if(pw2 == null || pw2==''){
            swal({
                  type: 'error',
                  title: 'Oops...',
                  text: '비밀번호 확인을 입력하세요.'
            });
            return false;
         }
      
         else if(pw1 != pw2){
            swal({
                  type: 'error',
                  title: 'Oops...',
                  text: '비밀번호가 일치하지 않습니다.'
            });
            return false;
         }
         
         else if(keyword == null || keyword==''){
            swal({
                  type: 'error',
                  title: 'Oops...',
                  text: '키워드를 입력하세요.'
            });
            return false;
            
         }
         else if(contentText== null || contentText==''){
            swal({
                  type: 'error',
                  title: 'Oops...',
                  text: '소개글을 입력하세요.'
            });
            return false;
         }
      
         else{
            return true;
         }
      
      }
   }
   

   
   
   
   
// 댓글

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
   
   function reReplyUpdate(i) {
	      var hidden = $('#reReplyUpdate'+i).attr("hidden");
	      console.log("hidden 값 : " + hidden);
	      
	      if ( hidden == "hidden" ) {         
	         $('#reReplyUpdate'+i).removeAttr("hidden"); // hidden 풀기(답댓글 창 보이기)
	      } else if ( hidden != "hidden" ) {
	         $('#reReplyUpdate'+i).attr("hidden", "hidden"); // hidden 속성추가(답댓글창 닫기(숨기기))
	      }
	   }
	   
	   function reReplyUpdateClose(i) {
	      var hidden = $('#reReplyUpdate'+i).attr("hidden");
	      console.log("hidden 값 : " + hidden);
	      $('#reReplyUpdate'+i).attr("hidden", "hidden"); // hidden 속성추가(답댓글창 닫기(숨기기))
	   }
   
   function deleteComment(qnaIdx, order) {
	   console.log('aaaaa');
	   $.ajax({
			type: "post"
			, url : "/zaksim/customerCenter/QnA/comment_delete"
			, data : {
				qnaIdx : qnaIdx,
				order : order
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
   }
   
	$("#recommendDiv").on("click", ".write", function() {
	   
	   var formData = $(this).parent().parent().serialize();
	   
	   console.log(formData);
	  
	   $.ajax({
			type: "post"
			, url : "/zaksim/customerCenter/QnA/comment_write"
			, data : formData
			, dataType: "html"
			, success: function( data ) {
				console.log(data);
				
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
   
   
   $("#recommendDiv").on("click", ".writeRe", function() {
	   
	   var formData = $(this).parent().parent().serialize();
	   
	   console.log(formData);
	  
	   $.ajax({
			type: "post"
			, url : "/zaksim/customerCenter/QnA/re_comment_write"
			, data : formData
			, dataType: "html"
			, success: function( data ) {
				console.log(data);
				
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
   
   $("#recommendDiv").on("click", ".updateRe", function() {
	   
	   var formData = $(this).parent().parent().serialize();
	   
	   console.log(formData);
	  
	   $.ajax({
			type: "post"
			, url : "/zaksim/customerCenter/QnA/comment_update"
			, data : formData
			, dataType: "html"
			, success: function( data ) {
				console.log(data);
				
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
   

   function report(boardIdx, memberIdx) {
	   $("#boardIdx").val(boardIdx);
	   $("#memberIdx").val(memberIdx);
	   $("#reportModal").modal('show');
   }
   
   $("#reportBtn").click(function() {
	   
	   var boardIdx = $("#boardIdx").val();
	   var category = $("[name=category]:checked").val();
	   var reason = $("#reason").val();
	   var memberIdx = $("#memberIdx").val();
	   
// 	   console.log(boardIdx + ", " + category + ", " + reason);
	   
	   
	   $.ajax({
			type: "post"
			, url : "/zaksim/community/report"
			, data : {
				boardIdx : boardIdx,
				reporterIdx : '${sessionScope.login_idx}',
				category : category,
				reason : reason,
				memberIdx : memberIdx
			}
			, dataType: "text"
			, success: function( data ) {
			
		         swal({
		             type: 'success',
		             title: 'success ! ',
		             text: '신고 접수되었습니다.'
		          }).then((result) => {
					  if (result.value) {
						  var reason = $("#reason").val("");
							$("#reportModal").modal('hide');
						  }
						});
				
				
				
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

