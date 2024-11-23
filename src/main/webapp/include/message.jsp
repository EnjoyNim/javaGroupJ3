<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
	<script type="text/javascript">
		
		'use strict';
		
		// 메시지를 보여주기 싫으면 호출하는 쪽에서 NO 를 보내면 된다.
		if("${message}" != "NO") alert("${message}");
		
		// 슬러시가 사이에 몇개 들어가든 상관없다고 한다. 다 한 개로 처리한다.
		location.href="${ctp}/${url}";
		
	</script>
</head>
<body>

</body>
</html>