package zaksim.dto;

import java.util.Date;

public class Payment {
	
	private int pRnum;
	
	private String impUid;
	private int merchantUid;
	private int buyerIdx;
	private int challengeIdx;
	private int price;
	private Date paidAt;
	private String status;
	private String paymentOption;
	
	private int certificationRate;	// 인증률
	

	private ZakSimMember zakSimMember;
	private Challenge challenge;

	
	
	public int getCertificationRate() {
		return certificationRate;
	}

	public void setCertificationRate(int certificationRate) {
		this.certificationRate = certificationRate;
	}
	
	public Challenge getChallenge() {
		return challenge;
	}

	public void setChallenge(Challenge challenge) {
		this.challenge = challenge;
	}

	public int getpRnum() {
		return pRnum;
	}

	public void setPrnum(int pRnum) {
		this.pRnum = pRnum;
	}
	
	public String getImpUid() {
		return impUid;
	}

	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}

	public int getMerchantUid() {
		return merchantUid;
	}

	public void setMerchantUid(int merchantUid) {
		this.merchantUid = merchantUid;
	}

	public int getBuyerIdx() {
		return buyerIdx;
	}

	public void setBuyerIdx(int buyerIdx) {
		this.buyerIdx = buyerIdx;
	}

	public int getChallengeIdx() {
		return challengeIdx;
	}

	public void setChallengeIdx(int challengeIdx) {
		this.challengeIdx = challengeIdx;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getPaidAt() {
		return paidAt;
	}

	public void setPaidAt(Date paidAt) {
		this.paidAt = paidAt;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPaymentOption() {
		return paymentOption;
	}

	public void setPaymentOption(String paymentOption) {
		this.paymentOption = paymentOption;
	}

	public ZakSimMember getZakSimMember() {
		return zakSimMember;
	}
 
	public void setZakSimMember(ZakSimMember zakSimMember) {
		this.zakSimMember = zakSimMember;
	}

	@Override
	public String toString() {
		return "Payment [pRnum=" + pRnum + ", impUid=" + impUid + ", merchantUid=" + merchantUid + ", buyerIdx="
				+ buyerIdx + ", challengeIdx=" + challengeIdx + ", price=" + price + ", paidAt=" + paidAt + ", status="
				+ status + ", paymentOption=" + paymentOption + ", certificationRate=" + certificationRate 
				+ ", zakSimMember=" + zakSimMember + ", challenge="	+ challenge + "]";
	}
	
}
