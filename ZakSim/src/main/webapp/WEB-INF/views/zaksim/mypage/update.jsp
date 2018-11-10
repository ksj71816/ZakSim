<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header include -->
<%@include file="/WEB-INF/views/zaksim/main/header.jsp" %>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />

	<title>Update</title>
	
	<style type="text/css">
		
    	p {
    		font-family: "Helvetica Nene", Helvetica, Arial, 맑은 고딕,"malgun gothic", sans-serif;
    	}
    		
        #navbar {
            background-color: rgb(154, 28, 15)
        }
        
        label {
        	float:left;
        }

		.cols {
  			 width: 18%;
		}
		
		.cols2 {
  			 width: 60%;
		}

     </style>

	<div class="py-5" style="background-image: url(/resources/image/main/back.webp); background-color: rgba(197, 155, 60, 0.4);">
		<div class="container">
		
			<div class="row">
			
				<div class="col-md-4"></div>
				
				<div class="col-md-4" style="text-align: center;">
	
						<h3>회원정보수정</h3>

						<div>
							<img class="rounded-circle" style="height:80px; width:100px;" src="https://data.ac-illust.com/data/thumbnails/78/7877e8c81ac0a942265a9b65a049b784_t.jpeg"/>
						</div>
						
						<div>    
							<p>${sessionScope.login_nick }</p>
						</div>

				</div>
				
				<div class="col-md-4"></div>
				
			</div>
		  
		  </div>
	
		

		<div class="container">
			<div class="col-12 mt-5">
        	 <p class="font-weight-bold h4">기본정보</p>
        	 <hr style="border: solid 2px black;">
     		</div>
		
			<form action="/zaksim/mypage/update" method="post" id="updateform" onsubmit="return update();">
			<div class="d-flex justify-content-center">
			<table class="table table-sm table-borderless" style="width:900px; bagroundcolor:white;">
				<tbody>
					<tr>
						<th class="align-middle cols">아이디</th>
						<td><input type="text" class="form-control form-control-sm mr-sm-2" value="${ID }" 
						 style="width: 400px;" id="ID" name="ID" readonly="readonly"/></td>
						<td></td>
					</tr>
					<tr>
						<th>변경할 비밀번호</th>
						<td>
							<input type="password" class="form-control form-control-sm mr-sm-2"
							style="width: 400px;" id="newPassword1" name="newPassword1"/>
						 	<ul>
                        		<li class="mt-3" style="font-size: 10px; color:red; line-height: 200%;">비밀번호는 8~16자의 영문, 숫자,
                           		 특수문자를 2가지 이상 혼합해서 사용하셔야합니다.</li>
                        		<li style="font-size: 10px; line-height: 200%;">자주 쓰는 사이트의 비밀번호가 같을 경우,
                            	주기적으로 변경하는게 안전합니다.</li>
                        		<li style="font-size: 10px; line-height: 200%;">안전한 개인정보관리를 위해서 주기적으로 변경하시는 것이 안전합니다. </li>
                            </ul>
						</td>
						<td></td>
					</tr>
					<tr>
						<th class="align-middle">비밀번호 재확인</th>
						<td><input type="text" class="form-control form-control-sm mr-sm-2"
						style="width: 400px;" id="newPassword2" name="newPassword2"/></td>
						<td></td>
					</tr>
					<tr>
						<th class="align-middle">이름</th>
						<td><input type="text" class="form-control form-control-sm mr-sm-2"
						style="width: 400px;" value="${NAME }" ID="NAME" name="NAME" disabled /></td>
						<td></td>
					</tr>
					<tr>
						<th class="align-middle">닉네임</th>
						<td><input type="text" class="form-control form-control-sm mr-sm-2"
						style="width: 400px;" value="${NICK }" id="NICK" name="NICK"/></td>
						<td></td>
					</tr>
					<tr>
						<th class="align-middle">연락처</th>
						<td><input type="text" class="form-control form-control-sm mr-sm-2"
						style="width: 400px;" value="${PHONE }" id="PHONE" name="PHONE"/></td>
						<td></td>
					</tr>
					<tr>
						<th class="align-middle">현재 이메일</th>
						<td><input type="text" class="form-control form-control-sm mr-sm-2"
						style="width: 400px;" value="${EMAIL }" id="EMAIL" name="EMAIL" disabled/></td>
						<td></td>
					</tr>
					<tr>
						<th class="align-middle">변경할 이메일</th>
						<td class="form-inline">
							<input type="email" class="form-control form-control-sm mr-sm-2" style="width: 400px;" name="Cemail" id="Cemail">
							<button type="button" class="btn btn-danger btn-sm" onclick="makerandom()" style="height:30px;">인증번호 전송</button>
						</td>
						<td></td>
					</tr>
					<tr>
						<th class="align-middle">이메일 인증번호</th>
						<td class="form-inline">
							<input type="text" class="form-control form-control-sm mr-sm-2" style="width: 400px;" id="mailnum" name="mailnum"/>
							<button type="button" class="btn btn-sm btn-danger" onclick="randomcheck()" style="height:30px;">확인</button>
						</td>
						<td></td>
					</tr>
				</tbody>
			</table>
			</div>
			<div class="form-inline d-flex justify-content-center mt-4">
<!-- 					<button type="submit" class="btn btn-danger btn-sm mr-4" onclick="update();">회원정보 수정</button> -->
					<button class="btn btn-danger btn-sm mr-4">회원정보 수정</button>
					<button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#myModal">서명 생성/수정</button>
				</div>
				
			</form>
		</div>
		
		
		</div>
		
		<div class="modal fade" id="myModal">
					<div class="modal-dialog modal-dialog-centered">
								  
						<div class="modal-content">
						
							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">서명 생성/수정</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
										
							<!-- Modal body -->
							<div class="modal-body">
								<form action="/mypage/sign" method="post">
									<div class="form-group">
									</div>
															
									<div>
										<button type="submit" class="btn btn-danger" data-dismiss="modal">생성/수정</button>
									</div>
								</form>
							</div>
							
					    </div>							    
					</div>
		</div>	

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
	<script type="text/javascript">
	    function update() {
			
		    	var userpwB = $("#newPassword1").val();
	    	    var userpwcB = $("#newPassword2").val();
	    	    var nickB = $("#nick").val();
	    	    var phoneB = $("#phone").val();
	    	    var emailB = $("#Cemail").val();
	
				var userID = document.getElementById("id").value;
		    	var newPassword1 = document.getElementById("newPassword1").value;
		    	var newPassword2 = document.getElementById("newPassword2").value;
		    	var checkemail = document.getElementById("Cemail").value;
		    	var checknick = document.getElementById("nick").value;
		    	var checkphone = document.getElementById("phone").value;
	    	    
		    	if(userpwB.length == 0){
	    	        alert("변경할 비밀번호를 입력해 주세요"); 
	    	        $("#newPassword1").focus();
	    	        return false;
	    	    }
	    	    
	    	    if(userpwcB.length == 0){
	    	        alert("재확인 비밀번호를 입력해 주세요"); 
	    	        $("#newPassword2").focus();
	    	        return false;
	    	    }
	    	 
	    	    if(nickB.length == 0){
	    	        alert("닉네임을 입력해 주세요"); 
	    	        $("#nick").focus();
	    	        return false;
	    	    }
	    	 
	    	    if(phoneB.length == 0){
	    	        alert("전화번호를 입력해주세요");
	    	        $("#phone").focus();
	    	        return false;
	    	    }
	    	    
	    	    if(emailB.length == 0){
	    	        alert("이메일을 입력해주세요");
	    	        $("#Cemail").focus();
	    	        return false;	    	    
	    	    }
		    	
		    	// 길이
		    	 if(!/^[/^(?=.*[!@#$%^&*()])(?=.*[a-z])(?=.*\d).{8,16}$/.test(newPassword1))
		    	 { 
			    	  alert("비밀번호는 숫자, 영문, 특수문자 조합으로 8~16자리를 사용해야 합니다."); 
			    	  return false;
		    	 }
		    	
		    	// 영문, 숫자, 특수문자 2종 이상 혼용
		    	 var chk = 0;
		    	 if(newPassword1.search(/[0-9]/g) != -1 ) chk ++;
		    	 if(newPassword1.search(/[a-z]/ig)  != -1 ) chk ++;
		    	 if(newPassword1.search(/[!@#$%^&*()]/g)  != -1  ) chk ++;
		    	 if(chk < 2)
		    	 { 
		    	  alert("비밀번호는 숫자, 영문, 특수문자를 두가지이상 혼용하여야 합니다."); 
		    	  return false;
		    	 }
		    	 
		    	// 아이디 포함 여부
		    	 if(newPassword1.search(userID)>-1)
		    	 {
		    	  alert("ID가 포함된 비밀번호는 사용하실 수 없습니다."); 
		    	  return false;
		    	 }
		    	
		    	// 재입력 일치 여부
		    	 if (newPassword1 != newPassword2) {
			    	  alert("입력한 두 개의 비밀번호가 서로  일치하지 않습니다."); 
			    	  return false;
		    	 }

		    	 // 닉네임 체크
		    	 if(!/^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{4,12}$/.test(checknick)) {
		    		 alert("닉네임은 특수문자를 제외하고 4자에서 12자 이내로 작성해야 합니다.")
		    		 return false;
		    	 }
		    	 
		    	 // 전화번호 체크
		    	 if(!/^\d{3}-\d{3,4}-\d{4}$/.test(checkphone)) {
		    		 alert("전화번호 형식이 맞지 않습니다.")
		    		 return false;
		    	 }
		    	 
		    	// 이메일 체크
		    	 if(!/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i.test(checkemail)) {
		    		 alert("이메일 형식이 맞지 않습니다.")
		    		 return false;
		    	 }

//	    	    if(addr1.length == 0 || addr2.length == 0 || addr3.length == 0 ){
//	    	        alert("주소를 입력해주세요");
//	    	        $("#addr3").focus();
//	    	        return false;
//	    	    }

		    	 // 기존 비밀번호와 새 비밀번호 일치 여부
// 		    	 if (password == newPassword2) {
// 		    	  alert("기존 비밀번호와 새 비밀번호가 일치합니다.");
// 		    	  return false;
// 		    	 }
	    	}
	    
	    function isContinuedValue(value) {
	    	 console.log("value = " + value);
	    	 var intCnt1 = 0;
	    	 var intCnt2 = 0;
	    	 var temp0 = "";
	    	 var temp1 = "";
	    	 var temp2 = "";
	    	 var temp3 = "";

	    	 for (var i = 0; i < value.length-3; i++) {
	    	  console.log("=========================");
	    	  temp0 = value.charAt(i);
	    	  temp1 = value.charAt(i + 1);
	    	  temp2 = value.charAt(i + 2);
	    	  temp3 = value.charAt(i + 3);

	    	  console.log(temp0)
	    	  console.log(temp1)
	    	  console.log(temp2)
	    	  console.log(temp3)

	    	  if (temp0.charCodeAt(0) - temp1.charCodeAt(0) == 1
	    	   && temp1.charCodeAt(0) - temp2.charCodeAt(0) == 1
	    	   && temp2.charCodeAt(0) - temp3.charCodeAt(0) == 1) {
	    	  intCnt1 = intCnt1 + 1;
	    	  }

	    	  if (temp0.charCodeAt(0) - temp1.charCodeAt(0) == -1
	    	   && temp1.charCodeAt(0) - temp2.charCodeAt(0) == -1
	    	   && temp2.charCodeAt(0) - temp3.charCodeAt(0) == -1) {
	    	  intCnt2 = intCnt2 + 1;
	    	  }
	    	  console.log("=========================");
	    	 }

	    	 console.log(intCnt1 > 0 || intCnt2 > 0);
	    	 return (intCnt1 > 0 || intCnt2 > 0);
	    	}
		
		var text = "";
	    
	    function makerandom()
	    {
	    	text = "";
	    	
	        var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

	        for( var i=0; i < 8; i++ ) // 코드 생성
	            text += possible.charAt(Math.floor(Math.random() * possible.length));

	        alert(text); 
	        
	        return text;
	    }
	    
	    function randomcheck() { 
	    	
	    	var check = document.getElementById("mailnum").value;
	    	
	    	if (check == text ) {
	    		 alert("인증번호가 일치합니다.");
	    	} else {
	    		alert("인증번호가 맞지 않습니다.");
	    		return false;
	    	}	
	    }
    </script>
	
<!-- footer include -->
<%@include file="/WEB-INF/views/zaksim/main/footer.jsp" %>