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

<!-- jQuery 와 ajax 사용을 위한 cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- swiper 관련 JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</head>

<body style="padding-top:70px; padding-bottom:80px">

	
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
<div style="font-size:24px;font-weidht:bold; height:30px; margin-top:10px">
	<strong>타이틀 (예 서초동 마사지 오투타이)</strong></div>
<p style="font-size:15px;">주소 (예 서울 서초구 서초대로75길 34/ 서초동 1208-14 5층)</p>

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


<div id="pan1_course" style="margin-top:50px">
	<div id="pan1_tab_menu">
		<div class="tab_menu" style="background-color:#333"><a href="#pan1_course" style="text-decoration:none"><span style="font-size:20px;font-weight:bold;color:white">코스정보</span></a></div>
		<div class="tab_menu" style="background-color:white"><a href="#pan2_store" style="text-decoration:none"><span style="font-size:20px;font-weight:bold;color:#333">업체정보</span></a></div>
		<div class="tab_menu" style="background-color:white"><a href="#pan3_review" style="text-decoration:none"><span style="font-size:20px;font-weight:bold;color:#333">방문후기(갯수)</span></a></div>
	</div>

	<div>
		<ul id="store_theme">
			<li class="status work on"><p>24시간</p></li>
			<li class="status park"><p>무료주차</p></li>
			<li class="status sleep"><p>수면가능</p></li>
			<li class="status shower"><p>개인샤워실</p></li>
			<li class="status week"><p>주간할인</p></li>
			<li class="status people on"><p>단체할인</p></li>
			<li class="status event"><p>이벤트중</p></li>
			<li class="status wifi"><p>wi-fi</p></li>
			<li class="status couple"><p>커플할인</p></li>
			<li class="status sleep2"><p>조건부수면</p></li>
			<li class="status person"><p>개인실</p></li>
			<li class="status couple_room on"><p>커플실</p></li>
			<li class="status coupon"><p>할인쿠폰</p></li>
			<li class="status first on" ><p>첫방문할인</p></li>
			<li class="status birth"><p>생일할인</p></li>
			<li class="status soldier"><p>군인할인</p></li>
			<li class="status review"><p>후기할인</p></li>
			<li class="status sms"><p></p>문자예약</li>
			<li class="status parking"><p>주차가능</p></li>
			<li class="status reservation"><p>예약필수</p></li>
		
		</ul>
	
	</div>
	
	<hr/>
	
	<!--  동적으로 생성 부분이다. 이 부분에 아이템이 들어가는 개수는 업소마다 다르다. -->
	<div class="pan_course" >
	
	
		<!-- 스웨디시 관리의 아이템들 3개 시작 -->
		<div class="item" style="text-align:center;">
				<strong class="h2" style="text-align:center; color:#333; font-size:19px">
				스웨디시 관리</strong>
		
		 <!-- 이런 코스가 vo 에 담겨있는 만큼 반복된다. -->
		<div class="course">
			<div class="course_header">
				<h3>A코스 - 60분</h3>
				<p></p>
			</div>
			<div class="course_container">
				<ul class="items">
					<li>
						<div class="discount">
							<strong class="dc">15%</strong>
							<strong class="org">130,000 원</strong>
						</div>
						 <div class="price">
						 	<strong>110,000 원</strong>
						 </div>
					</li>
					   
				</ul>
			</div>
			
			<div class="course_footer" style="padding: 15px 15px 5px 15px; text-align:left">
                 <p style="padding: 15px;border: 1px solid #EEEEEE;border-radius: 5px;background-color: #FFFFFF;color: #666666;font-size: 12px;">건식 + 전신스웨디시+ 림프관리</p>
            </div>
		</div>
		
		
		<!-- 이런 코스가 vo 에 담겨있는 만큼 반복된다. -->
		<div class="course">
			<div class="course_header">
				<h3>B코스 - 90분</h3>
				<p></p>
			</div>
			<div class="course_container">
				<ul class="items">
					<li>
						<div class="discount">
							<strong class="dc">13%</strong>
							<strong class="org">160,000 원</strong>
						</div>
						 <div class="price">
						 	<strong>140,000 원</strong>
						 </div>
					</li>
					   
				</ul>
			</div>
			
			<div class="course_footer" style="padding: 15px 15px 5px 15px; text-align:left">
                 <p style="padding: 15px;border: 1px solid #EEEEEE;border-radius: 5px;background-color: #FFFFFF;color: #666666;font-size: 12px;">건식 + 전신스웨디시+ 림프관리</p>
            </div>
		</div>
		
		
		<!-- 이런 코스가 vo 에 담겨있는 만큼 반복된다. -->
		<div class="course">
			<div class="course_header">
				<h3>C코스 - 70분(프라나)</h3>
				<p></p>
			</div>
			<div class="course_container">
				<ul class="items">
					<li>
						<div class="discount">
							<strong class="dc">13%</strong>
							<strong class="org">160,000 원
							</strong>
						</div>
						 <div class="price">
						 	<strong>140,000 원
						 	</strong>
						 </div>
					</li>
					   
				</ul>
			</div>
			
			<div class="course_footer" style="padding: 15px 15px 5px 15px; text-align:left">
                 <p style="padding: 15px;border: 1px solid #EEEEEE;border-radius: 5px;background-color: #FFFFFF;color: #666666;font-size: 12px;">프라나</p>
            </div>
		</div>
		
	</div>
	<!-- 스웨디시 관리의 아이템들 3개 끝 -->
	
	
	
	
	
	
	
	
	<!-- 브라질리언 왁싱의 아이템들 4개 시작 -->
	<div class="item" style="text-align:center;">
				<strong class="h2" style="text-align:center; color:#333; font-size:19px">
				브라질리언 왁싱</strong>
		
		 <!-- 이런 코스가 vo 에 담겨있는 만큼 반복된다. -->
		<div class="course">
			<div class="course_header">
				<h3>여자 브라질리언 고급 코스</h3>
				<p></p>
			</div>
			<div class="course_container">
				<ul class="items">
					<li>
						<div class="discount">
							<strong class="dc">22%</strong>
							<strong class="org">90,000 원</strong>
						</div>
						 <div class="price">
						 	<strong>70,000 원</strong>
						 </div>
					</li>
					   
				</ul>
			</div>
			
			<div class="course_footer" style="padding: 15px 15px 5px 15px; text-align:left">
                 <p style="padding: 15px;border: 1px solid #EEEEEE;border-radius: 5px;background-color: #FFFFFF;color: #666666;font-size: 12px;">
                 슈가/하드</p>
            </div>
		</div>
		
		
		<!-- 이런 코스가 vo 에 담겨있는 만큼 반복된다. -->
		<div class="course">
			<div class="course_header">
				<h3>남자 브라질리언 고급 코스</h3>
				<p></p>
			</div>
			<div class="course_container">
				<ul class="items">
					<li>
						<div class="discount">
							<strong class="dc">17%</strong>
							<strong class="org">120,000 원</strong>
						</div>
						 <div class="price">
						 	<strong>100,000 원</strong>
						 </div>
					</li>
					   
				</ul>
			</div>
			
			<div class="course_footer" style="padding: 15px 15px 5px 15px; text-align:left">
                 <p style="padding: 15px;border: 1px solid #EEEEEE;border-radius: 5px;background-color: #FFFFFF;color: #666666;font-size: 12px;">
                 슈가/하드</p>
            </div>
		</div>
		
		
		<!-- 이런 코스가 vo 에 담겨있는 만큼 반복된다. -->
		<div class="course">
			<div class="course_header">
				<h3>탄력 케어 림프 추가</h3>
				<p></p>
			</div>
			<div class="course_container">
				<ul class="items">
					<li>
						<div class="discount">
							<strong class="dc">40%</strong>
							<strong class="org">50,000 원
							</strong>
						</div>
						 <div class="price">
						 	<strong>30,000 원
						 	</strong>
						 </div>
					</li>
					   
				</ul>
			</div>  
			<!-- 이건 footer 가 없다. -->
		</div>
		
		
				 <!-- 이런 코스가 vo 에 담겨있는 만큼 반복된다. -->
		<div class="course">
			<div class="course_header">
				<h3>청결 코스</h3>
				<p></p>
			</div>
			<div class="course_container">
				<ul class="items">
					<li>
						<div class="discount">
							<strong class="dc">40%</strong>
							<strong class="org">50,000 원</strong>
						</div>
						 <div class="price">
						 	<strong>30,000 원</strong>
						 </div>
					</li>
					   
				</ul>
			</div>
			
			<div class="course_footer" style="padding: 15px 15px 5px 15px; text-align:left">
                 <p style="padding: 15px;border: 1px solid #EEEEEE;border-radius: 5px;background-color: #FFFFFF;color: #666666;font-size: 12px;">
                 단독 예약 불가 / 전신 문의</p>
            </div>
		</div>
		
	</div>
	<!-- 브라질리언 왁싱 아이템들 4개 끝 -->
	
	</div> <!-- pan_course 끝 -->
	
</div> <!-- pan1_course 끝 -->





<div id="pan2_store" style="margin-top:50px">
	
	<div id="pan2_tab_menu">
		<div class="tab_menu" style="background-color:white"><a href="#pan1_course" style="text-decoration:none"><span style="font-size:20px;font-weight:bold;color:#333">코스정보</span></a></div>
		<div class="tab_menu" style="background-color:#333"><a href="#pan2_store" style="text-decoration:none"><span style="font-size:20px;font-weight:bold;color:white">업체정보</span></a></div>
		<div class="tab_menu" style="background-color:white"><a href="#pan3_review" style="text-decoration:none"><span style="font-size:20px;font-weight:bold;color:#333">방문후기(갯수)</span></a></div>
	</div>
	
	  <!-- 텍스트로 이루어진 섹션을 디비에서 가져와서 개수에 맞게 반복시켜야한다. -->
	  <!-- 이 부분은 관리자가 textArea 에 태그를 넣고 꾸며서 디비에 입력시켜야할듯  -->
	<div class="text_section">
		<h3>공지사항</h3>
		<p>*사전예약시 적용되는 강남 역삼동 디엘로테라피 회원가 입니다.<br>
		<br>
		*스웨디시 관리 : 아로마 오일을 사용함으로써 피부에 영양공급과<br>
		혈액순환을 도와 노폐물 제거, 심신을 감미롭게 이완시키는 관리</p>
	</div>
	
	
		  <!-- 텍스트로 이루어진 섹션을 디비에서 가져와서 개수에 맞게 반복시켜야한다. -->
	<div class="text_section">
		<h3>업체소개</h3>
		<p>안녕하세요. 강남 역삼동 디엘로테라피입니다. 스웨디시 마사지<br>
			왁싱 전문샵으로 전문적인 관리사님에게 고급스러운 관리를<br>
			받아보세요. 방문해주시는 모든 분들이 만족하며 돌아가실 수 있도록<br>
			항상 노력하는 디엘로테라피가 되겠습니다. 감사합니다~^^</p>
	</div>
	
		  <!-- 텍스트로 이루어진 섹션을 디비에서 가져와서 개수에 맞게 반복시켜야한다. -->
	<div class="text_section">
		<h3>업체소개</h3>
		<p>안녕하세요. 강남 역삼동 디엘로테라피입니다. 스웨디시 마사지<br>
			왁싱 전문샵으로 전문적인 관리사님에게 고급스러운 관리를<br>
			받아보세요. 방문해주시는 모든 분들이 만족하며 돌아가실 수 있도록<br>
			항상 노력하는 디엘로테라피가 되겠습니다. 감사합니다~^^</p>
	</div>
	
	<div class="text_section">
        <h3>전화번호</h3>
        <p>0504-3182-5476</p>
    </div>
    
    <div class="text_section">
      <h3>영업시간</h3>
       <p>오전 11시 ~ 다음날 새벽 4시 영업 </p>
    </div>

	<div class="text_section">
     <h3>휴무일</h3>
     <p>폰OFF : 마감OR랜덤휴무</p>
    </div>

	<div class="text_section">
        <h3>관리사 정보</h3>
        <p>전원 2,30대 한국인 여성 관리사<br>
		<br>
		☆피부관리사 ,미용사 자격증보유☆<br>
		☆마사지&amp;테라피 교육프로그램이수☆<br>
		☆국제 두피 전문가협회소속.교육☆</p>
    </div>


	<div class="text_section">
       	<h3>원장님 경력</h3>
        	<p>☆피부관리사 ,미용사 자격증보유☆<br>
		☆마사지&amp;테라피 교육프로그램이수☆<br>
		☆국제 두피 전문가협회소속.교육☆</p>
    </div>


	<div class="text_section">
          <h3>주차정보</h3>
          <p>건물 옆 무료 주차<br>
		수도권 / 2호선 / 강남역 1번 출구 도보 4분</p>
    </div>

	<div class="text_section">
        <h3>주소</h3>
        <p>서울 강남구 테헤란로6길 26</p>
   	</div>

	<div class="text_section">
       	<div class="uio__warn">
         	<p><strong class="h2">주의사항</strong></p>
            <ul class="items">
               <li>강남 역삼동 디엘로테라피 100% 예약제! 입실 후 선불 결제 이십니다.</li>
               <li>예약시간 10분 초과시 예약이 자동 취소되세요.</li>
               <li>과음, 룰&amp;코스거부, 비매너, 비핸폰, 무발신자 등은 예약불가하세요.</li>
               <li>퇴폐, 불법, 무단&amp;상습캔슬 등은 예약불가하세요.</li>
               <li>부재시 문자(희망예약시간+코스)부탁드려요^^</li>
       		</ul>
        </div>
   </div>

</div>


<div class="panel-main-line"></div>



<div id="pan3_review" style="margin-top:50px">
	
	<div id="pan3_tab_menu">
		<div class="tab_menu" style="background-color:white"><a href="#pan1_course" style="text-decoration:none"><span style="font-size:20px;font-weight:bold;color:#333">코스정보</span></a></div>
		<div class="tab_menu" style="background-color:white"><a href="#pan2_store" style="text-decoration:none"><span style="font-size:20px;font-weight:bold;color:#333">업체정보</span></a></div>
		<div class="tab_menu" style="background-color:#333"><a href="#pan3_review" style="text-decoration:none"><span style="font-size:20px;font-weight:bold;color:white">방문후기(갯수)</span></a></div>
	</div>



		<div id="shop_review_div_box" class="reviewbox">
		
			<div id="review_chart">
				<header>
					<h3>방문후기</h3>
					<a
						href="https://www.makangs.com/review.php?code=4583&amp;back=%2Fshop.php%3Fcode%3D4583"
						class="more">더보기</a>
				</header>

				<section class="reviewbox_summary">
					<p class="total">
						<strong>4</strong>명이 참여
					</p>
					<a
						href="https://www.makangs.com/bbs/write.php?bo_table=review&amp;code=4583&amp;back=%2Fshop.php%3Fcode%3D4583"
						class="post">리뷰쓰기</a>
				</section>
				<!-- // .reviewbox__summary -->

				<div class="reviewbox_contents">


					<div class="reviewbox_graphs">
						<ul class="wraps">
							<li>
								<p class="lab lab-10">
									<span>"재방문 의사 있어요"</span> <strong>3</strong>
								</p> <i class="fill" style="width: 25.00%"></i>
							</li>
							<li>
								<p class="lab lab-2">
									<span>"편안해요"</span> <strong>2</strong>
								</p> <i class="fill" style="width: 16.67%"></i>
							</li>
							<li>
								<p class="lab lab-3">
									<span>"청결해요"</span> <strong>2</strong>
								</p> <i class="fill" style="width: 16.67%"></i>
							</li>
						</ul>
					</div>
					<p style="height: 60px;"></p>
					<!-- // .reviewbox__graphs -->
				</div>
			</div>
			
			
			<div id="mk__review_list">
				<div class="reviewbox__articles">

					<dl class="article">
						<dt>
							<div class="figure">
								<img src="${ctp}/images/level/level-icon-1@2x.png"
									alt="이모티콘">
							</div>
							<p class="usr">
								<strong class="name">조용한소음 </strong><br/><span class="date">2024-06-17</span>
							</p>

						</dt>
						<dd>

							<div class="memo is--limit">

								<div class="memo-text">시간도 낙낙히 해주시고 마사지도 잘 받고 갑니다</div>
							</div>
							<!-- // .memo -->

							<div class="reactions">
								<ul class="items">
									<li class="react react-2"><span>편안해요</span></li>
									<li class="react react-3"><span>청결해요</span></li>
									<li class="react react-10"><span>재방문 의사 있어요</span></li>
								</ul>
							</div>
							<!-- // .reactions -->


							<div class="notify-block-group-button"></div>

						</dd>
					</dl>
					<!-- // .article -->

					<!-- // .article-play -->

					<dl class="article">
						<dt>
							<div class="figure">
								<img src="${ctp}/images/level/level-icon-1@2x.png"
									alt="이모티콘">
							</div>
							<p class="usr">
								<strong class="name">다이어트중마주친치킨 </strong><br/><span class="date">2024-06-17</span>
							</p>

						</dt>
						<dd>

							<div class="memo is--limit">

								<div class="memo-text">지금까지 받아본 관리 중에 제일이었어요</div>
							</div>
							<!-- // .memo -->

							<div class="reactions">
								<ul class="items">
									<li class="react react-2"><span>편안해요</span></li>
									<li class="react react-3"><span>청결해요</span></li>
									<li class="react react-10"><span>재방문 의사 있어요</span></li>
								</ul>
							</div>
							<!-- // .reactions -->


							<div class="notify-block-group-button"></div>

						</dd>
					</dl>
					<!-- // .article -->

					<!-- // .article-play -->

					<dl class="article">
						<dt>
							<div class="figure">
								<img src="${ctp}/images/level/level-icon-1@2x.png"
									alt="이모티콘">
							</div>
							<p class="usr">
								<strong class="name">역기드는그녀 </strong><br/> <span class="date">2024-04-21</span>
							</p>

						</dt>
						<dd>

							<div class="memo is--limit">

								<div class="memo-text">올해 받은 관리 중 최고입니다. 실력 굿 친절도 굿굿이에요 !!</div>
							</div>
							<!-- // .memo -->

							<div class="reactions">
								<ul class="items">
									<li class="react react-6"><span>가성비가 좋아요</span></li>
									<li class="react react-7"><span>꼼꼼해요</span></li>
									<li class="react react-8"><span>친절해요</span></li>
								</ul>
							</div>
							<!-- // .reactions -->


							<div class="notify-block-group-button"></div>

						</dd>
					</dl>
					<!-- // .article -->

					<!-- // .article-play -->

					<dl class="article">
						<dt>
							<div class="figure">
								<img src="${ctp}/images/level/level-icon-1@2x.png"
									alt="이모티콘">
							</div>
							<p class="usr">
								<strong class="name">브레오스 </strong><br/> <span class="date">2024-04-19</span>
							</p>

						</dt>
						<dd>

							<div class="memo is--limit">

								<div class="memo-text">
									그동안의 피로가 다 날라감.<br> 재방문 의사 있음
								</div>
							</div>
							<!-- // .memo -->

							<div class="reactions">
								<ul class="items">
									<li class="react react-1"><span>고급스러워요</span></li>
									<li class="react react-7"><span>꼼꼼해요</span></li>
									<li class="react react-10"><span>재방문 의사 있어요</span></li>
								</ul>
							</div>
							<!-- // .reactions -->


							<div class="notify-block-group-button"></div>

						</dd>
					</dl>
					<!-- // .article -->

					<!-- // .article-play -->


				</div>
				<!-- // .reviewbox__articles -->


			</div>
			<!-- // .reviewbox__conts -->

		</div>


























	</div>


<script>
  $('a').click(function () {
    $('html, body').animate({
      scrollTop: $($.attr(this, 'href')).offset().top
    }, 500);
    return false;
  });
</script>





<!-- footer 영역 -->
<jsp:include page="/include/footer.jsp" />

</body>
</html>