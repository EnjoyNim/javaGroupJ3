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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://kit.fontawesome.com/1e682223ad.js"
	crossorigin="anonymous"></script>
<link type="text/css" rel="stylesheet" href="css/main.css">


<script type="text/javascript">
	
	// 이 페이지가 로딩될때 처리
	$(document).ready(function(){
	
        // 햄버거 매뉴에 onclick 함수를 지정한다. 클릭시 사이드바 표시
        $(document).on("click", "#hamburger-menu", function (e){
        	document.getElementById("mySidenav").style.width = "250px";
        	$('.overlay').fadeIn(); 
        });
 
         // overlay div 에 onclick 함수를 지정한다. 클릭시 사이드바 닫기
        $('.overlay').on('click', function () {
            $('.overlay').fadeOut();
        	document.getElementById("mySidenav").style.width = "0";
        }); 
         
    });
	

	/* 사이드바의 x 표시를 눌러서 닫기시 처리 함수 */
	function closeNav() {
	 	$('.overlay').fadeOut();
		document.getElementById("mySidenav").style.width = "0";
	}
	
		
</script>

</head>

<!-- 폰트어썸
gidori_1@naver.com
고마워요11% -->


<body>

	<div id="header-div">

		<p id="logo-p">
			<img src="${ctp}/images/logo.svg" alt="마사지 타이쿤"
				onclick="location.href='${ctp}';">
		</p>

		<form method="get" action="search_list.list" id="search-form"
			autocomplete="off">
			<input type="text" name="keyword" id="search-txt"
				placeholder="검색어를 입력해주세요." required>
			<button id="search-btn" type="submit">
				<i class="fa-solid fa-magnifying-glass"></i>
			</button>
		</form>

		<!-- "Hamburger menu" / "Bar icon" to toggle the navigation links -->
		<a href="javascript:void(0);" class="icon" id="hamburger-menu"> 
		<i class="fa fa-bars"></i></a>
	</div>



<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="#">About</a>
  <a href="#">Services</a>
  <a href="#">Clients</a>
  <a href="#">Contact</a>
</div>


<div class="overlay"></div>

</body>
</html>
