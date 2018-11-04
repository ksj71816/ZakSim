package zaksim.community.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zaksim.dao.CommunityEditDAO;
import zaksim.dto.CommunityCategory;
import zaksim.dto.CommunityGroup;
import zaksim.dto.GroupKeyword;

@Service
public class CommunityEditServiceImpl implements CommunityEditService{

	@Autowired CommunityEditDAO communityEditDAO;
	
	// 그룹 개설
	public int createGroup(CommunityGroup communityGroup) {
		int nextval = communityEditDAO.getnextval();
		communityGroup.setIdx(nextval);
		communityEditDAO.createGroup(communityGroup);
		return nextval;
	}
	
	// 카테고리 추가
	public void createCategory(CommunityCategory communityCategory) {
		
		communityEditDAO.createCategory(communityCategory);
	}
	
	// 키워드 추가
	@Override
	public void createKeyword(GroupKeyword groupKeyword) {
		communityEditDAO.createKeyword(groupKeyword);
	}
	
//	public void createKeyword(GroupKeyword[] groupKeyword) {
//		
//		communityEditDAO.createKeyword(groupKeyword);
//	}
//	
	// 그룹 수정
	public void updateGroup(int idx) {
		communityEditDAO.updateGroup(idx);
	}
	
	// 키워드 수정
	@Override
	public void updateKeyword(int Group_index) {
		communityEditDAO.updateKeyword(Group_index);
	}
	
	// 그룹 삭제
	public void deleteGroup(CommunityGroup communityGroup) {
		communityEditDAO.deleteGroup(communityGroup);
	}

	@Override
	public int getCategoryIdx(int categoryNum) {
		
		return categoryNum;
	}







	
	
}
