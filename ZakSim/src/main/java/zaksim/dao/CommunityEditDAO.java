package zaksim.dao;

import zaksim.dto.CommunityCategory;
import zaksim.dto.CommunityGroup;
import zaksim.dto.GroupKeyword;
import zaksim.dto.ZakSimMember;

public interface CommunityEditDAO {

	// 맴버 인덱스 가져오기
	public int memberIdx(ZakSimMember zakSimMember);
	
	// 카테고리 인덱스 가져오기
	public int getCategoryIdx(int categoryNum);
	
	// 그룹 개설
	public void createGroup(CommunityGroup communityGroup);
	
	// 
	public int getnextval();
	
	// 카테고리 추가
	public void createCategory(CommunityCategory communityCategory);
	
	// 키워드 추가
	public void createKeyword(GroupKeyword groupKeyword);
	
	
	// 그룹 수정
	public void updateGroup(int  idx);
	
	// 키워드 수정
	public void updateKeyword(int Group_index);
	
	// 그룹 삭제
	public void deleteGroup(CommunityGroup communityGroup);
	
}
