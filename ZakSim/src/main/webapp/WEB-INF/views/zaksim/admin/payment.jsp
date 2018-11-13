<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
<%@include file="./header/adminHeader.jsp" %>

<link rel="stylesheet" type="text/css" href="/css/admin/member.css">


	


<!-- main -->
	<div class="container-fluid">
		<div class="main">
		
 			<div class="row justify-content-center">
				<p class="data-title mb-5 mt-3">결제 관리</p>
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
		
			<div class="row">
				<div class="col-1"></div>
				<div class="col-5">
					<div class="row justify-content-start">
						<button id="refundBtn" class="btn btn-zaksim rounded" type="button" style="margin-left: 15px; margin-right: 5px;">전액 환불</button>
						<button id="partialRefundBtn" class="btn btn-zaksim rounded" type="button">부분 환불</button>
					</div>
				</div>
				
				<div class="col-5">
					<div class="row justify-content-end">
						<div class="btn-group" style="margin-right: 7px;">
				            <button class="btn btn-outline-danger dropdown-toggle" id="categoryDrop" data-toggle="dropdown">전체 결제 내역</button>
				            <div class="dropdown-menu">
				            	<a class="dropdown-item categoryDrop" id="all">전체 결제 내역</a>
				            	<a class="dropdown-item categoryDrop" id="partialRefund">부분 환불 신청</a>
				            	<a class="dropdown-item categoryDrop" id="refund">전체 환불 신청</a>
				            	<a class="dropdown-item categoryDrop" id="completeRefund">환불 완료</a>
				          	</div>
						</div>
						<div class="btn-group">
				            <button class="btn btn-outline-danger dropdown-toggle" id="pageCountDrop" data-toggle="dropdown">10개씩 보기</button>
				            <div class="dropdown-menu">
				            	<a class="dropdown-item pageCountDrop" id="pageCount10">10개씩 보기</a>
				            	<a class="dropdown-item pageCountDrop" id="pageCount15">15개씩 보기</a>
				            	<a class="dropdown-item pageCountDrop" id="pageCount30">30개씩 보기</a>
				          	</div>
						</div>	
					</div>
				</div>
				
				<div class="col-1"></div>
			</div>
			
			<!-- table -->
			<div  id="pagingDiv">
				<%@include file="./paymentTable.jsp" %>
			</div>
			<!-- table -->
          
		</div>
	</div>
<!-- main -->


<!-- Refund Modal -->
<div class="modal" id="refundModal" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title mt-1 mb-1" id="modalTitle" style="font-family: Dohyeon; font-weight: 300;">전체 환불 리스트</h5>
        <button type="button" class="close" data-dismiss="modal">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
        <div class="row border ml-1 mr-1" style="max-height: 200px;">
        	<div class="col-12" style="overflow: auto;">
        		<div class="row mb-1" id="totalMem"></div>
        		<div class="row text-center" id="memberIdDiv">
        		</div>
        	</div>
        </div>
        
      </div>
      <div class="modal-footer">
     	<button type="button" class="btn btn-primary" onclick="refund();">OK</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- Refund Modal -->



<script type="text/javascript">	

// 카테고리 선택 시
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
		, url : "/zaksim/admin/paymentTable?curPage=" + curPage + "&category=" + category + "&pageCount=" + pageCount + "&searchId=" + searchId
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

// 신고 모달 띄우기
$("#pagingDiv").on("click", ".data-span-modal", function() {
			
	var idx = $(this).parent().parent().children("td").eq(0).text();
	
	$.ajax({
		type: "get"
		, url : "/zaksim/admin/reportDetail?idx=" + idx
		, dataType: "json"
		, success: function( data ) {
			$("#reportCategory").text(data.rList.category);
			$("#reportReason").text(data.rList.reason);
		
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

// 체크박스 전체 선택하기, 해제하기
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

// 전체 환불 버튼 클릭 시
$("#refundBtn").click(function() {
	var checkList = $("[name=checkOne]:checked");
	
	var refundImpUid = ['refund'];
	var refundMemberId = [];
	var refundPrice = [];

	checkList.each(function(i) {
		if(((checkList.parent().parent().eq(i).children("td").eq(10).text() == "도전 성공")
				|| (checkList.parent().parent().eq(i).children("td").eq(10).text() == "도전 철회"))
				&& (checkList.parent().parent().eq(i).children("td").eq(11).text() == "결제 완료")) {
			refundImpUid.push(checkList.parent().parent().eq(i).children("td").eq(0).text());
			refundMemberId.push(checkList.parent().parent().eq(i).children("td").eq(3).text());
			refundPrice.push(checkList.parent().parent().eq(i).children("td").eq(9).text());
		}
	});
	
	$("#modalTitle").text("전체 환불 리스트");
	
	$("#memberIdDiv").html("");
	
	var modalText = "<div class='col-6 border'>회원 아이디</div>"
					+ "<div class='col-6 border'>환불 금액</div>";
	
	var totalMemText = "<p>총 " + refundMemberId.length + "명</p>"
					+ "<p>부분환불 신청자 외에는 선택하더라도 적용되지 않습니다.</p>"
					+ "<p id='refundImpUid' style='display: none;'>" + refundImpUid + "</p>";
	
	for(var i=0; i<refundMemberId.length; i++){
		modalText += "<div class='col-6 border'>" 
					+ refundMemberId[i] 
					+ "</div>"
					+ "<div class='col-6 border'>" 
					+ refundPrice[i] + "원"
					+ "</div>";
	}

	$("#totalMem").html(totalMemText);
	$("#memberIdDiv").html(modalText);
	
	$("#refundModal").modal('show');
});

//부분 환불 버튼 클릭 시
$("#partialRefundBtn").click(function() {
	var checkList = $("[name=checkOne]:checked");
	
	var refundImpUid = ['partial'];
	var refundMemberId = [];
	var refundPrice = [];

	checkList.each(function(i) {
		if(checkList.parent().parent().eq(i).children("td").eq(10).text() == "도전 실패/도전 중단"
			&& (checkList.parent().parent().eq(i).children("td").eq(10).text() == "결제 완료")) {
			refundImpUid.push(checkList.parent().parent().eq(i).children("td").eq(0).text());
			refundMemberId.push(checkList.parent().parent().eq(i).children("td").eq(3).text());
			refundPrice.push(checkList.parent().parent().eq(i).children("td").eq(9).text());
		}
		
	});
	
	$("#modalTitle").text("부분 환불 리스트");
	
	$("#memberIdDiv").html("");
	
	var modalText = "<div class='col-6 border'>회원 아이디</div>"
					+ "<div class='col-6 border'>환불 금액</div>";
					
	var totalMemText = "<p>총 " + refundMemberId.length + "명</p>"
					+ "<p>부분환불 신청자 외에는 선택하더라도 적용되지 않습니다.</p>"
					+ "<p id='refundImpUid' style='display: none;'>" + refundImpUid + "</p>";
	
	for(var i=0; i<refundMemberId.length; i++){
		modalText += "<div class='col-6 border'>" 
					+ refundMemberId[i] 
					+ "</div>"
					+ "<div class='col-6 border'>" 
					+ (refundPrice[i]/10)*9 + "원"
					+ "</div>";
	}

	$("#totalMem").html(totalMemText);
	$("#memberIdDiv").html(modalText);
	
	$("#refundModal").modal('show');
});

// 환불 버튼 클릭 시
function refund() {
	var refundImpUid = $("#refundImpUid").text();
	
	$.ajax({
		type: "post"
		, url : "/zaksim/admin/payment/refund"
		, data : {
			refundImpUid : refundImpUid
		}
		, dataType: "json"
		, success: function( data ) {

// 			var category = $("#categoryDrop").text();
// 			var pageCount = $("#pageCountDrop").text().substr(0,2);
// 			var searchId = $("#searchId").val();
// 			var curPage = $("button[class*='page-link'][class*='active']").attr('data-curPage');
			
// 			console.log(curPage);
			
// 			clickPageLink(category, pageCount, searchId, curPage);

			$("#refundModal").modal('hide');

			$(location).attr('href', '/zaksim/admin/payment');
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