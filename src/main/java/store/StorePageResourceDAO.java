package store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import common.GetConn;

public class StorePageResourceDAO {

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



	
	
	public int insertStorePageResource(StorePageResourceVO vo) {
		int result = 0;
		try {
			sql = "insert into storePageResource values(default,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getStoreId());
			pstmt.setString(2, vo.getStoreName());
			pstmt.setString(3, vo.getTel());
			pstmt.setString(4, vo.getAddress());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getTitle());
			pstmt.setInt(7, vo.getHeartCnt());
			pstmt.setInt(8, vo.getReviewCnt());
			pstmt.setString(9, vo.getStoreMainPhoto());
			pstmt.setString(10, vo.getStorePhoto());
			pstmt.setString(11, vo.getCourseInfo());
			pstmt.setString(12, vo.getCourseTitle());
			pstmt.setString(13, vo.getCourseItemTitle());
			pstmt.setString(14, vo.getCoursePrice());
			pstmt.setString(15, vo.getCourseItemInfo());
			pstmt.setString(16, vo.getNotice());
			pstmt.setString(17, vo.getStoreIntroduction());
			pstmt.setString(18, vo.getBusinessHours());
			pstmt.setString(19, vo.getWorkerInfo());
			pstmt.setString(20, vo.getUsingProduct());
			pstmt.setString(21, vo.getNote());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println(getClass() + " insertStorePageResource e :" + e.getMessage());
		} finally {
			pstmtClose();
		}
		return result;
	}

	
	
	
	/**
	 * storePageResource 테이블에서 아이디나 닉네임 체크, isStoreIdCheck 가 true 이면 storeId검색, false 이면 storeName 검색
	 * 
	 * @param strToCheck : 체크해 볼 storeId 또는 storeName
	 * @param isStoreIdCheck : true 이면 storeId, false 이면 storeName 을 체크해봄
	 * @return : 일치하는 레코드를 담은 StoreVO 객체, 없어도 비어있는 StoreVO 객체를 생성해서 보낸다. 따라서 null 리턴은 아니다.
	 */
	public StorePageResourceVO getStorePageResourceByIdOrStoreName(String strToCheck, boolean isStoreIdCheck) {

		StorePageResourceVO vo = new StorePageResourceVO();

		try {

			if (isStoreIdCheck) {
				sql = "select * from storePageResource where storeId=?";
			} else {
				sql = "select * from storePageResource where storeName=?";
			}

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strToCheck);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setStoreId(rs.getString("storeId"));
				vo.setStoreName(rs.getString("storeName"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setTitle(rs.getString("title"));
				vo.setHeartCnt(rs.getInt("heartCnt"));
				vo.setReviewCnt(rs.getInt("reviewCnt"));
				vo.setStoreMainPhoto(rs.getString("storeMainPhoto"));
				vo.setStorePhoto(rs.getString("storePhoto"));
				vo.setCourseInfo(rs.getString("courseInfo"));
				vo.setCourseTitle(rs.getString("courseTitle"));
				vo.setCourseItemTitle(rs.getString("courseItemTitle"));
				vo.setCoursePrice(rs.getString("coursePrice"));
				vo.setCourseItemInfo(rs.getString("courseItemInfo"));
				vo.setNotice(rs.getString("notice"));
				vo.setStoreIntroduction(rs.getString("storeIntroduction"));
				vo.setBusinessHours(rs.getString("businessHours"));
				vo.setWorkerInfo(rs.getString("workerInfo"));
				vo.setUsingProduct(rs.getString("usingProduct"));
				vo.setParkingInfo(rs.getString("parkingInfo"));
				vo.setNote(rs.getString("note"));
			}

		} catch (SQLException e) {
			System.out.println(getClass()+" getStorePageResourceByIdOrStoreName e:" + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	
	
	// storePageResource 테이블의 총 레코드 수 구하기
	public int getTotRecCnt() {
		int totRecCnt = 0;
		try {

			sql = "select count(idx) as totRecCnt from storePageResource";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			rs.next();
			totRecCnt = rs.getInt("totRecCnt");
		} catch (SQLException e) {
			System.out.println(getClass()+" getTotRecCnt e : " + e.getMessage());
		} finally {
			rsClose();
		}
		return totRecCnt;
	}

}
