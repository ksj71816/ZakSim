package zaksim.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zaksim.dao.CommunityMemberListDao;
import zaksim.dto.GroupMember;
import zaksim.dto.ZakSimMember;

@Service
public class CommunityMemberListServiceImpl implements CommunityMemberListService {

	@Autowired CommunityMemberListDao communityMemberListDao;

	@Override
	public List<ZakSimMember> members(int idx) {
		return communityMemberListDao.members(idx);
	}

	@Override
	public int cntMembers(int idx) {
		return communityMemberListDao.cntMember(idx);
	}


	

}
