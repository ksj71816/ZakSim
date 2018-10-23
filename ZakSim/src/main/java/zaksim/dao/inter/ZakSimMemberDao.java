package zaksim.dao.inter;

import zaksim.dto.ZakSimMember;

/*
 * 작성일 : 2018.10.18
 * 작성자 : 권미현
 */
/**
 * 회원 관련 DAO Interface
 */
public interface ZakSimMemberDao {

	/**
	 * 로그인 dao
	 * @return ZasimMember
	 */
	public ZakSimMember login();
	
	/**
	 * 아이디 찾기 dao
	 * @param String name
	 * @param String email
	 * @return String
	 */
	public String findId(String name, String email);

	/**
	 * 비밀번호 찾기 dao - 해당 회원이 있는지 확인
	 * @param String id
	 * @param String name
	 * @param String email
	 * @return String
	 */
	public int findPw(String id, String name, String email);
	/**
	 * 비밀번호 찾기 dao - 임시 비밀번호 DB에 저장
	 * @param String id
	 * @param String name
	 * @param String email
	 * @return String
	 */
	public String findPw(String id, String temPw);

	/**
	 * 회원가입 dao
	 * @param ZaksimMember memberDto
	 */
	public void jogin(ZakSimMember memberDto);
	
	/**
	 * 회원가입 - 아이디 중복체크 dao
	 * @param id
	 * @return true or false
	 */
	public int joinAjax(String id);
	
}
