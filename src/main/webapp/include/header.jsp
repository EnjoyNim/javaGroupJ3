<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>

<!-- 부트스트랩 사용을 위한 추가, 여기에 jquery cdn 도 이미 들어가 있다. -->
<jsp:include page="/include/bs4.jsp" />

<link type="text/css" rel="stylesheet" href="css/header.css">

<!-- hamburger 매뉴를 위한 css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 
<!-- 헤더 검색창의 돋보기를 사용하기 위한 cdn -->
<script src="https://kit.fontawesome.com/1e682223ad.js" crossorigin="anonymous"></script>
 

<script type="text/javascript">
	'use strict';
	
	let commSubMenuIsOpen = false;
	let myinfoSubMenuIsOpen = false;
	let serviceSubMenuIsOpen = false;
	            		
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
         
     	// community_box 를 클릭시 처리할 함수를 등록, jquery 에서 매개변수가 있는 함수 등록시에는 이렇게 한단다..
        $("#community_box").on('click', clickSubMenu.bind(null, 'community_box'));
     	// myinfo_box 를 클릭시 처리할 함수를 등록
        $("#myinfo_box").on('click', clickSubMenu.bind(null, 'myinfo_box'));
     	// service_box 를 클릭시 처리할 함수를 등록
        $("#service_box").on('click', clickSubMenu.bind(null, 'service_box'));
    });
	
</script>
	
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