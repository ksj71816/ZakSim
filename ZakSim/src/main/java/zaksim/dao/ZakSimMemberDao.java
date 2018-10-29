package zaksim.dao;

import java.util.List;
import java.util.Map;

import zaksim.dto.ZakSimMember;

public interface ZakSimMemberDao {
	
	// -------------- 관리자 ------------------
	// 로그인
	// 아이디, 비밀번호 일치하는 count(*) 반환
	public int selectAdminMember(ZakSimMember member);

	// 총 회원수 가져오기
	public int selectTotalMemberCount(Map<String, Object> param);

	// 회원 관리 리스트
	public List<ZakSimMember> selectAdminMemberList(Map<String, Object> param);

	// 계정 정지 처리
	public void updateMemberStatus(ZakSimMember member);

	// 기간 별 가입 인원
	public void selectJoinNum(int period);

	// 기간 별 회원 수
	public void selectMemberNum(int period);
	// -------------- 관리자 ------------------

	
	// -------------- 로그인 ------------------
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
	// -------------- 로그인 ------------------


	
	
}
