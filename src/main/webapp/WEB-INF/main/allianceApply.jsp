<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--       header.jsp 파일에 ctp 관련 코드가 똑같이 들어가있지만 여기서도 추가해줘야만 제대로 이미지들에 접근을 한다.
           header.jsp 를 include 할때 body 영역에 jsp 사용관련 선언들이 들어가는데 아마도 그게 제대로 역할을 안하는듯하다. -->
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <!-- jQuery 와 ajax 사용을 위한 cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<title>allianceApply.jsp</title>
<style>
    /* 페이지의 전반적인 스타일 설정 */
    body {
        font-family: Arial, sans-serif; /* 기본 폰트 설정 */
        margin: 0; /* 기본 마진 제거 */
        padding: 0; /* 기본 패딩 제거 */
        background-color: #f9f9f9; /* 페이지 배경색 */
    }

    /* 컨테이너 스타일 */
    .container {
        max-width: 800px; /* 컨테이너 최대 너비 */
        margin: 100px auto; /* 수직 방향 여백 100px, 수평 방향 중앙 정렬 */
        background-color: #f9f9f9; /* 컨테이너 배경색 */
        padding: 20px; /* 컨테이너 내부 여백 */
        border-radius: 8px; /* 모서리를 둥글게 설정 */
    }

    /* 제목 스타일 */
    .title {
        font-size: 24px; /* 제목 글씨 크기 */
        font-weight: bold; /* 제목 글씨를 굵게 설정 */
        text-align: center; /* 제목 중앙 정렬 */
        margin-bottom: 20px; /* 제목과 다음 요소 간격 */
    }

    /* 설명 텍스트 스타일 */
    .description {
        text-align: center; /* 설명 텍스트 중앙 정렬 */
        font-size: 14px; /* 설명 텍스트 글씨 크기 */
        color: #666; /* 설명 텍스트 색상 */
        margin-bottom: 30px; /* 설명 텍스트와 다음 요소 간격 */
    }

    /* 입력 필드 그룹 스타일 */
    .form-group {
        margin-bottom: 20px; /* 각 필드 그룹 간 간격 */
    }

    /* 레이블 스타일 */
    .form-group label {
        display: block; /* 레이블을 블록 요소로 설정 */
        font-size: 14px; /* 레이블 글씨 크기 */
        font-weight: bold; /* 레이블 글씨를 굵게 설정 */
        color: #333; /* 레이블 글씨 색상 */
        margin-bottom: 8px; /* 레이블과 입력 필드 간 간격 */
    }

    /* 입력 필드 및 텍스트 영역 스타일 */
    .form-group input, .form-group textarea {
        width: 100%; /* 입력 필드의 너비를 100%로 설정 */
        padding: 10px; /* 입력 필드 내부 여백 */
        font-size: 14px; /* 입력 필드 글씨 크기 */
        border: 1px solid #ddd; /* 입력 필드 테두리 색상 */
        border-radius: 5px; /* 입력 필드 모서리를 둥글게 설정 */
        box-sizing: border-box; /* 전체 크기에 패딩과 테두리 포함 */
    }

    /* 제출 버튼 스타일 */
    .submit-btn {
        width: 25%; /* 제출 버튼 너비 */
        padding: 12px; /* 제출 버튼 내부 여백 */
        font-size: 16px; /* 제출 버튼 글씨 크기 */
        color: #fff; /* 제출 버튼 글씨 색상 */
        background-color: #007bff; /* 제출 버튼 배경색 */
        border: none; /* 제출 버튼 테두리 제거 */
        border-radius: 5px; /* 제출 버튼 모서리를 둥글게 설정 */
        cursor: pointer; /* 버튼에 마우스 올렸을 때 포인터 모양으로 변경 */
        text-align: center; /* 버튼 내부 텍스트 중앙 정렬 */
    }

    /* 제출 버튼에 호버 효과 */
    .submit-btn:hover {
        background-color: #0056b3; /* 마우스를 올렸을 때 배경색 변경 */
    }
</style>

<script>


'use strict';

// 중복체크를 통과한 아이디를 저장하는 변수
let checkedStoreId = "";

// 아이디 유효성 검사 함수
function checkId(storeId) {
	
    const idPattern = /^[a-zA-Z0-9]{4,12}$/; // 아이디는 4~12자, 영문과 숫자만 허용

    if (!idPattern.test(storeId)) {
        alert("아이디는 4~12자의 영문자와 숫자만 사용할 수 있습니다.");
        return false;
    }
    return true;
}

// 비밀번호 유효성 검사 함수
function checkPwd(pwd) {
	
    const pwdPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
    // 비밀번호는 최소 8자, 하나 이상의 영문자, 숫자, 특수문자를 포함해야 함

    if (!pwdPattern.test(pwd)) {
        alert("비밀번호는 최소 8자 이상, 하나 이상의 영문자, 숫자, 특수문자를 포함해야 합니다.");
        return false;
    }
    return true;
}


// 아이디 중복여부를 체크한다. 
function checkStoreIdDuplicate(){
	
	let storeIdToCheck = document.getElementById("store_id").value.trim();
	
	if(!checkId(storeIdToCheck)){
		return;
	}
	
	$.ajax({ 
		type:"post",
		
		url:"CheckMemberInfoDuplicate.mem",
		
		data:{"strToCheck":storeIdToCheck,
			"isIdCheck":"true"},    // 이것은 아이디 체크임을 표시
		
		success:function(res){
			
			if(res!=""){ // 해당 아이디를 갖고 있는 회원이 있다면 그 회원의 아이디가 돌아온다.
				
				$("#store_id_check_result").html(res+"는 사용할 수 없습니다. 다른 아이디를 선택해주세요.");
				document.getElementById("store_id").focus();
			}
			else{
				$("#store_id_check_result").html(storeIdToCheck+"는 사용할 수 있는 아이디입니다.");
				
				// 체크된 아이디에 저장해둠
				checkedStoreId = storeIdToCheck;
				
				document.getElementById("pwd").focus();
			}
		},
		error:function(){
			alert("전송오류!");
		}
		
	});
}


// 서버로 가입정보를 보내기 전에 마지막으로 입력정보들을 체크한다.
function finalCheck(){
	
	let storeId = document.getElementById("store_id").value.trim();
	
	if(!checkId(storeId)){
		return;
	}
	
	// 아이디 중복체크를 했는지 여부 체크
	if(checkedStoreId!=storeId){ // 현재 폼에 입력된 아이디와 중복체크때 저장한 아이디가 다르다면 다시 중복체크 하도록.
		console.log("storeId:",storeId);
		console.log("checkedStoreId:",checkedStoreId);
		
		alert("아이디 중복체크를 해주세요.");
		document.getElementById("check_store_id_duplicate").focus();
		return false;
	}
	
	let pwd = document.getElementById("pwd").value.trim();
	
	if(!checkPwd(pwd)){
		return;
	}
			
	let pwdConfirm = document.getElementById("confirm_pwd").value.trim();
	
	if(pwd!=pwdConfirm){
		alert("비밀번호를 다시 입력해주세요.");
		return false;
	}
	
	
	let storeName = document.getElementById("store_name").value.trim();	

	if(storeName==""|| storeName.length<2){
		alert("업체명을 입력하세요.");
		document.getElementById("store_name").focus();
		return false;
	}
	
	let contactName = document.getElementById("contact_name").value.trim();	

	if(contactName==""|| contactName.length<2){
		alert("담당자 이름을 입력하세요.");
		document.getElementById("contact_name").focus();
		return false;
	}
	
	let contactPhone = document.getElementById("contact_phone").value.trim();	

	if(contactPhone==""|| contactPhone.length<8){
		alert("담당자 연락처를 입력하세요.");
		document.getElementById("contact_phone").focus();
		return false;
	}
	
	let contactTime = document.getElementById("contact_time").value.trim();	

	if(contactTime==""){
		alert("통화 가능시간을 입력하세요.");
		document.getElementById("contact_time").focus();
		return false;
	}
	
	document.myform.submit();
}



// 두개의 pwd 입력 텍스트가 서로 같은지 체크
	function checkTwoPwds(){
	
	let pwd = document.getElementById("pwd").value.trim();
	
	let pwdConfirm = document.getElementById("confirm_pwd").value.trim();

	if(pwd!=pwdConfirm){
		document.getElementById("two_pwds_check_result").innerHTML = "두 비밀번호가 일치하지 않습니다.";
	}else{
		document.getElementById("two_pwds_check_result").innerHTML = "";
	}
} 






/* 
    function validateForm(event) {
        // 체크박스 그룹 검사
        const checkboxes = document.querySelectorAll('input[name="knowWay"]:checked'); // 선택된 체크박스
        const errorMsg = document.getElementById('checkboxError'); // 경고 메시지 엘리먼트

        if (checkboxes.length === 0) {
            // 체크박스가 선택되지 않았을 경우
            errorMsg.style.display = 'block'; // 경고 메시지 표시
            document.querySelector('input[name="knowWay"]').scrollIntoView({ behavior: 'smooth' }); // 스크롤 이동
            event.preventDefault(); // 폼 제출 중단
            return false;
        } else {
            // 체크박스가 선택되었을 경우 경고 메시지 숨김
            errorMsg.style.display = 'none';
        }

        // 텍스트 영역 검사
        const textarea = document.querySelector('textarea[name="wr_content"]'); // 텍스트 영역
        if (!textarea.value.trim()) {
            // 텍스트가 비어 있을 경우
            textarea.scrollIntoView({ behavior: 'smooth' });
            alert("문의 내용을 입력해주세요.");
            event.preventDefault(); // 폼 제출 중단
            return false;
        }

        return true; // 모든 유효성 검사를 통과한 경우 폼 제출 허용
    } */
</script>
</head>
<body>
    <!-- 제휴 신청 폼 컨테이너 -->
    <div class="container">
        <!-- 제목 -->
        <div class="title">제휴 신청</div>
        <!-- 설명 -->
        <div class="description">
            아래 양식을 작성하여 제휴 신청을 진행해주세요. 작성해주신 내용은 검토 후 연락드리겠습니다.
        </div>
        <!-- 입력 폼 -->
        <form name="myform" action="ProcessAllianceApply.st" method="post">
        	<!-- 아이디와 비밀번호 입력받아야함. -->
        
            <div class="form-group">
		        <label for="store_id">아이디 *</label>
		        <input type="text" id="store_id" name="storeId" placeholder="아이디를 입력해주세요." style="width:80%" required>
		    	<input type="button" value="중복확인" id="check_store_id_duplicate" style="width:17%" onclick="checkStoreIdDuplicate()" style = "flex-basis:10%; margin-left:10px">
		    </div>
		               
            <div class="form-group">
            	<!-- 아이디의 중복여부 결과를 출력해줄 div -->            
            	<div id="store_id_check_result" style = "margin-left:250px;"></div>
            </div>
		    
		    <div class="form-group">
		        <label for="pwd">비밀번호 *</label>
		        <input type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력해주세요." required>
		    </div>
		    
		    <div class="form-group">
		        <label for="confirm_pwd">비밀번호 확인 *</label>
		        <input type="password" id="confirm_pwd" onkeyup="checkTwoPwds()" placeholder="비밀번호 확인" required>
		    </div>
		    
		    <div class="form-group">
            	<!-- 비밀번호의 일치여부를 출력해줄 div -->            
            	<div id="two_pwds_check_result" style = "margin-left:250px;"></div>
            </div>
		    
		    
		    <!-- 회사명 입력 -->
		    <div class="form-group">
		        <label for="store_name">업체명 *</label>
		        <input type="text" id="store_name" name="storeName" placeholder="지역+업체명을 입력해주세요. 예시)강남 마캉스테라피" required>
		    </div>
		
		    <!-- 담당자 이름 입력 -->
		    <div class="form-group">
		        <label for="contact_name">담당자 이름 *</label>
		        <input type="text" id="contact_name" name="contactName" placeholder="담당자 이름을 입력해주세요" required>
		    </div>
		
		    <!-- 연락처 입력 -->
		    <div class="form-group">
		        <label for="contact_phone">연락처 *</label>
		        <input type="tel" id="contact_phone" name="contactPhone" placeholder="담당자 연락처를 입력해주세요" required>
		    </div>
		
		    <!-- 통화가능 시간 입력 -->
		    <div class="form-group">
		        <label for="contact_time">통화 가능시간 *</label>
		        <input type="text" id="contact_time" name="contactTime" placeholder="통화 가능시간을 입력해주세요. 예시: 오전 9시~오후 6시" required>
		    </div>
		
		    <!-- 체크박스 그룹 -->
		<div class="form-group" style="display: flex; align-items: center; gap: 15px;">
		    <label><strong>* 마사지 타이쿤에서 담당자님께 통화 가능한 시간에 연락드립니다.</strong></label>
		</div>
			
		    <!-- 텍스트 영역 -->
		    <div class="inputs mt35">
		        <textarea name="inquiry" cols="30" rows="5" style="height:100px; width:100%;" placeholder="입점 신청 시 문의 내용을 적어주세요." required></textarea>
		    </div>
		    <br/>
		
		    <!-- 개인정보 동의 -->
		    <div class="consent-section" style="border: 1px solid #ddd; padding: 15px; border-radius: 5px; background-color: #f9f9f9;">
		        <label>
		            <input type="checkbox" name="consent" required>
		            <strong>개인정보 수집 및 이용동의 (필수)</strong>
		        </label>
		        <p>(주)뉴버드 제휴입점문의 접수 시, 최소한의 범위 내에서 아래와 같이 개인정보를 수집 및 이용합니다.</p>
		        <table style="width: 100%; border-collapse: collapse; margin-top: 10px;">
		            <thead>
		                <tr>
		                    <th style="border: 1px solid #ddd; padding: 8px; background-color: #f1f1f1;">수집하는 개인정보 항목</th>
		                    <th style="border: 1px solid #ddd; padding: 8px; background-color: #f1f1f1;">수집 및 이용목적</th>
		                </tr>
		            </thead>
		            <tbody>
		                <tr>
		                    <td style="border: 1px solid #ddd; padding: 8px;">지역명, 업체명, 연락처</td>
		                    <td style="border: 1px solid #ddd; padding: 8px;">제휴/입점 문의사항 접수 및 처리결과 회신</td>
		                </tr>
		            </tbody>
		        </table>
		        <ul style="margin-top: 10px; padding-left: 20px; font-size: 14px;">
		            <li>수집 및 이용목적: 입점문의사항 접수 및 처리결과 회신</li>
		            <li>개인정보 이용기간: 목적 달성 후, 해당 개인정보를 지체없이 파기</li>
		        </ul>
		        <p style="margin-top: 10px; font-size: 14px; color: #666;">
		            ※ 개인정보 수집 및 이용에 대한 동의를 거부할 권리가 있습니다. 동의하지 않을 경우 제휴/입점 문의가 제한될 수 있습니다.
		        </p>
		    </div>
		    <br/>
		
		    <!-- 제출 버튼 -->
		    <div style="text-align:center;width:770px">
		        <input type="button" class="submit-btn" value="입점 신청하기" onclick="finalCheck()">
		    </div>
		</form>
    </div>
    
    <!-- footer 영역 -->
<jsp:include page="/include/footer.jsp" />

</body>
</html>