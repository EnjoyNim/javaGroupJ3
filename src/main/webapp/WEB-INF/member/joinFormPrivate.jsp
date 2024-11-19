<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginform.jsp</title>
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
        justify-content: space-between; /* 레이블과 필드 간 간격 균등 */
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
    }

    /* 입력 필드 스타일 */
    .form-group input {
        flex-basis: 75%; /* 입력 필드 고정 너비 */
        padding: 10px; /* 입력 필드 내부 여백 */
        font-size: 14px; /* 입력 필드 글자 크기 */
        border: 1px solid #ddd; /* 입력 필드 테두리 */
        border-radius: 5px; /* 입력 필드 모서리를 둥글게 */
        text-align: left; /* 텍스트를 왼쪽 정렬 */
    }

    /* 핸드폰 및 인증번호 필드 크기 조정 */
    #phone, #verifyCode {
        flex-basis: 75%; /* 핸드폰 및 인증번호 필드 크기 */
    }

    /* 버튼 스타일 */
    .form-group .btn {
        flex-basis: 30%; /* 버튼 크기 */
        margin-left: 10px; /* 버튼과 입력 필드 간 간격 */
        padding: 10px 15px; /* 버튼 내부 여백 */
        font-size: 14px; /* 버튼 글자 크기 */
        background-color: #333; /* 버튼 배경색 */
        color: #fff; /* 버튼 글자 색상 */
        border: none; /* 버튼 테두리 제거 */
        border-radius: 5px; /* 버튼 모서리를 둥글게 */
        cursor: pointer; /* 마우스 커서 */
        text-align: center; /* 버튼 내부 텍스트 중앙 정렬 */
    }

    /* 버튼 호버 효과 */
    .form-group .btn:hover {
        background-color: #555; /* 버튼 호버 시 배경색 변경 */
    }

    /* 제출 버튼 스타일 */
    .submit-btn {
        width: 100%; /* 제출 버튼 전체 너비 */
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
</head>
<body>
    <div class="container">
        <div class="title">개인회원가입</div>
        <div class="description">회원가입을 하시면 마캉스의 모든 서비스를 이용하실 수 있습니다.<br>
            아래 필수 입력 정보를 상세히 입력해주세요.</div>
        <form action="register.jsp" method="post">
            <div class="form-group">
                <label for="userId">아이디 *</label>
                <input type="text" id="userId" name="userId" placeholder="아이디 입력" autofocus required>
            </div>
            <div class="form-group">
                <label for="password">비밀번호 *</label>
                <input type="password" id="password" name="password" placeholder="비밀번호 입력" required>
            </div>
            <div class="form-group">
                <label for="confirmPassword">비밀번호 확인 *</label>
                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="비밀번호 재입력" required>
            </div>
            <div class="form-group">
                <label for="name">성명 *</label>
                <input type="text" id="name" name="name" placeholder="성명 입력" required>
            </div>
            <div class="form-group">
                <label for="nickname">닉네임 *</label>
                <input type="text" id="nickname" name="nickname" placeholder="닉네임 입력">
            </div>
            <div class="form-group">
                <label for="email">이메일 *</label>
                <input type="email" id="email" name="email" placeholder="이메일 입력" required>
            </div>
            <div class="form-group">
                <label for="phone">핸드폰 *</label>
                <input type="text" id="phone" name="phone" placeholder="핸드폰 입력" required>
            </div>
            <button type="submit" class="submit-btn">회원가입</button>
        </form>
    </div>
</body>
</html>