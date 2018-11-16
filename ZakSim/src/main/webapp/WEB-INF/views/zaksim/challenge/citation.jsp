<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!-- header include -->
<%@include file="/WEB-INF/views/zaksim/main/header.jsp" %>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->

<!-- 드래그앤 드랍 스타일 -->
<link rel="stylesheet" href="/css/challenge/dragNdrop.css">




<!-- 바디 -->

   <div class="py-5" style="background-image: url(/resources/image/challenge/back.jpg);">
    <div class="container">
      <div class="row text-white py-3" style="background-color: rgba(94, 94, 94, 0.64);">
        <div class="col-md-1"> </div>
        <div class="col-md-10">
          <div class="row text-center rounded" style="background-color: rgba(33, 33, 33, 0.67);">
            <div class="mt-2 col-md-3">
              <h2 class="text-left ml-4 mt-1"> <b>ZakSim</b> </h2>
            </div>
          
             
              
            <div class="col-md-1 mt-3 " >
              
            </div>
            <div class="col-md-7 mt-3 rounded" style=" background-color:rgb(154, 28, 15); padding-top:7px; ">
              <h5 class="mt-1 "> ${sessionScope.login_nick }의 도전 인증 </h5>
            </div>
           
            <div class="col-md-0 mt-3 " >
              <h5 class="mt-1">  </h5>
            </div>
            <div class="col-md-1 mt-3">
            </div>
            
            <div style="height:5px; background-color:rgb(154, 28, 15);" class="col rounded">
            </div>
          </div>
          
        </div>
        <div class="col-md-1"><a onclick="alert();"> <img class="img-fluid d-block rounded-circle ml-3" src="/resources/image/challenge/exitBT.png" style="cursor:pointer;	height: 45px; width: 45px;"> </a> </div>
      </div>
   


  <div class="row text-dark pb-5 py-2 " style="background-color: rgba(94, 94, 94, 0.64);">
       
          <div class="col-md-2"> </div>
          
        <div class="col-md-8 border-white my-3 px-5 py-4 rounded" style="background-color: rgba(33, 33, 33, 0.5); border-right-width: 5px;	border-top-width: 5px;	border-bottom-width: 5px;    border-left-width: 5px;	border-style: solid;">

   
   
          <div class="row ">
            
            <div class="col-md-12 mt-2 text-white">
                <h3 class="text-center">${info.title}</h3>
                <h5  class="mt-3 mb-0 p-0 d-flex">작성일 :&nbsp;&nbsp;<span class="m-0 " id="nowdate" style=" color: tan;"> </span></h5>
           
            <h5 class="mt-3 radio-inline text-white"> 공개 여부 :
	           
	            <label class="mx-3 radio-inline" style="    font-size: 1rem;">
	      			<input type="radio" name="open" value="1" checked>공개
	    		</label>
	    		<label class="mx-3 radio-inline" style="    font-size: 1rem;">
	      			<input type="radio" name="open" value="0">비공개
	    		</label>
            
            </h5>
            
            </div>
            
          </div>
          
            <div style="height:2px; background-color:white;" class="col rounded my-2">
            </div>
          
         
            
          <div class="text-left text-center text-white">
           
            <img id="blah" class="w-100 h-100 img-fluid d-block rounded" src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg" style=" border-right-width: 3px;	border-top-width: 3px;	border-bottom-width: 3px;    border-left-width: 3px;	border-style: solid;	border-color: white; ">
          </div>
          
          
          <!--파일 드래그 앤 드랍-->
          
			          
			          
			<fieldset>
			
			<!-- <legend>HTML File Upload</legend> -->
			
			<input type="hidden" id="MAX_FILE_SIZE" name="MAX_FILE_SIZE" value="300000" />
			
			<div >
<!-- 				 <label for="fileselect">Files to upload:</label> -->
<!-- 				<input id="fileselect" type="file" name="fileselect" multiple="multiple"/> -->
				<div id="filedrag" style="background-color: aliceblue;">
				
				이곳에 이미지 파일을 드래그 해서 올려주세요.</div>
			</div>
			
			<div id="submitbutton">
				<button type="submit">Upload Files</button>
			</div> <!-- none -->
			
			</fieldset>
			
			
			<div id="messages">
			<p>Status Messages</p>
			</div>
			          
			          
         
          
          <!-- 파일 드래그 앤 드랍 end -->
            
            <div style="height:2px; background-color:white;" class="col rounded my-2 mt-4">
            </div>
            
          <div class="form-group text-center text-white">
            <label for="exampleFormControlTextarea1" class="d-flex mx-1">메세지</label>
            <textarea class="form-control" id="content" name="content" rows="3"></textarea>
            
            <div class="row">
            <!-- <div class="col-md-4">
            <a class="btn  mt-5  btn-success " href="#"> 파일 올리기 </a>
            </div>
            <div class="col-md-4"> </div> -->
            	<div class="col-md-12">
            	<button id="auth" type="button" class="btn btn-primary mt-5 " >인증 하기</button>
            	</div>
            </div>
              
          </div>
          
        
        </div>
        
        <div class="col-md-2"> </div>
     
        
      </div>
      
        
    </div>
  </div>
            
<!--바디 끝-->
 
   
        <!-- footer include -->
        
<%@include file="/WEB-INF/views/zaksim/main/footer.jsp" %>


<!-- alert 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.28.12/sweetalert2.all.js"></script>


<!-- alert 스크립트-->
<script type="text/javascript">


function alert(){
	
	swal({
		  title: '인증을 취소 하시겠습니까?',
		  text: "작성중인 정보가 초기화 됩니다!",
		  type: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#2E82CC',
		  cancelButtonColor: '#FC3A3A',
		  confirmButtonText: '확인',
		  cancelButtonText: '취소'
		}).then((result) => {
		  if (result.value) {
	
			  document.location.href = "/zaksim/challenge/challengeInfo";
			  
		  }
		})
	
	
}
		


</script>


    
<!-- 작성일 시간 스크립트 -->
<script type="text/javascript">

// 1초마다 재실행
setInterval(

		function sysdate(){
			
			
			var nowDate = document.getElementById("nowdate");

			var now = new Date();

			var nowTime = now.getFullYear();	

//			console.log(nowTime);	
			
			nowTime += '-' + (now.getMonth()+1);	//년도 0=1월, 11=12월이므로 +1

//			console.log(nowTime);
			nowTime += '-' + now.getDate();		 // 날짜

//			console.log(nowTime);
//			nowTime += ' ' + now.getHours();	 // 시간
			nowTime += ' ' + addZeros(now.getHours(),2);
			
//			console.log(nowTime);
//			nowTime += ':' + now.getMinutes();	 // 분
			nowTime += ':' + addZeros(now.getMinutes(),2);
			
//			console.log(nowTime);
//			nowTime += ':' + now.getSeconds();	 // 초
			nowTime += ':' + addZeros(now.getSeconds(),2);
			
//			console.log(nowTime);

//			console.log(now.getDate());
//			console.log(nowTime);
			
			nowDate.innerHTML=nowTime;
			
			
			
//			setTimeout("sysdate()",1000);         // 1초마다 printClock() 함수 호출
		}
		
		,1000);

//자릿수 맞춰주기
function addZeros(num, digit) { 
	  var zero = '';
	  num = num.toString();
	  if (num.length < digit) {
	    for (i = 0; i < digit - num.length; i++) {
	      zero += '0';
	    }
	  }
	  return zero + num;
}


</script>
     
     
     

 <!-- 파일 드래그 앤 드랍,파일리더 스크립트 -->
<script type="text/javascript">


//getElementById
function $id(id) {
	return document.getElementById(id);
}

//파일 태그 추가
//output information
function Output(msg) {
	var m = $id("messages");
	m.innerHTML = msg;
}



//call initialization file
if (window.File && window.FileList && window.FileReader) {
	
// 	console.log("-------------------");
// 	console.log("window.File");
// 	console.log(window.File);
	
// 	console.log("-------------------");
// 	console.log("window.FileList");
// 	console.log(window.FileList);
// 	console.log("-------------------");
// 	console.log("window.FileReader");
// 	console.log(window.FileReader);
	
	
	Init();
}

//
//initialize
function Init() {


		filedrag = $id("filedrag"),
		submitbutton = $id("submitbutton");
	

	var xhr = new XMLHttpRequest();
	if (xhr.upload) {
	
		// file drop
		filedrag.addEventListener("dragover", FileDragHover, false);
		filedrag.addEventListener("dragleave", FileDragHover, false);
		filedrag.addEventListener("drop", FileSelectHandler, false);
		filedrag.style.display = "block";
	
		
		// 버튼 숨김
		submitbutton.style.display = "none";
		
		// 셀렉터 숨김
	//	fileselect.style.display = "none";
		
		// 파일 정보 숨김
 		messages.style.display = "none";
		
		
		
	}

}


//file drag hover (호버시 스타일 적용 클래스 네임 생성)
function FileDragHover(e) {
	e.stopPropagation();
	e.preventDefault();
	e.target.className = (e.type == "dragover" ? "hover" : "");

	
}

var files;

//file selection
function FileSelectHandler(e) {

	// cancel event and hover styling
	FileDragHover(e);

	// fetch FileList object
 	files = e.target.files || e.dataTransfer.files;
	

	if(files.length < 1){
		console.log("이미지 없음");
		alert("이미지가 없습니다");
		return;
	}
	

	
// 파일 리더( 이미지 미리보기 )
    var reader = new FileReader();

    reader.onload = function (e) {
    	
//     	console.log("-------------------");
//         console.log("e.target.result");
//         console.log(e.target.result);
        
    	// 이미지 경로 셋팅
            $('#blah').attr('src', e.target.result);
        }

//     console.log("-------------------");
//     console.log("files");
//     console.log(files);
    
      reader.readAsDataURL(files[0]);
      
      
      
      
}

$('#auth').click(function(){
	
	fileMultiUpload(files, $('#filedrag'));
});


function fileMultiUpload(files, obj){
	var data = new FormData();
	data.append('fileselect', files[0]);
	data.append('content',$('#content').val());
	data.append('open',$('input[name="open"]').val());
	
	
	$.ajax({
		url:'/zaksim/challenge/citation',
		type:'post',
		data:data,
		processData:false,
		contentType: false,
		success:function(){
			console.log("에이젝스 성공");
			location.href="/zaksim/challenge/result/citationSuccess";
		}
	});
}








		
</script>

      
     
     