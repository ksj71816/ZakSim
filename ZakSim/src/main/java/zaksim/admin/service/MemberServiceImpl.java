package zaksim.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zaksim.dao.ReportDao;
import zaksim.dao.ZakSimMemberDao;
import zaksim.dto.Report;
import zaksim.dto.ZakSimMember;
import zaksim.util.Paging;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired ZakSimMemberDao zakSimMemberDao;
	@Autowired ReportDao reportDao;
	
	
	@Override
	public ZakSimMember getMemberData(ZakSimMember member) {
		return zakSimMemberDao.selectMemberInfoByIdx(member);
	}

	@Override
	public int getAdminTotalCount(String searchId, String category) {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<>();
		param.put("searchId", searchId);
		param.put("category", category);
		return zakSimMemberDao.selectTotalMemberCount(param);
	}
	
	@Override
	public List<ZakSimMember> viewAdminList(Paging paging, String category, String searchId) {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<>();
		param.put("paging", paging);
		param.put("category", category);
		param.put("searchId", searchId);
		
		return zakSimMemberDao.selectAdminMemberList(param);
	}

	@Override
	public List<Report> viewReport(ZakSimMember member) {
		return reportDao.selectReport(member);
	}

	@Override
	public void suspend(List<String> idx) {
		for(String index : idx) {
			zakSimMemberDao.updateMemberStatus(Integer.parseInt(index));
			reportDao.deleteReport(Integer.parseInt(index));
		}
		// 디비에서 자동으로 상태변경되게 만들거나 메소드 생성하기
		
	}


}
