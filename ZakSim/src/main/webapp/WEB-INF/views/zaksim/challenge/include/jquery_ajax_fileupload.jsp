<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery Ajax Fileupload</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- jQuery Form Plugin -->
<script src="http://malsup.github.com/min/jquery.form.min.js"></script> 
 
<script type="text/javascript">
$(document).ready(function() {
	
	//jquery.form.js 플러그인 사용
	//	http://malsup.com/jquery/form/
	
	$("#fileForm").ajaxForm({
// 		type: "post" //form에 설정한 값이 기본값
// 		, url: "/jquery" //form에 설정한 값이 기본값
		data: {
			
		}
		, dataType: "json"
		, success: function( res ) {
			console.log("성공");
		}
		, error: function() {
			console.log("실패");
		}
		
		
	});
});
</script>

</head>
<body>

<h1>jQuery 라이브러리를 이용한 Ajax 파일 업로드</h1>
<hr>

<form id="fileForm" action="/jquery" method="post" enctype="multipart/form-data">

<label>제목 : <input type="text" name="title" /></label><br>
<label>본문 : <input type="text" name="content" /></label><br>
<label>첨부1 : <input type="file" name="file1" /></label><br>
<label>첨부2 : <input type="file" name="file2" /></label><br>
<label>첨부3 : <input type="file" name="file3" /></label><br><br>

<button id="btnSend">보냅니다!</button>
</form>

</body>
</html>




onclick="toCitation();"

<!-- 


@WebServlet(value="/jquery")
public class JqueryAajxFileupload extends HttpServlet {

	private static final long serialVersionUID = 1L;

	
	//확인
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/jquery/jquery_ajax_fileupload.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//파일 업로드 처리
		
		//요청 파라미터 한글 인코딩 설정 : UTF-8
		req.setCharacterEncoding("UTF-8");
		
		boolean isMultipart = ServletFileUpload.isMultipartContent(req);
		
		if( !isMultipart ) {
			System.out.println("멀티파트 아님");
			return;
		}
		
		DiskFileItemFactory factory = null;
		factory = new DiskFileItemFactory();

		//메모리 처리 사이즈
		int maxMem = 1 * 1024 * 1024; //1MB
		factory.setSizeThreshold(maxMem);
		
		//디스크 처리 사이즈
		ServletContext context = getServletContext();
		File repository=new File(context.getRealPath("tmp"));
		factory.setRepository(repository);
		
		//업로드 객체 생성
		ServletFileUpload upload = null;
		upload = new ServletFileUpload(factory);
		
		//용량 제한 설정 : 10MB
		int maxFile = 10 * 1024 * 1024; //10MB
		upload.setFileSizeMax(maxFile);
		
		//업로드 데이터 파싱(추출) - 임시파일 업로드 수행
		List<FileItem> items = null;
		try {
			items = upload.parseRequest(req);
			
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		
		//파싱된 데이터 처리
		Iterator<FileItem> iter = items.iterator();
		
		//요청정보 전부 처리하기
		while( iter.hasNext() ) {
			FileItem item = iter.next();//요청정보 하나씩얻기
			
			// 빈 파일 처리
			if( item.getSize() <= 0 )	continue;
			
			// 빈 파일이 아닐 경우
			if( item.isFormField() ) {
				System.out.println("----------------------------------");
				System.out.println("폼 필드 키 : " + item.getFieldName());
				System.out.println("값 : " + item.getString("utf-8"));
				System.out.println("----------------------------------");
				
			} else {
				//파일일 경우

				// --- UUID 생성 ---
				UUID uuid = UUID.randomUUID();
				System.out.println(uuid);
				
				String u = uuid.toString().split("-")[4];
				System.out.println(u);
				// -----------------
				
				//로컬 저장소 파일
				File up = new File( context.getRealPath("upload"), item.getName() + "_" + u);
				System.out.println(up);
								
				try {
					// 실제 업로드
					item.write(up);
					
					// 임시 파일 삭제
					item.delete();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			
		}
		
	}
}


 -->




