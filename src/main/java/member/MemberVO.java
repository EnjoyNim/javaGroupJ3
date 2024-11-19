package member;

public class MemberVO {
	// sql 과 같은 변수들
	private int idx;
	private String mid;
	private String pwd;
	private String nickName;
	private String name;
	private String gender;
	private String birthday;
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
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getUserDel() {
		return userDel;
	}
	public void setUserDel(String userDel) {
		this.userDel = userDel;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getVisitCnt() {
		return visitCnt;
	}
	public void setVisitCnt(int visitCnt) {
		this.visitCnt = visitCnt;
	}
	public int getTodayCnt() {
		return todayCnt;
	}
	public void setTodayCnt(int todayCnt) {
		this.todayCnt = todayCnt;
	}
	public String getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(String userInfo) {
		this.userInfo = userInfo;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getLastDate() {
		return lastDate;
	}
	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}
	public String getTempMid() {
		return tempMid;
	}
	public void setTempMid(String tempMid) {
		this.tempMid = tempMid;
	}
	public int getElapsedDays() {
		return elapsedDays;
	}
	public void setElapsedDays(int elapsedDays) {
		this.elapsedDays = elapsedDays;
	}
	public String getStrLevel() {
		return strLevel;
	}
	public void setStrLevel(String strLevel) {
		this.strLevel = strLevel;
	}
	
	
	@Override
	public String toString() {
		return "MemberVO [idx=" + idx + ", mid=" + mid + ", pwd=" + pwd + ", nickName=" + nickName + ", name=" + name
				+ ", gender=" + gender + ", birthday=" + birthday + ", tel=" + tel + ", address=" + address + ", email="
				+ email + ", level=" + level + ", userDel=" + userDel + ", point=" + point + ", visitCnt=" + visitCnt
				+ ", todayCnt=" + todayCnt + ", userInfo=" + userInfo + ", startDate=" + startDate + ", lastDate="
				+ lastDate + ", tempMid=" + tempMid + ", elapsedDays=" + elapsedDays + ", strLevel=" + strLevel + "]";
	}


		
	
}
