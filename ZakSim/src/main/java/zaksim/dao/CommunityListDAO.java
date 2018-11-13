package zaksim.dao;

import java.util.List;

import zaksim.dto.CommunityCategory;
import zaksim.dto.CommunityGroup;
import zaksim.dto.GroupKeyword;
import zaksim.dto.GroupLike;
import zaksim.dto.GroupMember;
import zaksim.dto.ZakSimMember;

public interface CommunityListDAO {

	// 그룹 리스트
	public List<CommunityGroup> joinedGroupList(int idx);
	
	// 인기그룹 리스트
	public List<CommunityGroup> popularGroupList( );

	// 새로 시작한 그룹 리스트
	public List<CommunityGroup> newGroupList( );
	
	// 카테고리 리스트
	public List<CommunityCategory> categoryList();

	// 키워드 리스트
	public List<GroupKeyword> keywordList();
	
	// 카테고리 리스트2
	public List<CommunityCategory> categoryList2();
	
	// 인덱스에 대한 커뮤니티 정보 가져오기
	public List<CommunityGroup> info(int idx);
	
	// 카테고리별 정보
	public List<CommunityGroup> categoryGroup(int idx);
	
	// 커뮤니티 좋아요
	public GroupLike groupLike(int idx);
	
}
