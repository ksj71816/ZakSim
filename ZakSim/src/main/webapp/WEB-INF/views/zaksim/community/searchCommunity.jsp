<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


<!-- header include -->
<%@include file="/WEB-INF/views/zaksim/main/header.jsp"%>




<div class="container" id="zz">



	<div class="row" style="margin-bottom: 30px;">
		<div class="col"></div>
		<div class="col-10">
			<strong>
				<h1 style="vertical-align: 100%">커뮤니티</h1>
			</strong>
		</div>
		<div class="col"></div>
	</div>
	
	<div class="row">
		<div class="col"></div>
		<div class="col-10">
			<div class="form-inline">

<!-- 							<form action="/zaksim/community/searchCommunity" method="post"> -->
<!-- 								<div class="form-inline"> -->
<!-- 									<select name="selectSearch" class="custom-select d-block my-3" -->
<!-- 										required> -->
<!-- 										<option value="communutyName" selected="selected">모임 명</option> -->
<!-- 										<option value="communutyCategory">카테고리</option> -->
<!-- 										<option value="communutyKeyword">키워드</option> -->
<!-- 									</select> <input type="text" class="form-control mx-3" style="width: 600px;" -->
<!-- 										name="searchContent" placeholder="검색할 내용" required="required"> -->
<!-- 									<input type="submit" class="btn btn-outline-info" value="Search" /> -->

<!-- 								</div> -->
<!-- 							</form> -->

				<form action="/zaksim/community/searchCommunity" method="post">
					<div class="form-inline">
						
							<c:set var="selectSearch2" value="${selectSearch }" />
							<select name="selectSearch" class="custom-select d-block my-3" required>
							<option value="communutyName"
								<c:if test="${selectSearch2 eq 'communutyName'}"> selected</c:if>>모임
								명</option>
							<option value="communutyCategory"
								<c:if test="${selectSearch2 eq 'communutyCategory'}"> selected</c:if>>카테고리</option>
							<option value="communutyKeyword"
								<c:if test="${selectSearch2 eq 'communutyKeyword'}"> selected</c:if>>키워드</option>
						</select> <input type="text" class="form-control mx-3"
							style="width: 600px;" name="searchContent"  value="${searchContent }" required="required">
						<input type="submit" class="btn btn-outline-info" value="Search" />
					</div>
				</form>
			</div>

		</div>


		<div class="col"></div>

	</div>

	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10" style="margin-top: 50px; margin-right: 50px;">
			<strong style="font-size: 150%">검색 결과</strong>
			<c:if
				test="${!empty searchGroup || !empty searchCategoryGroup || !empty searchKeywordGroup  }">
				<button type="button" class="btn btn-outline-danger"
					style="float: right; margin-top: 30px; margin-left: 30px; margin-right: 30px;"
					data-toggle="modal" data-target=".bd-example-modal-lg">모임
					만들기</button>

			</c:if>
			<hr
				style="margin-top: 40px; border-color: gray; margin-top: 40px; margin-bottom: 40px;">


			<c:if
				test="${empty searchGroup && empty searchCategoryGroup && empty searchKeywordGroup  }">
				<div style="margin-left: 22px;">

					<div class="form-inline">

						<div class="col-sm-11"
							style="margin-top: 50px; margin-right: 50px;">
							<div style="margin-bottom: 150px;"></div>

							<div
								style="text-align: center; color: gray; font-size: 40px; font-style: italic;">
								<p>검색 결과가 없습니다.</p>
								<p>- 모임을 만드세요. -</p>
								<button type="button" class="btn btn-danger"
									style="width: 200px;" data-toggle="modal"
									data-target=".bd-example-modal-lg">모임 만들기</button>

							</div>
						</div>
					</div>
				</div>

			</c:if>



			<!-- 검색한 그룹이 존재할 시 -->
			<c:if
				test="${empty searchCategoryGroup && !empty searchGroup && empty searchKeywordGroup  }">

				<div class="form-inline">
					<c:forEach var="searchGroup" items="${searchGroup }">
						<input style="display: none;" value="${searchGroup.idx}">
						<div class="card bg-dark text-white mb-4">
							<div class="hovereffect">
<%-- 								<img class="card-img" src="${searchGroup.communityGroup.storedName }" --%>
								<img class="card-img" src="${searchGroup.image }"
									alt="Card image">
								<div class="card-img-overlay">
									<h4 class="card-title">${searchGroup.title }</h4>

									<c:forEach items="${keywordList }" var="keyword">
										<c:if
											test="${searchGroup.idx eq keyword.group_idx}">
											<p class="card-text">#${keyword.keyword }</p>
										</c:if>
									</c:forEach>

									<p class="card-text">♡ ${searchGroup.likeNum }</p>
<!-- 									<div class="progress"> -->
<!-- 										<div class="progress-bar" role="progressbar" -->
<!-- 											style="width: 100%;" aria-valuenow="100" aria-valuemin="0" -->
<!-- 											aria-valuemax="100">100%</div> -->
<!-- 									</div> -->
									<div class="overlay">
										<a class="info">
                              <% boolean groupFlag =  false; %>
                              <c:forEach var="groupMemberExist" items="${groupMemberExist }">

                                    <c:if test="${groupMemberExist.group_idx eq searchGroup.idx }">
                                       <% groupFlag = true; %>
                                    </c:if>
                              </c:forEach>   
                              
                              <!-- 로그인 했을 때 -->
                              <c:if test="${sessionScope.login }">
                                 
                              <!-- 가입했을 때 -->
                                 <c:if test="<%=groupFlag  %>">
                                    <button type="button" class="btn btn-danger" 
                                 onclick="moveURL(${searchGroup.idx }, 0)">상세보기</button>
                                 </c:if>
                                 
                                 <!-- 가입 안 했을 때 -->
                                 <c:if test="<%=!groupFlag  %>">
                                 
                                 <!-- 비공개일 떄 -->
                                    <c:if test="${searchGroup.secret == 1 }">
                                    <button type="button"  class="btn btn-primary secretJoin">가입하기</button>
                                    <br>
                                    <br>
                                 </c:if>
                                 
                                 <!-- 공개일 때 -->
                                   <c:if test="${searchGroup.secret == 0 }"> 
                                    <button type="button" class="btn btn-primary join" id ="noPassJoin">가입하기</button> 
                                    <br> 
                                    <br> 
                                  </c:if>    
                                    
                                    <button type="button" class="btn btn-danger" 
                                 onclick="moveURL(${searchGroup.idx }, ${searchGroup.secret })">상세보기</button>
                                 
                              
                                 </c:if>
                              
                              </c:if>
                              
                              <!-- 로그인 안했을 때 -->
                              <c:if test="${!sessionScope.login }">
                                     <button type="button" class="btn btn-danger" 
                                 onclick="moveURL(${searchGroup.idx }, ${searchGroup.secret })">상세보기</button>
                              </c:if>
                              
                           </a>
									</div>
								</div>
							</div>
						</div>

					</c:forEach>
				</div>
			</c:if>


			<!-- 카테고리 존재할 시 -->
			<c:if
				test="${!empty searchCategoryGroup && empty searchGroup && empty searchKeywordGroup  }">

				<div class="form-inline">
					<c:forEach var="searchCategoryGroup"
						items="${searchCategoryGroup }">

						<div class="card bg-dark text-white mb-4">
							<div class="hovereffect">
								<img class="card-img"
									src="${searchCategoryGroup.communityGroup.storedName }"
									alt="Card image">
								<div class="card-img-overlay">
									<h4 class="card-title">${searchCategoryGroup.communityGroup.title }</h4>

									<c:forEach items="${keywordList }" var="keyword">
										<c:if
											test="${searchCategoryGroup.communityGroup.idx eq keyword.group_idx}">
											<p class="card-text">#${keyword.keyword }</p>
										</c:if>
									</c:forEach>

									<p class="card-text">♡ ${searchCategoryGroup.likeNum }</p>
<!-- 									<div class="progress"> -->
<!-- 										<div class="progress-bar" role="progressbar" -->
<!-- 											style="width: 25%;" aria-valuenow="25" aria-valuemin="0" -->
<!-- 											aria-valuemax="100">50%</div> -->
<!-- 									</div> -->
									<div class="overlay">
										<a class="info" href="#">
											<button type="button" class="btn btn-primary">가입하기</button> <br>
											<br>
											<button type="button" class="btn btn-danger"
												onclick="moveURL(${searchCategoryGroup.communityGroup.idx })">상세보기</button>
										</a> <br> <br> <br>
									</div>
								</div>
							</div>
						</div>

					</c:forEach>
				</div>
			</c:if>


			<!-- 키워드  존재할 시 -->
			<c:if
				test="${empty searchCategoryGroup && empty searchGroup && !empty searchKeywordGroup  }">

				<div class="form-inline">
					<c:forEach var="searchKeywordGroup" items="${searchKeywordGroup }">

						<div class="card bg-dark text-white mb-4">
							<div class="hovereffect">
								<img class="card-img"
									src="${searchKeywordGroup.communityGroup.storedName }"
									alt="Card image">
								<div class="card-img-overlay">
									<h4 class="card-title">${searchKeywordGroup.communityGroup.title }</h4>

									<c:forEach items="${keywordList }" var="keyword">
										<c:if
											test="${searchKeywordGroup.communityGroup.idx eq keyword.group_idx}">
											<p class="card-text">#${keyword.keyword }</p>
										</c:if>
									</c:forEach>

									<p class="card-text">♡ ${searchKeywordGroup.likeNum }</p>
<!-- 									<div class="progress"> -->
<!-- 										<div class="progress-bar" role="progressbar" -->
<!-- 											style="width: 25%;" aria-valuenow="25" aria-valuemin="0" -->
<!-- 											aria-valuemax="100">50%</div> -->
<!-- 									</div> -->
									<div class="overlay">
										<a class="info" href="#">
											<button type="button" class="btn btn-primary">가입하기</button> <br>
											<br>
											<button type="button" class="btn btn-danger"
												onclick="moveURL(${searchKeywordGroup.communityGroup.idx })">상세보기</button>
										</a> <br> <br> <br>
									</div>
								</div>
							</div>
						</div>

					</c:forEach>
				</div>
			</c:if>

		</div>
		<div class="col-sm-1"></div>
	</div>
</div>

			<c:if test="${empty searchCategoryGroup && !empty searchGroup && empty searchKeywordGroup  }">
   				<div style="margin-left: 0px; margin-top: 50px;">
				<jsp:include page="/WEB-INF/views/zaksim/community/paging/titlePaging.jsp" />
			</div>
			</c:if>


<div class="row" style="margin-bottom: 300px;"></div>




<!-- 위로가기 버튼 -->
<div class="top-button">
	<a href=""><img id="upImg" src="/resources/image/community/위로.png" style="width: 50px; height: 50px;">
	</a>
</div>


<!-- footer include -->
<%@include file="/WEB-INF/views/zaksim/main/footer.jsp"%>

<!-- 모달 -->
<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
	id="createModal" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<form id="form1" action="/zaksim/community/createCommunity"
				method="post" runat="server" enctype="multipart/form-data">

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
											name="title" maxlength="20" required="required" id="commName"
											placeholder="20자 이내로 작성하세요"> <br> <br> <span
											style="font-size: 20px;"><strong>최대 모임 인원 : </strong></span>
										<input class="form-control" type="number"
											style="width: 80px; height: 30px;" placeholder="100" min="1"
											id="commMax" max="100" name="max" required="required"><strong>명</strong>
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
														name="password">
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
														style="margin-left: 37px;">
												</div>
												<br>
											</div>
										</div>
									</div>




									<span style="margin-left: 50px; margin-right: 70px;"><strong>카테고리</strong></span>
									<select name="category"
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
											name="keyword" name="keyword" placeholder="ex) #키워드1, #키워드2"
											required="required"
											onkeyup="this.value=this.value.replace(/[^#0-9가-힣a-zA-Z]/g,'')">
									</div>
									<br>
									<div class="form-inline">
										<span style="margin-left: 50px; margin-right: 90px;"><strong>소개글</strong></span>

										<br>
										<textarea class="form-control" name="content"
											onkeydown="content(this)"
											style="width: 300px; margin-bottom: 20px;"
											onkeyup="content(this)" placeholder="내용을 입력하세요"
											required="required"></textarea>


									</div>


								</div>
								<div class="col-sm-1"></div>
							</div>

						</div>
					</div>
					<div class="modal-footer" style="">
						<input type="submit" class="btn btn-danger" id="create"
							value="만들기" />
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
	href="/css/community/popularCommunity.css">


<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

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
//		document.location.href = "/zaksim/community/clickCategoryCommunity";
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
//								location.href = "/zaksim/community/enrollCommunity?idx="+idxx;
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
//							location.href = "/zaksim/community/enrollCommunity?idx="+idxx;
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