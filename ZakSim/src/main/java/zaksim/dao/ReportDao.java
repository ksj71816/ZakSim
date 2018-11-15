package zaksim.dao;

import java.util.List;

import zaksim.dto.Report;
import zaksim.dto.ZakSimMember;

public interface ReportDao {

	// 신고 상세 보기
	List<Report> selectReport(ZakSimMember member);

	// 계정 정지 시 신고 사항 삭제
	void deleteReport(int index);

}
