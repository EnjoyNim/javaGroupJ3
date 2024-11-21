package store;

import common.VOInterface;

public class StoreVO implements VOInterface{
	// sql 과 같은 변수들
	private int idx;
	private String mid;
	private String pwd;
	private String nickName;
	private String storeName;
	private String name;
	private String tel;
	private String address;
	private String email;
	private int level;
	private String userDel;
	private int point;
	private int visitCnt;
	private int todayCnt;
	private String userInfo;
	private String startDate;
	private String lastDate;
	
	// 프로그램 중간에서 사용한 변수들
	private String tempMid; // 아이디 중복체크를 위한 임시 아이디
	private int elapsedDays; // 최종 접속 경과일(탈퇴시 사용)
	private String strLevel; // 회원등급명
	
	@Override
	public int getIdx() {
		return idx;
	}
	@Override
	public void setIdx(int idx) {
		this.idx = idx;
	}
	@Override
	public String getMid() {
		return mid;
	}
	@Override
	public void setMid(String mid) {
		this.mid = mid;
	}
	@Override
	public String getPwd() {
		return pwd;
	}
	@Override
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	@Override
	public String getNickName() {
		return nickName;
	}
	@Override
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	@Override
	public String getName() {
		return name;
	}
	@Override
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String getTel() {
		return tel;
	}
	@Override
	public void setTel(String tel) {
		this.tel = tel;
	}
	@Override
	public String getAddress() {
		return address;
	}
	@Override
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String getEmail() {
		return email;
	}
	@Override
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public int getLevel() {
		return level;
	}
	@Override
	public void setLevel(int level) {
		this.level = level;
	}
	@Override
	public String getUserDel() {
		return userDel;
	}
	@Override
	public void setUserDel(String userDel) {
		this.userDel = userDel;
	}
	@Override
	public int getPoint() {
		return point;
	}
	@Override
	public void setPoint(int point) {
		this.point = point;
	}
	@Override
	public int getVisitCnt() {
		return visitCnt;
	}
	@Override
	public void setVisitCnt(int visitCnt) {
		this.visitCnt = visitCnt;
	}
	@Override
	public int getTodayCnt() {
		return todayCnt;
	}
	@Override
	public void setTodayCnt(int todayCnt) {
		this.todayCnt = todayCnt;
	}
	@Override
	public String getUserInfo() {
		return userInfo;
	}
	@Override
	public void setUserInfo(String userInfo) {
		this.userInfo = userInfo;
	}
	@Override
	public String getStartDate() {
		return startDate;
	}
	@Override
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	@Override
	public String getLastDate() {
		return lastDate;
	}
	@Override
	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}
	@Override
	public String getTempMid() {
		return tempMid;
	}
	@Override
	public void setTempMid(String tempMid) {
		this.tempMid = tempMid;
	}
	@Override
	public int getElapsedDays() {
		return elapsedDays;
	}
	@Override
	public void setElapsedDays(int elapsedDays) {
		this.elapsedDays = elapsedDays;
	}
	@Override
	public String getStrLevel() {
		return strLevel;
	}
	@Override
	public void setStrLevel(String strLevel) {
		this.strLevel = strLevel;
	}
	@Override
	public String getStoreName() {
		return storeName;
	}
	@Override
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	
	
	@Override
	public String toString() {
		return "MemberVO [idx=" + idx + ", mid=" + mid + ", pwd=" + pwd + ", nickName=" + nickName + ", storeName="
				+ storeName + ", name=" + name + ", tel=" + tel + ", address=" + address + ", email=" + email
				+ ", level=" + level + ", userDel=" + userDel + ", point=" + point + ", visitCnt=" + visitCnt
				+ ", todayCnt=" + todayCnt + ", userInfo=" + userInfo + ", startDate=" + startDate + ", lastDate="
				+ lastDate + ", tempMid=" + tempMid + ", elapsedDays=" + elapsedDays + ", strLevel=" + strLevel + "]";
	}
	
	
}
