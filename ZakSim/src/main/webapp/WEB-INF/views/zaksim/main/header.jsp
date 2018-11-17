<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
   
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ZakSim</title>
   
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.js"></script>

<style type="text/css">
@font-face {
	font-family: Dohyeon;
	src: url('/resources/fonts/BMDOHYEON_ttf.ttf');
}
@font-face {
	font-family: HannaAir;
	src: url('/resources/fonts/BMHANNAAir_ttf.ttf');
}

 #navbarToggle {  
    position: relative;     
    transition: width 0.001s;
	transition-timing-function: linear;  
}

.menu {
	height: 4em;
	width: 20%;
	margin-top: 25px;
}  
	.menu .subItems {
	}
	.menu .subItem{
		display: inline-block;
		margin-right: 2px;
	}
	.menu .subItem:hover {
		font-weight: bold;
	}

.point{
	cursor:pointer;
}

.dohyeon {
	font-family: Dohyeon !important;
}
</style>
</head>

<body>
<!-- navbar -->
<div class="container-fluid">
<div class="row navbar navbar-expand-lg" style="background-color: #FFFFFF;border-bottom:3px solid indianred;">
    <!-- logo -->
    <div class="col-sm-2">
		<span>
        	<a href="/zaksim/main/home">
        		<img src="/resources/image/main/logo.png" class="" alt="logo image" style="width: 220px;"/>
			</a>
    	</span>
        
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
		</button>
	</div><!-- end of logo div -->

	<div class="col-sm-1"></div>
	<!-- menu -->
	<div class="col-sm-8 px-5">
		<div class="d-flex justify-content-between">
			<div class="menu">
				<div class="mainItem">
					<span class="h5 point"><strong>챌린지</strong></span>
				</div>
				<div class="subItems">
					<span class="subItem">
				        <c:if test="${sessionScope.login}">
							<!-- 도전중 일때 -->
					        <c:if test="${ sessionScope.status eq 'ing' }">
					        <a href="/zaksim/challenge/challengeInfo" style="text-decoration: none; color: black;" >나의 도전 </a>
					        </c:if>
					        <!-- 도전중이 아닐때 -->
					        <c:if test="${sessionScope.status ne 'ing'}">
					        <a href="/zaksim/challenge/doChallenge" style="text-decoration: none; color: black;" >나의 도전 </a>
					        </c:if>
				        </c:if>
				        <c:if test="${not sessionScope.login}"> 
				        	<a href="/zaksim/main/notLogin" style="text-decoration: none; color: black;" >나의 도전 </a>
				        </c:if>
					</span>
					<span class="subItem">
						<a href="/zaksim/challenge/challengers" style="text-decoration: none;  color: black;" > 도전자 인증</a>
					</span>
				</div> <!-- end of 챌린지 subItems -->
			</div><!-- end of 챌린지 menu -->
			
			<div class="menu">
				<div class="mainItem">
					<span class="h5 point"><strong>커뮤니티</strong></span>
				</div>
				<div class="subItems">
					<span class="subItem">
						<a href="/zaksim/community/communityMain" style="text-decoration: none;  color: black;" >커뮤니티</a>
					</span>
<!-- 					<span class="subItem"> -->
<!-- 						<a href="/zaksim/community/individualRanking" style="text-decoration: none;  color: black;">도전 통계</a> -->
<!-- 					</span> -->
				</div>
			</div>
			
			<div class="menu">
				<div class="mainItem">
					<span class="h5 point"><strong>고객센터</strong></span>
				</div>
				<div class="subItems">
					<span class="subItem">
						<a href="/zaksim/customerCenter/QnA/list" style="text-decoration: none; color: black; " >QnA</a>
					</span>
					<span class="subItem">
						<a href="/zaksim/customerCenter/guidance/view" style="text-decoration: none; color: black; "> 이용 안내</a>
					</span>
				</div>
			</div>
			
			<div class="menu">
				<div class="mainItem">
					<span class="h5 point"><strong>마이페이지</strong></span>
				</div>
				<div class="subItems">
					<span class="subItem">
						<a href="/zaksim/mypage/main" style="text-decoration: none; color: black; " >회원 정보</a>
					</span>
				</div>
			</div>
		</div>
	</div><!-- menu -->
	
	<!-- logout -->
	<div class="col-sm-1">
    	<c:if test="${sessionScope.login ne null && sessionScope.login eq true }">
    		<a href="/zaksim/login/logout" style="text-decoration: none; color: black;">
    			<strong>logout</strong>
    		</a>
    	</c:if>
    	<c:if test="${sessionScope.login eq null}">
    		<a href="/zaksim/login/login" style="text-decoration: none; color: black;">
    			<strong>login</strong>
    		</a>
    	</c:if>
    	<c:if test='${sessionScope.login_id eq "admin"}'>
    		<br>
    		<a href="/zaksim/admin/member" style="text-decoration: none; color: black;">
    			<strong>관리자페이지</strong>
    		</a>
    	</c:if>
	</div>

</div><!-- end of navbar toggle -->
</div><!-- end of container -->
<!-- 해더 끝 -->
<script type="text/javascript">
$(document).ready(function(){
	$(".subItems").hide();
	
	$(".mainItem").on('click', function(){
		$(".subItems").fadeToggle();
	});	
})
</script>