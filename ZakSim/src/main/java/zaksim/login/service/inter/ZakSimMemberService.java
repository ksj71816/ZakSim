package zaksim.login.service.inter;

import zaksim.dto.ZakSimMember;

/*
 * 작성일 : 2018.10.18
 * 작성자 : 권미현
 */
/**
 * 회원관련 서비스 Interface
 */
public interface ZakSimMemberService {

	/**
	 * 로그인 service
	 * @return ZasimMember
	 */
	public ZakSimMember login();
	
	/**
	 * 아이디 찾기 service
	 * @param String name
	 * @param String email
	 * @return ZaksimMember
	 */
	public String findId(String name, String email);

	/**
	 * 비밀번호 찾기 service
	 * @param String id
	 * @param String name
	 * @param String email
	 * @return String
	 */
	public String findPw(String id, String name, String email);

	/**
	 * 회원가입 service
	 * @param ZaksimMember memberDto
	 */
	public void jogin(ZakSimMember memberDto);
	
	/**
	 * 회원가입 - 아이디 중복체크 service
	 * @param id
	 * @return true or false
	 */
	public boolean joinAjax(String id);
	
}
