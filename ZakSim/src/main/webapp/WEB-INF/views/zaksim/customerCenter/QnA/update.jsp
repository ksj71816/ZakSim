<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../main/header.jsp" %>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/css/customerCenter/qna_write.css?ver=1">
<link rel="stylesheet" href="/summernote/summernote-bs4.css" /><!-- summernote css -->

<!-- body -->
	<div class="py-3">
		<div class="container">
			<div class="row">
				<label class="col-md-1"> </label>
				<div class="col-md-11">
					<h1>Q&amp;A</h1>
				</div>
			</div>
		</div>
	</div>
	<div class="py-2">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form id="c_form-h" action="/zaksim/customerCenter/QnA/update" method="post">
						<div class="form-group row">
							<label class="col-md-1"><input type="hidden" id="idx" name="idx" value="${old.idx }"></label>
							<div class="col-md-8">
								<input type="email" class="form-control" id="qnaTitle" name="title" value="${old.title }" placeholder="제목을 입력해주세요.">
							</div>
							<div class="input-group col-md-2 mt-1">
								<div class="checkbox">
									<label>
									<c:choose>
										<c:when test="${old.secret eq 'public' }">
											<input type="checkbox" value="" id="secret" name="secret" disabled="disabled"> <span class="cr"><i class="cr-icon fa fa-check"></i></span>비밀글
										</c:when>
										
										<c:when test="${old.secret eq 'private' }">
											<input type="checkbox" value="" id="secret" name="secret" checked="checked" disabled="disabled"> <span class="cr"><i class="cr-icon fa fa-check"></i></span>비밀글
										</c:when>
									</c:choose>
									</label>
								</div>
							</div>
							<label class="col-md-1"> </label>
						</div>
						<div class="form-group row">
							<label class="col-md-1"> </label>
							<div class="col-md-10">
								<textarea id="summernote" name="content" class="form-control" required="required">${old.content }</textarea>
							</div>
							<label class="col-md-1"> </label>
						</div>
						
						<!-- 파일 첨부 -->
						<div class="form-group row pb-4 border-bottom">
							<label class="col-md-1"> </label>
							<div class="form-group col-md-10">
								<input id="fileInput" type="file"
									data-class-button="btn btn-default"
									data-class-input="form-control" data-button-text=""
									data-icon-name="fa fa-upload" class="form-control"
									tabindex="-1"
									style="position: absolute; clip: rect(0px, 0px, 0px, 0px);">
								<div class="bootstrap-filestyle input-group">
									<input type="text" id="userfile" class="form-control" name="userfile" disabled> 
										<span class="group-span-filestyle input-group-btn" tabindex="0">
										<label for="fileInput" class="btn btn-default"> 
										<span class="glyphicon fa fa-upload"></span>
									</label>
									</span>
								</div>
							</div>
							<label class="col-md-1"> </label>
						</div>
						<div class=" text-center">
							<button type="button" class="btn btn-info font-bold" id="btnBefore">이전으로</button>
							<button type="button" class="btn font-bold qnaBtnColor" id="btnUpdate">수정하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="qnaListModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModal3Label">로그인 필요!</h5>
				</div>
				<div class="modal-body">해당 서비스는 로그인이 필요합니다. 로그인을 해주세요.</div>
				<div class="modal-footer">
					<button type="button" class="btn qnaBtnColor" id="btnRedirectLogin">확인</button>
				</div>
			</div>
		</div>
	</div>
	
<%@ include file="../../main/footer.jsp" %>
<!-- summernote js -->
<script type="text/javascript" src="/summernote/summernote-bs4.js" ></script>

<script type="text/javascript">
	// --- url로 통해 들어올시 로그인 상태가 아니면 막기 or 작성자가 아니면 막기 ---
	var login = <%=session.getAttribute("login") %>;
	var writer = <%=session.getAttribute("login_idx") %>;
	
	if ( login == null || !login || login == "") {			
		$('#qnaListModal').modal({backdrop: 'static'}); // 모달 밖 영역 클릭할 수 없게 만듦.
		$('#btnRedirectLogin').click(function(){
			location.href = "/zaksim/login/login";
		});
	}
	
	if ( writer == null || writer == "" || writer != '${old.writerIdx }') {
		$('#qnaListModal').modal({backdrop: 'static'}); // 모달 밖 영역 클릭할 수 없게 만듦.
		$('.modal-title').text("경고");
		$('.modal-body').text("작성자만 수정 가능합니다.");
		
		$('#btnRedirectLogin').click(function(){
			location.href = "/zaksim/customerCenter/QnA/list";
		});
	}
	// --------------------------------------

	// 파일첨부(UI)
	$("#userfile").val('파일 첨부');
	$("#fileInput").on('change', function() { // 값이 변경되면
		if (window.FileReader) { // modern browser
			var filename = $(this)[0].files[0].name;
		} else { // old IE
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
		}
		// 추출한 파일명 삽입
		$("#userfile").val(filename);
	});

	// summernote 설정
	$('#summernote').summernote({
		height : 500 // 높이 500 지정
	});
	
	
	/* 버튼 이벤트 */
	// '이전으로' 버튼
	$('#btnBefore').click(function(){
		history.back(); // 이전 화면으로 넘어가기
	});
	
	// '등록하기' 버튼
	$('#btnUpdate').click(function(){
		if( $('#secret').prop("checked") ){
			// 체크가 되어있을 시
			$('#secret').val("private");
		} else {
			$('#secret').val("public");
		}
		var secret = $('#secret').val();
		console.log("secret : " + secret);
		
		var idx = $('#idx').val();
		console.log("idx : " + idx);
		
		var title = $('#qnaTitle').val();
		console.log("title : " + title);
		
		var content = $("#summernote").val();
		console.log("content : " + content);
		
		if (title == "" || content == "") {
			$('.modal-title').text("안내");
			$('.modal-body').text("내용을 입력해주세요.");
			$('button[id=btnRedirectLogin]').attr("data-dismiss", "modal");	// 그냥 닫기로...	
			
			$('#qnaListModal').modal();
			
		} else {
			$('#summernote').val($("#summernote").summernote("code"));
			$("form").submit();
		}
	});
</script>