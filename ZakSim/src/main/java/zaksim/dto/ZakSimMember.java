package zaksim.dto;

import java.util.Date;

public class ZakSimMember {
	
	private int reportNum;
	
	private int rnum;
	
	private int idx;
	private String memberType;
	private String id;
	private String password;
	private String nick;
	private String name;
	private String email;
	private String phone;
	private Date joinDate;
	private String status;				// 계정 정지 / 정상
	private Date suspensionDate;	// 계정 정지 처분 날짜
	private int suspendNum;
	private Date leaveDate;
	
	
	
	public int getReportNum() {
		return reportNum;
	}
	
	public void setReportNum(int reportNum) {
		this.reportNum = reportNum;
	}
	
	public int getRnum() {
		return rnum;
	}
	
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	
	public int getIdx() {
		return idx;
	}
	
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	public String getMemberType() {
		return memberType;
	}
	
	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getNick() {
		return nick;
	}
	
	public void setNick(String nick) {
		this.nick = nick;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public Date getJoinDate() {
		return joinDate;
	}
	
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public Date getSuspensionDate() {
		return suspensionDate;
	}
	
	public void setSuspensionDate(Date suspensionDate) {
		this.suspensionDate = suspensionDate;
	}
	
	public int getSuspendNum() {
		return suspendNum;
	}
	
	public void setSuspendNum(int suspendNum) {
		this.suspendNum = suspendNum;
	}
	
	public Date getLeaveDate() {
		return leaveDate;
	}
	
	public void setLeaveDate(Date leaveDate) {
		this.leaveDate = leaveDate;
	}
	
	@Override
	public String toString() {
		return "ZakSimMember [reportNum=" + reportNum + ", rnum=" + rnum + ", idx=" + idx + ", memberType=" + memberType
				+ ", id=" + id + ", password=" + password + ", nick=" + nick + ", name=" + name + ", email=" + email
				+ ", phone=" + phone + ", joinDate=" + joinDate + ", status=" + status + ", suspensionDate="
				+ suspensionDate + ", suspendNum=" + suspendNum + ", leaveDate=" + leaveDate + "]";
	}
}
