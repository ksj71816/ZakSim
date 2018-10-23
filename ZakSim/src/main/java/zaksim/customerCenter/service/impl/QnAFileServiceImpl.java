package zaksim.customerCenter.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zaksim.customerCenter.service.inter.QnAFileService;
import zaksim.dao.inter.QnAFileDao;
import zaksim.dto.QnAFile;

/*
 * 작성일 : 2018.10.18
 * 작성자 : 권미현
 */
/**
 * QnA 파일 관련 서비스
 */
@Service
public class QnAFileServiceImpl implements QnAFileService {

	@Autowired QnAFileDao qnaFileDao;
	
	@Override
	public List<QnAFile> qnaFileList(int qnaIdx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void qnaFileUpload(QnAFile qnaFileDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void qnaFileDelete(int qnaFileIdx) {
		// TODO Auto-generated method stub
		
	}

}
