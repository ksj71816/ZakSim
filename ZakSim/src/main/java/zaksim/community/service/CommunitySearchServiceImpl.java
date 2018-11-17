package zaksim.community.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zaksim.dao.CommunitySearchDAO;
import zaksim.dto.CommunityGroup;

@Service
public class CommunitySearchServiceImpl implements CommunitySearchService {

	@Autowired CommunitySearchDAO communitySearchDao;
	
	// 그룹 검색
	@Override
	public List<CommunityGroup> searchGroup(String keyword) {
		
		return communitySearchDao.searchGroup(keyword);
	}

	// 카테고리 검색
	@Override
	public List<CommunityGroup> searchCategoryGroup(String keyword) {
		
		return communitySearchDao.searchCategoryGroup(keyword);
	}

	// 키워드 검색
	@Override
	public List<CommunityGroup> searchKeywordGroup(String Keyword) {
		
		return communitySearchDao.searchKeywordGroup(Keyword);
	}



	/**
	 * 검색 - 타이틀 검색 시 총 갯수
	 * @return
	 */
	@Override
	public int titleTotalCount(String searchContent) {
		// TODO Auto-generated method stub
		return communitySearchDao.titleTotalCount(searchContent);
	}

	/**
	 * 검색 - 카테고리 검색 시 총 갯수
	 * @param searchContent
	 * @return
	 */
	@Override
	public int categoryTotalCount(String searchContent) {
		// TODO Auto-generated method stub
		return communitySearchDao.categoryTotalCount(searchContent);
	}
	
	/**
	 * 그룹 검색 (페이징)
	 */
	@Override
	public List<CommunityGroup> titlePage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return communitySearchDao.titlePage(map);
	}

	
	

}
