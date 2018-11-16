package zaksim.dto;

import java.util.Date;

// 커뮤니티 그룹
public class CommunityGroup {

	private int currval;
	
    // 인덱스 
    private int idx;

    // 생성 회원 인덱스 
    private int member_idx;

    // 카테고리 
    private int category_idx;

    // 타이틀 
    private String title;

    // 소개글 
    private String content;

    // 그룹 이미지 
    private String image;

    // 설정 인원 ~100
    private int max;

    // 생성 날짜 
    private Date open_date;

    // 공개 여부 1(비공개)/0(공개)
    private int secret;

    // 비밀번호 
    private String password;
    
    CommunityCategory communityCategory;
    
    ZakSimMember zakSimMember;
    
    private int likeNum;



	public int getCurrval() {
		return currval;
	}

	public void setCurrval(int currval) {
		this.currval = currval;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public int getCategory_idx() {
		return category_idx;
	}

	public void setCategory_idx(int category_idx) {
		this.category_idx = category_idx;
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

	public int getMax() {
		return max;
	}

	public void setMax(int max) {
		this.max = max;
	}

	public Date getOpen_date() {
		return open_date;
	}

	public void setOpen_date(Date open_date) {
		this.open_date = open_date;
	}

	public int getSecret() {
		return secret;
	}

	public void setSecret(int secret) {
		this.secret = secret;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public CommunityCategory getCommunityCategory() {
		return communityCategory;
	}

	public void setCommunityCategory(CommunityCategory communityCategory) {
		this.communityCategory = communityCategory;
	}

	public ZakSimMember getZakSimMember() {
		return zakSimMember;
	}

	public void setZakSimMember(ZakSimMember zakSimMember) {
		this.zakSimMember = zakSimMember;
	}

	public int getLikeNum() {
		return likeNum;
	}

	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}

	@Override
	public String toString() {
		return "CommunityGroup [currval=" + currval + ", idx=" + idx + ", member_idx=" + member_idx + ", category_idx="
				+ category_idx + ", title=" + title + ", content=" + content + ", image=" + image + ", max=" + max
				+ ", open_date=" + open_date + ", secret=" + secret + ", password=" + password + ", communityCategory="
				+ communityCategory + ", zakSimMember=" + zakSimMember + ", likeNum=" + likeNum + "]";
	}
}
