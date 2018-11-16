package zaksim.dto;

import java.util.Date;

/*
 * 작성일 : 2018.10.18
 * 작성자 : 권미현
 */
/**
 * Q&A 파일 DTO
 */
public class QnAFile {

	private int idx; // 인덱스
	private int qnaIdx; // 문의글 인덱스
	private String original; // 원본명
	private String stored; // 저장명
	private Date writtenDate; // 첨부 날짜
	
	// DTO(JOIN으로 인한...)
	private QnA qnaDto; // Q&A DTO

	
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getQnaIdx() {
		return qnaIdx;
	}

	public void setQnaIdx(int qnaIdx) {
		this.qnaIdx = qnaIdx;
	}

	public String getOriginal() {
		return original;
	}

	public void setOriginal(String original) {
		this.original = original;
	}

	public String getStored() {
		return stored;
	}

	public void setStored(String stored) {
		this.stored = stored;
	}

	public Date getWrittenDate() {
		return writtenDate;
	}

	public void setWrittenDate(Date writtenDate) {
		this.writtenDate = writtenDate;
	}

	public QnA getQnaDto() {
		return qnaDto;
	}

	public void setQnaDto(QnA qnaDto) {
		this.qnaDto = qnaDto;
	}

	@Override
	public String toString() {
		return "QnAFile [idx=" + idx + ", qnaIdx=" + qnaIdx + ", original=" + original + ", stored=" + stored
				+ ", writtenDate=" + writtenDate + ", qnaDto=" + qnaDto + "]";
	}
	
}
