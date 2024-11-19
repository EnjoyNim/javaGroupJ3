<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>member.jsp</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ffffff; /* 배경색 설정 */
            text-align: center; /* 중앙 정렬 */
        }
        .container {
            max-width: 800px; /* 컨테이너 최대 너비 */
            margin: 50px auto; /* 화면 중앙 배치 */
            padding: 20px;
        }
        .title {
            font-size: 24px; /* 제목 글자 크기 */
            font-weight: bold; /* 굵은 글씨 */
            margin-bottom: 10px; /* 제목과 설명 간격 */
        }
        .description {
            font-size: 14px; /* 설명 글자 크기 */
            color: #666; /* 설명 글자 색상 */
            margin-bottom: 40px; /* 설명과 카드 간 간격 */
        }
        .options {
            display: flex; /* 플렉스 박스 레이아웃 */
            justify-content: center; /* 가운데 정렬 */
            gap: 20px; /* 카드 간 간격 */
        }
        .option-card {
            width: 200px; /* 카드 너비 */
            padding: 20px; /* 카드 내부 여백 */
            border: 1px solid #ddd; /* 카드 테두리 */
            border-radius: 10px; /* 카드 모서리 둥글게 */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 */
            background-color: #fff; /* 카드 배경색 */
            text-align: center; /* 카드 내부 텍스트 중앙 정렬 */
            cursor: pointer; /* 마우스 커서를 포인터로 변경 */
            transition: transform 0.2s; /* 마우스 호버 시 애니메이션 */
        }
        .option-card:hover {
            transform: scale(1.05); /* 마우스 호버 시 확대 */
        }
        .option-card img {
            width: 80px; /* 이미지 너비 */
            height: auto; /* 이미지 비율 유지 */
            margin-bottom: 10px; /* 이미지와 텍스트 간 간격 */
        }
        .option-card-title {
            font-size: 16px; /* 카드 제목 크기 */
            font-weight: bold; /* 카드 제목 굵게 */
            margin-bottom: 5px; /* 제목과 설명 간 간격 */
        }
        .option-card-description {
            font-size: 12px; /* 카드 설명 크기 */
            color: #666; /* 카드 설명 색상 */
        }
        .footer {
            margin-top: 40px; /* 푸터와 콘텐츠 간 간격 */
            font-size: 12px; /* 푸터 글자 크기 */
            color: #aaa; /* 푸터 글자 색상 */
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="title">회원 유형을 선택해주세요.</div>
        <div class="description">궁금하신 사항은 고객센터 <strong><span style="color:red;">1544-7363</span></strong>로 문의 바랍니다.</div>
        <div class="options">
            <!-- 개인회원 -->
            <div class="option-card" onclick="location.href='${ctp}/MemberJoinFormPrivate.mem'">
               <img src="${ctp}/images/membersa.svg"  title="개인회원">
                <div class="option-card-title">개인회원</div>
                <div class="option-card-description">추가 혜택과 간편 정보!<br>가입하고 마캉스 가자!</div>
            </div>
            <!-- 업체회원 -->
            <div class="option-card" onclick="location.href='${ctp}/MemberJoinFormCompany.mem'">
                 <img src="${ctp}/images/membergi.svg"  title="업체회원">
                <div class="option-card-title">업체회원</div>
                <div class="option-card-description">마캉스로 업체 등록과<br>관리를 빠르고 간편하게!</div>
            </div>
        </div>
        <div class="footer">Copyright 2024 MassageTycoon.com. All rights reserved.</div>
    </div>
</body>
</html>