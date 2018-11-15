package zaksim.dto;

import java.util.Date;

//게시글 
public class Board {

	// 페이징 rnum
	private int rnum;
	
	// 인덱스 
	private int idx;

	// 개인 도전 인덱스 
	private int challenge_idx;

	// 그룹 인덱스 
	private int group_idx;

	// 작성자 인덱스 
	private int writer_idx;

	// 타이틀 
	private String title;

	// 내용 
	private String content;

	// 이미지 
	private String image;

	// 공개 여부
	private int open;

	// 인증글 여부 1(인증글)/0(일반글)
	private int certification;

	// 작성 날짜 
	private Date written_date;

	// 조회수 
	private int hit;

	// 댓글 & 대댓글
	private Comment comment;

	// 댓글 좋아요
	private BoardLike boardLike; 

	// 신고
	private Report report;

	private CommunityGroup communityGroup;

	private ZakSimMember zakSimMember;
	
	private int commentNum;
	
	private int likeNum;



	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getChallenge_idx() {
		return challenge_idx;
	}

	public void setChallenge_idx(int challenge_idx) {
		this.challenge_idx = challenge_idx;
	}

	public int getGroup_idx() {
		return group_idx;
	}

	public void setGroup_idx(int group_idx) {
		this.group_idx = group_idx;
	}

	public int getWriter_idx() {
		return writer_idx;
	}

	public void setWriter_idx(int writer_idx) {
		this.writer_idx = writer_idx;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getOpen() {
		return open;
	}

	public void setOpen(int open) {
		this.open = open;
	}

	public int getCertification() {
		return certification;
	}

	public void setCertification(int certification) {
		this.certification = certification;
	}

	public Date getWritten_date() {
		return written_date;
	}

	public void setWritten_date(Date written_date) {
		this.written_date = written_date;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public BoardLike getBoardLike() {
		return boardLike;
	}

	public void setBoardLike(BoardLike boardLike) {
		this.boardLike = boardLike;
	}

	public Report getReport() {
		return report;
	}

	public void setReport(Report report) {
		this.report = report;
	}

	public CommunityGroup getCommunityGroup() {
		return communityGroup;
	}

	public void setCommunityGroup(CommunityGroup communityGroup) {
		this.communityGroup = communityGroup;
	}

	public ZakSimMember getZakSimMember() {
		return zakSimMember;
	}

	public void setZakSimMember(ZakSimMember zakSimMember) {
		this.zakSimMember = zakSimMember;
	}

	public int getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}

	public int getLikeNum() {
		return likeNum;
	}

	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}

	@Override
	public String toString() {
		return "Board [rnum=" + rnum + ", idx=" + idx + ", challenge_idx=" + challenge_idx + ", group_idx=" + group_idx
				+ ", writer_idx=" + writer_idx + ", title=" + title + ", content=" + content + ", image=" + image
				+ ", open=" + open + ", certification=" + certification + ", written_date=" + written_date + ", hit="
				+ hit + ", comment=" + comment + ", boardLike=" + boardLike + ", report=" + report + ", communityGroup="
				+ communityGroup + ", zakSimMember=" + zakSimMember + ", commentNum=" + commentNum + ", likeNum="
				+ likeNum + "]";
	}
}
