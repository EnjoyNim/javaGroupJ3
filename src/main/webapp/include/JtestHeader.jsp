<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- JtestHeader.jsp -->
<%
/* 클라에서 넘어온 request 객체의 매개변수를 얻어와서 처리, 입력없이 이 페이지에 왔으면 null 값이 온다. */
//String id = request.getParameter("inputId")==null ? "" : request.getParameter("inputId");

String id = (String)request.getAttribute("inputId");
%>

	<script>
		'use strict';
		// 로그인없이 운영자관리 페이지 주소를 입력하면 inputId 값은 null 이 넘어오고 위에서 공백값으로 치환되어
		// 여기에서 공백값과 비교가 참이 된다. 따라서 로그인후 사용하세요. 경고창이 뜨고 Jtest10.jsp 로 돌려보낸다.
<%-- 		if("<%=id%>" == ''){ --%> 
	if('${id}'==''){  // 이렇게 해도 된다고 함
			alert("로그인후 사용하세요.");
			location.href = "<%=request.getContextPath()%>/study/1015/Jtest11.jsp";
		}
	</script>
	
<div style="width:100%; height:80px; background-color:skyblue">
	<div>접속자:<%=id%></div>
	<nav style="style-align:center">
	 	<a href="Jtest11Member.jsp?inputId=<%=id%>">홈으로</a>|<a href="Jtest11Board.jsp?inputId=<%=id%>">게시판</a>|<a href="Jtest11Guest.jsp?inputId=<%=id%>">방명록</a>|<a href="Jtest11Pds.jsp?inputId=<%=id%>">자료실</a>|<a href="javascript:logoutCheck()">로그아웃</a>
	</nav>
</div>

