<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Zaksim</title>
<link rel="stylesheet" type="text/css" 
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="../../css/guidance.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>

<body>
	<!-- header(임시) -->
	<div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<img class="img-fluid d-block mx-auto"
						src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg"
						width="500" height="300">
				</div>
			</div>
		</div>
	</div>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<div class="container">
			<button class="navbar-toggler navbar-toggler-right border-0"
				type="button" data-toggle="collapse" data-target="#navbar12">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbar12">
				<a class="navbar-brand d-none d-md-block" href="#"> <i
					class="fa d-inline fa-lg fa-circle"></i> <b> BRAND</b>
				</a>
				<ul class="navbar-nav mx-auto">
					<li class="nav-item"><a class="nav-link" href="#">Features</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Pricing</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">About</a></li>
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="#">Log in</a></li>
					<li class="nav-item"><a class="nav-link text-primary" href="#">Register</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- body -->
	<div class="py-3">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1 class="">이용안내</h1>
				</div>
			</div>
		</div>
	</div>
	<div>
		<div class="container">
			<div class="row redRow">
				<div class="col-md-5">
					<img class="d-block mx-auto img-fluid" id="img-guid"
						src="/resources/image/이용안내_도전.PNG">
				</div>
				<div class="col-md-7 p-2">
					<p class="redTitle">1. 도전하기</p>
					<p class="redContent">
						자신이 이루고자하는 목표를 '도전'으로 등록해보세요!<br>
						<br>도전금은 이전처럼 도전을 포기하지 못 하게 도와줍니다.<br>
						<br>도전 기간 중 80% 이상 인증을 하면 도전금은 환급됩니다.
					</p>
				</div>
			</div>
		</div>
	</div>
	<div>
		<div class="container">
			<div class="row">
				<div class="col-md-7 p-2">
					<p class="title">2. 인증하기</p>
					<p class="content">
						내 도전을 사진으로 인증해보세요!<br>
						<br>인증에 사용한 사진은 언제든 확인이 가능합니다.<br>
						<br>인증은 하루에 한번만 가능합니다.
					</p>
				</div>
				<div class="col-md-5">
					<img class="img-fluid d-block mx-auto" id="img-guid"
						src="/resources/image/이용안내_인증.PNG">
				</div>
			</div>
		</div>
	</div>
	<div>
		<div class="container">
			<div class="row redRow">
				<div class="col-md-5">
					<img class="img-fluid d-block mx-auto" id="img-guid"
						src="/resources/image/이용안내_모임.PNG">
				</div>
				<div class="col-md-7 p-2">
					<p class="redTitle">3. 모임</p>
					<p class="redContent">
						동일한 목표를 가지고 있는 사람들과 함께 도전해보세요!<br>
						<br>참여하고 있는 모임, 인기모임, 새로 시작된 모임, 카테고리별로<br>모임을 볼 수 있습니다.<br>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div>
		<div class="container">
			<div class="row">
				<div class="col-md-7 p-2">
					<p class="title">4. 랭킹</p>
					<p class="content">
						개인/모임 별로 랭킹을 확인할 수 있어요!<br>
						<br>개인은 도전횟수와 인증률로<br>모임은 좋아요를 토대로 TOP 20를 보여줍니다.
					</p>
				</div>
				<div class="col-md-5">
					<img class="img-fluid d-block mx-auto" id="img-guid"
						src="/resources/image/이용안내_랭킹.PNG">
				</div>
			</div>
		</div>
	</div>

	<!-- footer(임시) -->
	<div class="py-3">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center d-md-flex align-items-center">
					<i class="d-block fa fa-stop-circle fa-2x mr-md-5 text-primary"></i>
					<ul class="nav mx-md-auto d-flex justify-content-center">
						<li class="nav-item"><a class="nav-link active" href="#">Home</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#">Features</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#">Pricing</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#">About</a></li>
					</ul>
					<div class="row">
						<div
							class="col-md-12 d-flex align-items-center justify-content-md-between justify-content-center my-2">
							<a href="#"> <i
								class="d-block fa fa-facebook-official text-muted fa-lg mx-2"></i>
							</a> <a href="#"> <i
								class="d-block fa fa-instagram text-muted fa-lg mx-2"></i>
							</a> <a href="#"> <i
								class="d-block fa fa-twitter text-muted fa-lg ml-2"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">
					<p class="mt-2 mb-0">© 2014-2018 Pingendo. All rights reserved</p>
				</div>
			</div>
		</div>
	</div>
</body>

</html>