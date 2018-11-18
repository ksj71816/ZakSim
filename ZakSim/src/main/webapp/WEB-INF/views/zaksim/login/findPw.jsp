<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Zaksim</title>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/login/find.css">
</head>

<body>
	<!-- body -->
	<!-- 로고 이미지 - 메인 페이지로 이동 -->
	<div class="text-center pt-4">
		<a href="/zaksim/main/home"> 
			<img src="/resources/image/main/logo.jpg" width="400">
		</a>
	</div>
	
	<div class="py-5">
		<div class="container">
			<div class="row">
				<div class="col-md-8 mx-auto shadow-sm">
					<ul class="nav nav-tabs">
						<li class="nav-item col-md"><a href="/zaksim/login/findId" class="nav-link" data-toggle="tab" data-target="#tabone">ID 찾기</a></li>
						<li class="nav-item col-md"><a href="/zaksim/login/findPw" class="active nav-link" data-toggle="tab" data-target="#tabtwo">비밀번호 찾기</a></li>
					</ul>
					<div class="tab-content mt-2">
						<div class="tab-pane fade" id="tabone" role="tabpanel">
							<form class="pi-draggable" id="formFindId">
								<div class="form-group">
									<label>이름</label> <input type="text" class="form-control" id="name1" name="name" placeholder="ex) 홍길동">
								</div>
								<div class="form-group">
									<label>이메일</label> <input type="email" class="form-control" id="email1" name="email" placeholder="ex) abcd@gmail.com">
								</div>
								<div class="col-md-4 mx-auto pt-5 pb-2">
									<button type="button" class="btn joinBtnColor col-md" id="btnFindId">ID 찾기</button>
								</div>
							</form>
						</div>
						<!-- 처음 화면에 활성화 되는 컨테이너 -->
						<div class="tab-pane fade show active" id="tabtwo" role="tabpanel">
							<form class="pi-draggable" action="/zaksim/login/findPw" id="findFormPw">
								<div class="form-group">
									<label>아이디</label>
									<input type="text" class="form-control" id="id2" name="id">
								</div>
								<div class="form-group">
									<label>이름</label>
									<input type="text" class="form-control" id="name2" name="name" placeholder="ex) 홍길동">
								</div>
								<div class="form-group">
									<label>이메일</label>
									<input type="email" class="form-control" id="email2" name="email" placeholder="ex) abcd@gmail.com">
								</div>
								<div class="col-md-4 mx-auto pt-5 pb-2">
									<button type="button" class="btn joinBtnColor col-md" id="btnFindPw">비밀번호 찾기</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- body 안  -->
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="idModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModal3Label">ID 찾기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn joinBtnColor" id="btnRedirectLogin1">확인</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="pwModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModal3Label">비밀번호 찾기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn joinBtnColor" id="btnRedirectLogin2">확인</button>
				</div>
			</div>
		</div>
	</div>

<!-- (2018.11.18) jquery 추가 -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<%@ include file="../main/footer.jsp" %>
<script type="text/javascript">
	/* ID 찾기 */
	$('#btnFindId').click(function() {
		if ($('#name1').val() == "" || $('#email1').val() == "") {
			$('.modal-body').html("빈 내용이 있습니다.<br>내용을 채워주세요.");
		} else {

			var params = jQuery("#formFindId").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
			$.ajax({
				type : "post",
				url : "/zaksim/login/findId",
				data : params,
				dataType : "json",
				success : function(data) {
					var findId = data.findId;
					console.log(findId)
					if (findId == null) {
						$('.modal-body').html("해당되는 ID가 없습니다.<br>회원가입을 해주세요.");
					} else {
						$('.modal-body').text("찾으시는 ID : " + data.findId);
					}
				},
				error : function() {
					$('.modal-body').text('님아 오류남. 고치셈');
				}
			});
		}
		$("#idModal").modal();
	});

	$('#btnRedirectLogin1').click(function() {
		if ($('#name1').val() == "" || $('#email1').val() == "") {
			$('button[id=btnRedirectLogin1]').attr("data-dismiss", "modal"); // 태그에 속성 추가하기, 화면 전환 없음
		} else {
			location.href = "/zaksim/login/login"; // 리다이렉트
		}
	});

	/* 비밀번호 찾기 */
	$('#btnFindPw').click(function() {
		if ($('#id2').val() == "" || $('#name2').val() == "" || $('#email2').val() == "") {
			$('.modal-body').html('빈 내용이 있습니다.<br>내용을 채워주세요.');
		} else {
			var params = jQuery("#findFormPw").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
			$.ajax({
				type : "post",
				url : "/zaksim/login/findPw",
				data : params,
				dataType : "json",
				success : function(data) {
					if (data.findPwResult) {
						// 해당 정보를 찾고 임시 비밀번호를 생성이 될 때
						$('.modal-body').html('임시 비밀번호가 이메일로 발송되었습니다.<br>임시 비밀번호로 로그인해주세요.');
						
					} else {
						// 해당 정보를 찾지 못 하였을 때
						$('.modal-body').html('해당되는 정보가 없습니다.<br>회원가입을 해주세요.');
					}
				},
				error : function() {
					$('.modal-body').text('님아 오류남. 고치셈');
				}
			});
		}
		$("#pwModal").modal();
	});

	$('#btnRedirectLogin2').click(function() {
		if ($('#id2').val() == "" || $('#name2').val() == "" || $('#email2').val() == "") {
			$('button[id=btnRedirectLogin2]').attr("data-dismiss", "modal"); // 태그에 속성 추가하기, 화면 전환 없음
		} else {
			location.href = "/zaksim/login/login"; // 리다이렉트
		}
	});
</script>