package zaksim.dao;

import zaksim.dto.CommunityCategory;
import zaksim.dto.CommunityGroup;
import zaksim.dto.GroupKeyword;
import zaksim.dto.GroupLike;
import zaksim.dto.GroupMember;
import zaksim.dto.ZakSimMember;

public interface CommunityEditDAO {

	// 맴버 인덱스 가져오기
	public int memberIdx(ZakSimMember zakSimMember);
	
	// 카테고리 인덱스 가져오기
	public int getCategoryIdx(int categoryNum);
	
	// 그룹 개설
	public void createGroup(CommunityGroup communityGroup);
	
	// 그룹 맴버 추가
	public void addMember(GroupMember groupMember);
	
	// 
	public int getnextval();
	
	// 카테고리 추가
	public void createCategory(CommunityCategory communityCategory);
	
	// 키워드 추가
	public void createKeyword(GroupKeyword groupKeyword);
	
	
	// 키워드 삭제
	public void deleteKeyword(int group_idx);
	
	
	// 그룹 수정
	public void updateGroup(CommunityGroup communityGroup);
	
	// 그룹 삭제
	public void deleteGroup(int idx);
	
	// 그룹 맴버 삭제
	public void deleteGroupMember(int idx);
	
	// 좋아요 확인
	public int like(GroupLike groupLike);
	
	// 그룹 좋아요
	public void likeGroup(GroupLike groupLike);
	
	// 그룹 좋아요 취소
	public void disLikeGroup(GroupLike groupLike);
	
}
