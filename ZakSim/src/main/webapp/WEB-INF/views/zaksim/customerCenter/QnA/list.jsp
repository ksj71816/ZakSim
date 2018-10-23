<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Zaksim</title>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/css/qna_list.css">
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
	<div class="py-3">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>Q&amp;A</h1>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="col-md-3 offset-9">
			<div class="row justify-content-between">
				<button class="btn col-md-5 btn-primary">문의하기</button>
				<button class="btn col-md-6 btn-primary">내 문의보기</button>
			</div>
		</div>
	</div>
	<div class="py-2">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<table class="table">
						<thead class="table-primary">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>상태</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>10</td>
								<td>질문합니다.</td>
								<td>접수중</td>
								<td>질문왕</td>
								<td>20:23</td>
								<td>0</td>
							</tr>
							<tr>
								<td>9</td>
								<td>질문합니다.</td>
								<td>접수중</td>
								<td>질문왕</td>
								<td>20:05</td>
								<td>0</td>
							</tr>
							<tr>
								<td>8</td>
								<td>질문합니다.</td>
								<td>접수중</td>
								<td>질문왕</td>
								<td>20:00</td>
								<td>0</td>
							</tr>
							<tr>
								<td>7</td>
								<td>질문합니다.</td>
								<td>접수중</td>
								<td>질문왕</td>
								<td>19:50</td>
								<td>0</td>
							</tr>
							<tr>
								<td>6</td>
								<td>질문합니다.</td>
								<td>접수중</td>
								<td>질문왕</td>
								<td>19:40</td>
								<td>0</td>
							</tr>
							<tr>
								<td>5</td>
								<td>질문합니다.</td>
								<td>접수중</td>
								<td>질문왕</td>
								<td>19:30</td>
								<td>1</td>
							</tr>
							<tr>
								<td>4</td>
								<td>질문합니다.</td>
								<td>접수중</td>
								<td>질문왕</td>
								<td>19:25</td>
								<td>6</td>
							</tr>
							<tr>
								<td>3</td>
								<td>질문합니다.</td>
								<td>접수중</td>
								<td>질문왕</td>
								<td>19:23</td>
								<td>3</td>
							</tr>
							<tr>
								<td>2</td>
								<td>환불받고싶어요</td>
								<td>답변완료</td>
								<td>암요환불맨</td>
								<td>00:10</td>
								<td>1</td>
							</tr>
							<tr>
								<td>1</td>
								<td>중도포기관련</td>
								<td>답변완료</td>
								<td>도포자</td>
								<td>2018.10.22</td>
								<td>2</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md- mx-auto">
			<ul class="pagination">
				<li class="page-item disabled"><a class="page-link" href="#">
						<span>«</span> <span class="sr-only">Previous</span>
				</a></li>
				<li class="page-item active"><a class="page-link" href="#">1</a>
				</li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">4</a></li>
				<li class="page-item"><a class="page-link" href="#">5</a></li>
				<li class="page-item"><a class="page-link" href="#">6</a></li>
				<li class="page-item"><a class="page-link" href="#">7</a></li>
				<li class="page-item"><a class="page-link" href="#">8</a></li>
				<li class="page-item"><a class="page-link" href="#">9</a></li>
				<li class="page-item"><a class="page-link" href="#">10</a></li>
				<li class="page-item"><a class="page-link" href="#"> <span>»</span>
						<span class="sr-only">Next</span>
				</a></li>
			</ul>
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
	<pingendo onclick="window.open('https://pingendo.com/', '_blank')"
		style="cursor:pointer;position: fixed;bottom: 20px;right:20px;padding:4px;background-color: #00b0eb;border-radius: 8px; width:220px;display:flex;flex-direction:row;align-items:center;justify-content:center;font-size:14px;color:white">Made
	with Pingendo Free&nbsp;&nbsp;<img
		src="https://pingendo.com/site-assets/Pingendo_logo_big.png"
		class="d-block" alt="Pingendo logo" height="16"></pingendo>
</body>

</html>