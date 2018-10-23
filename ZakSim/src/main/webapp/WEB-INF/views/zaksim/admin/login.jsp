<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="https://static.pingendo.com/bootstrap/bootstrap-4.1.3.css">
  
  <!-- font awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
  integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
  
</head>
<body>

<!-- navbar -->
	<nav class="navbar navbar-expand-lg fixed-top" style="background-color: #8A0303;">
		<a href="" class="btn" style="font-size: xx-large; font-weight: bold; color: white;">ZakSim</a>
		<div class="collapse navbar-collapse justify-content-end">
			<a href="/zaksim/admin/login" style="font-weight: bold; color: white;">LOGOUT</a>
		</div>
	</nav>
<!-- navbar -->


<!-- main -->
<div class="py-5 mt-5">
    <div class="container">
      <div class="row my-4 mt-5" >
        <div class="mx-auto col-md-6 col-10 col-xl-4 px-4">
          <div class="card" style="width: 350px;">
            <div class="card-body text-center">
              <div class="row mt-5">
                <div class="col-md-12">
                  <h1 class="mb-4">
                    <b style="font-weight: bold">ZakSim</b>
                  </h1>
                </div>
              </div>
              <div class="row mt-4 pt-4">
                <div class="col ml-3 mr-3">
                  <form action="/zaksim/admin/login" method="post">
                    <div class="form-group mb-2">
                      <div class="input-group border-0">
                        <div class="input-group-prepend">
                          <span class="input-group-text" id="basic-addon1">
                            <i class="fa fa-user-circle fa-fw"></i>
                          </span>
                        </div>
                        <input type="text" class="form-control" id="id" name="id" placeholder="ID">
                      </div>
                    </div>
                    <div class="form-group mb-2">
                      <div class="input-group border-0">
                        <div class="input-group-prepend ">
                          <span class="input-group-text" id="basic-addon1">
                            <i class="fa fa-key fa-fw"></i>
                          </span>
                        </div>
                        <input type="text" class="form-control" id="password" name="password" placeholder="PASSWORD">
                      </div>
                    </div>
                    <button type="submit" class="btn mt-4 mb-4 btn-danger rounded btn-lg" style="background-color: #a81919; font-weight: bold">LOGIN</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<!-- main -->

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  
</body>
</html>