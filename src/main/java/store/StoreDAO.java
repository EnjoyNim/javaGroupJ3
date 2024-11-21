package store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import common.GetConn;

public class StoreDAO {

	private Connection conn = GetConn.getInstance().getConnection();

	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";

	StoreVO vo = null;

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



	// store 테이블에 업체로 회원가입한 업소의 정보를 insert 한다.
	public int setStoreJoinOk(StoreVO vo) {
		int result = 0;
		try {
			sql = "insert into store values(default,?,?,?,?,?,?,?,default,default,"
					+ "default,default,default,default,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getStoreName());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getTel());
			pstmt.setString(6, vo.getAddress());
			pstmt.setString(7, vo.getEmail());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println(getClass() + " setStoreJoinOk e :" + e.getMessage());
		} finally {
			pstmtClose();
		}
		return result;
	}

	
	
	
	/**
	 * member 테이블에서 아이디나 닉네임 체크, midCheck 가 true 이면 아이디검색, false 이면 닉네임검색
	 * 
	 * @param strToCheck : 체크해 볼 mid 또는 storeName
	 * @param isMidCheck : true 이면 mid, false 이면 storeName 을 체크해봄
	 * @return : 일치하는 레코드를 담은 StoreVO 객체, 없어도 비어있는 StoreVO 객체를 생성해서 보낸다. 따라서 null 리턴은 아니다.
	 */
	public StoreVO getStoreByIdOrStoreName(String strToCheck, boolean isMidCheck) {

		StoreVO vo = new StoreVO();

		try {

			if (isMidCheck) {
				sql = "select * from store where mid=?";
			} else {
				sql = "select * from store where storeName=?";
			}

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strToCheck);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setStoreName(rs.getString("storeName"));
				vo.setName(rs.getString("name"));
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
			System.out.println(getClass()+" getStoreByIdOrStoreName e:" + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	
}
