<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
				<h4 style="text-align:center">1. 샵 정보 입력 및 변경</h4>
 <table class="table table-hover text-center" style="width:100%; text-align:left">
		<tr><th>idx</th><td><input type="text" id="svo_idx" class="form-control" value="${svo.idx}" style="background-color:gray" readonly></td></tr>
		<tr><th>storeId</th><td><input type="text" id="svo_store_id" class="form-control" value="${svo.storeId}" style="background-color:gray" readonly></td></tr>
		<tr><th>storeName</th><td><input type="text" id="svo_store_name" class="form-control" value="${svo.storeName}"></td></tr>
		<tr><th>ownerName</th><td><input type="text" id="svo_owner_name" class="form-control" value="${svo.ownerName}"></td></tr>
		<tr><th>tel</th><td><input type="text" id="svo_tel" class="form-control" value="${svo.tel}"></td></tr>
		<tr><th>address</th><td><input type="text" id="svo_address" class="form-control" value="${svo.address}"></td></tr>
		<tr><th>email</th><td><input type="text" id="svo_email" class="form-control" value="${svo.email}"></td></tr>
		<tr><th>level</th><td><input type="text"  id="svo_level" class="form-control" value="${svo.level}"></td></tr>
		<tr><th>contractStartDate</th><td><input type="text" id="svo_contract_start_date" class="form-control" value="${svo.contractStartDate}"></td></tr>
		<tr><th>contractEndDate</th><td><input type="text" id="svo_contract_end_date" class="form-control" value="${svo.contractEndDate}"></td></tr>
		<tr><th>contractPrice</th><td><input type="number" id="svo_contract_price" class="form-control" value="${svo.contractPrice}"></td></tr>
		<tr><th>contactName</th><td><input type="text" id="svo_contact_name" class="form-control" value="${svo.contactName}"></td></tr>
		<tr><th>contactPhone</th><td><input type="text" id="svo_contact_phone" class="form-control" value="${svo.contactPhone}"></td></tr>
		<tr><th>contactTime</th><td><input type="text" id="svo_contact_time" class="form-control" value="${svo.contactTime}"></td></tr>
		<tr><th>inquiry</th><td><textarea rows="3" id="svo_inquiry" class="form-control">${svo.inquiry}</textarea></td></tr>
		<tr><th>appliedDate</th><td><input type="text" id="svo_applied_date" class="form-control" value="${svo.appliedDate}"  style="background-color:gray" readonly></td></tr>
											<!-- 콤보박스로 입점중, 취소됨, 신청, 작업중 중 하나로 설정하도록 해야할듯 -->
		<tr><th>process</th><td>
			<select id="svo_process" class="form-control">
				<c:if test="${svo.process=='신청'}"><option selected>신청</option></c:if>
				<c:if test="${svo.process!='신청'}"><option >신청</option></c:if>
				<c:if test="${svo.process=='입점중'}"><option selected>입점중</option></c:if>
				<c:if test="${svo.process!='입점중'}"><option >입점중</option></c:if>
				<c:if test="${svo.process=='취소됨'}"><option selected>취소됨</option></c:if>
				<c:if test="${svo.process!='취소됨'}"><option >취소됨</option></c:if>
				<c:if test="${svo.process=='작업중'}"><option selected>작업중</option></c:if>
				<c:if test="${svo.process!='작업중'}"><option >작업중</option></c:if>
				
			</select>
</table>

				<hr/><br/><br/><hr/>

				<h4 style="text-align:center">2. 샵 웹페이지 정보 입력</h4>
 <table style="width:100%" class="table table-hover text-center">
 
		<tr style="width:5%"><th>idx</th><td><input type="text" id="sprvo_idx" class="form-control" value="${sprVo.idx}" style="background-color:gray" readonly></td></tr>
		<tr><th>storeId</th><td><input type="text" id="sprvo_store_id" class="form-control" value="${svo.storeId}" style="background-color:gray" readonly></td></tr>
		<tr><th>storeName</th><td><input type="text" id="sprvo_store_name" class="form-control" value="${svo.storeName}"></td></tr>
		<tr><th>tel</th><td><input type="text" id="sprvo_tel" class="form-control" value="${sprVo.tel}"></td></tr>
		<tr><th>address</th><td><input type="text" id="sprvo_address" class="form-control" value="${sprVo.address}"></td></tr>
		<tr><th>email</th><td><input id="sprvo_email" type="text" class="form-control" value="${sprVo.email}"></td></tr>
		<tr><th>title</th><td><input type="text" id="sprvo_title" class="form-control" value="${sprVo.title}"></td></tr>
		<tr><th>heartCnt</th><td><input type="text" id="sprvo_heart_cnt" class="form-control" value="${sprVo.heartCnt}"></td></tr>
		<tr><th>reviewCnt</th><td><input type="text" id="sprvo_review_cnt" class="form-control" value="${sprVo.reviewCnt}"></td></tr>
		
						<!-- 파일선택 input -->
		<tr><th>storeMainPhoto</th><td><input class="form-control" type="file" id="sprvo_store_main_photo" value="${sprVo.storeMainPhoto}"></td></tr>
						    <!-- 여러파일선택가능 -->
		<tr><th>storePhoto</th><td><input class="form-control" type="file" id="sprvo_store_photo" value="${sprVo.storePhoto}" multiple></td></tr>
	
		
		<tr><th>courseInfo</th><td><input type="text" id="sprvo_course_info" class="form-control" value="${sprVo.courseInfo}"></td></tr>
		<tr><th>courseTitle</th><td><input type="text" id="sprvo_course_title" class="form-control" value="${sprVo.courseTitle}"></td></tr>
		<tr><th>courseItemTitle</th><td><input type="text" id="sprvo_course_item_title" class="form-control" value="${sprVo.courseItemTitle}"></td></tr>
		
		<tr><th>coursePrice</th><td><input type="text" id="sprvo_course_price" class="form-control" value="${sprVo.coursePrice}"></td></tr>
		<tr><th>courseItemInfo</th><td><input type="text" id="sprvo_course_item_info" class="form-control" value="${sprVo.courseItemInfo}"></td></tr>
		
		
		<tr><th>notice</th><td><textarea rows="3" id="sprvo_notice" class="form-control">${sprVo.notice}</textarea></td></tr>
		<tr><th>storeIntroduction</th><td><textarea rows="3" id="sprvo_store_introduction" class="form-control">${sprVo.storeIntroduction}</textarea></td></tr>
		
		
		<tr><th>businessHours</th><td><input type="text" id="sprvo_business_hours" class="form-control" value="${sprVo.businessHours}"></td></tr>
		<tr><th>workerInfo</th><td><input type="text" id="sprvo_worker_info" class="form-control" value="${sprVo.workerInfo}"></td></tr>
		<tr><th>usingProduct</th><td><input type="text" id="sprvo_using_product" class="form-control" value="${sprVo.usingProduct}"></td></tr>
		<tr><th>parkingInfo</th><td><input type="text" id="sprvo_parking_info" class="form-control" value="${sprVo.parkingInfo}"></td></tr>
		
		
		<tr><th>note</th><td><textarea rows="3" id="sprvo_note" class="form-control">${sprVo.note}</textarea></td></tr>
</table>

		<button type="button" onclick="backToParentPage()">적용</button>
		
<!-- 		////////////////////////// 레벨 넘버로 , 날짜 날짜인풋으로.. 그리고 메인페이지와 상세페이지를 읽어오는 부분하고 시간나면 채팅 구현 , 여기부터 하면 된다.  -->
		
		
		<script>
			function backToParentPage(){
				
				// 1. svoJsonObj 에 값 담기
				svoJsonObj.idx=document.getElementById("svo_idx").value;
				svoJsonObj.storeId=document.getElementById("svo_store_id").value;
				svoJsonObj.storeName=document.getElementById("svo_store_name").value;
				svoJsonObj.ownerName=document.getElementById("svo_owner_name").value;
				svoJsonObj.tel=document.getElementById("svo_tel").value;
				svoJsonObj.address=document.getElementById("svo_address").value;
				svoJsonObj.email=document.getElementById("svo_email").value;
				svoJsonObj.level=document.getElementById("svo_level").value;
				
				svoJsonObj.contractStartDate=document.getElementById("svo_contract_start_date").value;
				svoJsonObj.contractEndDate=document.getElementById("svo_contract_end_date").value;
				svoJsonObj.contractPrice=document.getElementById("svo_contract_price").value;
				
				svoJsonObj.contactName=document.getElementById("svo_contact_name").value;
				svoJsonObj.contactPhone=document.getElementById("svo_contact_phone").value;
				svoJsonObj.contactTime=document.getElementById("svo_contact_time").value;
				svoJsonObj.inquiry=document.getElementById("svo_inquiry").value;
				svoJsonObj.appliedDate=document.getElementById("svo_applied_date").value;
				
				
				let processCombo = document.getElementById("svo_process");
				let processVal = processCombo.options[processCombo.selectedIndex];
				
				svoJsonObj.process=processVal.value;
				
				voJsonArray.push(svoJsonObj);
				
				
				// 2. sprvoJsonObj 에 값 담기
				
   				sprvoJsonObj.idx =document.getElementById("sprvo_idx").value;
				sprvoJsonObj.storeId =document.getElementById("sprvo_store_id").value;
				sprvoJsonObj.storeName =document.getElementById("sprvo_store_name").value;
				sprvoJsonObj.tel =document.getElementById("sprvo_tel").value;
				sprvoJsonObj.address =document.getElementById("sprvo_address").value;
				sprvoJsonObj.email =document.getElementById("sprvo_email").value;
				sprvoJsonObj.title =document.getElementById("sprvo_title").value;
				sprvoJsonObj.heartCnt =document.getElementById("sprvo_heart_cnt").value;
				sprvoJsonObj.reviewCnt =document.getElementById("sprvo_review_cnt").value;
				
				
				sprvoJsonObj.storeMainPhoto =document.getElementById("sprvo_store_main_photo").value;
				sprvoJsonObj.storePhoto =document.getElementById("sprvo_store_photo").value;
 			
				
				sprvoJsonObj.courseInfo =document.getElementById("sprvo_course_info").value;
				sprvoJsonObj.courseTitle =document.getElementById("sprvo_course_title").value;
				sprvoJsonObj.courseItemTitle =document.getElementById("sprvo_course_item_title").value;
				
				sprvoJsonObj.coursePrice =document.getElementById("sprvo_course_price").value;
				sprvoJsonObj.courseItemInfo =document.getElementById("sprvo_course_item_info").value;
				
				
				sprvoJsonObj.notice =document.getElementById("sprvo_notice").value;
				sprvoJsonObj.storeIntroduction =document.getElementById("sprvo_store_introduction").value;
				sprvoJsonObj.businessHours =document.getElementById("sprvo_business_hours").value;
				sprvoJsonObj.workerInfo =document.getElementById("sprvo_worker_info").value;
				sprvoJsonObj.usingProduct =document.getElementById("sprvo_using_product").value;
				sprvoJsonObj.parkingInfo =document.getElementById("sprvo_parking_info").value;
				sprvoJsonObj.note =document.getElementById("sprvo_note").value; 
				
	
				
				
				voJsonArray.push(sprvoJsonObj);   
				
				// 본문 페이지에 있는 처리함수 호출
				closeModal();
			}
		
		</script>
																							










