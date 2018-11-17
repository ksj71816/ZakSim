package zaksim.community.service;

import java.util.List;
import java.util.Map;

import zaksim.dto.CommunityGroup;
import zaksim.dto.GroupLike;

public interface CommunitySearchService {

	
	// 그룹 검색
	public List<CommunityGroup> searchGroup(String keyword);
	
	// 카테고리 검색
	public List<CommunityGroup> searchCategoryGroup(String keyword);
	
	// 키워드 검색
	public List<CommunityGroup> searchKeywordGroup(String Keyword);

	/**
	 * 검색 - 타이틀 검색 시 총 갯수
	 * @param searchContent 
	 * @return
	 */
	public int titleTotalCount(String searchContent);

	/**
	 * 검색 - 카테고리 검색 시 총 갯수
	 * @param searchContent
	 * @return
	 */
	public int categoryTotalCount(String searchContent);
	
	/**
	 * 그룹 검색 (페이징)
	 * @param map
	 * @return
	 */
	public List<CommunityGroup> titlePage(Map<String, Object> map);

	
	/**
	 * 카테고리 검색 ( 페이징 ) 
	 * @param map
	 * @return
	 */
	public List<CommunityGroup> categoryPage(Map<String, Object> map);

	
}
