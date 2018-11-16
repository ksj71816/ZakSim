package zaksim.customerCenter.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import zaksim.dao.QnAFileDao;
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

	@Autowired ServletContext context;
	@Autowired QnAFileDao qnaFileDao;
	
	@Override
	public List<QnAFile> qnaFileList(int qnaIdx) {
		return qnaFileDao.qnaFileList(qnaIdx);
	}
	
	@Override
	public QnAFile getFilePath(MultipartFile file) {
		QnAFile qnaFile = new QnAFile();
	
		String path = "/resources/upload/qna/";
		String realpath = context.getRealPath(path);
		String uid = UUID.randomUUID().toString().split("-")[4];
		String stored = uid + "_" + file.getOriginalFilename();
		File dest = new File(realpath, stored);

		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		qnaFile.setOriginal(file.getOriginalFilename());
		qnaFile.setStored(stored);
		
		return qnaFile;
	}

	@Override
	public void qnaFileUpload(QnAFile qnaFileDto) {
		qnaFileDao.qnaFileUpload(qnaFileDto);
	}

	@Override
	public void qnaFileDelete(int qnaFileIdx) {
		// TODO Auto-generated method stub
		
	}

}
