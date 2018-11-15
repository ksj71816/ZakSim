<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!-- header include -->
<%@include file="/WEB-INF/views/zaksim/main/header.jsp"%>




<div class="container" id="zz">



	<div class="row" style="margin-bottom: 30px;">
		<div class="col"></div>
		<div class="col-9">
			<div class="form-inline">
				<strong> <span style="font-size: 40px;">전체 통계</span> <span
					style="color: grey; font-style: italic; margin-left: 20px;">♥좋아요를
						토대로 TOP20 을 보여줍니다.</span>
				</strong>
			</div>






		</div>
		<div class="col"></div>
	</div>

	<div class="row">
		<div class="col"></div>


		<div class="col-sm-11" style="margin-top: 50px; margin-right: 100px;">

			<div
				style="margin-left: 110px; font-size: 30px; border-bottom: 1px solid; border-bottom-color: gray; margin-right: 60px;">
				<div class="form-inline">
					<div
						style="border-right: 1px solid; border-right-color: gray; padding-right: 200px; padding-left: 150px; font-size: 30px;">
						<a href="/zaksim/community/individualRanking">개인</a>
					</div>
					<div style="margin-left: 200px; font-size: 30px;">
						<a href="/zaksim/community/groupRanking">모임</a>
					</div>
				</div>
			</div>

			<c:forEach var="communityList" items="${communityList }" step="1"
				begin="0" end="2" varStatus="status">

				<!-- 랭킹 -->
				<div class="form-inline"
					style="margin-top: 50px; font-size: 30px; margin-left: 150px; box-shadow: 5px 5px 5px; margin-right: 100px; margin-bottom: 60px;">
					<table class="table table-borderless">
						<tbody>
							<tr>
								<th scope="col">
									<p style="color: red; font-size: 60px;">&nbsp;&nbsp;${ status.index+1 }</p>
								</th>
								<th scope="col"><img class="groupImg"
									src="${communityList.communityGroup.image }"
									style="width: 90px;"></th>
								<th scope="col"
									style="text-align: center; width: 300px; word-break: break-all"
									wrap="hard">${communityList.communityGroup.title }<br>
									<c:forEach var="keywordList" items="${keywordList }">
										<c:if
											test="${communityList.communityGroup.idx eq keywordList.group_idx}">
											<span>#${keywordList.keyword }</span>
										</c:if>
									</c:forEach>
								</th>
								<th scope="col" style="text-align: center;">좋아요<br>${communityList.likeNum }</th>
								<th scope="col" style="text-align: center;">달성도<br>96%
								</th>
							</tr>
						</tbody>
					</table>
				</div>
			</c:forEach>

			<c:forEach var="communityList" items="${communityList }" step="1"
				begin="3" end="8" varStatus="status">

				<!-- 랭킹 -->
				<div class="form-inline"
					style="margin-top: 50px; font-size: 30px; margin-left: 150px; box-shadow: 5px 5px 5px; margin-right: 100px; margin-bottom: 60px;">
					<table class="table table-borderless">
						<tbody>
							<tr>
								<th scope="col">
									<p style="font-size: 60px;">&nbsp;&nbsp;${ status.index+1 }</p>
								</th>
								<th scope="col"><img class="groupImg"
									src="${communityList.communityGroup.image }"
									style="width: 90px;"></th>
								<th scope="col"
									style="text-align: center; width: 300px; word-break: break-all"
									wrap="hard">${communityList.communityGroup.title }<br>
									<c:forEach var="keywordList" items="${keywordList }">
										<c:if
											test="${communityList.communityGroup.idx eq keywordList.group_idx}">
											<span>#${keywordList.keyword }</span>
										</c:if>
									</c:forEach>
								</th>
								<th scope="col" style="text-align: center;">좋아요<br>${communityList.likeNum }</th>
								<th scope="col" style="text-align: center;">달성도<br>96%
								</th>
							</tr>
						</tbody>
					</table>
				</div>
			</c:forEach>




			<c:forEach var="communityList" items="${communityList }" step="1"
				begin="9" end="19" varStatus="status">

				<!-- 랭킹 -->
				<div class="form-inline"
					style="margin-top: 50px; font-size: 30px; margin-left: 150px; box-shadow: 5px 5px 5px; margin-right: 100px; margin-bottom: 60px;">
					<table class="table table-borderless">
						<tbody>
							<tr>
								<th scope="col">
									<p style="font-size: 60px;">${ status.index+1 }</p>
								</th>
								<th scope="col"><img class="groupImg"
									src="${communityList.communityGroup.image }"
									style="width: 90px;"></th>
								<th scope="col"
									style="text-align: center; width: 300px; word-break: break-all"
									wrap="hard">${communityList.communityGroup.title }<br>
									<c:forEach var="keywordList" items="${keywordList }">
										<c:if
											test="${communityList.communityGroup.idx eq keywordList.group_idx}">
											<span>#${keywordList.keyword }</span>
										</c:if>
									</c:forEach>
								</th>
								<th scope="col" style="text-align: center;">좋아요<br>${communityList.likeNum }</th>
								<th scope="col" style="text-align: center;">달성도<br>96%
								</th>
							</tr>
						</tbody>
					</table>
				</div>
			</c:forEach>


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


<link rel="stylesheet" type="text/css" href="/css/community/button.css">
<link rel="stylesheet" type="text/css"
	href="/css/community/groupRanking.css">

<script src="//code.jquery.com/jquery-2.2.4.min.js"></script>
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