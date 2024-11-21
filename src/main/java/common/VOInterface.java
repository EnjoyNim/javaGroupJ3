package common;

public interface VOInterface {
	
	/* 어짜피 인터페이스의 메서드는 public abstract 이니 public 한정자를 그냥 두자. */
	// 참고로 인터페이스의 맴버 변수는 public static final 이다.
	public int getIdx();
	public void setIdx(int idx);
	public String getMid();
	public void setMid(String mid);
	public String getPwd();
	public void setPwd(String pwd);
	public String getNickName();
	public void setNickName(String nickName);
	public String getName();
	public void setName(String name) ;
	public String getTel();
	public void setTel(String tel);
	public String getAddress();
	public void setAddress(String address);
	public String getEmail() ;
	public void setEmail(String email);
	public int getLevel();
	public void setLevel(int level);
	public String getUserDel();
	public void setUserDel(String userDel);
	public int getPoint();
	public void setPoint(int point);
	public int getVisitCnt();
	public void setVisitCnt(int visitCnt);
	public int getTodayCnt();
	public void setTodayCnt(int todayCnt);
	public String getUserInfo();
	public void setUserInfo(String userInfo);
	public String getStartDate();
	public void setStartDate(String startDate);
	public String getLastDate();
	public void setLastDate(String lastDate);
	public String getTempMid();
	public void setTempMid(String tempMid);
	public int getElapsedDays() ;
	public void setElapsedDays(int elapsedDays);
	public String getStrLevel();
	public void setStrLevel(String strLevel);
	public String getStoreName();
	void setStoreName(String storeName);
}
