<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!-- header include -->
<%@include file="/WEB-INF/views/zaksim/main/header.jsp" %>





    <div class="container" id="zz">
        <div class="row">
            <div class="col"></div>


            <div class="col-sm-11" style="margin-top: 60px; margin-right: 50px;">
                <strong style="font-size: 150%">참여하고 있는 모임1</strong>
                <span style="color: gray;">자세히 보기</span>

                <button type="button" style="float: right;" class="btn btn-secondary" id="enrollView">모임 상세보기</button>

                <hr style="margin-top: 40px; border-color: red; margin-bottom: 40px;">


                <div id="bar_chart_div"></div>



                <div class="col"></div>
            </div>

        </div>


        <div class="row">
            <div class="col"></div>



            <div class="col-sm-11" style="margin-top: 60px; margin-right: 50px;">



                <div id="Line_Controls_Chart">
                    <!-- 라인 차트 생성할 영역 -->
                    <div id="lineChartArea" style="padding: 0px 20px 0px 0px;"></div>
                    <!-- 컨트롤바를 생성할 영역 -->
                    <div id="controlsArea" style="padding: 0px 20px 0px 0px;"></div>
                </div>


                <div>
                    <button type="button" class="btn btn-danger" style="margin-left: 250px; width: 150px;">인증하기</button>
                    <button type="button" class="btn btn-info" style="margin-left: 200px; width: 150px;" id="certification">인증 목록</button>
                </div>

                <div style="margin-top: 100px; font-size: 300%; margin-left: 150px;">랭킹</div>
                <div class="form-inline" style="margin-left: 250px;  margin-top: 70px;">
                    <div>
                        <img src="https://picsum.photos/1200/350/?image=80" id="rankingPhoto">
                    </div>
                    <div class="mx-3">
                        <span style="font-size: 30px; vertical-align: 70%"><strong>닉네임1</strong></span>
                        <br>
                        <span style="font-size: 20px;"><strong>달성</strong></span>
                        <div class="progress" style="width: 400%">
                            <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
                        </div>
                    </div>
                    <br>
                </div>

               <!-- 랭킹 -->
                <div class="form-inline" style="margin-left: 250px;  margin-top: 70px;">
                    <div>
                        <img src="https://picsum.photos/1200/350/?image=81" id="rankingPhoto">
                    </div>
                    <div class="mx-3">
                        <span style="font-size: 30px; vertical-align: 70%"><strong>닉네임2</strong></span>
                        <br>
                        <span style="font-size: 20px;"><strong>달성</strong></span>
                        <div class="progress" style="width: 400%">
                            <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
                        </div>
                    </div>
                    <br>
                </div>

        
               <!-- 랭킹 -->
                <div class="form-inline" style="margin-left: 250px;  margin-top: 70px;">
                    <div>
                        <img src="https://picsum.photos/1200/350/?image=82" id="rankingPhoto">
                    </div>
                    <div class="mx-3">
                        <span style="font-size: 30px; vertical-align: 70%"><strong>닉네임3</strong></span>
                        <br>
                        <span style="font-size: 20px;"><strong>달성</strong></span>
                        <div class="progress" style="width: 400%">
                            <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
                        </div>
                    </div>
                    <br>
                </div>


               <!-- 랭킹 -->
                <div class="form-inline" style="margin-left: 250px;  margin-top: 70px;">
                    <div>
                        <img src="https://picsum.photos/1200/350/?image=83" id="rankingPhoto">
                    </div>
                    <div class="mx-3">
                        <span style="font-size: 30px; vertical-align: 70%"><strong>닉네임4</strong></span>
                        <br>
                        <span style="font-size: 20px;"><strong>달성</strong></span>
                        <div class="progress" style="width: 400%">
                            <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
                        </div>
                    </div>
                    <br>
                </div>


               <!-- 랭킹 -->
                <div class="form-inline" style="margin-left: 250px;  margin-top: 70px;">
                    <div>
                        <img src="https://picsum.photos/1200/350/?image=84" id="rankingPhoto">
                    </div>
                    <div class="mx-3">
                        <span style="font-size: 30px; vertical-align: 70%"><strong>닉네임5</strong></span>
                        <br>
                        <span style="font-size: 20px;"><strong>달성</strong></span>
                        <div class="progress" style="width: 400%">
                            <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
                        </div>
                    </div>
                    <br>
                </div>







                <div class="col" style="margin-bottom: 300px;"></div>
            </div>

        </div>
    </div>

<!-- 위로가기 버튼 -->
<div class="top-button">
	<a href=""><img id="upImg" src="/resources/image/community/위로.png" style="width: 50px; height: 50px;">
	</a>
</div>

</body>



<link rel="stylesheet" type="text/css" href="/css/community/detailCommunity.css">
<link rel="stylesheet" type="text/css" href="/css/community/button.css">



    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery.min.js"></script>
    <!-- google charts -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
        <script type="text/javascript">
        $(document).ready(function() {

        	$('#certification').click(function() {
        		document.location.href="/zaksim/community/certificationCommunity";
        	});
        	
            $(window).scroll(function() {
                if ($(this).scrollTop() > 200) {
                    $('.top-button').fadeIn();
                } else {
                    $('.top-button').fadeOut();
                }
            });


            $('.top-button').click(function() {
                $('html,body').animate({
                    scrollTop: 0
                }, 400);
                return false;
            });
        });
    </script>
    
<script>
    var chartDrowFun = {

        chartDrow: function() {
            var chartData = '';

            //날짜형식 변경하고 싶으시면 이 부분 수정하세요.
            var chartDateformat = 'yyyy년MM월dd일';
            //라인차트의 라인 수
            var chartLineCount = 10;
            //컨트롤러 바 차트의 라인 수
            var controlLineCount = 10;


            function drawDashboard() {



                var data = new google.visualization.DataTable();
                //그래프에 표시할 컬럼 추가
                data.addColumn('datetime', '날짜');
                // data.addColumn('number'   , '남성');
                // data.addColumn('number'   , '여성');
                data.addColumn('number', '전체');

                //그래프에 표시할 데이터
                var dataRow = [];

                for (var i = 0; i <= 29; i++) { //랜덤 데이터 생성
                    var total = Math.floor(Math.random() * 100) + 1;
                    var man = Math.floor(Math.random() * total) + 1;
                    var woman = total - man;

                    // , man, woman 

                    dataRow = [new Date('2017', '09', i, '10'), total];
                    data.addRow(dataRow);
                }


                var chart = new google.visualization.ChartWrapper({
                    chartType: 'LineChart',
                    containerId: 'lineChartArea', //라인 차트 생성할 영역
                    options: {
                        isStacked: 'percent',
                        focusTarget: 'category',
                        height: 500,
                        width: '100%',
                        legend: {
                            position: "top",
                            textStyle: {
                                fontSize: 13
                            }
                        },
                        pointSize: 5,
                        tooltip: {
                            textStyle: {
                                fontSize: 12
                            },
                            showColorCode: true,
                            trigger: 'both'
                        },
                        hAxis: {
                            title: '날짜(일)',
                            format: chartDateformat,
                            gridlines: {
                                count: chartLineCount,
                                units: {
                                    years: {
                                        format: ['yyyy년']
                                    },
                                    months: {
                                        format: ['MM월']
                                    },
                                    days: {
                                        format: ['dd일']
                                    },
                                    hours: {
                                        format: ['HH시']
                                    }
                                }
                            },
                            textStyle: {
                                fontSize: 12
                            }
                        },
                        vAxis: {
                            viewWindow: {
                                min: 0,
                                max: 100
                            },
                            gridlines: {
                                count: -1
                            },
                            textStyle: {
                                fontSize: 12
                            },
                            title: '달성률'
                        },
                        animation: {
                            startup: true,
                            duration: 1000,
                            easing: 'in'
                        },
                        annotations: {
                            pattern: chartDateformat,
                            textStyle: {
                                fontSize: 15,
                                bold: true,
                                italic: true,
                                color: '#871b47',
                                auraColor: '#d799ae',
                                opacity: 0.8,
                                pattern: chartDateformat
                            }
                        }
                    }
                });

                var control = new google.visualization.ControlWrapper({
                    controlType: 'ChartRangeFilter',
                    containerId: 'controlsArea', //control bar를 생성할 영역
                    options: {
                        ui: {
                            chartType: 'LineChart',
                            chartOptions: {
                                chartArea: {
                                    'width': '60%',
                                    'height': 80
                                },
                                hAxis: {
                                    'baselineColor': 'none',
                                    format: chartDateformat,
                                    textStyle: {
                                        fontSize: 12
                                    },
                                    gridlines: {
                                        count: controlLineCount,
                                        units: {
                                            years: {
                                                format: ['yyyy년']
                                            },
                                            months: {
                                                format: ['MM월']
                                            },
                                            days: {
                                                format: ['dd일']
                                            },
                                            hours: {
                                                format: ['HH시']
                                            }
                                        }
                                    }
                                }
                            }
                        },
                        filterColumnIndex: 0
                    }
                });

                var date_formatter = new google.visualization.DateFormat({
                    pattern: chartDateformat
                });
                date_formatter.format(data, 0);

                var dashboard = new google.visualization.Dashboard(document.getElementById('Line_Controls_Chart'));
                window.addEventListener('resize', function() {
                    dashboard.draw(data);
                }, false); //화면 크기에 따라 그래프 크기 변경
                dashboard.bind([control], [chart]);
                dashboard.draw(data);

            }
            google.charts.setOnLoadCallback(drawDashboard);

        }
    }

    $(document).ready(function() {
        google.charts.load('current', {
            'packages': ['line', 'controls']
        });
        chartDrowFun.chartDrow(); //chartDrow() 실행
    });
</script>


<!-- 막대 그래프 -->
<script>
    google.charts.load('current', {
        'packages': ['bar', 'corechart']
    });

    function schedulerSuccessAndFailChart() {
        var data = google.visualization.arrayToDataTable([
            ["Title", "달성률", {
                role: 'annotation'
            }],
            ["", 95, 95 //성공데이터 
            ]
        ]);

        var barChartOption = {
            bars: 'vertical',
            height: 260,
            width: '100%',
            legend: {
                position: "top"
            },
            isStacked: false,
            tooltip: {
                textStyle: {
                    fontSize: 12
                },
                showColorCode: true
            },
            animation: { //차트가 뿌려질때 실행될 애니메이션 효과
                startup: true,
                duration: 1000,
                easing: 'linear'
            },
            annotations: {
                textStyle: {
                    fontSize: 15,
                    bold: true,
                    italic: true,
                    color: '#871b47',
                    auraColor: '#d799ae',
                    opacity: 0.8
                }
            }
        };

        var chart = new google.visualization.BarChart(document.getElementById('bar_chart_div'));

        chart.draw(data, barChartOption);
        //반응형 그래프 출력 - 반응형 그래프를 원하지 않을 시 제거하거나 주석처리 하세요.
        window.addEventListener('resize', function() {
            chart.draw(data, barChartOption);
        }, false);
    }

    google.charts.setOnLoadCallback(schedulerSuccessAndFailChart);
</script>





            <!-- footer include -->
<%@include file="/WEB-INF/views/zaksim/main/footer.jsp" %>