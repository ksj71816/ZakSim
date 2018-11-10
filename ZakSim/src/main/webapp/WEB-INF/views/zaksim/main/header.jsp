<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

   
   <!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>ZakSim</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<style type="text/css">
 #navbarToggle {  
    position: relative;  
   
    transition: width 0.001s;

	transition-timing-function: linear;  
      
 }  


</style>

</head>

<body>
    <!-- logo -->
    <div class="container">
        <div class="row">
            <div class="col text-center">
                <a href="/zaksim/main/home"><img src="/resources/image/main/logo.jpg" class="img-fluid" alt="Responsive image" style="height: 18rem; width: 30rem;" /></a>
            </div>
        </div>
    </div> <!-- end of logo -->

    <!-- navbar -->
    <div class="row navbar navbar-expand-lg navbar-dark m-0" style=" background-color: rgb(154, 28, 15);">
        <div class=" text-white" style=" width:18rem!important;">
            <h3 class="my-0"><b>&nbsp;ZakSim</b></h3>

          
           <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
 
        </div>

        <div class="col-lg-10 collapse navbar-collapse text-center " id="navbarSupportedContent">
            <ul class="navbar-nav ">

	
                <li class="nav-item" style="   font-size: 20px;"
                   data-toggle="collapse" data-target="#navbarToggle" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
                    <a class="nav-link " style="cursor:pointer;"><b>챌린지</b></a>
                </li>
                
                
 		<li class="col " style="margin-left:2em; width:  14em;"> </li><!-- 공백용 col-->
                <li class="nav-item " style="   font-size: 20px;"
                   data-toggle="collapse" data-target="#navbarToggle" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
                    <a class="nav-link " style="cursor:pointer;"><b>커뮤니티</b></a>
                </li>

 		 
 		   <li class="col " style="margin-left:2em; width: 14em;"> </li><!-- 공백용 col-->
                <li class="nav-item "  style="  font-size: 20px;"
                   data-toggle="collapse" data-target="#navbarToggle" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
                    <a class="nav-link " style="cursor:pointer;"><b>고객센터</b></a>
                </li>
                
                  
     	  <li class="col " style="margin-left:1em; width: 14em;"> </li><!-- 공백용 col-->
                <li class="nav-item "  style="  font-size: 20px;" 
                   data-toggle="collapse" data-target="#navbarToggle" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
                    <a class="nav-link " style="cursor:pointer;"><b>마이페이지</b></a>
                </li>
          
            </ul>
        </div>
         
    </div> <!-- end of navbar -->

<!--나브바 토글-->
<div class="row navbar navbar-expand-lg navbar-dark collapse m-0" style="	background-color:lightgrey;	height: 40px;" id="navbarToggle">
    <div class="text-blakc " style="width: 25rem!important;">
      <h5 class="my-0 ml-1"><b>&nbsp;thirty day</b></h5>
    </div>
    
    <div class="col-lg-10 ">
      <ul class="navbar-nav ">
        
        <li class="nav-item font-weight-bold text-black-50 mx-2" style="font-size: 15px;">
        
        
        <c:if test="${sessionScope.login}">
	        
	        <!-- 도전중 일때 -->
	        <c:if test="${ status }">
	        <a href="/zaksim/challenge/challengeInfo" style="text-decoration: none; " >나의 도전</a>
	        </c:if>
	        
	        <!-- 도전중이 아닐때 -->
	        <c:if test="${empty status }">
	        <a href="/zaksim/challenge/doChallenge" style="text-decoration: none; " >나의 도전</a>
	        </c:if>
        </c:if>
        
        <c:if test="${not sessionScope.login}"> 
        	<a href="/zaksim/main/notLogin" style="text-decoration: none; " >나의 도전</a>
        </c:if>
        
        
        </li>
        <li class="nav-item  font-weight-bold text-black-50 mx-2" style="font-size: 15px;">
        <a href="/zaksim/challenge/challengers" style="text-decoration: none;  " >도전자 인증</a>
        </li>
        
        
        <li class="col "> </li><!-- 공백용 col-->
        
        <li class="nav-item font-weight-bold text-black-50 mx-2" style="font-size: 15px;">
        <a href="/zaksim/community/communityMain" style="text-decoration: none;  " >커뮤니티</a>
        </li>
        <li class="nav-item  font-weight-bold text-black-50 mx-2" style="font-size: 15px;">
        <a href="/zaksim/community/individualRanking" style="text-decoration: none;  ">도전 통계</a>
        </li>
        
        
        
        <li class="col "> </li><!-- 공백용 col-->
       
        <li class="nav-item  font-weight-bold text-black-50 mx-2" style="font-size: 15px;">
        <a href="/zaksim/customerCenter/QnA/list" style="text-decoration: none;  " >QnA</a>
        </li>
        <li class="nav-item   font-weight-bold text-black-50 mx-2" style="font-size: 15px;">
        <a href="/zaksim/customerCenter/guidance/view" style="text-decoration: none;  ">이용 안내</a>
        </li>
        
        
        
        <li class="col "> </li><!-- 공백용 col-->
        
        <li class="nav-item  font-weight-bold text-black-50 mx-2" style="font-size: 15px;">
        <a href="/zaksim/mypage/main" style="text-decoration: none;  " >회원 정보</a>
        </li>
        <li class="nav-item  font-weight-bold text-black-50 mx-2" style="font-size: 15px;">
        <a href="/zaksim/mypage/groups" style="text-decoration: none;  ">참여중 그룹</a>
        </li>
        <li class="nav-item font-weight-bold text-black-50 mx-2" style="font-size: 15px;">
        <a href="/zaksim/mypage/challenge" style="text-decoration: none;  ">지난 도전</a>
        
        <li class="col "> </li><!-- 공백용 col-->
      </ul>
    </div>
  </div>



<!-- 해더 끝 -->
