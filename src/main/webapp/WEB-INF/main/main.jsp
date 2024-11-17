<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Massage Tycoon</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/include/bs4.jsp" />

<!-- hamburger 매뉴를 위한 css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://kit.fontawesome.com/1e682223ad.js" crossorigin="anonymous"></script>
<link type="text/css" rel="stylesheet" href="css/main.css">

<script type="text/javascript">
	'use strict';
	
	let commSubMenuIsOpen = false;
	
	// 이 페이지가 로딩될때 처리
	$(document).ready(function(){
	
        // 햄버거 매뉴에 onclick 함수를 지정한다. 클릭시 사이드바 표시
        $(document).on("click", "#hamburger_menu", function (e){
        						// sidenav 의 너비는 270px 정도
        	document.getElementById("mySidenav").style.width = "270px";
        	$('.overlay').fadeIn(); 
        });
 
         // overlay div 에 onclick 함수를 지정한다. 클릭시 사이드바 닫기
        $('.overlay').on('click', closeNav); 
     	// community_box 를 클릭시 처리할 함수를 등록
        $("#community_box").click(closeCommBox);
    });
	
	
	function closeCommBox(){
            //클릭된 태그의 자식 태그중 ul 태그에 hide 클래스를 넣든지 빼든지 한다.(class hide 에 정의된 css 가 삭제되거나 적용됨)
            //$(this).children("ul").toggleClass("hide");
        
            // next 는 바로 다음요소이고 다다음 요소는 이렇게 next next 로 해야한다.
            // 참고로 prev 는 앞의 요소임
            let submenu =  $("#community_box").next(".submenu_hr").next(".submenu_ul"); 
            
            // submenu 가 화면상에 보일때는 위로 부드럽게 접고 아니면 아래로 펼치기
            if( submenu.is(":visible") ){
            	
            	submenu.slideUp();
            	
            	$("#community_box").next(".submenu_hr").css({"visibility":"hidden", "height":"0px", "margin-top":"0"});
            	
            	// remove() :선택된요소를 포함, 하위요소들을 제거 == 요소자체를 지운다
            	// empty() : 선택된 요소의 하위요소들만 제거 == 요소자체가 아니라 내용을 지운다
            	//$("#community_box hr" ).remove();
            	
            }else{
            	
            	//submenu.before("<hr/>"); // submenu 앞에 원하는 요소를 추가
            	
            	$("#community_box").next(".submenu_hr").css({"visibility":"visible", "height":"1px", "margin-top":"2px"});

                submenu.slideDown();
            }
	}
	

	/* 사이드바의 x 표시를 눌러서 닫기시 처리 함수 */
	function closeNav() {
	 	$('.overlay').fadeOut();
		document.getElementById("mySidenav").style.width = "0";
		
		// 커뮤니티 화살표를 사이드네비가 닫힐때 원상태로 돌려놓아야한다.
		if(commSubMenuIsOpen){
			
			document.getElementById("community_arrow_img").style.transform = "rotate( 360deg )";
			
			commSubMenuIsOpen = false;
			
			closeCommBox();
		}
	}
	
	
	
	/*  이런식으로 jquery 에서 css 에 접근할 수 있다.
	rotated = false;
	$('.pointer').click(function(){
	  elem = this;
	  
	  $({rotation: 225*rotated}).animate({rotation: 225*!rotated}, {
	    duration: 500,
	    step: function(now) {
	      $(elem).css({'transform' : 'rotate('+ now +'deg)'});
	    }
	  });
	  rotated=!rotated;
	});*/
	
	
	// 사이드바의 커뮤니티 항목을 클릭하면 
	function clickCommunityMenu(){
		// 이렇게 해당 요소의 style 에 접근해서 속성에 값을 줄 수 있다.
		// 사이드네비가 닫힐때 원상태로 돌려놓아야한다.
		if(!commSubMenuIsOpen){ // 원래상태를 기준으로 하기에 bool 변수를 줘서 180, 360 으로 처리해야한다.
			document.getElementById("community_arrow_img").style.transform = "rotate( 180deg )";
			document.getElementById("community_arrow_img").style.transition = "0.4s";
			commSubMenuIsOpen = true;
		}else{ // 원상태로 되돌린다.
			document.getElementById("community_arrow_img").style.transform = "rotate( 360deg )";
			document.getElementById("community_arrow_img").style.transition = "0.4s";
			commSubMenuIsOpen = false;
		}
	}
	


	
</script>

</head>

<!-- 폰트어썸
gidori_1@naver.com
고마워요11% -->


<body>

  <!-- 헤더 부분 -->
	<div id="header_div">
		<p id="logo_p">
			<img src="${ctp}/images/logo.svg" alt="마사지 타이쿤" onclick="location.href='${ctp}';">
		</p>

		<form method="get" action="search_list.list" id="search_form"
			autocomplete="off">
			<input type="text" name="keyword" id="search_txt"
				placeholder="검색어를 입력해주세요." required>
			<button id="search_btn" type="submit">
				<i class="fa-solid fa-magnifying-glass"></i>
			</button>
		</form>

		<!-- "Hamburger menu" / "Bar icon" to toggle the navigation links -->
		<a href="javascript:void(0);" class="icon" id="hamburger_menu"> 
		<i class="fa fa-bars"></i></a>
	</div>








   <!-- 사이드바 부분 -->
<div id="mySidenav" class="sidenav"> 
   
  
  	<!-- 사이드 네비의 헤더부분은 따로 뺐다. scroll 의 영향없이 항상 고정되도록. -->
   <div id="mySidenav_header" class="sidenav_header">
	  <!--  &times; 는 곱하기 표시 X 를 의미한다. -->
	  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	  
	  <div id="mySidenav_header_content" style="font-size:12px; margin-left:15px" >
	  <img alt="스마일" src="${ctp}/images/img_drop_smile.png" width="30px" height="30px">
	  <a href="#"><span style="color: blue; margin-left:5px">로그인</span></a> 또는 <a href="#"><span style="color:blue;">회원가입</span></a>을 해주세요
	  </div>
  
  </div>
  
  <br/><br/><br/><br/>
  
  
  
 
  <div onclick="#" style="cursor:pointer;">
	  <img alt="홈아이콘" src="${ctp}/images/ico_home_empty.png" width="20px" height="20px" class="menu_img">
	  <span class="menu_label_span">홈</span>
  </div>
  <hr/>
  

  <div onclick="#" style="cursor:pointer;">
	  <img alt="핀아이콘" src="${ctp}/images/ico_location.png" width="20px" height="20px" class="menu_img">
	  <span class="menu_label_span">지역별 마사지</span>
  </div>
  <hr/>
  




  <div>
  	<div id="community_box" onclick="clickCommunityMenu()" style="cursor:pointer;">
    	<img alt="커뮤니티아이콘" src="${ctp}/images/ico_community.png" width="20px" height="20px" class="menu_img">                   
		<span class="menu_label_span">커뮤니티</span>
	 	<img class="arrow_img" id="community_arrow_img" alt="아래펼침꺽쇠" src="${ctp}/images/ico_down_arrow.png">             
 	</div>
  	<hr class="submenu_hr"/>
  	  					
  	<ul class="submenu_ul" style="cursor:pointer;">
  		<li onclick="location.href='#';" style="margin-left:-25px">공지사항</li><br/>
  		<li onclick="location.href='#';" style="margin-left:-25px">공식블로그</li>
  	</ul>
  </div>
  
  <hr/>
 
 
 
 
 
  <div onclick="clickMyInfoMenu()" style="cursor:pointer;">
	  <img alt="사람아이콘" src="${ctp}/images/ico_user.png" width="20px" height="20px" class="menu_img">
	  <span class="menu_label_span" id="myInfo_span">내정보</span>
	  <img class="arrow_img" alt="아래펼침꺽쇠" src="${ctp}/images/ico_down_arrow.png"> 
  
  		<hr class="submenu_hr"/>
  </div>
  <div id="myInfoSubMenu"></div>
  
  
  <hr/>
  
  <div onclick="clickServiceMenu()" style="cursor:pointer;">
	  <img alt=헤드셋아이콘 src="${ctp}/images/ico_headset.png" width="20px" height="20px" class="menu_img">
	  <span class="menu_label_span" id="service_span">고객센터</span>
	  <img class="arrow_img" alt="아래펼침꺽쇠" src="${ctp}/images/ico_down_arrow.png"> 
      <hr class="submenu_hr"/>
  </div>
  <div id="serviceSubMenu"></div>
  
  
  <hr/>
  

  <div onclick="#" style="cursor:pointer;">
	  <img alt="이벤트아이콘" src="${ctp}/images/ico_event.png" width="20px" height="20px" class="menu_img">
	  <span class="menu_label_span">이벤트</span>
  </div>
  <hr/>
  

  <div onclick="#" style="cursor:pointer;">
	  <img alt="가방아이콘" src="${ctp}/images/ico_bag.png" width="20px" height="20px" class="menu_img">
	  <span class="menu_label_span">기획전</span>
  </div>

  <hr/>
  
</div>


<!-- 사이드바 외부클릭시 체크용으로 사용되는 div 이다. 이 div 가 클릭되면 사이드바를 닫는다 -->
<div class="overlay"></div>















 <!-- 화면 하단의 네비게이션 -->
<footer>
 <div id="footer_div">
   
   <div class="footer_left_div">
 		
 		<div id=location_div class="footer_item">
 			<a href="https://www.naver.com/" style="text-decoration-line:none">
 				<img alt="지역" src="${ctp}/images/ico_location.png" class="footer_img"><br/>
 				<span class="footer_span" style="color:black">지역</span>
 			</a>
 		</div>
 		
 		
 		<div id=nearby_div class="footer_item">
 			<a href="https://www.daum.net/" style="text-decoration-line:none">
 				<img alt="내주변" src="${ctp}/images/ico_navigator.png" class="footer_img"><br/>
 				<span class="footer_span" style="color:black">내주변</span>
 			</a>
 		</div>
 	</div>
 	
 	
	 	<!-- 가운데 동근란 홈 밑에 깔려지는 사각형 div -->
	<div class="footer_center_div">
		 <div id=home_circle_div class="footer_item">
		 	<a href="${ctp}" style="text-decoration-line:none">
		 		<img alt="홈" src="${ctp}/images/ico_home_fill.png" class="footer_img" id="home_img">
		 	</a>
		 </div>
	</div>
 	
 	
 	<div class="footer_right_div">
 	
 		<div id=community_div class="footer_item">
 			<a href="${ctp}" style="text-decoration-line:none">
 				<img alt="커뮤니티" src="${ctp}/images/ico_community.png" class="footer_img"><br/>
 				<span class="footer_span" style="color:black">커뮤니티</span>
 			</a>
 		</div>
 		
 		<div id=myinfo_div class="footer_item" >
 			<a href="${ctp}" style="text-decoration-line:none">	
 				<img alt="내정보" src="${ctp}/images/ico_user.png" class="footer_img"><br/>
 				<span class="footer_span" style="color:black">내정보</span>
 			</a>
 		</div>
 	</div>
 </div>

</footer>



</body>
</html>
