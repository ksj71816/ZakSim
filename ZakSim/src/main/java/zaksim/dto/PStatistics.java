package zaksim.dto;

import java.util.Date;

public class PStatistics {
	
	private Date today;
	private int endChal;
	private int failChal;
	private int money;	
	private int failMoney;
	
	private int successChal;
	private int ingChal;
	
	
	public Date getToday() {
		return today;
	}
	
	public void setToday(Date today) {
		this.today = today;
	}
	
	public int getEndChal() {
		return endChal;
	}
	
	public void setEndChal(int endChal) {
		this.endChal = endChal;
	}
	
	public int getFailChal() {
		return failChal;
	}
	
	public void setFailChal(int failChal) {
		this.failChal = failChal;
	}
	
	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public int getFailMoney() {
		return failMoney;
	}

	public void setFailMoney(int failMoney) {
		this.failMoney = failMoney;
	}

	public int getSuccessChal() {
		return successChal;
	}

	public void setSuccessChal(int successChal) {
		this.successChal = successChal;
	}

	public int getIngChal() {
		return ingChal;
	}

	public void setIngChal(int ingChal) {
		this.ingChal = ingChal;
	}

	@Override
	public String toString() {
		return "PStatistics [today=" + today + ", endChal=" + endChal + ", failChal=" + failChal + ", money=" + money
				+ ", failMoney=" + failMoney + ", successChal=" + successChal + ", ingChal=" + ingChal + "]";
	}

}
