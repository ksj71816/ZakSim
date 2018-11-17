<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Zaksim</title>
<link rel="stylesheet" type="text/css" 
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/css/login/login.css?ver=1">
</head>

<body>

<!-- 로그인 상태일 경우 메인으로 돌아가게끔 -->
<%-- <% if ( session.getAttribute("login") != null || session.getAttribute("id") != null) { %>
<script type="text/javascript">
	alert("로그인 상태");
	location.href = "/zaksim/main/home";
</script>
<% } %> --%>

	<!-- body -->
	<!-- 로고 이미지 - 메인 페이지로 이동 -->
	<div class="text-center pt-4">
		<a href="/zaksim/main/home"> 
			<img src="/resources/image/main/logo.png" width="400">
		</a>
	</div>
	
	<div class="py-5">
		<div class="container">
			<p class="col-md-5 mx-auto" id="loginFailMessage"></p>
			<div class="row">
				<div class="col-md-5 mx-auto py-2 shadow-sm" id="login_form">
					<form action="/zaksim/login/login" method="post">
						<div class="form-group">
							<label>ID</label> 
							<input type="text" class="form-control" name="id" placeholder="ID">
						</div>
						<div class="form-group">
							<label>비밀번호</label> 
							<input type="password" class="form-control" name="password" placeholder="비밀번호">
						</div>
						<div class="col-md-5 mx-auto text-center">
							<button type="submit" class="btn loginBtnColor col">로그인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<br><br>
		<div class="container">
			<div class="row" hidden="hidden">
				<!-- 네이버아이디로로그인 버튼 노출 영역 -->
				<div class="col-md-3 mx-auto text-center" id="naverIdLogin"></div>
			</div>
			<br>
<%--			<div class="row">
				<div class="col-md-3 mx-auto">
					<button class="btn btn-secondary col">Google 로그인</button>
				</div>
			</div>	--%>
			<br><br><br><br>
			<div class="row">
				<div class="col-md-7 mx-auto">
					<div class="text-center">
						<a class="btn loginBtnColor col-md-3" href="/zaksim/login/findId">ID 찾기</a>
						<a class="btn loginBtnColor col-md-4" href="/zaksim/login/findPw">비밀번호 찾기</a>
						<a class="btn loginBtnColor col-md-3" href="/zaksim/login/join">회원가입</a>
					</div>
				</div>
			</div>
		</div>
	</div>

<%@ include file="../main/footer.jsp" %>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script type="text/javascript">
	var session = <%=session.getAttribute("login")%>;
	console.log("LOGIN 세션 : " + session);
	
	if(session == false) {
		$('#loginFailMessage').text('※ 아이디랑 비밀번호를 확인해주세요.');
		
	}
	
	/* 네이버아디디로로그인 초기화 Script */
	var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "3Tfw74iqoE6anSkM99vS",
				callbackUrl: "http://localhost:8088/zaksim/login/naverLogin",
				isPopup: true, /* 팝업을 통한 연동처리 여부 */
				loginButton: {color: "green", type: 3, height: 55} /* 로그인 버튼의 타입을 지정 */
			}
		);
		
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
</script>