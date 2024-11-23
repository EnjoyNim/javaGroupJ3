<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--       header.jsp 파일에 ctp 관련 코드가 똑같이 들어가있지만 여기서도 추가해줘야만 제대로 이미지들에 접근을 한다.
           header.jsp 를 include 할때 body 영역에 jsp 사용관련 선언들이 들어가는데 아마도 그게 제대로 역할을 안하는듯하다. -->
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Massage Tycoon</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link type="text/css" rel="stylesheet" href="${ctp}/css/main.css">

<!-- swiper 관련 CSS -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<!-- swiper 관련 JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

</head>

<!-- 헤더와 푸터를 고정시켰기에 바디태그 페딩탑에 헤더높이 70, 페딩바텀에 푸터높이 80 줘야함  -->
<body style="padding-top:70px; padding-bottom:80px">


<!-- main css 를 jsp 페이지에 넣고 포함시키기 -->
<%-- <jsp:include page="/css/mainCSS.jsp" /> --%>

<!-- 헤더영역 -->
<jsp:include page="/include/header.jsp" />
<!-- 사이드네비 영역 -->
<jsp:include page="/include/sidenavi.jsp" />


   <!-- 본문 -->
<div id="container">


 		<!-- 1번 section: 큰 카테고리 매뉴 -->
		<div id="upper_content">
		
                <div class="big_category">
                  
                        <a href="${ctp}/MainCourse.mc?course=마사지">
                            <div class="thumb">
                                <img src="${ctp}/images/main_thumb01.png" alt="마사지 이미지">
                            </div>
                            <div class="lab">마사지</div>
                        </a>
                    
                        <a href="${ctp}/MainCourse.mc?course=에스테틱">
                            <div class="thumb">
                                <img src="${ctp}/images/main_thumb02.png" alt="에스테틱 이미지">
                            </div>
                            <div class="lab">에스테틱</div>
                        </a>
                  
                    
                        <a href="${ctp}/MainCourse.mc?course=왁싱">
                            <div class="thumb">
                                <img src="${ctp}/images/main_thumb03.png" alt="왁싱 이미지">
                            </div>
                            <div class="lab">왁싱</div>
                        </a>
                    
                 
                        <a href="${ctp}/MainCourse.mc?course=남성전용">
                            <div class="thumb">
                                <img src="${ctp}/images/main_thumb04.png" alt="남성전용 이미지">
                            </div>
                            <div class="lab">남성전용</div>
                        </a>
                  
                        <a href="${ctp}/MainCourse.mc?course=커플/여성">
                            <div class="thumb">
                                <img src="${ctp}/images/main_thumb05.png" alt="커플/여성 이미지">
                            </div>
                            <div class="lab">커플/여성</div>
                        </a>
                   
                        <a href="${ctp}/MainCourse.mc?course=해외마사지">
                            <div class="thumb">
                                <img src="${ctp}/images/main_thumb06.png" alt="해외마사지 이미지">
                            </div>
                            <div class="lab">해외</div>
                        </a>
                 </div>
                 
                
                <!--end of big_category-->


                <div class="eventlist">
                    <a href="${ctp}/MainCourse.mc?course=coupon"><img src="${ctp}/images/ico_coupon.png" alt="쿠폰 이미지"><span>쿠폰</span></a>
                    <a href="${ctp}/MainCourse.mc?course=event"><img src="${ctp}/images/ico_event.png" alt="이벤트 이미지"><span>이벤트</span></a>
                    <a href="${ctp}/MainCourse.mc?course=special"><img src="${ctp}/images/ico_bag.png" alt="기획전 이미지"><span>기획전</span></a>
                    
                </div>
		</div>
		
		
		
	
		
<!-- 2번 section: 자동 이미지 슬라이더 -->
<div class="slideshow_container">
	
	<div class="mySlides fade" onclick="location.href='#'">
	  <img src="${ctp}/images/img_slider_1.webp" style="width:100%">
	</div>
	<div class="mySlides fade" onclick="location.href='#'">
	  <img src="${ctp}/images/img_slider_2.webp" style="width:100%">
	</div>
	<div class="mySlides fade" onclick="location.href='#'">
	  <img src="${ctp}/images/img_slider_3.webp" style="width:100%">
	</div>
	<div class="mySlides fade" onclick="location.href='#'">
	  <img src="${ctp}/images/img_slider_4.webp" style="width:100%">
	</div>
	<div class="mySlides fade" onclick="location.href='#'">
	  <img src="${ctp}/images/img_slider_5.webp" style="width:100%">
	</div>
	<div class="mySlides fade" onclick="location.href='#'">
	  <img src="${ctp}/images/img_slider_6.webp" style="width:100%">
	</div>
</div>


<br>

<div style="text-align:center; margin-top:-55px">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span>
  <span class="dot"></span>
  <span class="dot"></span>
</div>


<script>
let slideIndex = 0;
showSlides();

function showSlides() {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 3000); // Change image every 2 seconds
}
</script>
		
		
	
	
	
<!-- 3번 section: 내 주변 추천샵 -->	
	
<div id="nearby_shop">

<p  class="section_title">내 주변 추천샵</p>

 <!-- swiper 를 두 개이상 사용할때는 이렇게 구분하는 클래스이름을 swiper-container 뒤에 따로 붙여주고
 javascript 에서 Swiper 객체를 생성할때도 구분하는 클래스이름(nearby_shop)을 사용해야한다. -->
 <div class="swiper-container nearby_shop">
  <div class="swiper-wrapper">
  
<%--     서버에서 넘어온 vos 를 foreach 로 vo 로 분리후에 각 vo에 정보를 가지고 각각 swiper-solide 를 생성해야한다.
    그리고 a 태그의 href 에는 href="ShowStoreDetail.st?storeIdx=${vo.getShopIdx}" 지정해서 서버로 넘겨야한다. 
    그럼 서버는 해당 shopIdx 를 입점샵테이블에서 찾아 vo 를 만들어서 request 에 담은후 다시 브라우저로 넘겨준다.
   --%>
    <div class="swiper-slide">
    	
    	<a href="ShowStoreDetail.st">
    	    <div><img src="${ctp}/images/img_nearby1.webp" style="width:100%"></div>
    		<p>사창동 마사지 더킹</p>
    
    				<!-- flex -->
    			<div class="review_and_heart">
    					<!-- flex -->
    			   <div class="inner">
    			   	 	<!-- <div class="ico_review"></div> -->
    			   	 	<img alt="리뷰아이콘" src="${ctp}/images/ico_review.png">
    			   	 	<div class="review_cnt" style="margin-left:5px">4</div>
    			   </div>
    			   <div class="inner" style="margin-left:10px">
    			   		<img alt="하트아이콘" src="${ctp}/images/ico_heart_fill.png">
    			   	 <!-- 	<div class="ico_heart_fill"></div> -->
    			   	 	<div class="heart_cnt" style="margin-left:5px">15</div>
    			   </div>
    			</div>
    			
    					<!-- flex -->
    			<div class="dist_and_price">
    				<div class="dist" style="margin-bottom:15px">0.3<span><em class="unit">km</em></span></div>
    				<div class="price">
    					<p class="original" style="text-decoration:line-through">130,000<em class="unit_ko">원</em></p>
    					<p class="dc" style="margin-top:-15px"><span style="color:red;">15%</span><strong> 110,000</strong>
    					<em class="unit_ko">원</em></p>
    				</div>
    			</div>
    			
    	</a>
    </div>
    
    
    
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

<script type="text/javascript">
		/* swiper 를 두개이상 사용할때는 이렇게 구분하는 클래스이름을 사용해서 생성해야한다. */
	new Swiper('.nearby_shop', {
		  // direction: 'horizontal';  기본값이므로 생략 가능. 수직은 vertical 값 주기
		  slidesPerView: 4, // 한번에 보여줄 슬라이드 개수
		  slidesPerGroup: 4,
		  spaceBetween: 10 // 슬라이드 사이 여백
		 
		});

</script>

	
	
	
		
<!-- 4번 section: 회원가입소개 div -->

<div class="register_ad" style="margin-top:10px;" onclick="location.href='#'">
	<div class="left_group"> <!-- flex 레이아웃 -->
		<img alt="로고 이미지" src="${ctp}/images/logo_m.svg">
		<div class="text_group" style="margin-left:10px">
			<p style="margin-top:10px;">마사지 타이쿤이 처음이신가요?</p>
			<p style="margin-top:-15px;">회원가입 후 <span>혜택 및 알림</span>을 받아보세요!</p>
		</div>
	</div>
	<div class="right_group" style="margin-right:5px">
		<img alt="오른쪽 꺽쇠" src="${ctp}/images/ico_right_arrow.png">
	</div>

</div>
		
		
		
		
<!-- 5번 section: 신규입점 swiper -->	
		
		
<div id="new_shop">
<p  class="section_title">신규 입점</p>
 <!-- swiper 를 두 개이상 사용할때는 이렇게 구분하는 클래스이름을 swiper-container 뒤에 따로 붙여주고
 javascript 에서 Swiper 객체를 생성할때도 구분하는 클래스이름(new_shop)을 사용해야한다. -->
 <div class="swiper-container new_shop">
  <div class="swiper-wrapper">
  
    <div class="swiper-slide">
    	<a href="https://www.naver.com">
    	    <div><img src="${ctp}/images/img_nearby1.webp" style="width:100%"></div>
    		<p>사창동 마사지 더킹</p>
    
    				<!-- flex -->
    			<div class="review_and_heart">
    					<!-- flex -->
    			   <div class="inner">
    			   	 	<!-- <div class="ico_review"></div> -->
    			   	 	<img alt="리뷰아이콘" src="${ctp}/images/ico_review.png">
    			   	 	<div class="review_cnt" style="margin-left:5px">4</div>
    			   </div>
    			   <div class="inner" style="margin-left:10px">
    			   		<img alt="리뷰아이콘" src="${ctp}/images/ico_heart_fill.png">
    			   	 <!-- 	<div class="ico_heart_fill"></div> -->
    			   	 	<div class="heart_cnt" style="margin-left:5px">15</div>
    			   </div>
    			</div>
    			
    					<!-- flex -->
    			<div class="dist_and_price">
    				<div class="dist" style="margin-bottom:15px">0.3<span><em class="unit">km</em></span></div>
    				<div class="price">
    					<p class="original" style="text-decoration:line-through">130,000<em class="unit_ko">원</em></p>
    					<p class="dc" style="margin-top:-15px"><span style="color:red;">15%</span><strong> 110,000</strong>
    					<em class="unit_ko">원</em></p>
    				</div>
    			</div>
    			
    	</a>
    </div>
    
    
    
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

<script type="text/javascript">
/* swiper 를 두개이상 사용할때는 이렇게 구분하는 클래스이름을 사용해서 생성해야한다. */
	new Swiper('.new_shop', {
		  // direction: 'horizontal';  기본값이므로 생략 가능. 수직은 vertical 값 주기
		  slidesPerView: 4, // 한번에 보여줄 슬라이드 개수
		  slidesPerGroup: 4,
		  spaceBetween: 10 // 슬라이드 사이 여백
		 
	});

</script>	
		

<div class="panel_main_line"></div>		








<!-- 6번 section: 최근 예약 많은 마사지 타이쿤 추천샵 swiper -->	
   <!-- 여기에 제휴 입점신청과 광고상품안내 넣는걸로 시작 -->
   
 <div id="ad_banner">
 		<!-- 제휴 입점 신청 -->
 	<a href="ContractApply.main"><img alt="" src="${ctp}/images/img_contract_shop.png" width="100%" height="100%"></a>
 		<!-- 광고 상품 안내 -->
 	<a href="ShowAd.main"><img alt="" src="${ctp}/images/img_introduction_service.png" width="100%" height="100%"></a>
 </div>  
	
			
<!-- container 끝 -->		
</div>



<!-- footer 영역 -->
<jsp:include page="/include/footer.jsp" />

</body>
</html>
