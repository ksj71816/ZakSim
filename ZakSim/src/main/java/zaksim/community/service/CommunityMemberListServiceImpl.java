package zaksim.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zaksim.dao.CommunityMemberListDao;
import zaksim.dto.GroupMember;

@Service
public class CommunityMemberListServiceImpl implements CommunityMemberListService {

	@Autowired CommunityMemberListDao communityMemberListDao;

	@Override
	public List<GroupMember> members(int idx) {
		// TODO Auto-generated method stub
		return communityMemberListDao.members(idx);
	}


	

}
