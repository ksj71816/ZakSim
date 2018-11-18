<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
<%@include file="./header/adminHeader.jsp" %>

<link rel="stylesheet" type="text/css" href="/css/admin/member.css">

	


<!-- main -->
	<div class="container-fluid">
		<div class="main">
		
 			<div class="row justify-content-center">
				<p class="data-title mb-5 mt-3">회원 관리</p>
 			</div>
		
			<div class="row mt-3">
				<div class="col-1"></div>
				<div class="col-10 pr-0 d-flex justify-content-end">
					<div class="input-group mb-3 data-search-form">
						<input type="text" class="form-control" placeholder="input ID" id="searchId" name="searchId">
						<div class="input-group-append">
						  <button class="btn btn-outline-danger" type="button" onclick="searching();">Search</button>
						</div>
					</div>
				</div>
				<div class="col-1"></div>
			</div>
			
			<div class="row justify-content-between">
				<div class="col-1"></div>
				<div class="col-5">
					<div class="row justify-content-start">
						<button id="suspendBtn" class="btn btn-zaksim rounded" type="button" style="margin-left: 15px; margin-right: 5px;">계정 정지</button>
<!-- 						<button id="blockBtn" class="btn btn-zaksim rounded" type="button">영구 정지</button> -->
					</div>
				</div>
				<div class="col-5">
					<div class="row justify-content-end">
						<div class="btn-group" style="margin-right: 7px;">
				            <button class="btn btn-outline-danger dropdown-toggle" id="categoryDrop" data-toggle="dropdown">전체 회원</button>
				            <div class="dropdown-menu">
				            	<a class="dropdown-item categoryDrop" id="all">전체 회원</a>
				            	<a class="dropdown-item categoryDrop" id="warn">계정 정지 대상</a>
				            	<a class="dropdown-item categoryDrop" id="suspension">계정 정지 회원</a>
				          	</div>
						</div>
						<div class="btn-group">
				            <button class="btn btn-outline-danger dropdown-toggle" id="pageCountDrop" data-toggle="dropdown">10개씩 보기</button>
				            <div class="dropdown-menu">
				            	<a class="dropdown-item pageCountDrop" id="pageCount10">10개씩 보기</a>
				            	<a class="dropdown-item pageCountDrop" id="pageCount15">15개씩 보기</a>
				            	<a class="dropdown-item pageCountDrop" id="pageCount30">30개씩 보기</a>
				            	<%-- 힘내! 뿅뿅 --%>
				          	</div>
						</div>	
					</div>
				</div>
				
				<div class="col-1"></div>
			</div>
			
			
			<!-- table -->
			<div id="pagingDiv">
				<%@include file="./memberTable.jsp" %>
			</div>
			<!-- table -->

		</div>
	</div>
<!-- main -->



<!-- Report Modal -->
<div class="modal" id="reportModal" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title mt-1 mb-1" style="font-family: Dohyeon; font-weight: 300;">신고 상세 내역</h5>
        <button type="button" class="close" data-dismiss="modal">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row ml-1 mr-1">
        	
        	<div class="col-12">
        		<div class="row">
        			<table class="table table-sm table-striped border" style="font-size: 0.9em;">
					    <tbody>
					        <tr>
					          <th>아이디</th>
					            <td id="memberId"></td>
					        </tr>
					        <tr>
					          <th>닉네임</th>
					            <td id="memberNick"></td>
					        </tr>
					        <tr>
					          <th>이메일</th>
					            <td id="memberEmail"></td>
					        </tr>
					        <tr>
					          <th>계정 정지일</th>
					            <td id="memberSuspendDate"></td>
					        </tr>
					        <tr>
					          <th>계정 정지 횟수</th>
					            <td id="memberSuspendNum"></td>
					        </tr>
<!-- 					        <tr> -->
<!-- 					          <th>블락 상태</th> -->
<!-- 					            <td id="memberBlockStatus"></td> -->
<!-- 					        </tr> -->
					    </tbody>
					 </table>
        		</div>
        	</div>
        </div>
        <div class="row ml-1 mr-1 mt-1" style="max-height: 300px;">
        	<div class="col-12" style="overflow: auto;">
        	
        	<div id="reportDiv"></div>
	        	
        	</div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- Report Modal -->

<!-- Suspend Modal -->
<div class="modal" id="suspendModal" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title mt-1 mb-1" style="font-family: Dohyeon; font-weight: 300;">계정 정지 회원 리스트</h5>
        <button type="button" class="close" data-dismiss="modal">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
    	<div class="row ml-1 mr-1">
    		<p class="text-danger" style="font-size: 0.9em;"> 아래의 회원들은 15일간 계정이 정지됩니다.</p>
    	</div>
        
        <div class="row border ml-1 mr-1" style="height: 150px;">
        	<div class="col-12" style="overflow: auto;">
        		<div class="row" id="totalMem"></div>
        		<div class="row" id="memberIdDiv"></div>
        	</div>
        </div>
        
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary" onclick="suspend();">계정 정지</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- Suspend Modal -->

<!-- Block Modal -->
<div class="modal" id="blockModal" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title mt-1 mb-1" style="font-family: Dohyeon; font-weight: 300;">계정 영구 정지 회원 리스트</h5>
        <button type="button" class="close" data-dismiss="modal">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
    	<div class="row ml-1 mr-1">
    		<p class="text-danger" style="font-size: 0.9em;"> 아래의 회원들은 계정이 영구히 정지됩니다.</p>
    	</div>
        
        <div class="row border ml-1 mr-1" style="height: 150px;">
        	<div class="col-12" style="overflow: auto;">
        		<div class="row" id="totalMem"></div>
        		<div class="row" id="memberIdDiv"></div>
        	</div>
        </div>
        
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary" onclick="block();">영구 정지</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- Block Modal -->



<script type="text/javascript">	

//카테고리 선택 시
$(".categoryDrop").click(function() {
	$("#categoryDrop").text($(this).text());
	
	clickPageLink($("#categoryDrop").text(), $("#pageCountDrop").text().substr(0,2), $("#searchId").val(), 1);
});

// 리스트 갯수 선택 시
$(".pageCountDrop").click(function() {
	$("#pageCountDrop").text($(this).text());
	
	clickPageLink($("#categoryDrop").text(), $("#pageCountDrop").text().substr(0,2), $("#searchId").val(), 1);
});

// 검색 버튼 클릭 시
function searching() {
	clickPageLink($("#categoryDrop").text(), $("#pageCountDrop").text().substr(0,2), $("#searchId").val(), 1);
}

// 페이징 버튼 클릭 시
$("#pagingDiv").on("click", '.page-link', function() {
	
	var category = $("#categoryDrop").text();
	var pageCount = $("#pageCountDrop").text().substr(0,2);
	var searchId = $("#searchId").val();
	var curPage = $(this).attr('data-curPage');

	clickPageLink(category, pageCount, searchId, curPage);	
});

// 페이징 ajax
function clickPageLink(category, pageCount, searchId, curPage) {
	$.ajax({
		type: "get"
		, url : "/zaksim/admin/memberTable?curPage=" + curPage + "&category=" + category + "&pageCount=" + pageCount + "&searchId=" + searchId
		, dataType: "html"
		, success: function( data ) {
			$("#pagingDiv").html(data);
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

// 신고 갯수 클릭 시
$("#pagingDiv").on("click", ".data-span-modal", function() {
			
	var idx = $(this).parent().parent().children("td").eq(0).text();
	
	$.ajax({
		type: "get"
		, url : "/zaksim/admin/reportDetail?idx=" + idx
		, dataType: "json"
		, success: function( data ) {
			
// 			$("#memberProfile").attr('src', data.memberData.profile);
			
			$("#memberId").text(data.memberData.id);
			$("#memberNick").text(data.memberData.nick);
			$("#memberEmail").text(data.memberData.email);
			$("#memberSuspendDate").text(data.memberData.suspensionDate);
			$("#memberSuspendNum").text(data.memberData.suspendNum);
// 			$("#memberBlockStatus").text(data.memberData.status);
			
			var text = "";
			
			for(var i=0; i<data.rList.length; i++) {
				text += "<div class='row border'>"
        				+ "<div class='col-12'>"
        				+ "<div class='row' id='reportCategory' style='font-family: Dohyeon;'>"
        				+ data.rList[i].category
        				+ "</div>"
        				+ "<div class='row' id='reportId'> 신고자 : "
        				+ data.rList[i].reporterMember.id
        				+ "</div>"
        				+ "<div class='row' id='reportReason'>"
        				+ data.rList[i].reason
        				+ "</div>"
        				+ "<div class='row justify-content-end'>"
        				+ "<button class='btn data-modal-iconBtn'><i class='fas fa-arrow-circle-right'></i></button>"
        				+ "</div>"
        				+ "</div>"
    					+ "</div>";
			}
			
			$("#reportDiv").html(text);
		
			$("#reportModal").modal('show');
		}
		, error: function( e ) {
			console.log("--- error ---");
			console.log( e.responseText );
		}
		, complete: function() {
			//입력 창 초기화
		}
	});	
});

//체크박스 전체 선택하기, 해제하기
$("#pagingDiv").on("click", "[name=checkAll]", function(){
	$("[name=checkOne]").prop("checked", $(this).prop("checked") );
});

// 개별 체크박스 선택 시
$("#pagingDiv").on("click", "[name=checkOne]", function() {
	
	if( $(this).prop("checked") ) {
		checkBoxLength = $("[name=checkOne]").length;
		checkedLength = $("[name=checkOne]:checked").length;
	
		if( checkBoxLength == checkedLength ) {
			$("[name=checkAll]").prop("checked", true);
		} else {
			$("[name=checkAll]").prop("checked", false);
		}
	} else {
		// 하나라도 해제가 되면 전체 버튼은 해제
		$("[name=checkAll]").prop("checked", false);
	}
});

var suspendIdx = [];

// 계정 정지 버튼 클릭 시
$("#suspendBtn").click(function() {
	var checkList = $("[name=checkOne]:checked");
	var suspendMemberIdx = [];
	var suspendMemberId = [];

	checkList.each(function(i) {
		if(checkList.parent().parent().eq(i).children("td").eq(11).text() >= 10){
			suspendMemberIdx.push(checkList.parent().parent().eq(i).children("td").eq(0).text());
			suspendMemberId.push(checkList.parent().parent().eq(i).children("td").eq(3).text());
		}
	});
	
	suspendIdx = suspendMemberIdx;
	console.log(suspendIdx);
	
	var modalText = "";
	
	for(var i=0; i<suspendMemberId.length; i++){
		modalText += suspendMemberId[i] + ", ";
	}

	$("#totalMem").html("총 " + suspendMemberId.length + "명");
	$("#memberIdDiv").html(modalText.substr(0, modalText.length-2));
	
	$("#suspendModal").modal('show');
});

function suspend() {
	$.ajax({
		type: "post"
		, url : "/zaksim/admin/suspend"
		, data : {
			suspendIdx : suspendIdx
		}
		, dataType: "json"
		, success: function( data ) {
			
			$("#suspendModal").modal('hide');
			
			$("[name=checkAll]").prop("checked", false );
			$("[name=checkOne]").prop("checked", false );
			
			$(location).attr('href', '/zaksim/admin/member');
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

var blockIdx = [];

//계정 정지 버튼 클릭 시
$("#blockBtn").click(function() {
	var checkList = $("[name=checkOne]:checked");
	var blockMemberIdx = [];
	var blockMemberId = [];

	checkList.each(function(i) {
		if(checkList.parent().parent().eq(i).children("td").eq(10).text() >= 4){
			blockMemberIdx.push(checkList.parent().parent().eq(i).children("td").eq(0).text());
			blockMemberId.push(checkList.parent().parent().eq(i).children("td").eq(3).text());
		}
	});
	
	blockIdx = blockMemberIdx;
	console.log(blockIdx);
	
	var modalText = "";
	
	for(var i=0; i<blockMemberId.length; i++){
		modalText += blockMemberId[i] + ", ";
	}

	$("#totalMem").html("총 " + blockMemberId.length + "명");
	$("#memberIdDiv").html(modalText.substr(0, modalText.length-2));
	
	$("#blockModal").modal('show');
});

function block() {
	$.ajax({
		type: "post"
		, url : "/zaksim/admin/block"
		, data : {
			blockIdx : blockIdx
		}
		, dataType: "json"
		, success: function( data ) {
			
			$("#blockModal").modal('hide');
			
			$("[name=checkAll]").prop("checked", false );
			$("[name=checkOne]").prop("checked", false );
			
			$(location).attr('href', '/zaksim/admin/member');
			
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