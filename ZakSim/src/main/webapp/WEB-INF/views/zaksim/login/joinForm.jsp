<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>ZakSim</title>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/login/join.css">
</head>

<body>
	<!-- body -->
	<div class="py-3">
		<!-- 로고 이미지 - 메인 페이지로 이동 -->
		<div class="text-center py-3">
			<a href="/zaksim/main/home"> <img
				src="/resources/image/main/logo.png" width="500">
			</a>
		</div>
	</div>
	
	<div class="text-center pt-4 pb-5">
		<div class="container">
			<div class="row">
				<div class="mx-auto col-md-7 shadow-sm">
					<h1 class="mt-3 mb-5">회원가입</h1>
					<form action="/zaksim/login/joinForm" method="post" class="text-left">
						<div class="form-group">
							<label for="joinId">아이디</label>
							<div class="row mx-auto joinBorder">
								<input type="text" class="form-control" id="joinId" name="Id" placeholder="6 ~ 12자(영소문자+숫자)">
							</div>
							<!-- if문 처리하기 -->
							<p id="idMessage"></p>
<!-- 							<p class="failColor">이미 사용중인 아이디 입니다.</p> -->
<!-- 							<p class="failColor">6 ~ 12자(영문+숫자)로 입력해주세요.</p> -->
<!-- 							<p class="successColor">사용 가능한 아이디입니다.</p> -->
							<!----------------->
						</div>
						<br>
						<div class="form-group">
							<label for="joinPw">비밀번호 <small class="successColor">특수문자* : ! @ # $ % ^ & * ( )</small></label>
							<div class="row mx-auto joinBorder">
								<input type="password" class="form-control col-md-10" id="joinPw" name="password" placeholder="8 ~ 16자(영문+숫자+특수문자*)">
								<!-- if문 처리하기 -->
								<span id="pwMessage"></span> 
<!-- 								<span class="col-md text-center m-1 failColor">불가</span>  -->
<!-- 								<span class="col-md text-center m-1 successColor">가능</span> -->
								<!----------------->
							</div>
						</div>
						<div class="form-group">
							<label for="joinPwCheck">비밀번호 재확인</label>
							<div class="row mx-auto joinBorder">
								<input type="password" class="form-control col-md-10" id="joinPwCheck">
								<!-- if문 처리하기 -->
								<span id="pwCheckMessage"></span> 
<!-- 								<span class="col-md text-center m-1 failColor">X</span>  -->
<!-- 								<span class="col-md text-center m-1 successColor">O</span> -->
								<!----------------->
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="joinNick">닉네임</label>
							<div class="row mx-auto joinBorder">
								<input type="text" class="form-control" id="joinNick" name="nick" placeholder="4 ~ 12자(특수문자 제외)">
							</div>
							<p id="nickMessage"></p>
<!-- 							<p class="failColor">사용 불가능한 닉네임입니다.</p> -->
<!-- 							<p class="successColor">사용 가능한 닉네임입니다.</p> -->
						</div>
						<br>
						<div class="form-group">
							<label for="joinName">이름</label>
							<div class="row mx-auto joinBorder">
								<input type="text" class="form-control" id="joinName" name="name" placeholder="ex) 홍길동">
							</div>
							<p id="nameMessage" class="failColor"></p>
						</div>
						<br>
						<div class="form-group">
							<label for="joinPhone">전화번호 <small class="successColor">(-) 입력 제외</small></label>
							<div class="row mx-auto">
								<div class="joinBorder col-md-8 px-0">
									<input type="tel" class="form-control" id="joinPhone" name="phone">
								</div>
								<label class="col-md-1"> </label>
								<button type="button" class="btn col-md-3 joinBtnColorCheck1" id="btnPhone" hidden="hidden">인증번호 받기</button>
							</div>
							<p id="phoneMessage" class="failColor"></p>
						</div>
						<br>
						<div class="form-group">
							<label for="joinEmail">이메일</label>
							<div class="row mx-auto">
								<div class="joinBorder col-md-8 px-0">
									<input type="email" class="form-control" id="joinEmail" name="email" placeholder="ex) abcd@gmail.com">
								</div>
								<label class="col-md-1"> </label>
								<button type="button" class="btn col-md-3 joinBtnColorCheck1" id="btnEmail">인증번호 받기</button>
							</div>
							<br>
							<div class="row mx-auto">
								<div class="joinBorder col-md-8 px-0">
									<input type="email" class="form-control" id="joinNum" placeholder="인증번호를 입력하세요.">
								</div>
								<label class="col-md-1"> </label>
								<button type="button" class="btn col-md-3 joinBtnColorCheck2" id="btnEmailCheck">인증 확인</button>
							</div>
						</div>
						<p id="joinErrorMessage" class="failColor"></p>
						<div class="col-md-6 mx-auto pt-5 pb-3">
							<button type="button" class="btn joinBtnColor col-md" id="btnJoin">가입하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="emailModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModal3Label">인증번호 받기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn joinBtnColor" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>

<!-- (2018.11.18) jquery 추가 -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>	
<%@ include file="../main/footer.jsp" %>

<script type="text/javascript">
	var flagId = false; // ID 중복 체크
	var flagPw = false; // 비밀번호
	var flagPwCheck = false; // 비밀번호 재확인
	var flagNick = false; // 닉네임 중복 체크
	var flagName = false; // 이름
	var flagPhone = false; // 전화번호
	var flagEmail = false; // 이메일
	var flagEmailCheck = false; // 이메일 인증
	
	var joinPw = null; // 비밀번호 저장할 변수(비밀번호 재확인에 필요)
	var checkNum = null; // 인증번호 저장할 변수
	
	
	// ID 중복 체크/유효성 검사 (포커스 잃을 때 실행)
	$('#joinId').blur(function(){
		var joinId = $('#joinId').val(); // input 에 있는 값 담기.
		console.log("입력한 ID : " + joinId);
		
		var formId = /^[a-z](?=.*\d)[a-z0-9]{4,10}$/; // 유효성 검사 설정
		// \d : 숫자( 0~9 )
		// 첫 문자는 무조건 영소문자, 그 뒤에 영소문자+숫자(적어도 한 개 이상)조합으로 4 ~ 10자
		// (첫 문자와 최소 숫자를 합쳐서 6 ~ 12자가 됨)
		
		// ID 검사하는 if-else문
		if(joinId == "" || !formId.test(joinId)) {
			// 공백이거나 유효하지 않을 시
			console.log("if문 안이오이다.")
			$('#idMessage').attr('class', 'failColor');
			$('#idMessage').text('6 ~ 12자(영소문자+숫자)로 입력해주세요.');
			
			flagId = false;
			
			console.log("Flag ID : " + flagId);
			
		} else {
			joinId = "joinId=" + joinId;
			console.log("넘어갈 ID 중복 체크할 데이터 : " + joinId);
			
			$.ajax({
				type: "post",
				url: "/zaksim/login/joinId",
				data: joinId,
				dataType: "json",
				success: function(data) {
					var uniqueId = data.uniqueId;
					console.log("ajax 실행");
					
					if (uniqueId) {	
						$('#idMessage').attr('class', 'successColor');
						$('#idMessage').text('사용 가능한 아이디입니다.');
						
						flagId = true;
						
					} else {		
						$('#idMessage').attr('class', 'failColor');
						$('#idMessage').text('이미 사용 중인 아이디 입니다.');
						
						flagId = false;
					}
					
					console.log("Flag ID : " + flagId);
				},
				error: function(request,status,error) {
					alert('무슨 오류인지 모르겠는데 오류났음 :)...');
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					
					flagId = false;
					
					console.log("Flag ID : " + flagId);
				}
			});
		} // ID 검사하는 if-else문 끝
	});
	
	// 비밀번호 유효성 검사 (키를 누르고 땠을 때 실행)
	$('#joinPw').keyup(function(){
		console.log("Pw 키 입력 중");
		joinPw = $('#joinPw').val(); // input에 있는 값 담기.
		
		console.log("입력한 비밀번호 : " + joinPw);
		
		var formPw = /^(?=.*[!@#$%^&*()])(?=.*[a-z])(?=.*\d).{8,16}$/; // 유효성 검사 설정
		// 특수문자 + 영소문자 + 숫자 조합으로 8 ~ 16자
		// 특수문자 : !@#$%^&*() 키보드 숫자키의 특수문자만 가능
		
		if ( joinPw == "" || !formPw.test(joinPw) ) {
			// 유효하지 않을 시
			$('#pwMessage').attr('class', 'col-md text-center m-1 failColor');
			$('#pwMessage').text('불가');
			
			flagPw = false;
			
		} else {
			$('#pwMessage').attr('class', 'col-md text-center m-1 successColor');
			$('#pwMessage').text('가능');
			
			flagPw = true;
			
		}
		
		console.log("Flag password : " + flagPw);
	});
	
	// 비밀번호 재확인 (키를 누르고 땠을 때 실행)
	$('#joinPwCheck').keyup(function(){
		console.log("Pw 키 입력 중");
	    var joinPwCheck = $('#joinPwCheck').val(); // input에 있는 값 담기.
		
		console.log("비밀번호 : " + joinPw);
		console.log("입력한 비밀번호 : " + joinPwCheck);
		
		if ( joinPwCheck == "" || joinPwCheck != joinPw ) {
			// 비밀번호와 맞지 않을 시
			$('#pwCheckMessage').attr('class', 'col-md text-center m-1 failColor');
			$('#pwCheckMessage').text('X');
			
			flagPwCheck = false;
			
		} else {
			$('#pwCheckMessage').attr('class', 'col-md text-center m-1 successColor');
			$('#pwCheckMessage').text('O');

			flagPwCheck = true;
			
		}
		
		console.log("Flag password check : " + flagPwCheck);
	});
	
	// 닉네임 중복 체크/유효성 검사 (포커스 잃을 때 실행)
	$('#joinNick').blur(function(){
		var joinNick = $('#joinNick').val(); // input 에 있는 값 담기.
		console.log("입력한 닉네임 : " + joinNick);
		
		var formNick = /^[a-zA-Z가-힣0-9]{4,12}$/; // 유효성 검사 설정
		// 특수 문자 제외, 4 ~ 12자
		
		if(joinNick == "" || !formNick.test(joinNick)) {
			// 공백이거나 유효하지 않을 시
			$('#nickMessage').attr('class', 'failColor');
			$('#nickMessage').text('사용 불가능한 닉네임입니다.');
			
			flagNick = false;
			
			console.log("Flag nick : " + flagNick);
			
		} else {
			joinNick = "joinNick=" + joinNick;
			console.log("넘어갈 닉네임 중복 체크할 데이터 : " + joinNick);
			
			$.ajax({
				type: "post",
				url: "/zaksim/login/joinNick",
				data: joinNick,
				dataType: "json",
				success: function(data) {
					var uniqueNick = data.uniqueNick;
					console.log("ajax 실행");
					
					if (uniqueNick) {	
						$('#nickMessage').attr('class', 'successColor');
						$('#nickMessage').text('사용 가능한 닉네임입니다.');
						
						flagNick = true;
						
					} else {		
						$('#nickMessage').attr('class', 'failColor');
						$('#nickMessage').text('이미 사용 중인 닉네임입니다.');
						
						flagNick = false;
					}
					
					console.log("Flag nick : " + flagNick);
				},
				error: function(request,status,error) {
					alert('캬항~ 오류 파티다!');
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					
					flagNick = false;
				}
			});
		} // 닉네임 검사하는 if-else문 끝
	});

	// 이름 유효성 검사 (포커스 잃을 때 실행)
	$('#joinName').blur(function(){
		var joinName = $('#joinName').val(); // input 에 있는 값 담기.
		console.log("입력한 이름 : " + joinName);
		
		var formName = /^[가-힣]{2,6}$/; // 유효성 검사 설정
		// 한글, 2 ~ 6자
		
		if(joinName == "" || !formName.test(joinName)) {
			// 공백이거나 유효하지 않을 시
			$('#nameMessage').text('이름을 정확히 입력해주세요. (예시 : 홍길동)');
			
			flagName = false;
			
		} else {
			$('#nameMessage').text('');
			
			flagName = true;
		
		}
		
		console.log("Flag name : " + flagName);
	});
	
	// 전화번호 유효성 검사 (포커스 잃을 때 실행)
	$('#joinPhone').blur(function(){
		var joinPhone = $('#joinPhone').val(); // input에 있는 값 담기.
		
		console.log("입력한 전화번호 : " + joinPhone);
		
		var formPhone = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g; // 유효성 검사 설정
		// 전화번호 정규식
		
		if ( joinPhone == "" || !formPhone.test(joinPhone) ) {
			// 유효하지 않을 시
			$('#phoneMessage').text('전화번호 형식에 맞지 않습니다.(숫자만 입력)');
			
			flagPhone = false;
			
		} else {
			$('#phoneMessage').text('');
			$('#joinPhone').val(
					joinPhone.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, "$1-$2-$3"));
			
			joinPhone = $('#joinPhone').val();
			flagPhone = true;
			
		}
		
		console.log("최종 전화번호 : " + joinPhone);
		console.log("Flag phone : " + flagPhone);
	});
	
	// 이메일 - 인증번호 받기
	$('#btnEmail').click(function(){
		var joinEmail = $('#joinEmail').val(); // input 에 있는 값 담기.
		console.log("입력한 email : " + joinEmail);
		
		var formEmail = /^[a-zA-Z0-9_+.-]+@[a-z0-9-]+\.[a-z0-9]{2,4}$/; // 유효성 검사 설정
		// 이메일 정규식
		
		if ( joinEmail == "" || !formEmail.test(joinEmail) ) {
			// 유효하지 않을 시
			$('.modal-body').html("이메일 형식에 맞지 않습니다.<br>이메일을 다시 입력해주세요.");
			
			flagEmail = false;
			
			console.log("Flag email : " + flagEmail);
			
		} else {
			
			joinEmail = "joinEmail=" + joinEmail;
			console.log("보낼 이메일 주소 : " + joinEmail);
			
			$.ajax({
				type: "post",
				url: "/zaksim/login/joinEmail",
				data: joinEmail,
				dataType: "json",
				success: function(data) {
					checkNum = data.checkNum;
					
					if (checkNum == "" || checkNum == null) {
						$('.modal-body').html('인증번호를 못 가져왔습니다.<br>다시 시도해주세요.');
						console.log('인증번호 못 넘김.');
	
						flagEmail = false;
						
					} else {
						$('.modal-body').html('입력한 이메일로 인증번호를 발송했습니다.<br>이메일을 확인해주세요.');
						console.log('인증번호 : ' + checkNum);
						
						flagEmail = true;
					}
					
					console.log("Flag email : " + flagEmail);
				},
				error: function() {
					$('.modal-body').text('또 오류냐?');
					
					flagEmail = false;
					
					console.log("Flag email : " + flagEmail);
				}
			});
			
		}
		$('#emailModal').modal();
	});
	
	// 이메일 - 인증확인
	$('#btnEmailCheck').click(function(){
		var joinNum = $('#joinNum').val();
		
		console.log("인증번호 : " + checkNum);
		console.log("입력한 인증번호 : " + joinNum);
		
		if (checkNum == "" || checkNum == null) {
			// 인증번호가 없을 시
			$('.modal-title').text('인증번호 확인');
			$('.modal-body').html('인증번호가 없습니다.<br>인증번호를 다시 받아주세요.');
			
			flagEmailCheck = false;
		
		} else {
			if (joinNum == "" || joinNum != checkNum) {
				// 인증번호가 맞지 않을 시
				$('.modal-title').text('인증번호 확인');
				$('.modal-body').html('인증번호가 맞지 않습니다.<br>인증번호를 확인해주세요.');
				
				flagEmailCheck = false;
				
			} else {
				$('.modal-title').text('인증번호 확인');
				$('.modal-body').html('이메일 인증을 완료했습니다.');				
				
				flagEmailCheck = true;
			}
		}
		$('#emailModal').modal();
		
		console.log("Flag email check : " + flagEmailCheck);
	});
	
	$('#btnJoin').click(function(){
		if (flagId && flagPw && flagPwCheck && flagNick 
				&& flagName && flagPhone && flagEmail && flagEmailCheck){
			// 모든 정보 입력되어 있을 경우, submit
			$('form').submit();
			
		} else {
			if (!flagId){
				$('#idMessage').attr('class', 'failColor');
				$('#idMessage').text('아이디를 입력해주세요.');
			}
			if (!flagPw){
				$('#pwMessage').attr('class', 'col-md text-center m-1 failColor');
				$('#pwMessage').text('불가');
			}
			if (!flagPwCheck){
				$('#pwCheckMessage').attr('class', 'col-md text-center m-1 failColor');
				$('#pwCheckMessage').text('X');
			}
			if (!flagNick){
				$('#nickMessage').attr('class', 'failColor');
				$('#nickMessage').text('닉네임을 입력해주세요.');
			}
			if (!flagName){
				$('#nameMessage').text('이름을 입력해주세요.');
			}
			if (!flagPhone){
				$('#phoneMessage').text('전화번호를 입력해주세요.');
			}
			if (!flagEmail || !flagEmailCheck){
				if (!flagId || !flagPw || !flagPwCheck || !flagNick || !flagName || !flagPhone){	
					$('#joinErrorMessage').text('인증 및 필수 정보가 필요합니다.');
				} else {				
					$('#joinErrorMessage').text('인증이 필요합니다.');
				}
			} else {
				if (!flagId || !flagPw || !flagPwCheck || !flagNick || !flagName || !flagPhone){	
					$('#joinErrorMessage').text('필수 정보가 필요합니다.');
				}
			}
		} // if-else문 끝

	});
</script>