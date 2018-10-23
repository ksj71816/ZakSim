<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Zaksim</title>
<link rel="stylesheet" type="text/css" 
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="../../css/login.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>

<body >
  <img class="img-fluid d-block mx-auto pt-4" src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg" width="400">
  <div class="py-5">
    <div class="container">
      <div class="row">
        <div class="col-md-5 mx-auto py-2 shadow-sm" id="login_form">
          <form>
            <div class="form-group"> <label>ID</label> <input type="email" class="form-control" placeholder="ID"></div>
            <div class="form-group"> <label>비밀번호</label> <input type="password" class="form-control" placeholder="비밀번호"> </div>
            <div class="col-md-5 mx-auto text-center">
              <button type="submit" class="btn btn-primary col">로그인</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <br><br>
    <div class="container">
      <div class="row">
        <div class="col-md-3 mx-auto">
          <button class="btn btn-naver col">Naver 로그인</button></div>
      </div>
      <br>
      <div class="row">
        <div class="col-md-3 mx-auto">
          <button class="btn btn-secondary col">Google 로그인</button>
        </div>
      </div>
      <br><br><br><br>
      <div class="row">
        <div class="col-md-7 mx-auto">
          <div class="text-center">
            <button class="btn btn-primary col-md-3">ID 찾기</button>
            <button class="btn btn-primary col-md-4">비밀번호 찾기</button>
            <button class="btn btn-primary col-md-3">회원가입</button>
          </div>
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