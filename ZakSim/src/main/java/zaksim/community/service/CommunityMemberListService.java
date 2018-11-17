package zaksim.community.service;

import java.util.List;

import zaksim.dto.GroupMember;
import zaksim.dto.ZakSimMember;

public interface CommunityMemberListService {

	// 그룹별 회원 정보
	public List<ZakSimMember> members(int idx);

	// 회원 
	public int cntMembers(int idx);
	
}
