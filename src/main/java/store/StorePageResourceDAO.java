package store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

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



	public int updatePhoto(String storeId, String mainPhoto, String storePhoto) {
		int result = 0;
		try {
			
			sql = "update storePageResource set storeMainPhoto=?, storePhoto=? where storeId=?";
			pstmt = conn.prepareStatement(sql);
			
			if(mainPhoto==null || mainPhoto.equals("")) {
				pstmt.setString(1, "noimage.jpg");
			}else {
				pstmt.setString(1, mainPhoto);
			}
			
			if(storePhoto==null || storePhoto.equals("")) {
				pstmt.setString(2, "noimage.jpg");
			}else {
				pstmt.setString(2, storePhoto);
			}
			
			pstmt.setString(3, storeId);
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println(getClass() + " updatePhoto e :" + e.getMessage());
		} finally {
			pstmtClose();
		}
		return result;
	}
	
	
	public int insertStorePageResource(StorePageResourceVO vo) {
		int result = 0;
		try {
			sql = "insert into storePageResource values(default,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getStoreId());
			pstmt.setString(2, vo.getStoreName());
			pstmt.setString(3, vo.getTel());
			pstmt.setString(4, vo.getAddress());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getTitle());
			pstmt.setInt(7, vo.getHeartCnt());
			pstmt.setInt(8, vo.getReviewCnt());
			pstmt.setInt(9, vo.getDiscountRate());
			pstmt.setInt(10, vo.getOriginalPrice());
			pstmt.setString(11, vo.getStoreMainPhoto());
			pstmt.setString(12, vo.getStorePhoto());
			pstmt.setString(13, vo.getCourseInfo());
			pstmt.setString(14, vo.getCourseTitle());
			pstmt.setString(15, vo.getCourseItemTitle());
			pstmt.setString(16, vo.getCoursePrice());
			pstmt.setString(17, vo.getCourseItemInfo());
			pstmt.setString(18, vo.getNotice());
			pstmt.setString(19, vo.getStoreIntroduction());
			pstmt.setString(20, vo.getBusinessHours());
			pstmt.setString(21, vo.getWorkerInfo());
			pstmt.setString(22, vo.getUsingProduct());
			pstmt.setString(23, vo.getParkingInfo());
			pstmt.setString(24, vo.getNote());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println(getClass() + " insertStorePageResource e :" + e.getMessage());
		} finally {
			pstmtClose();
		}
		return result;
	}

	
	
	
	
	public boolean checkStorePageResourceByIdOrStoreName(String strToCheck, boolean isStoreIdCheck) {
	
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
				return true;
			}

		} catch (SQLException e) {
			System.out.println(getClass()+" checkStorePageResourceByIdOrStoreName e:" + e.getMessage());
		} finally {
			rsClose();
		}
		return false;
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
				vo.setDiscountRate(rs.getInt("discountRate"));
				vo.setOriginalPrice(rs.getInt("originalPrice"));
				
				int discountedPrice = (int)(vo.getOriginalPrice() * (100 - vo.getDiscountRate())/100.0);
				vo.setDiscountedPrice(discountedPrice);
				
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


	public int updateStorePageResource(StorePageResourceVO vo) {
		int result = 0;
		try {
			sql = "update storePageResource set storeName=?,tel=?,address=?,email=?,"
					+ "title=?,heartCnt=?,reviewCnt=?,discountRate=?,originalPrice=?,courseInfo=?,courseTitle=?,courseItemTitle=?,"
					+ "coursePrice=?,courseItemInfo=?,notice=?,storeIntroduction=?,businessHours=?,"
					+ "workerInfo=?,usingProduct=?,parkingInfo=?,note=? where storeId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getStoreName());
			pstmt.setString(2, vo.getTel());
			pstmt.setString(3, vo.getAddress());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getTitle());
			pstmt.setInt(6, vo.getHeartCnt());
			pstmt.setInt(7, vo.getReviewCnt());
			pstmt.setInt(8, vo.getDiscountRate());
			pstmt.setInt(9, vo.getOriginalPrice());
			pstmt.setString(10, vo.getCourseInfo());
			pstmt.setString(11, vo.getCourseTitle());
			pstmt.setString(12, vo.getCourseItemTitle());
			pstmt.setString(13, vo.getCoursePrice());
			pstmt.setString(14, vo.getCourseItemInfo());
			pstmt.setString(15, vo.getNotice());
			pstmt.setString(16, vo.getStoreIntroduction());
			pstmt.setString(17, vo.getBusinessHours());
			pstmt.setString(18, vo.getWorkerInfo());
			pstmt.setString(19, vo.getUsingProduct());
			pstmt.setString(20, vo.getParkingInfo());
			pstmt.setString(21, vo.getNote());
			
			pstmt.setString( 22, vo.getStoreId());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println(getClass() + " updateStorePageResource e :" + e.getMessage());
		} finally {
			pstmtClose();
		}
		return result;
	}

	public List<StorePageResourceVO> getStorePageResourceList() {
		// TODO Auto-generated method stub
		return null;
	}
}
