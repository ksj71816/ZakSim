package zaksim.login.service;

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
	 * @param ZaSimMember memberDto
	 * @return true or false
	 */
	public boolean login(ZakSimMember memberDto);
	
	/**
	 * 회원정보 dao
	 * @param ZaSimMember memberDto 
	 * @return ZakSimMember
	 */
	public ZakSimMember memberInfo(ZakSimMember memberDto);
	
	/**
	 * 아이디 찾기 service
	 * @param String name
	 * @param String email
	 * @return String
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
	 * @param ZakSimMember memberDto
	 */
	public void join(ZakSimMember memberDto);
	
	/**
	 * 회원가입 - 아이디 중복체크 service
	 * @param String id
	 * @return true(사용 가능) or false(중복된 ID가 있음)
	 */
	public boolean checkId(String id);

	/**
	 * 회원가입 - 닉네임 중복체크 service
	 * @param String nick
	 * @return true(사용 가능) or false(중복된 닉네임이 있음)
	 */
	public boolean checkNick(String nick);

	/**
	 * 이메일 인증 service
	 * @param String email
	 * @return String
	 */
	public String authEmail(String email);

	// 방문수 증가
	public void plusVisits();
	
}
