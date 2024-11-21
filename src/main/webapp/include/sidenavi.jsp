<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>

<link type="text/css" rel="stylesheet" href="${ctp}/css/sidenavi.css">

<script type="text/javascript">
	'use strict';

	// 사이드네비의 섭매뉴를 열거나 닫는다.
	function clickSubMenu(id){
		
        	let el =  $("#"+id);
            
            let subMenuUl =  el.next(".submenu_hr").next(".submenu_ul"); 
    
            // submenu 가 화면상에 보일때는 위로 부드럽게 접고 아니면 아래로 펼치기
            if( subMenuUl.is(":visible") ){
            	
            	el.children(".down_arrow_img").css({"transform":"rotate( 360deg )", "transition":"0.4s"});
            	subMenuUl.slideUp();
            	el.next(".submenu_hr").css({"visibility":"hidden", "height":"0px", "margin-top":"0"});
            	
            	switch(id){
	            	case 'community_box':
	            		commSubMenuIsOpen = false;
	            		break;
	            	case 'myinfo_box':
	            		myinfoSubMenuIsOpen = false;
	            		break;
	            	case 'service_box':
	            		serviceSubMenuIsOpen = false;
	            		break;
	            	default:break;
            	}
            	
            }else{
            	
            	el.children(".down_arrow_img").css({"transform":"rotate( 180deg )", "transition":"0.4s"});
            	el.next(".submenu_hr").css({"visibility":"visible", "height":"1px", "margin-top":"2px"});
	
	            subMenuUl.slideDown();
	            	
	            switch(id){
	            	case 'community_box':
	            		commSubMenuIsOpen = true;
	            		break;
	            	case 'myinfo_box':
	            		myinfoSubMenuIsOpen = true;
	            		break;
	            	case 'service_box':
	            		serviceSubMenuIsOpen = true;
	            		break;
	            	default:break;
	            }
            	
            }
	}
	

	/* 사이드바의 x 표시를 눌러서 닫을때 처리 함수 */
	function closeNav() {
	 	$('.overlay').fadeOut();
	 	/* 사이드네비가 들어갈때는 빠르게 들어가도록하자. */
	 	document.getElementById("mySidenav").style.transition="0.2s";
		document.getElementById("mySidenav").style.width = "0";
		
		// 커뮤니티 화살표를 사이드네비가 닫힐때 원상태로 돌려놓아야한다.
		if(commSubMenuIsOpen){
			commSubMenuIsOpen = false;
			clickSubMenu("community_box");
		}
		
		// 내정보 화살표를 사이드네비가 닫힐때 원상태로 돌려놓아야한다.
		if(myinfoSubMenuIsOpen){
			myinfoSubMenuIsOpen = false;
			clickSubMenu("myinfo_box");
		}
		
		// 고객센터 화살표를 사이드네비가 닫힐때 원상태로 돌려놓아야한다.
		if(serviceSubMenuIsOpen){
			serviceSubMenuIsOpen = false;
			clickSubMenu("service_box");
		}
	}
	

	
</script>

<!-- 사이드네비 영역 css 파일을 jsp 형식으로 만든것을 포함시킴-->
<%-- <jsp:include page="/css/sidenaviCSS.jsp" /> --%>

   <!-- 사이드바 부분 -->
<div id="mySidenav" class="sidenav"> 
   
  
  	<!-- 사이드 네비의 헤더부분은 따로 뺐다. scroll 의 영향없이 항상 고정되도록. -->
   <div id="mySidenav_header" class="sidenav_header">
	  <!--  &times; 는 곱하기 표시 X 를 의미한다. -->
	  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	  
	  <div id="mySidenav_header_content" style="font-size:12px; margin-left:15px" >
	  <img alt="스마일" src="${ctp}/images/img_drop_smile.png" width="30px" height="30px">
	  
	  
	  
	  
	  <c:if test="${not empty sNickName}"> <!--  로그인한 상태에서는 "~~님 환영합니다."  -->
		  <span style="color: black; margin-left:5px; font-size:17px; font-weight:bold">${sNickName}</span>님 환영합니다.
		       <!-- 로그아웃 부분 -->
		  <a href="${ctp}/Logout.main"><span style="color: blue; margin-left:5px">로그아웃</span></a>
	  </c:if>
	  
	  <c:if test="${not empty sStoreName}"> <!--  로그인한 상태에서는 "~~님 환영합니다."  -->
		  <span style="color: black; margin-left:5px; font-size:17px; font-weight:bold">${sStoreName}</span>님 환영합니다.
		       <!-- 로그아웃 부분 -->
		  <a href="${ctp}/Logout.main"><span style="color: blue; margin-left:5px">로그아웃</span></a>
	  </c:if>
	  
	  <c:if test="${empty sNickName && empty sStoreName}">
	 	 <a href="${ctp}/Login.main"><span style="color: blue; margin-left:5px">로그인</span></a> 또는 <a href="${ctp}/MemberJoin.main"><span style="color:blue;">회원가입</span></a>을 해주세요
	  </c:if>
	  
	  </div>
  
  </div>
  
  <br/><br/><br/><br/>
  
  
  <div onclick="location.href='${ctp}'" style="cursor:pointer;">
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
  	<div id="community_box" style="cursor:pointer;">
    	<img alt="커뮤니티아이콘" src="${ctp}/images/ico_community.png" width="20px" height="20px" class="menu_img">                   
		<span class="menu_label_span">커뮤니티</span>
	 	<img class="down_arrow_img" alt="아래펼침꺽쇠" src="${ctp}/images/ico_down_arrow.png">             
 	</div>
  	<hr class="submenu_hr"/>
  	  					
  	<ul class="submenu_ul" style="cursor:pointer;">
  		<li onclick="location.href='#';">공지사항</li><br/>
  		<li onclick="location.href='#';">공식블로그</li>
  	</ul>
  </div>
  <hr/>
 
 
   <div>
  	<div id="myinfo_box" style="cursor:pointer;">
    	<img alt="사람아이콘" src="${ctp}/images/ico_user.png" width="20px" height="20px" class="menu_img">                   
		<span class="menu_label_span">내정보</span>
	 	<img class="down_arrow_img" alt="아래펼침꺽쇠" src="${ctp}/images/ico_down_arrow.png">             
 	</div>
  	<hr class="submenu_hr"/>
  	  					
  	<ul class="submenu_ul" style="cursor:pointer;">
  		<li onclick="location.href='#';">회원가입</li><br/>
  		<li onclick="location.href='#';">내포인트</li><br/>
  		<li onclick="location.href='#';">내쿠폰함</li><br/>
  		<li onclick="location.href='#';">내 좋아요 제휴점</li><br/>
  		<li onclick="location.href='#';">내 방문후기</li>
  	</ul>
  </div>
  <hr/>
  
  
  <div>
  	<div id="service_box" style="cursor:pointer;">
    	<img alt="헤드셋아이콘" src="${ctp}/images/ico_user.png" width="20px" height="20px" class="menu_img">                   
		<span class="menu_label_span">고객센터</span>
	 	<img class="down_arrow_img" alt="아래펼침꺽쇠" src="${ctp}/images/ico_down_arrow.png">             
 	</div>
  	<hr class="submenu_hr"/>
  	  					
  	<ul class="submenu_ul" style="cursor:pointer;">
  		<li onclick="location.href='#';">1:1채팅</li><br/>
  		<li onclick="location.href='#';">자주묻는질문</li><br/>
  		<li onclick="location.href='#';">제휴입점신청</li><br/>
  		<li onclick="location.href='#';">마캉스정보</li>
  	</ul>
  </div> 
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
  
  
  <div>
  	
  
  </div>
  
  
  
</div>


<!-- 사이드바 외부클릭시 체크용으로 사용되는 div 이다. 이 div 가 클릭되면 사이드바를 닫는다 -->
<div class="overlay"></div>