package zaksim.community.service;

import java.util.List;

import zaksim.dto.GroupMember;

public interface CommunityMemberListService {

	// 그룹별 회원 정보
	public List<GroupMember> members(int idx);
	
}
