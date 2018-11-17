package zaksim.dao;

import java.util.List;
import java.util.Map;

import zaksim.dto.CommunityCategory;
import zaksim.dto.CommunityGroup;
import zaksim.dto.GroupKeyword;
import zaksim.dto.GroupLike;
import zaksim.dto.GroupMember;
import zaksim.util.Paging;

public interface CommunityListDAO {

	// 그룹 리스트
	public List<CommunityGroup> joinedGroupList(int idx);
	
	// 인기그룹 리스트
	public List<CommunityGroup> popularGroupList();

	// 새로 시작한 그룹 리스트
	public List<CommunityGroup> newGroupList();
//	public List<GroupLike> newGroupList(String idx);
	
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
	
	// 그룹맴버 존재하는 지 
	public List<GroupMember> existMember(int idx);
	
	// 커뮤니티 비밀번호 일치여부
	public int secretCommunityJoin(CommunityGroup communityGroup);
	
	// 인기그룹 갯수
	public int popularCount();

	/**
	 * 인기그룹 리스트 가져오기(페이징)
	 * @param paging
	 * @return
	 */
	public List<GroupLike> popularPage(Paging paging);	
	
	public int isCommunityMember(Map<String,Integer> map);

	
	/**
	 * 새로운 리스트 가져오기(페이징)
	 * @param paging
	 * @return
	 */
	public List<GroupLike> newPage(Paging paging);

	/**
	 *  카테고리 갯수 가져오기
	 * @param category_idx
	 * @return
	 */
	public int categoryCount(int category_idx);
	
	/**
	 * 카테고리 리스트 가져요기 (페이징 ) 
	 * @param map
	 * @return
	 */
	public List<CommunityGroup> categoryPage(Map<String, Object> map);

	/**
	 * 카테고리별 갯수 가져오기 (페이징)
	 * @param idx
	 * @return
	 */
	public int categoryTotalCount(int idx);
}
