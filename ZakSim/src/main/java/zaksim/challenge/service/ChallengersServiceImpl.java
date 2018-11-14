package zaksim.challenge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zaksim.dao.BoardDao;
import zaksim.dto.Board;
import zaksim.util.Paging;

@Service
public class ChallengersServiceImpl implements ChallengersService{

	@Autowired BoardDao boardDao;
	
	
	@Override
	public List<Board> getCitationList() {
		
		return boardDao.selectTotalCitation();
	}


	@Override
	public int citationTotalCnt() {
		
		return boardDao.cntTotal();
	}


	@Override
	public List<Board> pagingCitationList(Paging paging) {
		
		return boardDao.selectPagingCitation(paging);
	}

	
	
	
}
