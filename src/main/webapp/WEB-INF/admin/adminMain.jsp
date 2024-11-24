<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>adminMain.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  
  
    <script>
    'use strict';
    
    // 사용자 페이지 설정
    function pageSizeChange() {
    	let pageSize = document.getElementById("pageSize").value;
    	location.href = "BoardList.ad?pageSize="+pageSize+"&pag=1";
    }
    
    // 입점처리 버튼을 누르면 호출
    function addAlliance(storeId) {
    	$.ajax({
			url:"AddAlliance.ad",
			data:{"storeId": storeId},
			method:"get",
			success:function(res){
				console.log("res", res);
				// 모달에 html 결과를 지정해줌
				$("#myModal #modalContent").html(res);
			},
			error:function(){
				alert("전송오류");
			}
		});
    }

    function cancelAlliance(content) {
    	$("#myModal #modalContent").html(content);
    	/* 
    	$("#myModal").modal({
        fadeDuration: 1000,
        fadeDelay: 0.5,
      });
    	*/
    }
    
    function cursorMove() {
    	document.getElementById("searchString").focus();
    }
    
    // 전체 선택
    function allCheck() {
    	for(let i=0; i<myform.idxFlag.length; i++) {
    		myform.idxFlag[i].checked = true;
    	}
    }
    
    // 전체 해제
    function allReset() {
    	for(let i=0; i<myform.idxFlag.length; i++) {
    		myform.idxFlag[i].checked = false;
    	}
    }
    
    // 선택반전
    function reverseCheck() {
    	for(let i=0; i<myform.idxFlag.length; i++) {
    		myform.idxFlag[i].checked = !myform.idxFlag[i].checked;
    	}
    }
    
    // 선택항목 삭제
    function selectDeleteCheck() {
    	let idxSelectArray = "";
    	
    	for(let i=0; i<myform.idxFlag.length; i++) {
    		if(myform.idxFlag[i].checked) idxSelectArray += myform.idxFlag[i].value + "/";
    	}
    	idxSelectArray = idxSelectArray.substring(0,idxSelectArray.length-1);
    	
    	if(idxSelectArray == "") {
    		alert("삭제할 항목을 선택하세요");
    		return false;
    	}
    	let ans = confirm("선택항목을 모두 삭제 처리 하시겠습니까?");
    	if(!ans) return false;
    	
    	$.ajax({
    		type : "post",
    		url  : "BoardSelectDelete.ad",
    		data : {idxSelectArray : idxSelectArray},
    		success:function(res) {
    			if(res != "0") {
    				alert("선택된 게시물들을 모두 삭제처리 했습니다.");
    				location.reload();
    			}
    			else alert("게시물 삭제 실패~~");
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
    
    
    // 모달에서 아래의 전역변수에 값을 채운다.
    let voJsonArray = new Array();
    let svoJsonObj = new Object();
    let sprvoJsonObj = new Object();
    // 이미지 파일이름 저장용 전역변수
    let form = new FormData();
    
    function closeModal(){
    	
    	// 모달 열려있으면 닫기, 닫혀있으면 연다.
    	$(function () {
    		   $('#modal').modal('toggle');
    		});

    	
    	
    	console.log("svoJsonObj.email:", svoJsonObj.email);

    	
    	$.ajax({
    		type:"post",
			url:"AddAllianceOk.ad",
			async    : false, 
				// Json 이든 JsonArray 이든 모두 보낼때는  JSON.stringify() 를 해야한다.
			data:{"voJsonArray": JSON.stringify(voJsonArray)},
			success:function(res){
				//alert("res1:"+res+", 회신 받음");
			},
			error:function(){
				//alert("json 전송오류");
			}
		});
    	
    	
    	$.ajax({
    		type:"post",
			url:"PhotoViewAjax",   // multipart/form-data 는 이상하게 확장자 패턴이 안된다고 한다. 그래서 디렉토리 패턴으로.
			async    : false,  // 여러개의 ajax 통신을 할려면 ajax 끼리 동기화해야한다. 안그러면 서버로 갈때 마구 섞인다고 한다.
			enctype:"multipart/form-data",
				// Json 이든 JsonArray 이든 모두 보낼때는  JSON.stringify() 를 해야한다.
			data:form,
			processData: false,   // false 는 있는 그대로 처리해라라는 의미
    		contentType: false,
    		cache: false, // 필수는 아님
    		timeout: 6000, // 타임아웃 초값, 필수는 아님
			success:function(res){
				//alert("res2:"+res+", 회신 받음");
				// 페이지 리로딩
				location.reload();
			},
			error:function(){
				//alert("사진전송 전송오류");
			}
		});
    	
    		
    }
  </script>
</head>

<!-- 헤더와 푸터를 고정시켰기에 바디태그 페딩탑에 헤더높이 70, 페딩바텀에 푸터높이 80 줘야함  -->
<body style="padding-top:70px; padding-bottom:80px">
<!-- 헤더영역 -->
<jsp:include page="/include/header.jsp" />
<!-- 사이드네비 영역 -->
<jsp:include page="/include/sidenavi.jsp" />


<p><br/></p>
<div class="container" style="width:100%">
  <h2 class="text-center">스토어 리스트</h2>
  
  <table class="table table-borderless mt-3 mb-0 p-0">
    <tr>
      <td class="text-left">
        <input type="button" value="전체선택" onclick="allCheck()" class="btn btn-success btn-sm mr-1"/>
        <input type="button" value="전체취소" onclick="allReset()" class="btn btn-warning btn-sm mr-1"/>
        <input type="button" value="선택반전" onclick="reverseCheck()" class="btn btn-info btn-sm mr-1"/>
        <input type="button" value="선택항목삭제" onclick="selectDeleteCheck()" class="btn btn-danger btn-sm mr-1"/>
      </td>
      <td class="text-right">한페이지 분량 :
        <select name="pageSize" id="pageSize" onchange="pageSizeChange()">
          <option value="5"  <c:if test="${pageSize == 5}"  >selected</c:if>>5건</option>
          <option value="10" <c:if test="${pageSize == 10}" >selected</c:if>>10건</option>
          <option value="15" <c:if test="${pageSize == 15}" >selected</c:if>>15건</option>
          <option value="20" <c:if test="${pageSize == 20}" >selected</c:if>>20건</option>
          <option value="30" <c:if test="${pageSize == 30}" >selected</c:if>>30건</option>
          <option value="30" <c:if test="${pageSize == 50}" >selected</c:if>>50건</option>
        </select>
      </td>
    </tr>
  </table>
  
  
  <form name="myform">
	  <table class="table table-hover text-center">
	    <tr class="table-secondary">
	      <th>번호</th>
	      <th>샵아이디</th>
	      <th>샵이름</th>
	      <th>담당자이름</th>
	      <th>담당자연락처</th>
	      <th>연락가능시간</th>
	      <th>문의사항</th>
	      <th>신청일</th>
	      <th>진행</th>
	      <th>처리</th>
	    </tr>
	    <c:set var="curScrStartNo" value="${curScrStartNo}" />
	    <c:forEach var="vo" items="${vos}" varStatus="st">
		    <tr>
		      <td><input type="checkbox" name="idxFlag" id="idxFlag${vo.idx}" value="${vo.idx}" /> ${curScrStartNo}</td>
		      <td class="text-left">${vo.storeId}</td>
		      <td class="text-left">${vo.storeName}</td>
		      <td class="text-left">${vo.contactName}</td>
		      <td class="text-left">${vo.contactPhone}</td>
		      <td class="text-left">${vo.contactTime}</td>
		      <td class="text-left">${vo.inquiry}</td>
		      <td class="text-left">${vo.appliedDate}</td>
		      <td class="text-left">${vo.process}</td>
		      
		      						<!-- 신청/취소 상태라면 입점처리 버튼을 보여준다. -->
		      <c:if test="${vo.process=='신청'||vo.process=='취소됨'||vo.process=='작업중'}">
		      		<c:set var="voToProcess" value="${vo}"></c:set>
		      		<td class="text-left"><button type="button" class="btn btn-primary" onclick='addAlliance("${vo.storeId}")' data-toggle="modal" data-target="#myModal">처리</button></td>
		      </c:if>
		      						<!--  입점 상태라면 입점취소 버튼을 보여준다. -->
		      <c:if test="${vo.process=='입점중'}">
		      		<td class="text-left">
		      			<button type="button"  class="btn btn-danger" onclick='cancelAlliance("${vo.storeId}")' data-toggle="modal" data-target="#myModal">입점취소</button>
		      			<button type="button"  class="btn btn-primary" onclick='addAlliance("${vo.storeId}")' data-toggle="modal" data-target="#myModal">처리</button>
		      		</td>
		      </c:if>
		     	  
		    </tr>
		    <c:set var="curScrStartNo" value="${curScrStartNo - 1}" />
	    </c:forEach>
	    <tr><td colspan="5" class="m-0 p-0"></td></tr>
	  </table>
  </form>
  <br/>
</div>

<!-- 블록페이지 시작 -->
<div class="text-center">
  <ul class="pagination justify-content-center">
	  <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="BoardList.ad?level=${level}&pageSize=${pageSize}&pag=1">첫페이지</a></li></c:if>
	  <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="BoardList.ad?level=${level}&pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li></c:if>
	  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize) + blockSize}" varStatus="st">
	    <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="BoardList.ad?level=${level}&pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
	    <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="BoardList.ad?level=${level}&pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
	  </c:forEach>
	  <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="BoardList.ad?level=${level}&pageSize=${pageSize}&pag=${(curBlock+1)*blockSize+1}">다음블록</a></li></c:if>
	  <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="BoardList.ad?level=${level}&pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li></c:if>
  </ul>
</div>
<!-- 블록페이지 끝 -->
<br/>

<!-- 검색기 시작 -->
<div class="container text-center">
  <form name="searchForm" method="post" action="BoardSearchList.bo">
    <b>검색 : </b>
    <select name="search" id="search" onchange="cursorMove()">
      <option value="title">글제목</option>
      <option value="nickName">글쓴이</option>
      <option value="content">글내용</option>
    </select>
    <input type="text" name="searchString" id="searchString" required />
    <input type="submit" value="검색" class="btn btn-secondary btn-sm"/>
  </form>
</div>
<!-- 검색기 끝 -->


<!-- The Modal            data-backdrop="static" data-keyboard="false" 을 추가해주면 모달의 밖을 클릭해도 닫히지 않는다.                    -->
<div class="modal fade" id="myModal" data-backdrop="static" data-keyboard="false" style="width:80vw">
					 	<!--여기서 modal-lg 를 주면 모달이 커진다.(800px) 더 큰건 modal-xl(1140px),  아무것도 안주면 500px,  modal-sm 은 300px -->
  <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title">처리</h3>
        <button type="button" class="close" data-dismiss="modal">×</button>
      </div>
      <div class="modal-body">
        <div id="modalContent">
        	
        
        
        
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>





<!-- footer 영역 -->
<jsp:include page="/include/footer.jsp" />
</body>
</html>