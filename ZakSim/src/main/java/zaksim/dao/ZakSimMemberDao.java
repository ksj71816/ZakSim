package zaksim.dao;

import java.util.List;
import java.util.Map;

import zaksim.dto.MStatistics;
import zaksim.dto.ZakSimMember;

public interface ZakSimMemberDao {
	
	// -------------- 관리자 ------------------
	
	// 인덱스로 회원 정보 가져오기
	public ZakSimMember selectMemberInfoByIdx(ZakSimMember member);
	
	// 로그인
	// 아이디, 비밀번호 일치하는 count(*) 반환
	public int selectAdminMember(ZakSimMember member);

	// 총 회원수 가져오기
	public int selectTotalMemberCount(Map<String, Object> param);

	// 회원 관리 리스트
	public List<ZakSimMember> selectAdminMemberList(Map<String, Object> param);

	// 계정 정지 처리
	public void updateMemberStatus(int idx);
	
	// 기간 별 가입 인원
	public int selectJoinNum(Map<String, String> param);
	
	// 회원 통계 상세 표 정보 가져오기
	public List<MStatistics> selectMStatisticsDetailData(Map<String, String> param);

//	// 기간 별 회원 수
//	public void selectMemberNum(String period);
	// -------------- 관리자 ------------------

	
	// -------------- 로그인 ------------------
	/**
	 * 로그인 dao
	 * @param ZakSimMember memberDto
	 * @return int
	 */
	public int login(ZakSimMember memberDto);
	
	/**
	 * 회원정보 dao
	 * @param ZaSimMember memberDto
	 * @return ZakSimMember
	 */
	public ZakSimMember memberInfo(ZakSimMember memberDto);
	
	/**
	 * 아이디 찾기 dao
	 * @param Map map
	 * @return String
	 */
	public String findId(Map<String, String> map);

	/**
	 * 비밀번호 찾기 dao - 해당 회원이 있는지 확인
	 * @param Map map
	 * @return int
	 */
	public int findPw(Map<String, String> map);
	/**
	 * 비밀번호 찾기 dao - 임시 비밀번호 DB에 저장
	 * @param Map map
	 */
	public void findPwResult(Map<String, String> map);

	/**
	 * 회원가입 dao
	 * @param ZaksimMember memberDto
	 */
	public void join(ZakSimMember memberDto);
	
	/**
	 * 회원가입 - 아이디 중복체크 dao
	 * @param String id
	 * @return int
	 */
	public int checkId(String id);
	
	/**
	 * 회원가입 - 닉네임 중복체크 dao
	 * @param String nick
	 * @return int
	 */
	public int checkNick(String nick);
	// -------------- 로그인 ------------------


	// 모든 회원 아이디 가져오기
	public List<ZakSimMember> selectAllMember();

	// 오늘 날짜의 컬럼 있는지 확인 (방문수)
	public int checkVisits();

	// 방문수 증가
	public void updateVisits();

	// 방문수 증가
	public void insertVisits();
}
