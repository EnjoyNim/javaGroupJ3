<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--       header.jsp 파일에 ctp 관련 코드가 똑같이 들어가있지만 여기서도 추가해줘야만 제대로 이미지들에 접근을 한다.
           header.jsp 를 include 할때 body 영역에 jsp 사용관련 선언들이 들어가는데 아마도 그게 제대로 역할을 안하는듯하다. -->
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>storeDetail.jsp</title>

<link type="text/css" rel="stylesheet" href="${ctp}/css/storedDetail.css">
<!-- swiper 관련 CSS -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<!-- swiper 관련 JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</head>

<body style="padding-top:70px; padding-bottom:80px">
		
<!-- include 헤더(상세페이지에 맞춘) -->
	
<div id="shop_detail">

<div id="shop_screen_shot">
 <!-- swiper 를 두 개이상 사용할때는 이렇게 구분하는 클래스이름을 swiper-container 뒤에 따로 붙여주고
 javascript 에서 Swiper 객체를 생성할때도 구분하는 클래스이름(nearby_shop)을 사용해야한다. -->
 <div class="swiper-container shop_screen_shot">
  <div class="swiper-wrapper">
    			<!-- 넘어온 shop vo 의 이미지 파일 이름들을 연결한 문자열을 가져와서 jstl 로 개수에 맞게 잘라서 생성  -->
    <div class="swiper-slide"><img src="${ctp}/images/img_nearby1.webp" style="width:100%"></div>
    <div class="swiper-slide"><img src="${ctp}/images/img_nearby2.webp" style="width:100%"></div>
    <div class="swiper-slide"><img src="${ctp}/images/img_nearby3.webp" style="width:100%"></div>
    <div class="swiper-slide"><img src="${ctp}/images/img_nearby4.webp" style="width:100%"></div>
    <div class="swiper-slide"><img src="${ctp}/images/img_nearby5.webp" style="width:100%"></div>
    <div class="swiper-slide"><img src="${ctp}/images/img_nearby6.webp" style="width:100%"></div>
    <div class="swiper-slide"><img src="${ctp}/images/img_nearby7.webp" style="width:100%"></div>
    <div class="swiper-slide"><img src="${ctp}/images/img_nearby8.webp" style="width:100%"></div>
    <div class="swiper-slide"><img src="${ctp}/images/img_nearby9.webp" style="width:100%"></div>
    <div class="swiper-slide"><img src="${ctp}/images/img_nearby10.webp" style="width:100%"></div>
    <div class="swiper-slide"><img src="${ctp}/images/img_nearby11.webp" style="width:100%"></div>
    <div class="swiper-slide"><img src="${ctp}/images/img_nearby12.webp" style="width:100%"></div>
    <div class="swiper-slide"><img src="${ctp}/images/img_nearby13.webp" style="width:100%"></div>
    <div class="swiper-slide"><img src="${ctp}/images/img_nearby14.webp" style="width:100%"></div>
    <div class="swiper-slide"><img src="${ctp}/images/img_nearby15.webp" style="width:100%"></div>
    <div class="swiper-slide"><img src="${ctp}/images/img_nearby16.webp" style="width:100%"></div>
    <div class="swiper-slide"><img src="${ctp}/images/img_nearby17.webp" style="width:100%"></div>
  </div>
 </div>
</div>
</div>

<script type="text/javascript">
		/* swiper 를 두개이상 사용할때는 이렇게 구분하는 클래스이름을 사용해서 생성해야한다. */
	new Swiper('.shop_screen_shot', {
		  // direction: 'horizontal';  기본값이므로 생략 가능. 수직은 vertical 값 주기
		  slidesPerView: 2, // 한번에 보여줄 슬라이드 개수
		  slidesPerGroup: 2,
		  spaceBetween: 10 // 슬라이드 사이 여백
		 
		});

</script>

	<!-- vo로부터 타이틀과 주소를 가져와서 처리 -->
<h5 style="font-weidht:bold">타이틀 (예 서초동 마사지 오투타이)</h5>
<p style="font-size:13px">주소 (예 서울 서초구 서초대로75길 34/ 서초동 1208-14 5층)</p>

	<!-- flex -->
<div id="review_and_heart" class="review_and_heart">
		<!-- flex -->
   <div class="inner">
   	 	<!-- <div class="ico_review"></div> -->
   	 	<img alt="리뷰아이콘" src="${ctp}/images/ico_review.png">
   	 	<div class="review_cnt" style="margin-left:5px"><span style="font-size:19px;font-weight:bold">4</span></div>
   </div>
   <div class="inner" style="margin-left:10px">
   		<img alt="하트아이콘" src="${ctp}/images/ico_heart_fill.png">
   	 <!-- 	<div class="ico_heart_fill"></div> -->
   	 	<div class="heart_cnt" style="margin-left:5px"><span style="font-size:19px;font-weight:bold">15</span></div>
   </div>
</div>


<div class="pan_course" id="course_tab" style="margin-top:50px">
	<div id="pan_tab_menu1">
		<div id="course_info" class="tab_menu"><a href="#course_tab" style="text-decoration:none"><span style="font-size:20px;font-weight:bold;color:white">코스정보</span></a></div>
		<div id="store_info" class="tab_menu"><a href="#store_tab" style="text-decoration:none"><span style="font-size:20px;font-weight:bold;color:#333">업체정보</span></a></div>
		<div id="review_count" class="tab_menu"><a href="#veview_tab" style="text-decoration:none"><span style="font-size:20px;font-weight:bold;color:#333">방문후기(갯수)</span></a></div>
	</div>

</div>





</body>
</html>