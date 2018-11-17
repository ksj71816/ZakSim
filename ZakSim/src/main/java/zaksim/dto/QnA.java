package zaksim.dto;

import java.util.Date;

/*
 * 작성일 : 2018.10.18
 * 작성자 : 권미현
 */
/**
 * Q&A DTO
 */
public class QnA {

	private int idx; // 인덱스
	private int writerIdx; // 작성자 인덱스
	private String title; // 타이틀
	private String content; // 내용
	private int hit; // 조회수
	private String status; // 답변 상태(ready/complete)
	private String secret; // 비밀글 여부(public/private)
//	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date writtenDate; // 작성 날짜
	private int upperIdx; // 상위 문의글 인덱스
	private int depth; // 깊이
	
	private String nick;
	
	// DTO(JOIN으로 인한...)
	private ZakSimMember memberDto; // 회원 DTO
	private QnA qnaDto; // 상위 Q&A DTO
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getWriterIdx() {
		return writerIdx;
	}
	public void setWriterIdx(int writerIdx) {
		this.writerIdx = writerIdx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	public Date getWrittenDate() {
		return writtenDate;
	}
	public void setWrittenDate(Date writtenDate) {
		this.writtenDate = writtenDate;
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
	
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	@Override
	public String toString() {
		return "QnA [idx=" + idx + ", writerIdx=" + writerIdx + ", title=" + title + ", content=" + content + ", hit="
				+ hit + ", status=" + status + ", secret=" + secret + ", writtenDate=" + writtenDate + ", upperIdx="
				+ upperIdx + ", depth=" + depth + ", nick=" + nick + ", memberDto=" + memberDto + ", qnaDto=" + qnaDto
				+ "]";
	}

}
