package store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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



	// 여기부터해야한다. storePageResource 에 insert 하고 아래에 select 하는 부분 완성하고
	//https://velog.io/@teon98/ajax%EB%A1%9C-%EB%AA%A8%EB%8B%AC%EC%B0%BD%EC%97%90-%EC%83%81%EC%84%B8%EA%B2%B0%EA%B3%BC-%EB%9D%84%EC%9A%B0%EA%B8%B0-with-jsp
	//위 페이지 참고해서 admin 에 addAlliance.jsp 를 만들고 그 페이지를 adminMain.jsp 안에 모달에 결과로써 넣어줘야함.
	// 그리고 모달안의 테이블에서 입점상점의 정보와 페이지작성에 필요한 정보를 입력받고 그걸 다시 디비에 업데이트...등 종이게 적어놨다.
	
	// 제휴신청폼에 정보를 allianceStores 테이블에 insert 한다. 이때는 몇몇 필드는 default 로 남겨둔다.
	// 나중에 관리자가 신청한 내역을 보고 따로 연락하여 나머지 구체적인 정보를 입점처리할때 따로 입력한다.
	public int insertStorePageResource(StorePageResourceVO vo) {
		int result = 0;
		try {
			sql = "insert into storePageResource values(default,?,?,?,default,default,default,default,"
					+ "default,default,default,default,?,?,?,?, default, default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getStoreId());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println(getClass() + " insertStorePageResource e :" + e.getMessage());
		} finally {
			pstmtClose();
		}
		return result;
	}

	
	
	
	/**
	 * allianceStores 테이블에서 아이디나 닉네임 체크, isStoreIdCheck 가 true 이면 storeId검색, false 이면 storeName 검색
	 * 
	 * @param strToCheck : 체크해 볼 storeId 또는 storeName
	 * @param isStoreIdCheck : true 이면 storeId, false 이면 storeName 을 체크해봄
	 * @return : 일치하는 레코드를 담은 StoreVO 객체, 없어도 비어있는 StoreVO 객체를 생성해서 보낸다. 따라서 null 리턴은 아니다.
	 */
	public StoreVO getStorePageResourceByIdOrStoreName(String strToCheck, boolean isStoreIdCheck) {

		StoreVO vo = new StoreVO();

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
				vo.setPwd(rs.getString("pwd"));
				vo.setStoreName(rs.getString("storeName"));
				vo.setOwnerName(rs.getString("ownerName"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setLevel(rs.getInt("level"));
				vo.setContractStartDate(rs.getString("contractStartDate"));
				vo.setContractEndDate(rs.getString("contractEndDate"));
				vo.setContractPrice(rs.getInt("contractPrice"));
				vo.setContactName(rs.getString("contactName"));
				vo.setContactPhone(rs.getString("contactPhone"));
				vo.setContactTime(rs.getString("contactTime"));
				vo.setInquiry(rs.getString("inquiry"));
				vo.setAppliedDate(rs.getString("appliedDate"));
				vo.setProcess(rs.getString("process"));
			}

		} catch (SQLException e) {
			System.out.println(getClass()+" getStoreByIdOrStoreName e:" + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	
	// allianceStores 테이블의 총 레코드 수 구하기
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
	
	
	
	/**
	 * allianceStores 테이블에서 limit 으로  특정 개수만큼 레코드 가져오기
	 * 
	 * @param startIndexNo          : 가져올 시작 인덱스(zero-based)
	 * @param recordCountToRetrieve : 가져올 레코드 개수
	 * @return List<StoreVO>
	 */
	public List<StoreVO> getAllianceStoreList(int startIndexNo, int pageSize) {
		List<StoreVO> vos = new ArrayList<StoreVO>();
		try {
			// datediff함수는 인수1 - 인수2 결과를 day 로 리턴, timestampdiff 함수는 인수2 - 인수3 의 차이를 hour로
			// 리턴
			sql = "select * from storePageResource order by idx desc limit ?,?";
			// subQuery 를 이용해서 게시판의 리스트를 가져오고 각 게시글들에 달린 댓글 수도 가져온다.
			// b.idx 는 from 절에 board 를 지칭한 b 이다. 섭쿼리를 사용할때는 이렇게 테이블에 다른 명칭을 줘야 하는듯?

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo = new StoreVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setStoreId(rs.getString("storeId"));
				vo.setPwd(rs.getString("pwd"));
				vo.setStoreName(rs.getString("storeName"));
				vo.setOwnerName(rs.getString("ownerName"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setLevel(rs.getInt("level"));
				vo.setContractStartDate(rs.getString("contractStartDate"));
				vo.setContractEndDate(rs.getString("contractEndDate"));
				vo.setContractPrice(rs.getInt("contractPrice"));
				vo.setContactName(rs.getString("contactName"));
				vo.setContactPhone(rs.getString("contactPhone"));
				vo.setContactTime(rs.getString("contactTime"));
				
				String inquiry = rs.getString("inquiry").replaceAll("\\r?\\n", "<br/>");
				inquiry = inquiry.replace("'", "&#39;").replace("\"", "&#39;");
				vo.setInquiry(inquiry);
				
				vo.setAppliedDate(rs.getString("appliedDate"));
				vo.setProcess(rs.getString("process"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println( getClass()+" getAllianceStoreList e : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
}
