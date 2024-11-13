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
	
	// 처음에는 모달창을 숨겨 놓는다.
	$(document).ready(function() {
		$(".modal a").not(".dropdown-toggle").on("click", function() {
			$(".modal").modal("hide");
		});
	});

	function hamburgerClick() {
		alert("햄버거 클릭 됨");
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
		<a href="javascript:void(0);" class="icon" data-toggle="modal" data-target="#sidebar-right" id="hamburger-menu"> 
		<i class="fa fa-bars"></i></a>
	</div>


	<!-- 모달을 이용한 오른쪽 사이드바 -->
	<div class="modal fade right" id="sidebar-right" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" >
							<!-- 닫기 X 표시 -->
						<h3><span style="text-align:left"> &times;</span></h3>   
						<!-- <span aria-hidden="true">&times;</span> -->
					</button>
					 <!-- <h4 class="modal-title">모달 사이드바</h4> -->
				</div>
				<div class="modal-body">

					<ul class="nav nav-pills nav-stacked text-center lead">
						<li role="presentation" class="active"><a href="#home">Home</a></li>
						<li role="presentation" class="dropdown">
							<a href="#" class="dropdown-toggle" id="myTabDrop1" 
							data-toggle="dropdown" aria-controls="myTabDrop1-contents" aria-expanded="false">Services
									<span class="fa fa-fw fa-chevron-down"></span>
							</a>
							<ul class="dropdown-menu btn-block">
								<li><a href="#design" role="tab">Design</a></li>
								<li><a href="#develop" role="tab">Develop</a></li>
								<li><a href="#support" role="tab">Support</a></li>
							</ul></li>
						<li role="presentation"><a href="#about">About</a></li>
					</ul>

					<hr>

					<div class="form-group hide">
						<div class="input-group">
							<input class="form-control" placeholder="Search"> <span
								class="input-group-btn">
								<button class="btn btn-default" type="button">
									<i class="fa fa-fw fa-search"></i>
								</button>
							</span>
						</div>
					</div>

					<div class="form-group has-feedback">
						<input type="text" class="form-control" id="search-right"
							placeholder="Search"> <span
							class="glyphicon glyphicon-search form-control-feedback"
							aria-hidden="true"></span>
					</div>

					<hr>

					<div class="btn-group-vertical center-block">
						<a class="btn btn-instagram btn-lg"
							href="https://www.instagram.com/jorenerene/" target="_blank"><i
							class="fa fa-fw fa-instagram"></i></a> <a
							class="btn btn-twitter btn-lg"
							href="https://www.twitter.com/jorenerene/" target="_blank"><i
							class="fa fa-fw fa-twitter"></i></a> <a class="btn btn-github btn-lg"
							href="https://www.github.com/jorenerene/" target="_blank"><i
							class="fa fa-fw fa-github"></i></a>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>
