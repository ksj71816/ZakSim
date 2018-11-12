package zaksim.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Challenge {
	
	//인덱스
	private int idx;
	//유저 인덱스
	private int memberIdx;
	//도전 신청일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date applyDate;
	//도전 시작일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate;
	//도전 종료일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
	//도전금
	private int money;
	//도전명
	private String title;
	//도전 상태 ex) ing/done/half(중도포기)
	private String status;
	//달성 결과 ex) success/fail
	private String result;
	
	
	
	public int getIdx() {
		return idx;
	}
	
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	public int getMemberIdx() {
		return memberIdx;
	}
	
	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}
	
	
	
	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	public Date getStartDate() {
		return startDate;
	}
	
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	
	public Date getEndDate() {
		return endDate;
	}
	
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	public int getMoney() {
		return money;
	}
	
	public void setMoney(int money) {
		this.money = money;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getResult() {
		return result;
	}
	
	public void setResult(String result) {
		this.result = result;
	}

	@Override
	public String toString() {
		return "Challenge [idx=" + idx + ", memberIdx=" + memberIdx + ", applyDate=" + applyDate + ", startDate="
				+ startDate + ", endDate=" + endDate + ", money=" + money + ", title=" + title + ", status=" + status
				+ ", result=" + result + "]";
	}
	
	
}
