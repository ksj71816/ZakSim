<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


<!-- header include -->
<%@include file="/WEB-INF/views/zaksim/main/header.jsp"%>



<div class="container" id="zz">
	<div class="row" style="margin-bottom: 30px;">
		<div class="col"></div>
		<div class="col-9">
			<strong>
				<h1 style="vertical-align: 100%">커뮤니티</h1>
			</strong>
		</div>
		<div class="col"></div>
	</div>
	<div class="row">
		<div class="col"></div>
		<div class="col-9">
			<form action="/zaksim/community/searchCommunity" method="post">
				<div class="form-inline">
					<select name="selectSearch" class="custom-select d-block my-3"
						required>
						<option value="communutyName" selected="selected">모임 명</option>
						<option value="communutyCategory">카테고리</option>
						<option value="communutyKeyword">키워드</option>
					</select> <input type="text" class="form-control mx-3" style="width: 600px;"
						name="searchContent" placeholder="검색할 내용" required="required">
					<input type="submit" class="btn btn-outline-info" value="Search" />

				</div>
			</form>

		</div>


		<div class="col"></div>
	</div>

	<div class="row">
		<div class="col"></div>


		<div class="col-sm-11" style="margin-top: 50px; margin-right: 50px;">
			<strong style="font-size: 150%">새로 시작한 모임</strong>
				<button type="button" class="btn btn-outline-danger"
					style="float: right; margin-top: 30px; margin-left: 30px; margin-right: 30px;"
					data-toggle="modal" data-target=".bd-example-modal-lg">모임
					만들기</button>
			<hr
				style="margin-top: 40px; border-color: gray; margin-top: 40px; margin-bottom: 40px;">





			<div style="margin-left: 22px;">
				<div class="form-inline">
             <c:forEach var="newGroupList" items="${newGroupList }">
                  <div class="card" style="width: 20rem; margin-right: 10px;">
                  <input type="hidden" class="idxx" value="${newGroupList.idx }">
                  <input type="hidden" class= "memberIdxx" value="${newGroupList.member_idx }">
                     <div class="hovereffect">
                        <img class="card-img-top"
                           src="${newGroupList.image }"
                           alt="Card image cap">
                        <div class="card-body">
                           <span>
                              <h3 class="card-title">${newGroupList.title }
                           
                              </h3>
                           </span> <span class="form-inline"> <span style="color: red;">
                                 <h4>♥ &nbsp;${newGroupList.likeNum }</h4>
                           </span>
                           </span>
                           <p class="card-text">
                              <c:if test="${empty keywordList }">키워드 : 
                              </c:if>
                              <c:forEach items="${keywordList }" var="keyword">
                                 <c:if
                                    test="${newGroupList.idx eq keyword.group_idx}">
                                    #${keyword.keyword }
                                 </c:if>
                              </c:forEach>
                           </p>
                        </div>
               <div class="overlay">
                           <br> <br> 
                           <a class="info">
                              <% boolean groupFlag =  false; %>
                              <c:forEach var="groupMemberExist" items="${groupMemberExist }">

                                    <c:if test="${groupMemberExist.group_idx eq newGroupList.idx }">
                                       <% groupFlag = true; %>
                                    </c:if>
                              </c:forEach>   
                              
                              <!-- 로그인 했을 때 -->
                              <c:if test="${sessionScope.login }">
                                 
                              <!-- 가입했을 때 -->
                                 <c:if test="<%=groupFlag  %>">
                                    <button type="button" class="btn btn-danger" 
                                 onclick="moveURL(${newGroupList.idx }, 0)">상세보기</button>
                                 </c:if>
                                 
                                 <!-- 가입 안 했을 때 -->
                                 <c:if test="<%=!groupFlag  %>">
                                 
                                 <!-- 비공개일 떄 -->
                                    <c:if test="${newGroupList.secret == 1 }">
                                    <button type="button"  class="btn btn-primary secretJoin">가입하기</button>
                                    <br>
                                    <br>
                                 </c:if>
                                 
                                 <!-- 공개일 때 -->
                                   <c:if test="${newGroupList.secret == 0 }"> 
                                    <button type="button" class="btn btn-primary join" id ="noPassJoin">가입하기</button> 
                                    <br> 
                                    <br> 
                                  </c:if>    
                                    
                                    <button type="button" class="btn btn-danger" 
                                 onclick="moveURL(${newGroupList.idx }, ${newGroupList.secret })">상세보기</button>
                                 
                              
                                 </c:if>
                              
                              </c:if>
                              
                              <!-- 로그인 안했을 때 -->
                              <c:if test="${!sessionScope.login }">
                                     <button type="button" class="btn btn-danger" 
                                 onclick="moveURL(${newGroupList.idx }, ${newGroupList.secret })">상세보기</button>
                              </c:if>
                              
                           </a>
                        </div>
                     </div>
                  </div>
               </c:forEach>
				</div>
			</div>
		</div>

	<div style="margin-left: 500px; margin-top: 50px;">
			<jsp:include page="/WEB-INF/views/zaksim/community/paging/newPaging.jsp" />
	</div>




		<div class="col" style="margin-bottom: 300px;"></div>
	</div>

</div>



<!-- 위로가기 버튼 -->
<div class="top-button">
	<a href=""><img id="upImg" src="/resources/image/community/위로.png" style="width: 50px; height: 50px;">
	</a>
</div>

<!-- footer include -->
<%@include file="/WEB-INF/views/zaksim/main/footer.jsp"%>

<!-- 가입하기 -->
<div class="modal" id="join" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalVerticalLabel" aria-hidden="false">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalVerticalLabel">가입하기</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group">
						<input type="hidden" class ="idxxx"> 
						<label for="recipient-name" class="form-control-label">비밀번호</label>
						<input type="password" class="form-control"
							id="commPass" />
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary joinedComm" >가입하기</button>
			</div>
		</div>
	</div>
</div>


<!-- 모임 만들기 모달 -->
<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
	id="createModal" aria-labelledby="myLargeModalLabel" aria-hidden="false">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<form id="form1" action="/zaksim/community/createCommunity"
				method="post" runat="server" enctype="multipart/form-data"
				onsubmit="return create();">

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

										<img id="image" src="/resources/image/community/sample.png"
											alt="..." class="img-thumbnail"
											style="width: 200px; height: 150px; margin-bottom: 10px;"><br>


										<div class="imgInp btn btn-primary"
											style="position: relative; overflow: hidden; padding-right: 17px; margin-left: 40px;">

											<b>이미지 변경</b> <input type="file" id="imgInp" name="file"
												value="/resources/image/community/sample.png"
												style="align-content: center; margin-left: 40px; position: absolute; font-size: 0px; opacity: 0; right: 0; top: 0; cursor: pointer; height: 36px; width: 100px;">
										</div>




									</div>
									<div style="padding-bottom: 0px; margin-left: 50px;">
										<span style="font-size: 20px;"><strong>모임명 : </strong></span>
										<input class="form-control" type="text" style="height: 30px;"
											name="title" maxlength="20" id="commName"
											placeholder="20자 이내로 작성하세요"> <br> <br> <span
											style="font-size: 20px;"><strong>최대 모임 인원 : </strong></span>
										<input class="form-control" type="number"
											style="width: 80px; height: 30px;" placeholder="100" min="1"
											id="commMax" max="100" name="max"><strong>명</strong>
										<br> <span
											style="margin-left: 50px; font-size: 15px; color: gray;">※
											최대 100명까지 가능</span>

									</div>

								</div>

								<div style="margin-top: 30px;">
									<span style="margin-left: 50px; margin-right: 102px;"><strong>공개</strong></span>
									<input type="radio" name="secret" id="screctRadio1"
										checked="checked" value=0> <label> 공개</label> <input
										type="radio" style="margin-left: 100px;" id="screctRadio2"
										name="secret" value=1> <label> 비공개</label> <br> <br>




									<div style="margin-left: 30px; margin-right: 30px;">
										<div class="screctRadio" style="vertical-align: top;">
											<div class="card-body">
												<div class="form-inline">
													<span><strong>비밀번호</strong></span> <input type="password"
														class="form-control" style="margin-left: 73px;"
														id="password1" name="password">
												</div>

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
												<br>
											</div>
										</div>
									</div>




									<span style="margin-left: 50px; margin-right: 70px;"><strong>카테고리</strong></span>
									<select name="category_idx"
										class="custom-select mb-2 mr-sm-2 mb-sm-0"
										style="height: 40px; width: 150px;">
										<option value=1>운동</option>
										<option value=2>금연</option>
										<option value=3>다이어트</option>
										<option value=4>스터디</option>
										<option value=5>도서</option>
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
										<textarea class="form-control" name="content" id="contentText"
											onkeydown="content(this)"
											style="width: 300px; margin-bottom: 20px;"
											onkeyup="content(this)" placeholder="내용을 입력하세요"></textarea>


									</div>


								</div>
								<div class="col-sm-1"></div>
							</div>

						</div>
					</div>
					<div class="modal-footer" style="">
						<input type="submit" class="btn btn-danger" value="만들기" />
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
					</div>
			</form>
		</div>
	</div>
</div>


</body>

<link rel="stylesheet" type="text/css" href="/css/community/hover.css">
<link rel="stylesheet" type="text/css" href="/css/community/button.css">
<link rel="stylesheet" type="text/css"
	href="/css/community/main.css">


<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.28.12/sweetalert2.all.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$(window).scroll(function() {
			if ($(this).scrollTop() > 200) {
				$('.top-button').fadeIn();
			} else {
				$('.top-button').fadeOut();
			}
		});

		$(".top-button").click(function() {
			$('html').animate({
				"scrollTop" : "0px"
			}, "slow");
			return false;
		});
	});
</script>


<script type="text/javascript">
 $(document).ready(function() {
		// 공개 클릭 시 숨기기 / 비공개 클릭 시 보이기 
		var radioVal = $('input[name="secret"]:checked').val();
		if(radioVal==0){
			$(".screctRadio").hide();
			$("#password1").attr("disabled", false);
			$("#password2").attr("disabled", false);
		}
		else {
			$(".screctRadio").show();
// 			$("#password1").attr("required", true);
// 			$("#password2").attr("required", true);
		}

		$("#screctRadio1").click(function() {
			$("#password1").val("");
			$("#password2").val("");
			$("#password1").attr("disabled", false);
			$("#password2").attr("disabled", false);
			$(".screctRadio").hide();
		});

		$("#screctRadio2").click(function() {
// 			$("#password1").attr("required", true);
// 			$("#password2").attr("required", true);
			$(".screctRadio").fadeIn();
		});
 });
</script>

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

		$(window).scroll(function() {
			if ($(this).scrollTop() > 200) {
				$('.top-button').fadeIn();
			} else {
				$('.top-button').fadeOut();
			}
		});





		
		/* 가입한 모임 더 보기 */
		$("#joinedGroupViewMore").click(function() {
			location.href = "/zaksim/community/joinCommunity";
		});

		/* 인기모임 더 보기 */
		$("#popularGroupViewMore").click(function() {
			location.href = "/zaksim/community/popularCommunity";
		});

		/* 새로운모임 더 보기 */
		$("#newGroupViewMore").click(function() {
			location.href = "/zaksim/community/newCommunity";
		});

		/* 카테고리 더 보기 */
		$("#categoryViewMore").click(function() {
			location.href = "/zaksim/community/categoryCommunity";
		});

	});
	
	
	function moveURL(url, secret) {
		
		if(secret == 1){
			swal({
					type: 'error',
					title: 'Oops...',
					text: '비밀커뮤니티입니다'
			});
			return;
		}
		else{
		document.location.href = "/zaksim/community/enrollCommunity?idx="+url;
		}
	}
	
	function categoryClick(categoryIdx){
// 		document.location.href = "/zaksim/community/clickCategoryCommunity";
		document.location.href = "/zaksim/community/clickCategoryCommunity?category_idx="+categoryIdx;
		
	}
	
	
	function create() {
		var commName = document.getElementById("commName").value;
		var commMax = document.getElementById("commMax").value;
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
					text: '생성되었습니다.'
			}).then((result) => {
				  if (result.value) {
						console.log("안쪽!!!");
						location.href = "/zaksim/community/communityMain";
					  }
					})
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

	$(".joinedComm").click(function() {

		var idxx = $(".idxxx").val();
		var commPass = $("#commPass").val();
		

		
		$.ajax({
			type: "post"
			, url: "/zaksim/community/secretCommunityJoin"
			, dataType: "json"
			, data: {
				idx: idxx,
				password: commPass
			}
			, success: function(data) {
				
				if(commPass == null || commPass==''){
					swal({
						type: 'error',
						title: 'Oops...',
						text: '비밀번호를 입력하세요.'
					});
					
					return false;
				}
				
				if(data.result =='1'){
					swal({
						type: 'success',
						title: 'success !',
						text: data.success
					}).then((result) => {
						  if (result.value) {
								console.log("안쪽!!!");
// 								location.href = "/zaksim/community/enrollCommunity?idx="+idxx;
								window.location.reload();
							  }
							})
				}
				else{
					swal({
						type: 'error',
						title: 'Oops...',
						text: '비밀번호가 틀립니다.'
					});
				return false;
				}
				
			}
			, error: function(e) {
				console.log("fail");
				console.log(e.responseText);
			}
		});
	
		
	});
	

	// 비밀커뮤니티 가입하기 눌렀을 때 인덱스 넘기기
	$(".secretJoin").click(function() {
		var idxx = $(this).parent().parent().parent().parent().children("input").eq(0).val();
		
		console.log(idxx);
		
		$("#join").modal('show');
		// value 추가
		$(".idxxx").attr({
				value : idxx
		});
		
	});
	
	$(".join").click(function() {
		
		var idxx = $(this).parent().parent().parent().parent().children("input").eq(0).val();
		
		$.ajax({
			type: "post"
			, url: "/zaksim/community/join"
			, dataType: "json"
			, data: {
				idx: idxx
			}
			, success: function(data) {
				
				console.log(idxx);
				console.log(data.success);
				swal({
					type: 'success',
					title: 'success !',
					text: data.success
				}).then((result) => {
					  if (result.value) {
							console.log("안쪽!!!");
// 							location.href = "/zaksim/community/enrollCommunity?idx="+idxx;
							window.location.reload();
						  }
						})
				
			}
			, error: function(e) {
				console.log("fail");
				console.log(e.responseText);
			}
		});
		
		
		
	});		
	
</script>





