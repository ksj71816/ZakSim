<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>





 <!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->
 
 
 
 
   
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




