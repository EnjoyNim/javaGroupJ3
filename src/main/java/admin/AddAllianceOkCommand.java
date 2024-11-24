package admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import store.StoreDAO;
import store.StorePageResourceDAO;
import store.StorePageResourceVO;
import store.StoreVO;

public class AddAllianceOkCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String result = "";

		String data = request.getParameter("voJsonArray");

		
		int result1 = 0; 
		int result2 = 0;
		
		 try { 

			JSONParser jsonParser = new JSONParser();
			// 브라우저에서 JSONArray 로 보냈으면 여기서도 JSONArray 로 형변환해야한다. JSONObject 로 보냈으면 그냥 바로 JsonObject.get("ownerName") 이렇게 접근하면 됨
			JSONArray jsonArray = (JSONArray) jsonParser.parse(data);
			

			for (int i = 0; i < jsonArray.size(); i++) {
				JSONObject voJsonObject = (JSONObject) jsonArray.get(i);
				
				if (i == 0) {
					
					StoreVO svo = new StoreVO();
					svo.setIdx(Integer.parseInt(voJsonObject.get("idx").toString()));
					svo.setStoreId(voJsonObject.get("storeId").toString());
					svo.setStoreName(voJsonObject.get("storeName").toString());
					svo.setOwnerName(voJsonObject.get("ownerName").toString());
					svo.setTel(voJsonObject.get("tel").toString());
					svo.setAddress(voJsonObject.get("address").toString());
					svo.setEmail(voJsonObject.get("email").toString());
					svo.setLevel(Integer.parseInt(voJsonObject.get("level").toString()));
					svo.setContractStartDate(voJsonObject.get("contractStartDate").toString());
					svo.setContractEndDate(voJsonObject.get("contractEndDate").toString());
					svo.setContractPrice(Integer.parseInt(voJsonObject.get("contractPrice").toString()));
					svo.setContactName(voJsonObject.get("contactName").toString());
					svo.setContactPhone(voJsonObject.get("contactPhone").toString());
					svo.setContactTime(voJsonObject.get("contactTime").toString());
					svo.setInquiry(voJsonObject.get("inquiry").toString());
					svo.setAppliedDate(voJsonObject.get("appliedDate").toString());
					svo.setProcess(voJsonObject.get("process").toString());
					StoreDAO sDao = new StoreDAO();
					result1 = sDao.updateStoreInfo(svo);
					
				} else {
					
					StorePageResourceVO sprVo = new StorePageResourceVO();
					sprVo.setIdx(Integer.parseInt(voJsonObject.get("idx").toString()));
					sprVo.setStoreId(voJsonObject.get("storeId").toString());
					sprVo.setStoreName(voJsonObject.get("storeName").toString());
					sprVo.setTel(voJsonObject.get("tel").toString());
					sprVo.setAddress(voJsonObject.get("address").toString());
					sprVo.setEmail(voJsonObject.get("email").toString());
					sprVo.setTitle(voJsonObject.get("title").toString());
					
					sprVo.setHeartCnt(Integer.parseInt(voJsonObject.get("heartCnt").toString()));
					sprVo.setReviewCnt(Integer.parseInt(voJsonObject.get("reviewCnt").toString()));
					sprVo.setDiscountRate(Integer.parseInt(voJsonObject.get("discountRate").toString()));
					sprVo.setOriginalPrice(Integer.parseInt(voJsonObject.get("originalPrice").toString()));
					
					// 사진은 addAllianceOkPhotoAjax.java 에서 처리한다.
					sprVo.setStoreMainPhoto("noimage.jpg");
					sprVo.setStorePhoto("noimage.jpg");
					 
					
					sprVo.setCourseInfo(voJsonObject.get("courseInfo").toString());
					sprVo.setCourseTitle(voJsonObject.get("courseTitle").toString());
					sprVo.setCourseItemTitle(voJsonObject.get("courseItemTitle").toString());
					sprVo.setCoursePrice(voJsonObject.get("coursePrice").toString());
					sprVo.setCourseItemInfo(voJsonObject.get("courseItemInfo").toString());
					sprVo.setNotice(voJsonObject.get("notice").toString());
					sprVo.setStoreIntroduction(voJsonObject.get("storeIntroduction").toString());
					sprVo.setBusinessHours(voJsonObject.get("businessHours").toString());
					sprVo.setWorkerInfo(voJsonObject.get("workerInfo").toString());
					sprVo.setUsingProduct(voJsonObject.get("usingProduct").toString());
					sprVo.setParkingInfo(voJsonObject.get("parkingInfo").toString());
					sprVo.setNote(voJsonObject.get("note").toString());
					
					StorePageResourceDAO sprDao = new StorePageResourceDAO();
				
					boolean exist = sprDao.checkStorePageResourceByIdOrStoreName(sprVo.getStoreId(), true);
					if(exist) { // 이미 있는거면 업데이트
						result2 = sprDao.updateStorePageResource(sprVo);
					}else { // 없다면 새로 insert
						result2 = sprDao.insertStorePageResource(sprVo);
					}
				}
			}
			
			result = "ok";
			
			if(result1==0||result2==0) {
				result = "fail";
			}
		} catch (ParseException e) {
			System.out.println(getClass() + " execute e:" + e.getMessage());
			result = "fail";
		}
		 
		// 리스판스로 값만을 보낸다.
		response.getWriter().write(result);

	
	}
}
