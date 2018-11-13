<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZakSim admin</title>

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
			<a href="/zaksim/admin/login" style="font-weight: bold; color: white;"></a>
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
                  <form>
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
                        <input type="password" class="form-control" id="password" name="password" placeholder="PASSWORD">
                      </div>
                    </div>
                    <button type="button" class="btn mt-4 mb-4 btn-danger rounded btn-lg" onclick="adminLogin();" style="background-color: #a81919; font-weight: bold">LOGIN</button>
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


<!-- Login fail Modal -->
<div class="modal" id="loginFailModal" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title mt-1 mb-1" style="font-family: Dohyeon; font-weight: 300;">로그인 실패</h5>
        <button type="button" class="close" data-dismiss="modal">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
        <div class="row ml-1 mr-1" style="max-height: 200px;">
        	<p>아이디와 비밀번호를 다시 확인해 주세요.</p>
        </div>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- Login fail Modal -->


<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  
  
<script type="text/javascript">

function adminLogin() {
	
	var id = $("#id").val();
	var password = $("#password").val();
	
	$.ajax({
		type: "post"
		, url : "/zaksim/admin/login"
		, data : {
			id : id,
			password : password
		}
		, dataType: "json"
		, success: function( data ) {
// 			console.log(data);
			
			if(data.aLogin == false){
				$("#id").val("");
				$("#password").val("");
				$("#loginFailModal").modal("show");
			} else {
// 				console.log("aaaa");
				$(location).attr('href', "/zaksim/admin/member");
			}
		}
		, error: function( e ) {
			console.log("--- error ---");
			console.log( e.responseText );
		}
		, complete: function() {
			//입력 창 초기화
		}
	});	
}

</script>
  
</body>
</html>