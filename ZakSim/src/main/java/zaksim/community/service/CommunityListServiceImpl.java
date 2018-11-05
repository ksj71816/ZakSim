package zaksim.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zaksim.dao.CommunityListDAO;
import zaksim.dto.CommunityCategory;
import zaksim.dto.CommunityGroup;
import zaksim.dto.GroupKeyword;
import zaksim.dto.GroupLike;

@Service
public class CommunityListServiceImpl  implements CommunityListService{

	@Autowired CommunityListDAO communityListDAO;

	// 가입한 그룹 리스트
	@Override
	public List<CommunityGroup> joinedGroupList() {
		// TODO Auto-generated method stub
		return communityListDAO.joinedGroupList();
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

 @Override
	// 카테고리별 정보
	public List<CommunityGroup> categoryGroup(int idx){
	 
	 return communityListDAO.categoryGroup(idx);
 }


	
	


	
}
