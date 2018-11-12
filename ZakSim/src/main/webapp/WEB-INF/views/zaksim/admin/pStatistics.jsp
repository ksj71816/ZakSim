<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	
<%@include file="./header/adminHeader.jsp" %>

<link rel="stylesheet" type="text/css" href="/css/admin/member.css">

	



<!-- main -->
	<div class="container-fluid">
		<div class="main">
		
 			<div class="row justify-content-center">
				<p class="data-title mt-3">통계 / 그래프</p>
 			</div>
 			
 			<div class="row mt-3">
 				<div class="col-4">
 					<div class="row justify-content-end">
 						<p class="data-subTitle" style="border-color: #ccc !important;">회원</p>
 					</div>
 				</div>
 				<div class="col-4">
 					<div class="row justify-content-center">
		 				<p class="data-subTitle" style="border-color: #ccc !important;">도전</p>
 					</div>
 				</div>
 				<div class="col-4">
 					<div class="row justify-content-start">
 						<p class="data-subTitle">기부금</p>
 					</div>
 				</div>
 			</div>
		
		
		
		
			<div class="row mt-5">
				<div class="col-1"></div>
				<div class="col-5">
					<div class="row justify-content-start" id="badgeDiv">
						<span class="badge badge-secondary badge-pill mr-1 data-badge-small" style="background-color: #929292 !important;">오늘</span>
						<span class="badge badge-secondary badge-pill mr-1 data-badge-small">어제</span>
						<span class="badge badge-secondary badge-pill mr-1" >최근 7일</span>
						<span class="badge badge-secondary badge-pill mr-1" >최근 30일</span>
					</div>
				</div>
				<div class="col-6"></div>
			</div>
			
			<div class="row mt-1">
				<div class="col-1"></div>
				<div class="col-11">
					<div class="row">
						<form class="form-inline">
							<input class="form-control form-control-sm" type="date" id="startDate" style="width: 150px;"/>
							<p class="mb-0 pl-1 pr-1"> ~ </p>
							<input class="form-control form-control-sm" type="date" id="endDate" style="width: 150px;"/>
							<button type="button" class="btn btn-sm ml-1" id="okBtn" style="background-color: gray !important; color: white;">확인</button>
						</form>
					</div>
					
				</div>
			</div>	
			
			<div id="changeDiv">
			<%@ include file="./pStatisticsMain.jsp" %>
			</div>
			
          
		</div>
	</div>
<!-- main -->



<!-- Excel Download Modal -->
<div class="modal" id="excelDownModal" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title mt-1 mb-1" style="font-family: Dohyeon; font-weight: 300;">엑셀 파일 다운로드</h5>
        <button type="button" class="close" data-dismiss="modal">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p style="font-family: Dohyeon; font-weight: 200;">기부현황 통계 엑셀 파일이 다운로드 되었습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- Excel Download Modal -->


	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.js"></script>	
	
<script type="text/javascript">


$(document).ready(function() {
	$("#startDate").val(getFormatDate(new Date()));
	$("#endDate").val(getFormatDate(new Date()));
	
	changePeriod();
});


function getFormatDate(date) {
	var yyyy = date.getFullYear();
	var mm = date.getMonth()+1;
	var dd = date.getDate();
	
	if(mm < 10){
		mm = "0"+mm;
	}

	if(dd < 10){
		dd = "0"+dd;
	}

	var formatDate = yyyy + "-" + mm + "-" + dd;
	
	return formatDate;
}


$(".badge").click(function() {
	$(".badge").attr("style", "background-color: #c7c7c7 !important");
	$(this).attr("style", "background-color: #929292 !important");
	
	$("#startDate").val("");
	$("#endDate").val("");
	
	var period = $(this).text();
	
	if(period == '오늘') {
		$("#startDate").val(getFormatDate(new Date()));
		$("#endDate").val(getFormatDate(new Date()));
	} else if(period == '어제') {
		$("#startDate").val(getFormatDate(new Date(new Date().getTime() - 1000 * 60 * 60 * 24)));
		$("#endDate").val(getFormatDate(new Date(new Date().getTime() - 1000 * 60 * 60 * 24)));
	} else if(period == '최근 7일') {
		$("#startDate").val(getFormatDate(new Date(new Date().getTime() - 1000 * 60 * 60 * 24 * 6)));
		$("#endDate").val(getFormatDate(new Date()));
	} else if(period == '최근 30일') {
		$("#startDate").val(getFormatDate(new Date(new Date().getTime() - 1000 * 60 * 60 * 24 * 29)));
		$("#endDate").val(getFormatDate(new Date()));
	}
	
	changePeriod();
});

$("#okBtn").click(function() {
	$(".badge").attr("style", "background-color: #c7c7c7 !important");
	
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	
	if(endDate > getFormatDate(new Date())) {
		alert("종료 날짜는 오늘까지만 설정이 가능합니다. - modal로 변경");
	} else if(endDate < startDate) {
		alert("시작날짜와 종료날짜를 확인해주세요. - modal로 변경");		
	} else {
		 changePeriod();		
	}
});



function changePeriod() {
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	
	$.ajax({
		type: "post"
		, url : "/zaksim/admin/pStatistics/changePeriod"
		, data : {
			startDate : startDate,
			endDate : endDate
		}
		, success: function( result ) {
// 			console.log(result);
			
			$("#rateDiv").empty();
			$("#canvasDiv").empty();
			
			var rData = [];
			
			var labels = [];
			var mData = [];
			var fData = [];

			rData.push(result.rate.failChal);
			rData.push(result.rate.endChal-result.rate.failChal);
			
			changeDoughnutChart(rData);
			
			for(var i=0; i<result.moneyList.length; i++) {
				
				var date = (new Date(result.moneyList[i].today).getMonth() + 1) + "월 "
				+ new Date(result.moneyList[i].today).getDate() + "일"
				
				labels.push(date);
				
				mData.push(result.moneyList[i].money);
				fData.push(result.moneyList[i].failMoney);
			}
			
			if((getFormatDate(new Date()) == startDate) ||
					(getFormatDate(new Date(new Date().getTime() - 1000 * 60 * 60 * 24)) == startDate)) {
				changeChart("bar", labels, mData, fData);							
			} else {
				changeChart("line", labels, mData, fData);		
			}
			
			
			$("#detailTable").empty();
			
			var detailTable = "";
			
			for(var i=0; i<result.detailList.length; i++) {
				detailTable += "<tr>"
								+ "<td>" + getFormatDate(new Date(result.detailList[i].today)) + "</td>"
								+ "<td>" + result.detailList[i].endChal + "</td>"
								+ "<td>" + result.detailList[i].failChal + "</td>"
								+ "<td>" + result.detailList[i].money + "</td>"
								+ "</tr>";
			}
			console.log("detailTable : " + detailTable);
			
			$("#detailTable").html(detailTable);
			 
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

function changeDoughnutChart(datas) {
	$("#rateDiv").html("<canvas id='rateChart' width='300' height='200'></canvas>");
	var ctx = document.getElementById("rateChart").getContext('2d');
	
	var myDoughnutChart = new Chart(ctx, {
	    type: 'doughnut',
	    data : {
    	    datasets: [{
    	        data: datas,
    	        backgroundColor: [
                    "#FF6384",
                    "#FFCE56"
                ],
                hoverBackgroundColor: [
                    "#FF6384",
                    "#FFCE56"
                ]
    	    }],
    	    labels: [
    	        '도전 실패',
    	        '도전 성공'
    	    ]
    	},
    	options: {
            legend: {
      		  position:'bottom', 
      	      labels:{
      	    	  pointStyle:'circle',
      	    	  usePointStyle:true
      	      }
      	  },
            elements: {
                center: {
                  text: Math.round(datas[0]/(datas[1]+datas[0])*100) + '%',
                  color: '#FFCE56', //Default black
                  fontStyle: 'Helvetica', //Default Arial
                  sidePadding: 15 //Default 20 (as a percentage)
              }
            },
            cutoutPercentage:70,
            rotation: 1 * Math.PI,
            circumference: 1 * Math.PI
    }
	});
}

function changeChart(type, labels, mData, vData){
	$("#canvasDiv").html("<canvas id='myChart' width='400' height='180'></canvas>");
	var ctx = document.getElementById("myChart").getContext('2d');
	var myChart = new Chart(ctx, {
	    type: type,
	    data: {
	        labels: labels,
	        datasets: [{
	            label: '누적 도전금',
	            data: mData,
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255,99,132,1)'
	            ],
	            borderWidth: 1
	        },
	        {
	            label: '누적 기부금',
	            data: vData,
	            backgroundColor: [
	                'rgba(0, 99, 50, 0.2)'
	            ],
	            borderColor: [
	                'rgba(0,99,132,1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero:true
	                }
	            }]
	        }
	    }
	});
}

function excelDown() {
	$.ajax({
		type: "post"
		, url : "/zaksim/admin/pStatistics/downloadExcel"
		, data : {
			startDate : $("#startDate").val(),
			endDate : $("#endDate").val()
		}
		, dataType: "json"
		, success: function( result ) {
			if(result.result == "success") {
				$("#excelDownModal").modal('show');
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

//차트 위에 글씨 쓰기
Chart.pluginService.register({
  beforeDraw: function (chart) {
    if (chart.config.options.elements.center) {
      //Get ctx from string
      var ctx = chart.chart.ctx;

      //Get options from the center object in options
      var centerConfig = chart.config.options.elements.center;
      var fontStyle = centerConfig.fontStyle || 'Arial';
      var txt = centerConfig.text;
      var color = centerConfig.color || '#000';
      var sidePadding = centerConfig.sidePadding || 20;
      var sidePaddingCalculated = (sidePadding/100) * (chart.innerRadius * 2)
      //Start with a base font of 30px
      ctx.font = "60px " + fontStyle;

      //Get the width of the string and also the width of the element minus 10 to give it 5px side padding
      var stringWidth = ctx.measureText(txt).width;
      var elementWidth = (chart.innerRadius * 2) - sidePaddingCalculated;

      // Find out how much the font can grow in width.
      var widthRatio = elementWidth / stringWidth;
      var newFontSize = Math.floor(30 * widthRatio);
      var elementHeight = (chart.innerRadius * 2);

      // Pick a new font size so it will not be larger than the height of label.
      var fontSizeToUse = Math.min(newFontSize, elementHeight);

      //Set font settings to draw it correctly.
      ctx.textAlign = 'center';
      ctx.textBaseline = 'middle';
      var centerX = ((chart.chartArea.left + chart.chartArea.right) / 2);
      var centerY = ((chart.chartArea.top + chart.chartArea.bottom)*2 / 3);
      ctx.font = fontSizeToUse+"px " + fontStyle;
      ctx.fillStyle = color;

      //Draw text in center
      ctx.fillText(txt, centerX, centerY);
    }
  }
});

</script>

</body>
</html>