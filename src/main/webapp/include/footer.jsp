<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<link type="text/css" rel="stylesheet" href="css/footer.css">
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
		 		<img alt="홈" src="${ctp}/images/ico_home.png" class="footer_img" id="home_img">
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