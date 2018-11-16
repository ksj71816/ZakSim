package zaksim.dao;

import java.util.List;

import zaksim.dto.QnAFile;

/*
 * 작성일 : 2018.10.18
 * 작성자 : 권미현
 */
/**
 * Q&A 파일 관련 DAO Interface
 */
public interface QnAFileDao {

	/**
	 * Q&A 파일 리스트 조회 dao
	 * @param qnaIdx
	 * @return List<QnAFile>
	 */
	public List<QnAFile> qnaFileList(int qnaIdx);
	
	/**
	 * Q&A 파일 업로드(첨부) dao
	 * @param qnaFileDto
	 */
	public void qnaFileUpload(QnAFile qnaFileDto);
	
	/**
	 * Q&A 파일 삭제 dao
	 * @param qnaFileIdx
	 */
	public void qnaFileDelete(int qnaFileIdx);
	

	public QnAFile download(int qnaIdx);
}
