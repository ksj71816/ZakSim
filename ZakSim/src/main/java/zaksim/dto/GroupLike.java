package zaksim.dto;

//그룹 좋아요 
public class GroupLike {

	// 인덱스 
	private int idx;

	// 그룹 인덱스 
	private int group_idx;

	// 회원 인덱스 
	private int member_idx;
	
	private int likeNum;

	private int joinYn;
	
	private CommunityGroup communityGroup;
	
	private ZakSimMember zakSimMember;
	
	private GroupKeyword groupKeyword;
	
	private CommunityCategory communityCategory;

	@Override
	public String toString() {
		return "GroupLike [idx=" + idx + ", group_idx=" + group_idx + ", member_idx=" + member_idx + ", likeNum="
				+ likeNum + ", joinYn=" + joinYn + ", communityGroup=" + communityGroup + ", zakSimMember="
				+ zakSimMember + ", groupKeyword=" + groupKeyword + ", communityCategory=" + communityCategory + "]";
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getGroup_idx() {
		return group_idx;
	}

	public void setGroup_idx(int group_idx) {
		this.group_idx = group_idx;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public int getLikeNum() {
		return likeNum;
	}

	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}

	public int getJoinYn() {
		return joinYn;
	}

	public void setJoinYn(int joinYn) {
		this.joinYn = joinYn;
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

	public GroupKeyword getGroupKeyword() {
		return groupKeyword;
	}

	public void setGroupKeyword(GroupKeyword groupKeyword) {
		this.groupKeyword = groupKeyword;
	}

	public CommunityCategory getCommunityCategory() {
		return communityCategory;
	}

	public void setCommunityCategory(CommunityCategory communityCategory) {
		this.communityCategory = communityCategory;
	}



	



	
}