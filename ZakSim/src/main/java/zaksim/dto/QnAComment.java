package zaksim.dto;

import java.sql.Date;

/*
 * 작성일 : 2018.10.18
 * 작성자 : 권미현
 */
/**
 * Q&A 댓글 DTO
 */
public class QnAComment {

	private int idx; // 인덱스
	private int qnaIdx; // 문의글 인덱스
	private int upperIdx; // 상위 댓글 인덱스
	private int depth; // 깊이
	private int writerIdx; // 작성자 인덱스
	private String content; // 내용
	private Date writtenDate; // 작성 날짜
	
	// DTO(JOIN으로 인한...)
	private ZakSimMember memberDto; // 회원 DTO
	private QnA qnaDto; // Q&A DTO
	private QnAComment qnaCommentDto; // 상위 Q&A 댓글 DTO
	
	
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
	public int getUpperIdx() {
		return upperIdx;
	}
	public void setUpperIdx(int upperIdx) {
		this.upperIdx = upperIdx;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getWriterIdx() {
		return writerIdx;
	}
	public void setWriterIdx(int writerIdx) {
		this.writerIdx = writerIdx;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWrittenDate() {
		return writtenDate;
	}
	public void setWrittenDate(Date writtenDate) {
		this.writtenDate = writtenDate;
	}
	public ZakSimMember getMemberDto() {
		return memberDto;
	}
	public void setMemberDto(ZakSimMember memberDto) {
		this.memberDto = memberDto;
	}
	public QnA getQnaDto() {
		return qnaDto;
	}
	public void setQnaDto(QnA qnaDto) {
		this.qnaDto = qnaDto;
	}
	public QnAComment getQnaCommentDto() {
		return qnaCommentDto;
	}
	public void setQnaCommentDto(QnAComment qnaCommentDto) {
		this.qnaCommentDto = qnaCommentDto;
	}
	
	@Override
	public String toString() {
		return "QnAComment [idx=" + idx + ", qnaIdx=" + qnaIdx + ", upperIdx=" + upperIdx + ", depth=" + depth
				+ ", writerIdx=" + writerIdx + ", content=" + content + ", writtenDate=" + writtenDate + ", memberDto="
				+ memberDto + ", qnaDto=" + qnaDto + ", qnaCommentDto=" + qnaCommentDto + "]";
	}
	
}
