<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="ctp" value="${pageContext.request.contextPath}"/>
				<h4 style="text-align:center">1. 샵 정보 입력 및 변경</h4>
 <table class="table table-hover text-center" style="width:100%; text-align:left">
		<tr><th>idx</th><td><input type="number" id="svo_idx" class="form-control" value="${svo.idx}" style="background-color:gray" readonly></td></tr>
		<tr><th>storeId</th><td><input type="text" id="svo_store_id" class="form-control" value="${svo.storeId}" style="background-color:gray" readonly></td></tr>
		<tr><th>storeName</th><td><input type="text" id="svo_store_name" class="form-control" value="${svo.storeName}"></td></tr>
		<tr><th>ownerName</th><td><input type="text" id="svo_owner_name" class="form-control" value="${svo.ownerName}"></td></tr>
		<tr><th>tel</th><td><input type="number" id="svo_tel" class="form-control" value="${svo.tel}"></td></tr>
		<tr><th>address</th><td><input type="text" id="svo_address" class="form-control" value="${svo.address}"></td></tr>
		<tr><th>email</th><td><input type="text" id="svo_email" class="form-control" value="${svo.email}"></td></tr>
		<tr><th>level</th><td><input type="number"  id="svo_level" class="form-control" value="${svo.level}"></td></tr>
		
		<tr>
            <th class="text-center">contractStartDate</th>
              <td>
                <input type="date" id="svo_contract_start_date" class="form-control" value="${fn:substring(svo.contractStartDate, 0, 10)}" />
            </td> 
        </tr>
		
		<tr>
            <th class="text-center">contractEndDate</th>
              <td>
                <input type="date" id="svo_contract_end_date" class="form-control" value="${fn:substring(svo.contractEndDate, 0, 10)}" />
            </td> 
        </tr>
		
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
 
		<tr style="width:5%"><th>idx</th><td><input type="number" id="sprvo_idx" class="form-control" value="${sprVo.idx}" style="background-color:gray" readonly></td></tr>
		<tr><th>storeId</th><td><input type="text" id="sprvo_store_id" class="form-control" value="${svo.storeId}" style="background-color:gray" readonly></td></tr>
		<tr><th>storeName</th><td><input type="text" id="sprvo_store_name" class="form-control" value="${svo.storeName}"></td></tr>
		<tr><th>tel</th><td><input type="number" id="sprvo_tel" class="form-control" value="${sprVo.tel}"></td></tr>
		<tr><th>address</th><td><input type="text" id="sprvo_address" class="form-control" value="${sprVo.address}"></td></tr>
		<tr><th>email</th><td><input type="text" id="sprvo_email" class="form-control" value="${sprVo.email}"></td></tr>
		<tr><th>title</th><td><input type="text" id="sprvo_title" class="form-control" value="${sprVo.title}"></td></tr>
		<tr><th>heartCnt</th><td><input type="number" id="sprvo_heart_cnt" class="form-control" value="${sprVo.heartCnt}"></td></tr>
		<tr><th>reviewCnt</th><td><input type="number" id="sprvo_review_cnt" class="form-control" value="${sprVo.reviewCnt}"></td></tr>
		
		<tr><th>discountRate</th><td><input type="number" id="sprvo_discount_rate" class="form-control" value="${sprVo.discountRate}"></td></tr>
		<tr><th>originalPrice</th><td><input type="number" id="sprvo_original_price" class="form-control" value="${sprVo.originalPrice}"></td></tr>
		
		
						<!-- 파일선택 input -->
		<tr><th>storeMainPhoto</th><td><input class="form-control" type="file" id="sprvo_store_main_photo" value="${sprVo.storeMainPhoto}"></td></tr>
		<tr><th class="imgDemo" style="display:flex;justify-content:center"></th><td><img src="${ctp}/images/photoView/${sprVo.storeMainPhoto}" alt="noimage" width="100px"></td></tr>

  						    <!-- 여러파일선택가능 -->
		<tr><th>storePhoto</th><td><input class="form-control" type="file" id="sprvo_store_photo" value="${sprVo.storePhoto}" multiple></td></tr>
							 <!-- 기존에 지정해둔 이미지가 있다면 여기에 표시해주도록 해야한다. -->
		<tr><th class="imgsDemo" style="display:flex;"></th></tr>
	
		
		<tr><th>courseInfo</th><td><input type="text" id="sprvo_course_info" class="form-control" value="${sprVo.courseInfo}"></td></tr>
		<tr><th>courseTitle</th><td><input type="text" id="sprvo_course_title" class="form-control" value="${sprVo.courseTitle}"></td></tr>
		<tr><th>courseItemTitle</th><td><input type="text" id="sprvo_course_item_title" class="form-control" value="${sprVo.courseItemTitle}"></td></tr>
		
		<tr><th>coursePrice</th><td><input type="number" id="sprvo_course_price" class="form-control" value="${sprVo.coursePrice}"></td></tr>
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
				sprvoJsonObj.discountRate =document.getElementById("sprvo_discount_rate").value;
				sprvoJsonObj.originalPrice =document.getElementById("sprvo_original_price").value;
				
				
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
	
				// 사진과 나머지 데이터가 두번의 ajax 로 별도로 가기때문에 사진만 가는 전역변수 form 에 storeId를 추가해줌, 서버에서는 request.getParam으로 받으면 됨
				form.append( "storeId", document.getElementById("svo_store_id").value);

				// 본문 페이지에 있는 처리함수 호출
				closeModal();
			}
			
			// 이미지 여러장 미리보기(하지만 한장만 미리보기용으로 수정해서 쓴다.)
			$(function(){
					// 이 태그에 변화가 올때 다음 콜백 함수를 호출해라. 콜백 함수 이름만 쓴다.
				$("#sprvo_store_main_photo").on("change", imageCheck);
			});
			
			
			function imageCheck(e){
				let files = e.target.files;
				
				// files 를 호출해서 자른후에 배열로 만들어서 리턴
				// prototype 은 특정 객체의 모든 속성을 갖고 있는 것을 말한다.
				let filesArr = Array.prototype.slice.call(files);
				
				filesArr.forEach(function(f){ // forEach 의 각 요소를 f 라 치고
					if(!f.type.match("image.*")){ // 모든 이미지파일
						alert("업로드할 파일은 이미지파일만 가능합니다.");
						return false;
					}
				});
				// 멀티파일 이미지 미리보기
				let i = e.target.files.length;
				// in 과 of 가 있음 in 는 다음에 인덱스 번호, of 는 다음에 파일명이 옴
				for(let image of e.target.files){
					// img 태그를 생성한다.
					let img = document.createElement('img');
					let reader = new FileReader();
					
					reader.onload = function(e){
						// 만들어진 img 태그에 src 속성을 추가하고 속성의 값도 넣는다.
						img.setAttribute("src", e.target.result);
						img.setAttribute("width", 100);
					}
					reader.readAsDataURL(e.target.files[--i]);
					// 본문에 생성한 form 전역변수에 사진파일정보를 담는다. 
					form.append( "mainPhoto", e.target.files[i] );
								// class 를 선택할때는 .  appendChild 는 기존것에 추가한다는 의미이다.
					document.querySelector(".imgDemo").appendChild(img);
					// 한장만 표시하고 빠져나가기
					break;
				}
			}
			
			
			// 이미지 여러장 미리보기
			$(function(){
					// 이 태그에 변화가 올때 다음 콜백 함수를 호출해라. 콜백 함수 이름만 쓴다.
				$("#sprvo_store_photo").on("change", multiImageCheck);
			});			
			
			function multiImageCheck(e){
				let files = e.target.files;
				
				// files 를 호출해서 자른후에 배열로 만들어서 리턴
				// prototype 은 특정 객체의 모든 속성을 갖고 있는 것을 말한다.
				let filesArr = Array.prototype.slice.call(files);
				
				filesArr.forEach(function(f){ // forEach 의 각 요소를 f 라 치고
					if(!f.type.match("image.*")){ // 모든 이미지파일
						alert("업로드할 파일은 이미지파일만 가능합니다.");
						return false;
					}
				});
				// 멀티파일 이미지 미리보기
				let i = e.target.files.length;
				// in 과 of 가 있음 in 는 다음에 인덱스 번호, of 는 다음에 파일명이 옴
				for(let image of e.target.files){
					// img 태그를 생성한다.
					let img = document.createElement('img');
					let reader = new FileReader();
					
					reader.onload = function(e){
						// 만들어진 img 태그에 src 속성을 추가하고 속성의 값도 넣는다.
						img.setAttribute("src", e.target.result);
						img.setAttribute("width", 100);
					}
					reader.readAsDataURL(e.target.files[--i]);
					// 본문에 생성한 form 전역변수에 숫자를 붙여서 사진파일정보를 담는다.
					// 같은 이름으로 하면 아무리 여러장을 담아도 마지막에 담은 것만 들어간다. 서버에서도 이렇게 각각 분리
					form.append( "photos"+i, e.target.files[i] );
								// class 를 선택할때는 .  appendChild 는 기존것에 추가한다는 의미이다.
					document.querySelector(".imgsDemo").appendChild(img);
				}
			}
		
		</script>
																							










