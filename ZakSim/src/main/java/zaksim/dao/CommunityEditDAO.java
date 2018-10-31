package zaksim.dao;

import zaksim.dto.CommunityGroup;

public interface CommunityEditDAO {

	// 그룹 개설
	public void createGroup(CommunityGroup communityGroup);
	
	// 그룹 수정
	public void updateGroup(CommunityGroup communityGroup);
	
	// 그룹 삭제
	public void deleteGroup(CommunityGroup communityGroup);
	
	
}