package zaksim.login.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zaksim.dao.inter.ZakSimMemberDao;
import zaksim.dto.ZakSimMember;
import zaksim.login.service.inter.ZakSimMemberService;

/*
 * 작성일 : 2018.10.18
 * 작성자 : 권미현
 */
/**
 * 회원 관련 서비스
 */
@Service
public class ZakSimMemberServiceImpl implements ZakSimMemberService {

	@Autowired ZakSimMemberDao memberDao;
	
	@Override
	public ZakSimMember login() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String findId(String name, String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String findPw(String id, String name, String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void jogin(ZakSimMember memberDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean joinAjax(String id) {
		// TODO Auto-generated method stub
		return false;
	}

}
