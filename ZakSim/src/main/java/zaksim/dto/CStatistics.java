package zaksim.dto;

import java.util.Date;

public class CStatistics {
	
	private Date today;
	private int totalMem;
	private int chalCount;
	private int avgMoney;
	
	private int dateNum;
	private int boardNum;
	
	
	
	public Date getToday() {
		return today;
	}
	
	public void setToday(Date today) {
		this.today = today;
	}
	
	public int getTotalMem() {
		return totalMem;
	}
	
	public void setTotalMem(int totalMem) {
		this.totalMem = totalMem;
	}
	
	public int getChalCount() {
		return chalCount;
	}
	
	public void setChalCount(int chalCount) {
		this.chalCount = chalCount;
	}
	
	public int getAvgMoney() {
		return avgMoney;
	}
	
	public void setAvgMoney(int avgMoney) {
		this.avgMoney = avgMoney;
	}
	
	public int getDateNum() {
		return dateNum;
	}

	public void setDateNum(int dateNum) {
		this.dateNum = dateNum;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	@Override
	public String toString() {
		return "CStatistics [today=" + today + ", totalMem=" + totalMem + ", chalCount=" + chalCount + ", avgMoney="
				+ avgMoney + ", dateNum=" + dateNum + ", boardNum=" + boardNum + "]";
	}
}
