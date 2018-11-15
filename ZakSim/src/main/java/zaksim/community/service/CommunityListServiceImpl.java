package zaksim.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zaksim.dao.CommunityListDAO;
import zaksim.dto.CommunityCategory;
import zaksim.dto.CommunityGroup;
import zaksim.dto.GroupKeyword;
import zaksim.dto.GroupLike;
import zaksim.dto.GroupMember;

@Service
public class CommunityListServiceImpl  implements CommunityListService{

	@Autowired CommunityListDAO communityListDAO;

	// 가입한 그룹 리스트
	@Override
	public List<GroupLike> joinedGroupList(int idx) {
		// TODO Auto-generated method stub
		return communityListDAO.joinedGroupList(idx);
	}
	
	// 인기 모임 리스트
	@Override
	public List<CommunityGroup> popularGroupList() {
		// TODO Auto-generated method stub
		return communityListDAO.popularGroupList();
	}
	
	// 새로운 그룹 리스트
	@Override
	public List<CommunityGroup> newGroupList() {
//	public List<GroupLike> newGroupList(String idx) {
		// TODO Auto-generated method stub
		return communityListDAO.newGroupList();
	}
	
	// 카테고리 리스트
	@Override
	public List<CommunityCategory> categoryList() {
		
		return communityListDAO.categoryList();
	}


	// 키워드 리스트
	@Override
	public List<GroupKeyword> keywordList() {
		// TODO Auto-generated method stub
		return communityListDAO.keywordList();
	}

	// 해당 커뮤니티 정보 가져오기
	@Override
	public List<CommunityGroup> info(int idx) {
		// TODO Auto-generated method stub
		return communityListDAO.info(idx);
	}

	// 카테고리 리스트2
	@Override
	public List<CommunityCategory> categoryList2() {
		// TODO Auto-generated method stub
		return communityListDAO.categoryList2();
	}

	
	// 카테고리별 정보
	@Override
	public List<CommunityGroup> categoryGroup(int idx){
	 return communityListDAO.categoryGroup(idx);
 }

	// 그룹 좋아요
	@Override
	public GroupLike groupLike(int idx) {
		// TODO Auto-generated method stub
		return communityListDAO.groupLike(idx);
	}

	
	// 커뮤니티 비밀번호 일치여부
	@Override
	public boolean secretCommunityJoin(CommunityGroup communityGroup) {
		// TODO Auto-generated method stub
		if( communityListDAO.secretCommunityJoin(communityGroup)>0) {
			return true;
		}
		else {
			return false;
		}

	}

	// 그룹 맴버 존재하는지
	@Override
	public List<GroupMember> existMember( int idx) {

		return communityListDAO.existMember(idx);
	}




	
	


	
}
