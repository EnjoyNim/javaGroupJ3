<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
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
  
</head>

<!-- 폰트어썸
gidori_1@naver.com
고마워요11% -->


<body>

<!-- Top Navigation Menu -->
<div class="topnav">
  <a href="#home" class="active">Logo</a>
  
  <!-- Navigation links (hidden by default) -->
  <div id="myLinks">
    <a href="#news">News</a>
    <a href="#contact">Contact</a>
    <a href="#about">About</a>
  </div>
  
  <!-- "Hamburger menu" / "Bar icon" to toggle the navigation links -->
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
</div>






    <div class="in">
        <p><img src="${ctp}/images/logo.svg" alt="마사지 타이쿤" style="cursor: pointer" 
        onclick="location.href='${ctp}';"></p>

          
            <form method="get" action="search_list.list" id="search-box" autocomplete="off">
                <input type="text" name="keyword" id="search-txt" placeholder="검색어를 입력해주세요." required>
                <button id="search-btn" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
    </div>







<!-- 본문영역 -->
<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-4">
		<p> 안녕하세요 </p>
	</div>
  </div>
</div>


</body>
</html>
