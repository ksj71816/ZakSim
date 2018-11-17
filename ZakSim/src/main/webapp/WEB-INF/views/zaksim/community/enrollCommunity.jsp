<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- header include -->
<%@include file="/WEB-INF/views/zaksim/main/header.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/community/button.css">
<link rel="stylesheet" type="text/css" href="/css/community/enrollCommunity.css">



<div class="container" id="zz">

   <div class="row">
      <div class="col"></div>

      <c:forEach var="groupInfo" items="${groupInfo }">
      
      <input type="hidden" id ="idxx"value="${groupInfo.idx }">

         <div class="col-sm-11" style="margin-top: 50px; margin-right: 50px;" id="btnDiv">
            <strong style="font-size: 150%">${groupInfo.title }</strong>
            <c:if
               test="${groupInfo.member_idx eq sessionScope.login_idx }">
               <button type="button" class="btn btn-outline-info"
                  style="float: right; color: red; border-color: red; margin-left: 30px;"
                  data-toggle="modal" data-target="#updateCommunityModal">수정하기</button>
            </c:if>
            
   

            <c:if test="${ null ne sessionScope.login_idx}">
            
               <c:if test="${groupInfo.member_idx ne sessionScope.login_idx }">
                  <button type="button" class="btn btn-outline-info"
                     style="float: right; color: red; border-color: red; margin-left: 30px; margin-right: 30px;" 
                     data-toggle="modal" data-target="#updateCommunityModal">가입하기</button>
               </c:if>               
            
               <c:if test="${like }">
                  <button type="button" class="btn btn-outline-info noBtnRecommend"
                      style="float: right; margin-right: 30px; margin-left: 30px;" id="recommendBtn">좋아요 취소
                     &nbsp; ${groupLike.likeNum }</button>
               </c:if>
               <c:if test="${!like }">
                  <button type="button" class="btn btn-outline-success btnRecommend"
                   style="float: right; margin-right: 30px; margin-left: 30px;" id="recommendBtn">좋아요 &nbsp; ${groupLike.likeNum }</button>
               </c:if>
               
            </c:if>



            <div style="margin-top: 100px;">

               <div style="margin-left: 50px; margin-right: 50px;">
                  <img src="${groupInfo.storedName }" id="photo">
               </div>

               <div style="margin-top: 40px; margin-left: 190px; margin-right: 190px;">
                  <div style="margin-bottom: 20px;">
                     <strong
                        style="font-size: 150%; margin-left: 30px; margin-right: 30px; cursor: pointer;"
                        id="communityIntroduce">모임 소개</strong> <strong
                        style="font-size: 150%; margin-left: 30px; margin-right: 30px; cursor: pointer;"
                        id="communityJoinPeople">참여자 </strong> <strong
                        style="font-size: 150%; margin-left: 30px; margin-right: 30px; cursor: pointer;"
                        id="communityKeyword">키워드 </strong> <strong
                        style="font-size: 150%; margin-left: 30px; margin-right: 30px; cursor: pointer;"
                        id="communityAchievement">모임 달성도 </strong>
                  </div>
                  
                  <div
                     style="margin-left: 50px; margin-right: 50px; margin-bottom: 50px; display: none;"
                     id="communityIntroduceComment">${groupInfo.content }</div>

                  <div
                     style="margin-left: 50px; margin-right: 50px; margin-bottom: 50px; display: none;"
                     id="communityJoinPeopleComment">
                     <span style="font-size: 150%;">n명 </span> <span
                        style="font-size: 150%;">/ 최대
                        ${groupInfo.max }명</span> &nbsp;&nbsp;&nbsp;
                     <button type="button" class="btn btn-outline-secondary"
                        onclick="joinMemberView(${groupInfo.idx })">참여자
                        보기</button>
                  </div>

                  <div
                     style="margin-left: 50px; margin-right: 50px; margin-bottom: 50px; display: none;"
                     id="communityKeywordComment">
                     <span style="font-size: 150%;"> <c:forEach
                           var="keywordList" items="${keywordList }">
                           <c:if
                              test="${groupInfo.idx eq keywordList.group_idx}">
                                       #${keywordList.keyword } 
                                 </c:if>
                        </c:forEach></span>
                  </div>


                  <div
                     style="margin-left: 50px; margin-right: 50px; margin-bottom: 50px; display: none;"
                     id="communityAchievementComment">

                     <button type="button" class="btn btn-outline-danger"
                        id="detailView">자세히 보기</button>
                     <br> <br>
                     <div class="progress">
                        <div class="progress-bar" role="progressbar" style="width: 25%;"
                           aria-valuenow="" aria-valuemin="0" aria-valuemax="100">25%</div>
                     </div>
                  </div>
                 </div>
                 </div>
               </div>
         </c:forEach>
      </div>





               <hr style="margin-top: 10px; margin-bottom: 30px; border-color: black;">
                  
                  
               <div style="margin-bottom: 100px;">
                  <button type="button" class="btn btn-outline-secondary"
                     data-toggle="collapse" href="#collapseExample"
                     aria-expanded="false" aria-controls="collapseExample"
                     style="float: right; margin-right: 30px;">작성하기</button>
               </div>
               <br>

               <div class="collapse" id="collapseExample"
                  style="margin-left: 150px; margin-right: 150px; margin-bottom: 50px;">
                  <div class="card card-body">
                        <form id="boardForm" action="/zaksim/community/enrollBoard" method="post" enctype="multipart/form-data">
                     <div>
                           <div class="form-group">
                           <input type="hidden" class="idxxx" name ="group_idx">
                              <label for="recipient-name" class="form-control-label"><strong>
                                    게시글을 작성하세요</strong></label> <br>
                              <div class="form-inline"
                                 style="margin-left: auto; margin-right: auto;">
                                 <div class="radio"
                                    style="margin-left: 200px; margin-right: 100px;">
                                    <label> <input type="radio" name="certification"
                                       class="textKind" value=0 checked> 일반 글
                                    </label>
                                 </div>
                                 <div class="radio">
                                    <label> <input type="radio" name="certification"
                                       class="textKind" value=1> 인증 글
                                    </label>
                                 </div>
                                 <br> <br>
                                 <div>
                                    <br> <input type="file" name="file" id="filee"
                                       style="margin-left: 200px;" />
                                 </div>
                              </div>
                           </div>
                           <div class="form-group">
                              <label for="board-text1" class="form-control-label" ><strong>Content:</strong></label>
                              <textarea class="form-control" id="board-text1" name="content"
                                 onkeydown="boardCommnet(this)" onkeyup="boardCommnet(this)"></textarea>
                           </div>
                        
                     </div>
                     <div style="float: right;">
                        <button type="submit" class="btn btn-danger" id ="enrollBoardBtn">등록</button>
                        <button type="reset" class="btn btn-secondary"
                           data-dismiss="modal">초기화</button>
                     </div>
                     </form>
                  </div>
               </div>


<!-- 게시글 -->
         <c:forEach items="${boardList}" var="board">
               <div class="card mb-5" style="margin-left: 150px; margin-right: 150px;">
                  <div class="ml-4 mr-4">
                     <h4 class="card-title mt-4" style="font-family: Dohyeon;">${board.zakSimMember.nick}</h4>
                     <hr>
                     <p class="card-text mt-4">${board.content}</p>
                     <p class="card-text mb-3">
                        <small class="text-muted"><fmt:formatDate pattern = "yyyy-MM-dd" value = "${board.written_date}" /></small>
                     </p>
                  </div>
                  
                  <!-- 인증 사진 -->
                  <img class="card-img-bottom" src="${board.storedName}" alt="인증">
                  
                <div class="row">
                     <div class="col"
                        style="background-color: lightgray; margin-left: 15px; text-align: center;">

                        <strong id="comment" style="cursor: pointer;">댓글 ${board.commentNum}개</strong>

                     </div>
                     <div class="col"
                        style="background-color: lightgray; margin-right: 15px; text-align: center; ">
                        <strong style="cursor: pointer;"> ♡ 좋아요 ${board.likeNum}개</strong>
                     </div>
                  </div>
                  <div class="row justify-content-center"
                     style="cursor: pointer; background-color: lightgray; margin-left: 1px; margin-right: 1px; border-color: white;
                     border-top: 1px solid; border-bottom: 1px solid; border-color: white;" >
                     <strong id="commentWrite">댓글 쓰기</strong>
                  </div>

                  <!-- 댓글 쓰기 -->
                  <div id="writeComment"
                     style="border: 1px solid; background-color: write; display: none; border-color: lightgray; border-radius: 100px; margin-top: 20px; margin-bottom: 20px;">
                     <div class="mx-5">
                        <div>
                           <img src="/resources/image/community/sample.png"
                              class="mx-3 my-3" id="commentPhoto"> <span
                              style="font-size: 20px;"><strong>${sessionScope.login_nick}</strong></span>

                        </div>
                        <div class="mx-5">
                           <textarea class="form-control col-sm-112" rows="3"
                              placeholder="댓글 입력 "></textarea>


                           <br>
                        </div>

                        <div class="mx-5">
                           <button type="button" class="btn btn-outline-secondary"
                              style="float: right; margin-right: 10px;">취소</button>
                           <button type="button" class="btn btn-outline-danger"
                              style="float: right; margin-right: 10px;">입력</button>
                           <br>
                        </div>

                     </div>
                     <br>
                  </div>

                  <div class="row justify-content-center" style="cursor: pointer; background-color: lightgray; margin-left: 1px; margin-right: 1px;">
                     <strong id="commentOpen">댓글 더 보기</strong>
                  </div>
               </div>


            <!-- 댓글 -->
               <div id="openComment"
                  style="background-color: lightgray; margin-left: 150px; margin-right: 150px; display: none;">
                  <div class="card-body mx-3 ">
                     <div
                        style="border: 1px solid; background-color: white; border-color: lightgray; border-radius: 100px;">
                        <div class="mx-5">
                           <div>
                              <img src="/resources/image/community/sample.png"
                                 class="mx-3 my-3" id="commentPhoto"> <span
                                 style="font-size: 20px;"><strong>닉네임a</strong></span>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span
                                 style="color: lightgray; cursor: pointer;" id="comment2Open"> 댓글 달기 </span> <span
                                 style="color: lightgray; cursor: pointer;"
                                 data-toggle="modal" data-target="#reportModal"> 신고 하기
                              </span> <span style="color: lightgray; cursor: pointer;"> 삭제
                                 하기 </span>
                           </div>
                           <div class="mx-5">
                              世솅〮宗조ᇰ御ᅌᅥᆼ〮製졩〮訓훈〮民민正져ᇰ〮音ᅙᅳᆷ 나랏〮말〯ᄊᆞ미〮 中듀ᇰ國귁〮에〮달아〮
                              文문字ᄍᆞᆼ〮와〮로〮서르ᄉᆞᄆᆞᆺ디〮아니〮ᄒᆞᆯᄊᆡ〮
                              이〮런젼ᄎᆞ〮로〮어린〮百ᄇᆡᆨ〮姓셔ᇰ〮이〮니르고〮져〮호ᇙ〮배〮이셔〮도〮
                              ᄆᆞᄎᆞᆷ〮내〯제ᄠᅳ〮들〮시러〮펴디〮몯〯ᄒᆞᇙ노〮미〮하니〮라〮 내〮이〮ᄅᆞᆯ〮為윙〮ᄒᆞ〮야〮어〯엿비〮너겨〮
                              새〮로〮스〮믈〮여듧〮字ᄍᆞᆼ〮ᄅᆞᆯ〮ᄆᆡᇰᄀᆞ〮노니〮 사〯ᄅᆞᆷ마〯다〮ᄒᆡ〯ᅇᅧ〮수〯ᄫᅵ〮니겨〮날〮로〮ᄡᅮ〮메〮
                              便뼌安ᅙᅡᆫ킈〮ᄒᆞ고〮져〮ᄒᆞᇙᄯᆞᄅᆞ미〮니라〮 <br> <br> <a href="">더
                                 보기</a> <br> <br>
                           </div>
                        </div>
                     </div>

                     <!-- 대댓글 -->
                     <div id="open2Comment" 
                        style="border: 1px solid; background-color: white; border-color: lightgray; display: none;
                           border-radius: 100px; margin-left: 100px;">
                        <div class="mx-5">
                           <div>
                              <img src="/resources/image/community/sample.png"
                                 class="mx-3 my-3" id="commentPhoto"> <span
                                 style="font-size: 20px;"><strong>닉네임a</strong></span>

                           </div>
                           <div class="mx-5">
                              <textarea class="form-control col-sm-112" rows="3"
                                 placeholder="댓글 입력 "></textarea>


                              <br>
                           </div>

                           <div class="mx-5">
                              <button type="button" class="btn btn-outline-secondary"
                                 style="float: right; margin-right: 10px;">취소</button>
                              <button type="button" class="btn btn-outline-danger"
                                 style="float: right; margin-right: 10px;">입력</button>

                           </div>
                           <br> <br>

                        </div>
                     </div>


                     <br> <br> <br>


                  </div>
               </div>
               
               </c:forEach>

      <div class="col" style="margin-bottom: 300px;"></div>
   </div>



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
                  <span><strong>작성자 : </strong></span> <span> 닉네임1</span>
               </div>


               <hr>

               <div>
                  <span><strong>사유선택 : </strong></span> <span
                     style="color: lightgray; font-size: 12px;">여러 사유에 해당하는 경우,
                     대표적인 사유 1개를 선택해주세요</span>
               </div>
               <br>
               <div class="radio" style="margin-left: 80px;">
                  <input type="radio" name="report"> 부적절한 홍보 게시글 <br> <input
                     type="radio" name="report"> 음란성 또는 청소년에게 부적합한 내용 <br>
                  <input type="radio" name="report"> 명예회손 / 사생활 침해 저작권침해 등 <br>
                  <input type="radio" name="report"> 기타

               </div>
            </div>
         </div>
         <div class="modal-footer">
            <div>
               <button type="button" class="btn btn-danger">신고하기</button>
               <button type="button" class="btn btn-secondary"
                  data-dismiss="modal">취소</button>

            </div>
         </div>
      </div>
   </div>
</div>



<!-- 커뮤니티 수정 모달 -->
<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
   id="updateCommunityModal" aria-labelledby="myLargeModalLabel"
   aria-hidden="true">
   <div class="modal-dialog modal-lg">
      <div class="modal-content">
         <form id="form1" action="/zaksim/community/updateCommunity"
            method="post" runat="server" enctype="multipart/form-data"
            onsubmit="return update();">
            <c:forEach var="groupInfo" items="${groupInfo }">
               <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel"
                     style="font-size: 30px;">
                     <strong>모임 만들기</strong>
                  </h5>
                  <button type="button" class="close" data-dismiss="modal"
                     aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button>
               </div>
               <!-- 모달 바디-->
               <div class="modal-body">

                  <div class="container">

                     <div class="row">
                        <div class="col-sm-2"></div>
                        <div class="">
                        
                        
                        
                           <div class="form-inline">
                           
                           
                              <div>
                                 <input type="hidden" name="idx"
                                    value="${groupInfo.idx }" /> <img id="image"
                                    src="${groupInfo.storedName }" alt="..."
                                    class="img-thumbnail"
                                    style="width: 200px; height: 150px; margin-bottom: 10px;"><br>

                                 <div class="imgInp btn btn-primary"
                                    style="position: relative; overflow: hidden; padding-right: 17px; margin-left: 40px;">

                                    <b>이미지 변경</b> <input type="file" id="imgInp" name="file"
                                       value="${groupInfo.storedName }"
                                       style="align-content: center; margin-left: 40px; position: absolute; font-size: 0px; opacity: 0; right: 0; top: 0; cursor: pointer; height: 36px; width: 100px;">
                                 </div>
                                 
                                 <input type="hidden" name="image"
                                    value="${groupInfo.storedName }" />
                              </div>
                              
                              
                              <div style="padding-bottom: 0px; margin-left: 50px;">
                                 <span style="font-size: 20px;"><strong>모임명 :
                                 </strong></span> <input class="form-control" type="text"
                                    style="height: 30px;" name="title" maxlength="20"
                                    id="commName" value="${groupInfo.title }">
                                 <br> <br> <span style="font-size: 20px;"><strong>최대
                                       모임 인원 : </strong></span> <input class="form-control" type="number"
                                    style="width: 80px; height: 30px;"
                                    value="${groupInfo.max }" min="1"
                                    id="commMax" max="100" name="max"><strong>명</strong>
                                 <br> <span
                                    style="margin-left: 50px; font-size: 15px; color: gray;">※
                                    최대 100명까지 가능</span>

                              </div>
                              
                           </div>
                           
                           

                           <div style="margin-top: 30px;">
                              <span style="margin-left: 50px; margin-right: 102px;"><strong>공개</strong></span>
                              <input type="radio" name="secret" id="screctRadio1" value=0
                                 <c:if test="${groupInfo.secret==0}">checked="checked"</c:if> />

                              <label> 공개</label> <input type="radio"
                                 style="margin-left: 100px;" id="screctRadio2" name="secret"
                                 value=1
                                 <c:if test="${groupInfo.secret==1}">checked="checked"</c:if> />
                              <label> 비공개</label> <br> <br>

                              <!-- 기존 비밀번호가 존재 시 -->
                              <c:if test="${groupInfo.secret==1}">
                                 <div style="margin-left: 30px; margin-right: 30px;">
                                    <div class="screctRadio" style="vertical-align: top;">
                                       <div class="card-body">
                                          <div class="form-inline">
                                             <span><strong>기존 비밀번호</strong></span> <input
                                                type="password" class="form-control"
                                                style="margin-left: 37px;" id="pass">
                                          </div>

                                          <span style="margin-left: 140px; display: none;"
                                             id="passComment"
                                             onkeypress="isSame(${groupInfo.idx})"></span>
                                       </div>
                                    </div>
                                 </div>
                              </c:if>

                              <div style="margin-left: 30px; margin-right: 30px;">
                                 <div class="screctRadio" style="vertical-align: top;">
                                    <div class="card-body">
                                       <div class="form-inline">
                                          <span><strong>새로운 비밀번호</strong></span> <input
                                             type="password" class="form-control"
                                             style="margin-left: 22px;" id="password1" name="password1">
                                       </div>
                                       <span style="margin-left: 140px; display: none;"
                                          id="pass1Comment"></span>
                                    </div>
                                 </div>
                              </div>


                              <div style="margin-left: 30px; margin-right: 30px;">
                                 <div class="screctRadio" style="vertical-align: top;">
                                    <div class="card-body">
                                       <div class="form-inline">
                                          <span><strong>비밀번호 확인</strong></span> <input
                                             type="password" name="password2" class="form-control"
                                             id="password2" style="margin-left: 37px;">
                                       </div>
                                       <span style="margin-left: 140px; display: none;"
                                          id="pass2Comment"></span> <br>
                                    </div>
                                 </div>
                              </div>


                              <span style="margin-left: 50px; margin-right: 70px;"><strong>카테고리</strong></span>
                              <select name="category_idx"
                                 class="custom-select mb-2 mr-sm-2 mb-sm-0"
                                 style="height: 40px; width: 150px;">


                                 <c:set var="catego"
                                    value="${groupInfo.idx}" />
                                 <option value=1>운동</option>
                                 <option value=2 <c:if test="${catego eq 2}">selected</c:if>>금연</option>
                                 <option value=3 <c:if test="${catego eq 3}">selected</c:if>>다이어트</option>
                                 <option value=4 <c:if test="${catego eq 4}">selected</c:if>>스터디</option>
                                 <option value=5 <c:if test="${catego eq 5}">selected</c:if>>도서</option>
                              </select> <br> <br>
                              <div class="form-inline">
                                 <span style="margin-left: 50px; margin-right: 90px;"><strong>키워드</strong></span>

                                 <input type="text" class="form-control" style="width: 300px;"
                                    name="keyword" id="keyword" placeholder="ex) #키워드1#키워드2"
                                    onkeyup="this.value=this.value.replace(/[^#0-9가-힣a-zA-Z]/g,'')">
                              </div>
                              <br>
                              <div class="form-inline">
                                 <span style="margin-left: 50px; margin-right: 90px;"><strong>소개글</strong></span>

                                 <br>
                                 <textarea class="form-control" name="content"
                                    id="contentText" onkeydown="boardCommnet(this)"
                                    style="width: 300px; margin-bottom: 20px;"
                                    onkeyup="boardCommnet(this)" placeholder="내용을 입력하세요">${groupInfo.content}</textarea>

                              </div>
                           </div>
                           <div class="col-sm-1"></div>
                        
                     </div>
                  </div>
            </div><!-- modal body -->

                  <div class="modal-footer">
                     <input type="submit" class="btn btn-danger" id="update"
                        value="수정" />
                     <button type="reset" class="btn btn-secondary"
                        onclick="updateCancel()">취소</button>
                     <button type="button" class="btn btn-success"
                        onclick="deleteCommnunity(${groupInfo.idx})">삭제</button>
                  </div>
                  
            </c:forEach>
         </form>
      </div>
   </div>
</div>








</body>


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
         else    if(boardContent == null || boardContent ==''){
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
   
   
   
   
   
//    $("#boardForm").ajaxForm({
// //       type: "post" //form에 설정한 값이 기본값 
// //       , url: "/zaksim/community/enrollBoard" //form에 설정한 값이 기본값
//       data: {
         
//       }
//       , dataType: "json"
//       , success: function( res ) {
//          console.log("성공");
//          console.log(res);
//       }
//       , error: function() {
//          console.log("실패");
//       }
      
      
//    });
});
</script>




<script type="text/javascript">

   $(document).ready(function() {

      // 댓글 더 보기
      $("#commentOpen").click(function() {
         if($("#openComment").css("display")=="none"){
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

      
      // 커뮤니티 삭제 ;;
      $("#deleteCommnunity").click(function() {
         document.location.href = "/zaksim/community/communityMain";
      });

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
      document.location.href = "/zaksim/community/deleteCommunity?idx="+obj;
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
   


</script>

