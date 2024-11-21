<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="${ctp}/css/login.css">
<title>Login.jsp</title>

<script>
    // 아이디 유효성 검사 함수
    function checkId() {
        const userId = document.myform.userId.value; // 아이디 입력 값 가져오기
        const idPattern = /^[a-zA-Z0-9]{4,12}$/; // 아이디는 4~12자, 영문과 숫자만 허용

        if (!idPattern.test(userId)) {
            alert("아이디는 4~12자의 영문자와 숫자만 사용할 수 있습니다.");
            return false;
        }
        return true;
    }

    // 비밀번호 유효성 검사 함수
    function checkPwd() {
        const pwd = document.myform.pwd.value; // 비밀번호 입력 값 가져오기
        const pwdPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
        // 비밀번호는 최소 8자, 하나 이상의 영문자, 숫자, 특수문자를 포함해야 함

        if (!pwdPattern.test(pwd)) {
            alert("비밀번호는 최소 8자 이상, 하나 이상의 영문자, 숫자, 특수문자를 포함해야 합니다.");
            return false;
        }
        return true;
    }

    // 로그인 폼 유효성 검사
    function validateForm() {
        if (!checkId()) {
            document.myform.userId.focus(); // 유효성 검사를 통과하지 못하면 아이디 입력 칸으로 포커스
            return false;
        }
        if (!checkPwd()) {
            document.myform.pwd.focus(); // 유효성 검사를 통과하지 못하면 비밀번호 입력 칸으로 포커스
            return false;
        }
        return true; // 유효성 검사를 모두 통과한 경우
    }
</script>
</head>
<body>

<!-- main css 를 jsp 페이지에 넣고 포함시키기 -->
<%-- <jsp:include page="/css/loginCSS.jsp" /> --%>

<!-- 페딩바텀에 푸터높이 80 줘야함  -->
<body style="padding-bottom:80px">

<!-- 로그인창의 헤더영역은 이미지로 대체 -->
<div id="login_header_image_div" style="border:1px solid gray"><img alt="로그인 헤더이미지" src="${ctp}/images/img_login_header.png"></div>

<div class="container">
    <div class="logo">로그인</div>
    <div class="description">로그인을 하시면 마캉스의 모든 서비스를 이용할 수 있습니다.<br/>
        회원이 아니시면 회원가입 후 다양한 혜택을 누리세요.</div>
    
    <!-- 유효성 검사 함수 validateForm 호출 -->
    <form name="myform" action="LoginOk.main" method="post" onsubmit="return validateForm()">
        <input type="text" name="mid" class="input-field" placeholder="아이디" required>
        <input type="password" name="pwd" class="input-field" placeholder="비밀번호" required>
        <button type="submit" class="login-btn">로그인</button>
    </form>
    
    <a href="#" class="link">회원정보찾기</a>
    <div class="sns-login">
        <p>SNS 계정으로 간편하게 로그인</p>
        <img src="${ctp}/images/KakaoTalkLogin1.png" alt="Kakao Login">
    </div>
    <div id="mk__login_join" class="fixed__box">
        <p class="signed">아직 마캉스 회원이 아니세요? <a href="MemberJoin.main">회원가입</a></p>
    </div>
</div>
    
<!-- footer 영역 -->
<jsp:include page="/include/footer.jsp" />

</body>
</html>