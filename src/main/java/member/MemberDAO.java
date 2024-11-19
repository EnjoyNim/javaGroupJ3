package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import common.GetConn;

public class MemberDAO {

	private Connection conn = GetConn.getInstance().getConnection();

	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";

	MemberVO vo = null;

	public void pstmtClose() {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
			}
		}
	}

	public void rsClose() {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
			} finally {
				pstmtClose();
			}
		}
	}

	
	
	/**
	 * member 테이블에서 아이디나 닉네임 체크, midCheck 가 true 이면 아이디검색, false 이면 닉네임검색
	 * 
	 * @param strToCheck : 체크해 볼 mid 또는 nickName
	 * @param isMidCheck : true 이면 mid, false 이면 nickName 을 체크해봄
	 * @return : 일치하는 레코드를 담은 MemberVO 객체, 없어도 비어있는 MemberVO 객체를 생성해서 보낸다. 따라서 null 리턴은 아니다.
	 */
	public MemberVO memberIdOrNickNameCheck(String strToCheck, boolean isMidCheck) {

		MemberVO vo = new MemberVO();

		try {

			if (isMidCheck) {
				sql = "select * from Member where mid=?";
			} else {
				sql = "select * from Member where nickName=?";
			}

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strToCheck);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setLevel(rs.getInt("level"));
				vo.setUserInfo(rs.getString("userInfo"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
			}

		} catch (SQLException e) {
			System.out.println("SQL 오류 :" + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	
	
	
	/**
	 * 
	 * @param idx
	 * @return 찾았으면 해당 회원 객체를 MemberVO에 담아서 리턴, 없으면 빈 vo 객체를 리턴 따라서 null 리턴은 없음
	 */
	public MemberVO getMemberByIdx(int idx) {

		MemberVO vo = new MemberVO();

		try {

			sql = "select * from Member where idx=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setLevel(rs.getInt("level"));
				vo.setUserInfo(rs.getString("userInfo"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
			}

		} catch (SQLException e) {
			System.out.println(getClass() +" getMemberByIdx e :" + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	
	// 방문 포인트 10씩 증가시켜주기
	public void setPointPlus(String mid) {
		try {
//			sql = "update set member point = point + 10 where mid = ?";
			sql = "update member set point = point + 10, visitCnt=visitCnt+1, todayCnt=todayCnt+1, lastDate=now() where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 :" + e.getMessage());
		} finally {
			pstmtClose();
		}

	}

	public int setMemberJoinOk(MemberVO vo) {
		int result = 0;
		try {
			sql = "insert into Member values(default,?,?,?,?,?,?,?,?,?,?,?,?,default,default,"
					+ "default,default,default,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getNickName());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getGender());
			pstmt.setString(6, vo.getBirthday());
			pstmt.setString(7, vo.getTel());
			pstmt.setString(8, vo.getAddress());
			pstmt.setString(9, vo.getEmail());
			pstmt.setString(12, vo.getUserInfo());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println(getClass() + " setMemberJoinOk e :" + e.getMessage());
		} finally {
			pstmtClose();
		}
		return result;
	}

	// 방문시 Update처리할 내용들 기술한다.
	public void setMemberInfoUpdate(MemberVO vo) {
		try {
			sql = "update member set point=?, visitCnt=visitCnt+1, todayCnt=?, lastDate=now() where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getPoint());
			pstmt.setInt(2, vo.getTodayCnt());
			pstmt.setString(3, vo.getMid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	
	
	public ArrayList<MemberVO> getMemberList() {

		ArrayList<MemberVO> vos = new ArrayList<>();
		MemberVO vo = null;

		try {
					// 탈퇴한 회원제외하고 모든 회원의 닉네임 내림차순 리스트 반환
			sql = "select * from Member where level !=99 order by nickName desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				vo = new MemberVO();
				
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				
				/*
				 * String content = rs.getString("content"); if(content!=null &&
				 * !content.equals("") && content.contains("\n")) { content =
				 * content.replace("\n", "<br/>"); } System.out.println("content:"+content);
				 * vo.setContent(content);
				 */
				
				vo.setLevel(rs.getInt("level"));
				vo.setUserInfo(rs.getString("userInfo"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				
				vos.add(vo);
			}

		} catch (SQLException e) {
			System.out.println(getClass()+" getMemberList 모두보기 e:" + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	
	// 방문시 Update처리할 내용들 기술한다.
	public void setMemberLevelUpdate(int idx, int level) {
		try {
			sql = "update member set level=? where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, level);
			pstmt.setInt(2, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(getClass()+" setMemberLevelUpdate e : " + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	
	// 회원 정보 수정
	public int setMemberUpdateOk(MemberVO vo) {

		int result = 0;
		
		try {
			sql ="update member set name=?, nickName=?, gender=?, birthday=?, tel=?, address=?, "
					+ "email=?, content=?, photo=?, userInfo=? where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getNickName());
			pstmt.setString(3, vo.getGender());
			pstmt.setString(4, vo.getBirthday());
			pstmt.setString(5, vo.getTel());
			pstmt.setString(6, vo.getAddress());
			pstmt.setString(7, vo.getEmail());
			pstmt.setString(10, vo.getUserInfo());
			pstmt.setString(11, vo.getMid());
			result = pstmt.executeUpdate();
;			
		} catch (SQLException e) {
			System.out.println(getClass()+" setMemberUpdateOk e : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return result;
	}

	public int setUpdatePwd(String mid, String pwd) {
		int result = 0;
		try {
			sql = "update member set pwd=? where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, mid);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(getClass()+" setUpdatePwd e : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return result;
	}

	// 회원 탈퇴 신청 처리(userDel의 'NO' -> 'OK' 변경처리)
	public int setMemberDeleteCheckOk(String mid) {
		int result = 0;
		try {
			sql = "update member set userDel='OK', level=99 where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(getClass()+" setMemberDeleteCheckOk e : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return result;
	}

	// 회원 등급 변경
	public int setMemberLevelChange(int level, int idx) {
		int result = 0;
		try {
			sql = "update member set level=? where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, level);
			pstmt.setInt(2, idx);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(getClass()+" setMemberLevelChange e : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return result;
	}
	
	// 회원의 총 인원수 구하기
	public int getTotRecCnt(int level) {
		int totRecCnt = 0;
		try {
			if(level==999) {
				sql = "select count(idx) as totRecCnt from member";
				pstmt = conn.prepareStatement(sql);
			}else {
				sql = "select count(idx) as totRecCnt from member where level=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, level);
			}
			rs = pstmt.executeQuery();
			
			rs.next();
			totRecCnt = rs.getInt("totRecCnt");
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}	finally {
			rsClose();
		}
		return totRecCnt;
	}

	
	/**
	 * 회원 리스트를 얻어온다.
	 * @param startIndexNo : 레벨에 맞는 레코드들 중 몇 번째부터 가져올지 시작 값
	 * @param recordCountToRetrieve : 몇개를 가져올지 개수 값
	 * @param level : 각 레벨에 맞는 회원들만, 999라면 전체리스트를 가져옴
	 * @return
	 */
	public ArrayList<MemberVO> getMemberList(int startIndexNo, int recordCountToRetrieve, int level) {

		ArrayList<MemberVO> vos = new ArrayList<>();

		MemberVO vo = null;

		try {
			if(level==999) {		
				// 이렇게 select 다음에 컴마로 구분해서 쿼리를 또 쓸 수 있다. datediff(a, b) 함수는 a - b 결과를 리턴한다.
				sql = "select *, datediff(now(), lastDate) as elapsedDays from Member order by idx desc limit ?, ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startIndexNo);
				pstmt.setInt(2, recordCountToRetrieve);
			}else { // 레벨별 회원리스트
				sql = "select *, datediff(now(), lastDate) as elapsedDays from Member where level=? order by idx desc limit ?, ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, level);
				pstmt.setInt(2, startIndexNo);
				pstmt.setInt(3, recordCountToRetrieve);
			}
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				vo = new MemberVO();
				
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setLevel(rs.getInt("level"));
				vo.setUserInfo(rs.getString("userInfo"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setElapsedDays(rs.getInt("elapsedDays"));
				vos.add(vo);
				
			}

		} catch (SQLException e) {
			System.out.println(getClass()+" getMemberList e:" + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	public int deleteMember(String mid) {
		int result = 0;
		try {
			sql = "delete from member where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(getClass()+" deleteMember e : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return result;
		
	}

	
	// 매개변수 mid 를 포함하는 모든 레코드 리턴
		public ArrayList<MemberVO> getMemberListById(String mid) {

			ArrayList<MemberVO> vos = new ArrayList<>();
			MemberVO vo = null;

			try {
						// 탈퇴한 회원제외하고 모든 회원의 닉네임 내림차순 리스트 반환
				sql = "select * from Member where level !=99 and mid like ? order by nickName desc";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+mid+"%");
				rs = pstmt.executeQuery();

				while (rs.next()) {
					
					vo = new MemberVO();
					
					vo.setIdx(rs.getInt("idx"));
					vo.setMid(rs.getString("mid"));
					vo.setPwd(rs.getString("pwd"));
					vo.setNickName(rs.getString("nickName"));
					vo.setName(rs.getString("name"));
					vo.setGender(rs.getString("gender"));
					vo.setBirthday(rs.getString("birthday"));
					vo.setTel(rs.getString("tel"));
					vo.setAddress(rs.getString("address"));
					vo.setEmail(rs.getString("email"));
					
					/*
					 * String content = rs.getString("content"); if(content!=null &&
					 * !content.equals("") && content.contains("\n")) { content =
					 * content.replace("\n", "<br/>"); } System.out.println("content:"+content);
					 * vo.setContent(content);
					 */
					
					vo.setLevel(rs.getInt("level"));
					vo.setUserInfo(rs.getString("userInfo"));
					vo.setUserDel(rs.getString("userDel"));
					vo.setPoint(rs.getInt("point"));
					vo.setVisitCnt(rs.getInt("visitCnt"));
					vo.setTodayCnt(rs.getInt("todayCnt"));
					vo.setStartDate(rs.getString("startDate"));
					vo.setLastDate(rs.getString("lastDate"));
					
					vos.add(vo);
				}

			} catch (SQLException e) {
				System.out.println(getClass()+" getMemberListById e:" + e.getMessage());
			} finally {
				rsClose();
			}
			return vos;
		}

	
	/*
	 * // Member 테이블에서 아이디 검색하기 public MemberVO memberNickNameCheck(String nickName)
	 * {
	 * 
	 * MemberVO vo = new MemberVO();
	 * 
	 * try {
	 * 
	 * sql = "select * from Member where nickName=?"; pstmt =
	 * conn.prepareStatement(sql); pstmt.setString(1, nickName); rs =
	 * pstmt.executeQuery();
	 * 
	 * if (rs.next()) {
	 * 
	 * vo.setIdx(rs.getInt("idx")); vo.setPwd(rs.getString("pwd"));
	 * vo.setNickName(rs.getString("nickName")); vo.setName(rs.getString("name"));
	 * vo.setGender(rs.getString("gender"));
	 * vo.setBirthday(rs.getString("birthday")); vo.setTel(rs.getString("tel"));
	 * vo.setAddress(rs.getString("address")); vo.setEmail(rs.getString("email"));
	 * vo.setContent(rs.getString("content")); vo.setPhoto(rs.getString("photo"));
	 * vo.setLevel(rs.getInt("level")); vo.setUserInfo(rs.getString("userInfo"));
	 * vo.setUserDel(rs.getString("userDel")); vo.setPoint(rs.getInt("point"));
	 * vo.setVisitCnt(rs.getInt("visitCnt")); vo.setTodayCnt(rs.getInt("todayCnt"));
	 * vo.setStartDate(rs.getString("startDate"));
	 * vo.setLastDate(rs.getString("lastDate")); }
	 * 
	 * } catch (SQLException e) { System.out.println("memberNickNameCheck e :" +
	 * e.getMessage()); } finally { rsClose(); } return vo; }
	 */

}
