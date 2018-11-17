package zaksim.dto;

import java.util.Date;

public class Comment {

	 // 인덱스 
    private int idx;

    // 작성자 인덱스 
    private int writer_idx;

    // 내용 
    private String content;

    // 게시글 인덱스 
    private int board_idx;

    // 작성 날짜 
    private Date written_date;

    // 깊이 
    private int depth;

    // 상위 댓글 인덱스 
    private int upper_idx;
    
    private int order;
    
    private String upperId;

	private ZakSimMember zakSimMember;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getWriter_idx() {
		return writer_idx;
	}

	public void setWriter_idx(int writer_idx) {
		this.writer_idx = writer_idx;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getBoard_idx() {
		return board_idx;
	}

	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}

	public Date getWritten_date() {
		return written_date;
	}

	public void setWritten_date(Date written_date) {
		this.written_date = written_date;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public int getUpper_idx() {
		return upper_idx;
	}

	public void setUpper_idx(int upper_idx) {
		this.upper_idx = upper_idx;
	}

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	public String getUpperId() {
		return upperId;
	}

	public void setUpperId(String upperId) {
		this.upperId = upperId;
	}

	public ZakSimMember getZakSimMember() {
		return zakSimMember;
	}

	public void setZakSimMember(ZakSimMember zakSimMember) {
		this.zakSimMember = zakSimMember;
	}

	@Override
	public String toString() {
		return "Comment [idx=" + idx + ", writer_idx=" + writer_idx + ", content=" + content + ", board_idx="
				+ board_idx + ", written_date=" + written_date + ", depth=" + depth + ", upper_idx=" + upper_idx
				+ ", order=" + order + ", upperId=" + upperId + ", zakSimMember=" + zakSimMember + "]";
	}


	
}
