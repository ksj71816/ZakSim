package zaksim.dao;

import java.util.List;

import zaksim.dto.GroupMember;
import zaksim.dto.ZakSimMember;

public interface CommunityMemberListDao {

	// 그룹별 회원 정보
	public List<ZakSimMember> members(int idx);

	// 그룹의 회원 수 가져오기
	public int cntMember(int idx);

	// 그룹에서 탈퇴하기
	public void withdrawMember(GroupMember groupMember);
	
}
