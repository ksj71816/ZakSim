<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<link rel="stylesheet" href="/css/challenge/dragNdrop.css">



<fieldset>

<!-- <legend>HTML File Upload</legend> -->

<input type="hidden" id="MAX_FILE_SIZE" name="MAX_FILE_SIZE" value="300000" />

<div>
	<!-- <label for="fileselect">Files to upload:</label> -->
	<input type="file" id="fileselect" name="fileselect[]" multiple="multiple" />
	<div id="filedrag" style="background-color: aliceblue;">이곳에 이미지 파일을 드래그 해서 올려주세요.</div>
</div>

<div id="submitbutton">
	<button type="submit">Upload Files</button>
</div>

</fieldset>


<div id="messages">
<p>Status Messages</p>
</div>



 <!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->
 
 
 <!-- 파일 드래그 앤 드랍 스크립트 -->
<script type="text/javascript">


//getElementById
function $id(id) {
	return document.getElementById(id);
}

//
//output information
function Output(msg) {
	var m = $id("messages");
	m.innerHTML = msg + m.innerHTML;
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

	var fileselect = $id("fileselect"),
		filedrag = $id("filedrag"),
		submitbutton = $id("submitbutton");
	

	// file select
	fileselect.addEventListener("change", FileSelectHandler, false);

	// is XHR2 available?
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
		fileselect.style.display = "none";
		
		// 파일 정보 숨김
 		messages.style.display = "none";
		
		
		
	}

}


//file drag hover
function FileDragHover(e) {
	e.stopPropagation();
	e.preventDefault();
	e.target.className = (e.type == "dragover" ? "hover" : "");

	
}

var file;

//file selection
function FileSelectHandler(e) {

	// cancel event and hover styling
	FileDragHover(e);

	// fetch FileList object
	var files = e.target.files || e.dataTransfer.files;
		file=files[0];
	  
//     console.log("-------------------");
//     console.log("files");
//     console.log(files);
	
	
	// process all File objects // 이미지 정보 전달->출력
	for (var i = 0, f; f = files[i]; i++) {
		ParseFile(f);
	}

	
// 파일 리더
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



function ParseFile(file) {

// 	console.log("-------------------");
// 	console.log("file");
	console.log(file);
//	console.log("-------------------");
	
	// 이미지 정보 출력
	Output(
		"<p>File information: <strong>" + file.name +
		"</strong> type: <strong>" + file.type +
		"</strong> size: <strong>" + file.size +
		"</strong> bytes</p>"
	);
	
}



function toCitation(){
	console.log("toCitation()");
	console.log(file);
	 $.ajax({
	      type: "post"
	      , url : "/zaksim/challenge/citation"
	      , data :
	      	{
	      		file : file["0"]
   	  		, text : $("#textarea").val()
	      	}
	 
   	  , dataType: "json"
	      , success: function( data ) {
				console.log("전송 성공!!");	         

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

 
 
   
 <!-- 파일 리더 스크립트 (이미지 미리보기) -->    
 <!-- 
 <script type="text/javascript">
        $(function() {
            $("#imgInp").on('change', function(){
            	console.log("-------------------");
            	console.log("이미지 로더");
            	console.log(this);
            	
            /* <input type="file" id="imgInp"> */
            	
                readURL(this);
            });
        });

        function readURL(input) {
        	
        	console.log("-------------------");
        	console.log("input");
        	console.log(input);
        	
        	/* <input type="file" id="imgInp"> */
        	
            if (input.files && input.files[0]) {
            
            console.log("-------------------");
            console.log("input.files");
            console.log(input.files);
            console.log("-------------------");
            console.log("input.files[0]");
            console.log(input.files[0]);
            
            
            var reader = new FileReader();

            reader.onload = function (e) {
            	
            	console.log("-------------------");
                console.log("e.target.result");
                console.log(e.target.result);
                
            	
                    $('#blah').attr('src', e.target.result);
                }

              reader.readAsDataURL(input.files[0]);
              
              
              
              
            }
        }


    </script>


 <form id="form1" runat="server">
        <input type='file' id="imgInp" />
        <img id="blah" src="#" alt="your image" />
    </form>



 -->




