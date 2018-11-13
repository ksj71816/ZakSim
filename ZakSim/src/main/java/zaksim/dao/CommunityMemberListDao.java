package zaksim.dao;

import java.util.List;

import zaksim.dto.GroupMember;

public interface CommunityMemberListDao {

	// 그룹별 회원 정보
	public List<GroupMember> members();
	

	
}
