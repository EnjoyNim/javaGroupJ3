<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinFormCompany.jsp</title>
<style>
    /* 페이지 기본 설정 */
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #ffffff; /* 배경색 설정 */
        text-align: center; /* 전체 텍스트를 중앙 정렬 */
    }

    /* 폼 전체 컨테이너 */
    .container {
        max-width: 800px; /* 컨테이너 최대 너비 */
        margin: 50px auto; /* 상단/하단 50px, 수평 중앙 정렬 */
        padding: 20px;
    }

    /* 제목 스타일 */
    .title {
        font-size: 24px; /* 제목 글자 크기 */
        font-weight: bold; /* 제목 글자를 굵게 */
        margin-bottom: 10px; /* 제목과 다음 요소 간 간격 */
    }

    /* 설명 텍스트 스타일 */
    .description {
        font-size: 14px; /* 설명 글자 크기 */
        color: #666; /* 설명 글자 색상 */
        margin-bottom: 30px; /* 설명과 폼 사이 간격 */
    }

    /* 폼 필드 그룹 */
    .form-group {
        display: flex; /* 수평 정렬 */
        align-items: center; /* 수직 중앙 정렬 */
        justify-content: flex-start; /* 레이블과 필드가 왼쪽 정렬 */
        margin-bottom: 15px; /* 각 필드 간 간격 */
    }

    /* 필드 레이블 스타일 */
    .form-group label {
        flex-basis: 20%; /* 레이블 고정 너비 */
        text-align: left; /* 레이블 텍스트 왼쪽 정렬 */
        font-size: 14px; /* 레이블 글자 크기 */
        font-weight: bold; /* 레이블 글자 굵게 */
        color: #333; /* 레이블 글자 색상 */
        padding-right: 10px; /* 레이블과 입력 필드 간 간격 */
        margin-left: 50px; /* 레이블 자체를 오른쪽으로 이동 */
    }

    /* 입력 필드 스타일 */
    .form-group input {
        flex-basis: 55%; /* 입력 필드 고정 너비 */
        padding: 15px; /* 입력 필드 내부 여백 */
        font-size: 14px; /* 입력 필드 글자 크기 */
        border: 1px solid #ddd; /* 입력 필드 테두리 */
        border-radius: 5px; /* 입력 필드 모서리를 둥글게 */
        text-align: left; /* 텍스트를 왼쪽 정렬 */
        margin-left: 0; /* 입력 필드를 기본 위치로 */
        position: relative;
        left: -20px; /* 왼쪽으로 이동 */
    }

    /* 제출 버튼 스타일 */
    .submit-btn {
        width: 80%; /* 제출 버튼 전체 너비 */
        padding: 12px;
        font-size: 16px; /* 버튼 글자 크기 */
        background-color: #00bcd4; /* 제출 버튼 배경색 */
        color: #fff; /* 제출 버튼 글자 색상 */
        border: none; /* 제출 버튼 테두리 제거 */
        border-radius: 5px; /* 제출 버튼 모서리를 둥글게 */
        cursor: pointer; /* 제출 버튼에 마우스 올렸을 때 포인터 표시 */
        margin-top: 20px; /* 제출 버튼 상단 간격 */
    }

    /* 제출 버튼 호버 효과 */
    .submit-btn:hover {
        background-color: #019cad; /* 제출 버튼 호버 시 배경색 변경 */
    }
</style>

<script type="text/javascript">

	function finalCheck(){
		// 일단은 무조건 서밋
		// 유효성 체크는 나중에 하자.
		
		
		document.myform.submit();
		
	}

</script>

</head>

<body>
    <div class="container">
        <div class="title">업체회원가입</div>
        <div class="description">회원가입을 하시면 마캉스의 모든 서비스를 이용하실 수 있습니다.<br>
            아래 필수 입력 정보를 상세히 입력해주세요.</div>
        <form name="myform" action="JoinStoreOk.st" method="post">
            <!-- 입력 필드 -->
            <div class="form-group">
                <label for="userId">아이디 <font color="red">*</font></label>
                <input type="text" id="user_id" name="mid" placeholder="아이디 입력" autofocus required>
            </div>
            <div class="form-group">
                <label for="password">비밀번호 <font color="red">*</font></label>
                <input type="password" id="pwd" name="pwd" placeholder="비밀번호 입력" required>
            </div>
            <div class="form-group">
                <label for="confirmPassword">비밀번호 확인 <font color="red">*</font></label>
                <input type="password" id="confirm_pwd" name="confirmPassword" placeholder="비밀번호 재입력" required>
            </div>
            <div class="form-group">
                <label for="name">성명 <font color="red">*</font></label>
                <input type="text" id="name" name="name" placeholder="성명 입력" required>
            </div>
            <div class="form-group">
                <label for="nickname">업체명 <font color="red">*</font></label>
                <input type="text" id="nickname" name="storeName" placeholder="업체명 입력">
            </div>
            <div class="form-group">
                <label for="address">주소 <font color="red">*</font></label>
                <input type="text" id="address" name="address" placeholder="주소입력">
            </div>
            <div class="form-group">
                <label for="email">이메일 <font color="red">*</font></label>
                <input type="email" id="email" name="email" placeholder="이메일 입력" required>
            </div>
            <div class="form-group">
                <label for="phone">핸드폰 <font color="red">*</font></label>
                <input type="text" id="phone" name="phone" placeholder="핸드폰 입력" required>
            </div>

	<!-- 전체 동의 섹션 -->
	<div style="margin-top: 30px; border-top: 1px solid #ddd; padding-top: 20px; text-align: center;">
	    <!-- 전체 동의 -->
	    <div style="margin-bottom: 15px;">
	        <label style="font-size: 16px; font-weight: bold;">
	            <input type="checkbox" id="agreeAll" style="margin-right: 5px;"> 전체 동의
	        </label>
	    </div>
	
	    <!-- 개별 약관 -->
	    <div style="margin-left: 0; display: inline-block; text-align: left;">
	        <div style="margin-bottom: 10px;">
	            <label style="font-size: 14px;">
	                <input type="checkbox" name="terms" required style="margin-right: 5px;">
	                <span style="color: #00bcd4; font-weight: bold;">[필수]</span> 서비스 이용약관
	                <a href="#" style="color: #00bcd4; text-decoration: none;">보기</a>
	            </label>
	        </div>
	        <div style="margin-bottom: 10px;">
	            <label style="font-size: 14px;">
	                <input type="checkbox" name="privacy" required style="margin-right: 5px;">
	                <span style="color: #00bcd4; font-weight: bold;">[필수]</span> 개인정보처리방침
	                <a href="#" style="color: #00bcd4; text-decoration: none;">보기</a>
	            </label>
	        </div>
	        <div style="margin-bottom: 10px;">
	            <label style="font-size: 14px;">
	                <input type="checkbox" name="location" style="margin-right: 5px;">
	                <span style="color: #00bcd4; font-weight: bold;">[선택]</span> 위치정보 이용약관
	                <a href="#" style="color: #00bcd4; text-decoration: none;">보기</a>
	            </label>
	        </div>
	    </div>
	</div>
	 <!-- 회원가입 버튼 -->
      <input type="button" class="submit-btn" onclick="finalCheck()" value="회원가입">
    </form>
 </div> 
       
       
	<script>
	    document.getElementById('agreeAll').addEventListener('change', function () {
	        // 모든 체크박스 가져오기
	        const checkboxes = document.querySelectorAll('input[type="checkbox"][name]');
	        checkboxes.forEach(checkbox => {
	            checkbox.checked = this.checked; // "전체 동의"의 상태에 따라 모두 체크/해제
	        });
	    });
	
	    // 개별 체크박스 상태에 따라 전체 동의 상태 업데이트
	    const individualCheckboxes = document.querySelectorAll('input[type="checkbox"][name]');
	    individualCheckboxes.forEach(checkbox => {
	        checkbox.addEventListener('change', function () {
	            const allChecked = Array.from(individualCheckboxes).every(cb => cb.checked);
	            document.getElementById('agreeAll').checked = allChecked;
	        });
	    });
	</script>

    <!-- footer 영역 -->
    <jsp:include page="/include/footer.jsp" />
    
    
</body>

</html>