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
			<strong style="font-size: 150%">가입한 모임</strong>
				<button type="button" class="btn btn-outline-danger"
					style="float: right; margin-top: 30px; margin-left: 30px; margin-right: 30px;"
					data-toggle="modal" data-target=".bd-example-modal-lg">모임
					만들기</button>
			<hr
				style="margin-top: 40px; border-color: gray; margin-top: 40px; margin-bottom: 40px;">





			<div style="margin-left: 22px;">

				<div class="form-inline">

					<c:forEach var="joinedGroupList" items="${joinedGroupList }" >

						<div class="card bg-dark text-white">
							<div class="hovereffect">
								<img class="card-img"
									src="${joinedGroupList.communityGroup.image }"
									alt="Card image">
								<div class="card-img-overlay">
									<h4 class="card-title">${joinedGroupList.communityGroup.title }</h4>

									<c:forEach items="${categoryList }" var="categoryList">
										<c:if
  											test="${joinedGroupList.communityGroup.category_idx eq categoryList.idx}"> 
 											<p class="card-text">${categoryList }</p> 
  										</c:if>  									
  										</c:forEach> 

									<c:forEach items="${keywordList }" var="keyword">
										<c:if
											test="${joinedGroupList.communityGroup.idx eq keyword.group_idx}">
											<p class="card-text">#${keyword.keyword }</p>
										</c:if>
									</c:forEach>

									<p class="card-text">♡ ${joinedGroupList.likeNum }</p>
									<div class="progress">
										<div class="progress-bar" role="progressbar"
											style="width: 25%;" aria-valuenow="25" aria-valuemin="0"
											aria-valuemax="100">50%</div>
									</div>
									<div class="overlay">
									<br><br>
										<a class="info" href="#">
											<button type="button" class="btn btn-danger"
											onclick="moveURL(${joinedGroupList.communityGroup.idx })">상세보기</button>
										</a> <br> <br> <br>
									</div>
								</div>
							</div>
						</div>

					</c:forEach>

				</div>
			</div>
		</div>




		<div class="col" style="margin-bottom: 300px;"></div>
	</div>

</div>



<!-- 위로가기 버튼 -->
<div class="top-button">
	<a href=""><img id="upImg" src="/resources/image/community/위로.png">
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
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
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


            $('.top-button').click(function() {
                $('html,body').animate({
                    scrollTop: 0
                }, 400);
                return false;
            });
    		// 공개 클릭 시 숨기기 / 비공개 클릭 시 보이기
    		$(".screctRadio").hide();

    		$("#screctRadio1").click(function() {
    			$(".screctRadio").hide();
    		});

    		$("#screctRadio2").click(function() {
    			$(".screctRadio").fadeIn();
    		});

    		$("#join").click(function() {
    			$("#createModal").modal();
    		});
            
        });
        
    	function moveURL(url) {
    		document.location.href = "/zaksim/community/enrollCommunity?idx="+url;
    	}
        
    </script>



