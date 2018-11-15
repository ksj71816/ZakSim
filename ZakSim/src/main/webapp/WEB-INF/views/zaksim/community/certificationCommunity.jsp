<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <!-- header include -->
<%@include file="/WEB-INF/views/zaksim/main/header.jsp"%>

    




    <div class="container" id="zz">
        <div class="row" style="margin-bottom: 30px;">
            <div class="col">
            </div>
            <div class="col-9">
                <div class="form-inline">
                    <strong>
                        <span style="font-size: 40px;">참여하고 있는 모임 1</span>
                        <span style="color: grey; font-style: italic; margin-left: 20px;">인증 목록</span>
                    </strong>
                    <button type="button" class="btn btn-danger" style="margin-top: 60px; margin-left: 200px;">모임 상세 보기</button>
                </div>






            </div>
            <div class="col">
            </div>
        </div>

        <div class="row">
            <div class="col"></div>


            <div class="col-sm-11" style="margin-top: 50px; margin-right: 100px;">

                <div style="margin-left: 200px; margin-right: 200px; margin-bottom: 70px;" class="form-inline">
                    <span style="font-size: 30px;" class="mx-2"><strong>날짜</strong></span>
                    <div><input class="form-control form-control-sm" type="date" style="width: 150px;" /></div>
                    <span class="mx-3" style="color: lightgray"> ※ 인증 목록은 지난 달까지만 볼 수 있습니다.</span>
                </div>

                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Card title</h4>
                        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                    </div>
                    <img class="card-img-bottom" src="https://picsum.photos/1200/350/?image=137" alt="인증">
                </div>
                
                
                                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Card title</h4>
                        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                    </div>
                    <img class="card-img-bottom" src="https://picsum.photos/1200/350/?image=136" alt="인증">
                </div>
                
                
                                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Card title</h4>
                        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                    </div>
                    <img class="card-img-bottom" src="https://picsum.photos/1200/350/?image=139" alt="인증">
                </div>


<div style="margin-left: 350px;">
<nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
  </ul>
</nav>
</div>

            </div>


            <div class="col" style="margin-bottom: 300px;"></div>
        </div>

    </div>

<!-- 위로가기 버튼 -->
<div class="top-button">
	<a href=""><img id="upImg" src="/resources/image/community/위로.png" style="width: 50px; height: 50px;">
	</a>
</div>



</body>

<link rel="stylesheet" type="text/css" href="/css/community/certificationCommunity.css">
<link rel="stylesheet" type="text/css" href="/css/community/button.css">


<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>


    <script type="text/javascript">
        $(document).ready(function() {

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

    <!-- footer include -->
<%@include file="/WEB-INF/views/zaksim/main/footer.jsp"%>

