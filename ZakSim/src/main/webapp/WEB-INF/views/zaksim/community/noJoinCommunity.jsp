<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
			<div class="form-inline">
				<select class="custom-select d-block my-3" required>
					<option value="1" selected="selected">모임 명</option>
					<option value="2">카테고리</option>
					<option value="3">키워드</option>
				</select> <input type="text" class="form-control mx-3" style="width: 600px;"
					placeholder="검색할 내용">
				<button type="button" class="btn btn-outline-info">검색</button>
			</div>

		</div>


		<div class="col"></div>
	</div>

	<div class="row">
		<div class="col"></div>


		<div class="col-sm-11" style="margin-top: 50px; margin-right: 50px;">
			<div style="margin-bottom: 150px;">
				<strong style="font-size: 150%;">참여하고 있는 모임</strong>
			</div>

			<div
				style="text-align: center; color: gray; font-size: 40px; font-style: italic;">
				<p>참여하고 있는 모임이 없습니다.</p>
				<p>- 모임을 만드세요. -</p>
				<button type="button" class="btn btn-danger" style="width: 200px;"
					data-toggle="modal" data-target=".bd-example-modal-lg">모임
					만들기</button>





			</div>



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

<!-- 모달 -->
<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel" aria-hidden="true">
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

										<img id="image" 
											src="/resources/image/community/sample.png" alt="..."
											class="img-thumbnail"
											style="width: 200px; height: 150px; margin-bottom: 10px;"><br>


										<div class="imgInp btn btn-primary"
											style="position: relative; overflow: hidden; padding-right: 17px; margin-left: 40px;">

											<b>이미지 변경</b> <input type="file" id="imgInp" name="file" value="/resources/image/community/sample.png"
												style="align-content: center; margin-left: 40px; position: absolute; font-size: 0px; opacity: 0; right: 0; top: 0; cursor: pointer; height: 36px; width: 100px;">
										</div>




									</div>
									<div style="padding-bottom: 0px; margin-left: 50px;">
										<span style="font-size: 20px;"><strong>모임명 : </strong></span>
										<input class="form-control" type="text" style="height: 30px;"
											name="title" maxlength="20" required="required"
											placeholder="20자 이내로 작성하세요"> <br> <br> <span
											style="font-size: 20px;"><strong>최대 모임 인원 : </strong></span>
										<input class="form-control" type="number"
											style="width: 80px; height: 30px;" placeholder="100" min="1"
											max="100" name="max" required="required"><strong>명</strong>
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
												<div id="screctRadio" style="vertical-align: top;">
													<div class="card-body">
														<div class="form-inline">
															<span><strong>비밀번호</strong></span> <input type="password"
																class="form-control" style="margin-left: 73px;"
																name="password">
														</div>
														<br>
													</div>
												</div>
											</div>






									<span style="margin-left: 50px; margin-right: 70px;"><strong>카테고리</strong></span>
									<select class="custom-select mb-2 mr-sm-2 mb-sm-0"
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
											name="keyword" placeholder="ex) #키워드1, #키워드2"
											required="required">
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
						<!-- 				<button type="button" class="btn btn-danger" id="create"> -->
						<!-- 					<a href="">만들기</a> -->
						<!-- 				</button> -->
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

<link rel="stylesheet" type="text/css" href="/css/community/button.css">
<link rel="stylesheet" type="text/css" href="/css/community/noJoin.css">

<script src="//code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#ex_file').change(function(event) {
			var tmppath = URL.createObjectURL(event.target.files[0]);
			$('#ex_file').attr('src', tmppath);
		});
	});
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
				scrollTop : 0
			}, 400);
			return false;
		});

		// 공개 클릭 시 숨기기 / 비공개 클릭 시 보이기
		$("#screctRadio").hide();

		$("#screctRadio1").click(function() {
			$("#screctRadio").hide();
		});

		$("#screctRadio2").click(function() {
			$("#screctRadio").fadeIn();
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

