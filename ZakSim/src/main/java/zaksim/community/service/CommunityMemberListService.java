package zaksim.community.service;

import java.util.List;

import zaksim.dto.GroupMember;
import zaksim.dto.ZakSimMember;

public interface CommunityMemberListService {

	// 그룹별 회원 정보
	public List<ZakSimMember> members(int idx);

	// 커뮤니티 회원 가입 수 
	public int cntMembers(int idx);

	// 커뮤니티 탈퇴하기
	public void withdrawMember(GroupMember groupMember);
	
}
