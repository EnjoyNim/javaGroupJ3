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
<link type="text/css" rel="stylesheet" href="css/main.css">

<!-- swiper 관련 CSS -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<!-- swiper 관련 JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

</head>


<body>
<!-- 헤더영역 -->
<jsp:include page="/include/header.jsp" />
<!-- 사이드네비 영역 -->
<jsp:include page="/include/sidenavi.jsp" />


   <!-- 본문 -->
<div id="container">
 		<!-- 1번 section -->
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
		
		<!--  end of upper content -->
		
	
		
<!-- 2번 section -->
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

<div style="text-align:center">
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
		
		
	
	
<!-- 3번 section -->	
		
<!-- 내 주변 추천샵 swiper,  overflow:hidden 을 꼭 해줘야한다. 안그러면 앞 뒤로 이미지가 넘어가서 나옴 -->		
<div id="nearby_shop" style="overflow:hidden">
 <div class="swiper-container ">
  <div class="swiper-wrapper">
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
  </div>
</div>
	
</div>

<script type="text/javascript">
	
	new Swiper('.swiper-container', {
		  // direction: 'horizontal';  기본값이므로 생략 가능. 수직은 vertical 값 주기
		  slidesPerView: 4, // 한번에 보여줄 슬라이드 개수
		  slidesPerGroup: 4,
		  spaceBetween: 10 // 슬라이드 사이 여백
		 
		});

</script>

		
	
		
		
		
<!-- container 끝 -->		
</div>



<!-- footer 영역 -->
<jsp:include page="/include/footer.jsp" />

</body>
</html>
