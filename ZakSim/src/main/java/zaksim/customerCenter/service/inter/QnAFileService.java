package zaksim.customerCenter.service.inter;

import java.util.List;

import zaksim.dto.QnAFile;

/*
 * 작성일 : 2018.10.18
 * 작성자 : 권미현
 */
/**
 * Q&A 파일 관련 서비스 Interface
 */
public interface QnAFileService {

	/**
	 * Q&A 파일 리스트 조회 service
	 * @param qnaIdx
	 * @return List<QnAFile>
	 */
	public List<QnAFile> qnaFileList(int qnaIdx);
	
	/**
	 * Q&A 파일 업로드(첨부) service
	 * @param qnaFileDto
	 */
	public void qnaFileUpload(QnAFile qnaFileDto);
	
	/**
	 * Q&A 파일 삭제 service
	 * @param qnaFileIdx
	 */
	public void qnaFileDelete(int qnaFileIdx);
	
}
