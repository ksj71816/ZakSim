<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- header include -->
<%@include file="/WEB-INF/views/zaksim/main/header.jsp"%>

<div class="container" id="zz">

	<div class="row" style="margin-bottom: 30px;">
		<div class="col"></div>
		<div class="col-9">
			<div class="form-inline">
				<strong> <span style="font-size: 40px;">참여하고 있는 모임 1</span>
					<span style="color: grey; font-style: italic; margin-left: 20px;">참여자
						보기</span>
				</strong>
				<button type="button" class="btn btn-danger"
					style="margin-top: 60px; margin-left: 150px;" id="detailView">
					모임 상세 보기</button>
			</div>

		</div>
		<div class="col"></div>
	</div>

	<div class="row">
		<div class="col"></div>


		<div class="col-sm-11" style="margin-top: 50px; margin-right: 100px;">

			<c:forEach var="members" items="${members }">
				<c:forEach var="groupInfo" items="${groupInfo }">
			
			<c:if test="${members.group_idx eq groupInfo.communityGroup.idx }">
					<!-- 랭킹 -->
					<div class="form-inline"
						style="margin-top: 50px; font-size: 30px; margin-left: 150px; box-shadow: 5px 5px 5px; margin-right: 100px; margin-bottom: 60px;">
						<table class="table table-borderless">
							<tbody>
								<tr>
									<th scope="col"></th>
									<th scope="col"><img
										src="https://picsum.photos/1200/350/?image=2"
										style="width: 90px;"></th>
									<th scope="col"
										style="text-align: center; width: 300px; word-break: break-all"
										wrap="hard">닉네임1<br>도전하고 있는 목표
									</th>
									<th scope="col" style="text-align: center;">도전횟수<br>10
									</th>
									<th scope="col" style="text-align: center;">인증률<br>96%
									</th>
								</tr>
							</tbody>
						</table>
					</div>
					    </c:if>
				</c:forEach>
			</c:forEach>





		</div>




		<div class="col" style="margin-bottom: 500px;"></div>
	</div>

</div>


<!-- 위로가기 버튼 -->
<div class="top-button">
	<a href=""><img id="upImg" src="/resources/image/community/위로.png" style="width: 50px; height: 50px;">
	</a>
</div>




</body>


<link rel="stylesheet" type="text/css" href="/css/community/button.css">
<link rel="stylesheet" type="text/css"
	href="/css/community/individualRanking.css">

<script src="//code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
        $(document).ready(function() {
        	
        	$("#detailView").click(function() {
    			document.location.href = "/zaksim/community/detailCommunity";
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

<!-- footer include -->
<%@include file="/WEB-INF/views/zaksim/main/footer.jsp"%>
