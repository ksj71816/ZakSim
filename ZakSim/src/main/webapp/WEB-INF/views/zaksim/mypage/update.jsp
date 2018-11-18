<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header include -->
<%@include file="/WEB-INF/views/zaksim/main/header.jsp" %>
<link rel="stylesheet" type="text/css" href="/css/mypage/mypage.css">

	<div class="py-5">
		<div class="container">
			<div class="row mt-5">
	    		<h2 class="ml-3 pl-2 pt-1 title dohyeon">회원 정보 수정</h2>
	    	</div>
	
		
		<div class="row">			
			<div class="col-md-1"></div>
			<div class="col-md-10 mt-5 pt-5">
	        	 <p class="h4 dohyeon">기본정보</p>
	        	 <hr class="mBorder-sub">
     		</div>
			<div class="col-md-1"></div>
		</div>
		
			<form action="/zaksim/mypage/update"  method="post" id="updateform">
			<div class="row d-flex justify-content-center mt-5">
			<table class="table table-sm table-borderless ml-5 mTable">
				<tbody>
					<tr>
						<th class="align-middle cols">아이디</th>
						<td><input type="text" class="form-control form-control-sm mr-sm-2 mInput" value="${member.id}" 
						 id="ID" name="ID" readonly="readonly"/></td>
						<td></td>
					</tr>
					<tr>
						<th>변경할 비밀번호</th>
						<td>
							<input type="password" class="form-control form-control-sm mr-sm-2 mInput"
							id="password" name="password"/>
						 	<ul>
                        		<li class="mt-3 mLi" style="color:red;">비밀번호는 8~16자의 영문, 숫자,
                           		 특수문자를 2가지 이상 혼합해서 사용하셔야합니다.</li>
                        		<li class="mLi">안전한 개인정보관리를 위해 비밀번호를 주기적으로 변경하시기 바랍니다. </li>
                            </ul>
						</td>
						<td></td>
					</tr>
					<tr>
						<th></th>
						<td><p id="pwMessage" style="font-size: 0.9em;"></p></td>
						<td></td>
					</tr>
					<tr>
						<th class="align-middle">비밀번호 재확인</th>
						<td><input type="password" class="form-control form-control-sm mr-sm-2 mInput"
						id="newPassword2" name="newPassword2"/></td>
						<td></td>
					</tr>
					<tr>
						<th></th>
						<td><p id="rePwMessage" style="font-size: 0.9em;"></p></td>
						<td></td>
					</tr>
					<tr>
						<th class="align-middle">이름</th>
						<td><input type="text" class="form-control form-control-sm mr-sm-2 mInput"
						value="${member.name}" ID="name" name="name" disabled /></td>
						<td></td>
					</tr>
					<tr>
						<th class="align-middle">닉네임</th>
						<td><input type="text" class="form-control form-control-sm mr-sm-2 mInput"
						value="${member.nick}" id="nick" name="nick"/></td>
						<td></td>
					</tr>
					<tr>
						<th></th>
						<td><p id="nickMessage" style="font-size: 0.9em;"></p></td>
						<td></td>
					</tr>
					<tr>
						<th class="align-middle">연락처</th>
						<td><input type="text" class="form-control form-control-sm mr-sm-2 mInput"
						value="${member.phone}" id="phone" name="phone"/></td>
						<td></td>
					</tr>
					<tr>
						<th></th>
						<td><p id="phoneMessage" style="font-size: 0.9em;"></p></td>
						<td></td>
					</tr>
					<tr>
						<th class="align-middle">현재 이메일</th>
						<td><input type="text" class="form-control form-control-sm mr-sm-2 mInput"
						value="${member.email}" id="email" name="email" disabled/></td>
						<td></td>
					</tr>
					<tr>
						<th class="align-middle">변경할 이메일</th>
						<td class="form-inline">
							<input type="email" class="form-control form-control-sm mr-sm-2 mInput" name="Cemail" id="Cemail">
							<button type="button" class="btn btn-danger btn-sm" id="emailBtn" style="height:30px;">인증번호 전송</button>
						</td>
						<td></td>
					</tr>
					<tr>
						<th></th>
						<td><p id="emailMessage" style="font-size: 0.9em;"></p></td>
						<td></td>
					</tr>
					<tr>
						<th class="align-middle">이메일 인증번호</th>
						<td class="form-inline">
							<input type="text" class="form-control form-control-sm mr-sm-2 mInput" id="mailnum" name="mailnum"/>
							<button type="button" class="btn btn-sm btn-danger" id="checkBtn" onclick="randomcheck();" style="height:30px;">확인</button>
						</td>
						<td></td>
					</tr>
				</tbody>
			</table>
			</div>
			
			<div class="form-inline d-flex justify-content-center mt-4">
				<button class="btn btn-lg btn-danger btn-sm mr-4" type="button" onclick="update();">회원정보 수정</button>
			</div>
				
			</form>
		
		</div>
		</div>
		
		
<div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" style="font-family: Dohyeon; font-weight: 300;">양식 오류</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
    	<div class="row ml-1 mr-1">
    		<p id="modalBody"></p>
    	</div>        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>




	
<!-- footer include -->
<%@include file="/WEB-INF/views/zaksim/main/footer.jsp" %>


<script type="text/javascript">

var flagPw = false;
var flagRePw = false;
var flagNick = false;
var flagPhone = false;
var flagEmail = false;
var flagEmailNum = false;

$(document).ready(function() {
	checkNick();
	checkPhone();
	checkEmail();
	
	$("#checkBtn").prop("disabled", true);
	$("#mailnum").prop("disabled", true);
});

function update() {
	
	emailFlag = false;
			
   	var userpwB = $("#password").val();
    var userpwcB = $("#newPassword2").val();
    var nickB = $("#nick").val();
    var phoneB = $("#phone").val();
    var emailB = $("#Cemail").val();
    
    
   	if((userpwB != null && userpwB != "") && flagPw == false) {
		
		showModal("비밀번호는 숫자, 영문, 특수문자의 조합으로 8~16자리를 사용해야 합니다.");
		$("#password").focus();
	
	} else if((userpwB != null && userpwB != "") && userpwcB == null || userpwcB == "") {
    	
    	showModal("재확인 비밀번호를 입력해 주세요");
		$("#newPassword2").focus();
		
	} else if ((userpwB != null && userpwB != "") && flagRePw == false) {
		
		showModal("입력한 두 개의 비밀번호가 서로  일치하지 않습니다.");
		$("#newPassword2").focus();
		
	} else if(nickB == null || nickB == "") {
		
		showModal("닉네임을 입력해 주세요");
		$("#nick").focus();
	
	} else if(flagNick == false && $('#nick').val() == '${member.nick}') {
		
		$('#nickMessage').attr('class', 'successColor');
		$('#nickMessage').text('사용 가능한 닉네임입니다.');
		
		flagNick = true;
		
	} else if(flagNick == false && $('#nick').val() != '${member.nick}') {
		
		showModal("닉네임은 특수문자를 제외하고 4자에서 12자 이내로 작성해야 합니다.");
		$("#nick").focus();		
		
	} else if(phoneB == null || phoneB == "") {
		
		showModal("연락처를 입력해주세요");
		$("#phone").focus();
	
	} else if(flagPhone == false && $('#phone').val() == '${member.phone}') {
		
		$('#phoneMessage').attr('class', 'successColor');
		$('#phoneMessage').text('사용 가능한 연락처입니다.');
		
		flagPhone = true;
		
	} else if(flagPhone == false && $('#phone').val() != '${member.phone}') {
		
		showModal("연락처 형식이 맞지 않습니다.");
		$("#phone").focus();
		
	} else if((emailB != null && emailB != "") && flagEmail == false) {
		
		showModal("이메일 형식이 맞지 않습니다.");
		$("#email").focus();
		
	} else if((emailB != null && emailB != "") && flagEmailNum == false) {
		
		showModal("인증번호를 확인해주세요.");
		$("#emailnum").focus();
	
	} else {
		$("#updateform").submit();
	}

}

function showModal(msg) {
	console.log(msg);
	$("#modalBody").text(msg);
	$("#checkModal").modal('show');
}
   
	    
function randomcheck() { 
	    	
   	var check = $("#mailnum").val();
   	
   	if(checkNum != "") {
	   	if (check == checkNum ) {
	   		flagEmailNum = true;
	   		 alert("인증번호가 일치합니다.");
	   	} else {
	   		flagEmailNum = false;
	   		alert("인증번호가 맞지 않습니다.");
	   	}	   		
   	}
}

//비밀번호 유효성 검사 (키를 누르고 땠을 때 실행)
$('#password').keyup(function(){
	joinPw = $('#password').val(); // input에 있는 값 담기.
	
	var formPw = /^(?=.*[!@#$%^&*()])(?=.*[a-z])(?=.*\d).{8,16}$/; // 유효성 검사 설정
	// 특수문자 + 영소문자 + 숫자 조합으로 8 ~ 16자
	// 특수문자 : !@#$%^&*() 키보드 숫자키의 특수문자만 가능
	
	if ( joinPw == "" || !formPw.test(joinPw) ) {
		// 유효하지 않을 시
		$('#pwMessage').attr('class', 'failColor');
		$('#pwMessage').text('비밀번호는 숫자, 영문, 특수문자의 조합으로 8~16자리를 사용해야 합니다.');
		
		flagPw = false;
		
	} else {
		$('#pwMessage').attr('class', 'successColor');
		$('#pwMessage').text('사용 가능한 비밀번호입니다.');
		
		flagPw = true;
		
	}
});

$('#newPassword2').keyup(function(){
	if($('#password').val() == $("#newPassword2").val()) {
		$('#rePwMessage').attr('class', 'successColor');
		$('#rePwMessage').text('비밀번호 일치');
		
		flagRePw = true;
	} else {
		$('#rePwMessage').attr('class', 'failColor');
		$('#rePwMessage').text('비밀번호 불일치');
		
		flagRePw = false;
	}
});

//닉네임 중복 체크/유효성 검사 (포커스 잃을 때 실행)
$('#nick').keyup(function(){
	checkNick();
});

function checkNick() {
var joinNick = $('#nick').val(); // input 에 있는 값 담기.
	
	var formNick = /^[a-zA-Z가-힣0-9]{4,12}$/; // 유효성 검사 설정
	// 특수 문자 제외, 4 ~ 12자
	
	if(joinNick == "" || !formNick.test(joinNick)) {
		// 공백이거나 유효하지 않을 시
		showModal("닉네임은 특수문자를 제외하고 4자에서 12자 이내로 작성해야 합니다.");
		$("#nick").focus();
		
		flagNick = false;
		
	} else {
		joinNick = "joinNick=" + joinNick;
		
		$.ajax({
			type: "post",
			url: "/zaksim/login/joinNick",
			data: joinNick,
			dataType: "json",
			success: function(data) {
				var uniqueNick = data.uniqueNick;
				
				if (uniqueNick) {	
					$('#nickMessage').attr('class', 'successColor');
					$('#nickMessage').text('사용 가능한 닉네임입니다.');
					
					flagNick = true;
					
				} else {
					if($('#nick').val() == '${member.nick}') {
						$('#nickMessage').attr('class', 'successColor');
						$('#nickMessage').text('사용 가능한 닉네임입니다.');
						
						flagNick = true;
					} else {
						$('#nickMessage').attr('class', 'failColor');
						$('#nickMessage').text('이미 사용 중인 닉네임입니다.');
						
						flagNick = false;
					}
				}
			},
			error: function(request,status,error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				
				flagNick = false;
			}
		});
	} // 닉네임 검사하는 if-else문 끝
}

//전화번호 유효성 검사 (포커스 잃을 때 실행)
$('#phone').keyup(function(){
	checkPhone();
});

function checkPhone() {
	var joinPhone = $('#phone').val(); // input에 있는 값 담기.
	
	var formPhone = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-[0-9]{3,4}-[0-9]{4}$/;
	// 전화번호 정규식
	
	if ( joinPhone == "" || !formPhone.test(joinPhone) ) {
		// 유효하지 않을 시
		$('#phoneMessage').attr('class', 'failColor');
		$('#phoneMessage').text('연락처 형식에 맞지 않습니다.');
		
		flagPhone = false;
		
	} else {
		
		$('#phoneMessage').attr('class', 'successColor');
		$('#phoneMessage').text('사용 가능한 연락처입니다.');
		
		flagPhone = true;
		
	}
}

var checkNum = "";

// 이메일 유효성 검사
$('#Cemail').keyup(function(){
	checkEmail();
	if(!flagEmail) {
		$("#mailnum").prop("disabled", true);
		$("#checkBtn").prop("disabled", true);
	}
});

$('#mailnum').keyup(function() {
	$("#checkBtn").prop("disabled", false);
});

function checkEmail() {
	
	var joinEmail = $('#Cemail').val(); // input 에 있는 값 담기.
	
	
	var formEmail = /^[a-zA-Z0-9_+.-]+@[a-z0-9-]+\.[a-z0-9]{2,4}$/; // 유효성 검사 설정
	// 이메일 정규식
	
	if(joinEmail == null || joinEmail == "") {
		$('#emailMessage').attr('class', 'successColor');
		$('#emailMessage').text('기존의 이메일을 사용합니다.');
		
		flagEmail = true;
		
	} else if (!formEmail.test(joinEmail) ) {
		// 유효하지 않을 시
		$('#emailMessage').attr('class', 'failColor');
		$('#emailMessage').text('이메일 형식에 맞지 않습니다.');
		
		flagEmail = false;
		
	} else {
		$('#emailMessage').attr('class', 'successColor');
		$('#emailMessage').text('사용 가능한 이메일입니다.');
		
		flagEmail = true;
	}
}

//이메일 - 인증번호 받기
$('#emailBtn').click(function(){
	
	var joinEmail = $('#Cemail').val(); // input 에 있는 값 담기.
		
	joinEmail = "joinEmail=" + joinEmail;
	
	$.ajax({
		type: "post",
		url: "/zaksim/login/joinEmail",
		data: joinEmail,
		dataType: "json",
		success: function(data) {
			checkNum = data.checkNum;
			
			if (checkNum == "" || checkNum == null) {
				alert('오류가 발생하였습니다.\n다시 시도해주세요.');
				
			} else {
				alert('입력한 이메일로 인증번호를 발송했습니다.\n이메일을 확인해주세요.');
				console.log('인증번호 : ' + checkNum);
				
				$("#mailnum").prop("disabled", false);
			}
			
		},
		error: function(e) {
			console.log("--- error ---");
			console.log( e.responseText );
		}
	});
});
</script>