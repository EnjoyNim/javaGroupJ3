<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <!-- jQuery 와 ajax 사용을 위한 cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title>joinFormPrivate.jsp</title>
<style>
    /* 페이지 기본 설정 */
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #ffffff; /* 배경색 설정 */
        text-align: center; /* 전체 텍스트를 중앙 정렬 */
    }

    /* 폼 전체 컨테이너 */
    .container {
        max-width: 800px; /* 컨테이너 최대 너비 */
        margin: 50px auto; /* 상단/하단 50px, 수평 중앙 정렬 */
        padding: 20px;
    }

    /* 제목 스타일 */
    .title {
        font-size: 24px; /* 제목 글자 크기 */
        font-weight: bold; /* 제목 글자를 굵게 */
        margin-bottom: 10px; /* 제목과 다음 요소 간 간격 */
    }

    /* 설명 텍스트 스타일 */
    .description {
        font-size: 14px; /* 설명 글자 크기 */
        color: #666; /* 설명 글자 색상 */
        margin-bottom: 30px; /* 설명과 폼 사이 간격 */
    }

    /* 폼 필드 그룹 */
    .form-group {
        display: flex; /* 수평 정렬 */
        align-items: center; /* 수직 중앙 정렬 */
        justify-content: space-between; /* 레이블과 필드 간 간격 균등 */
        margin-bottom: 15px; /* 각 필드 간 간격 */
    }

    /* 필드 레이블 스타일 */
    .form-group label {
        flex-basis: 20%; /* 레이블 고정 너비 */
        text-align: left; /* 레이블 텍스트 왼쪽 정렬 */
        font-size: 14px; /* 레이블 글자 크기 */
        font-weight: bold; /* 레이블 글자 굵게 */
        color: #333; /* 레이블 글자 색상 */
        padding-right: 10px; /* 레이블과 입력 필드 간 간격 */
    }

    /* 입력 필드 스타일 */
    .form-group input {
        flex-basis: 75%; /* 입력 필드 고정 너비 */
        padding: 10px; /* 입력 필드 내부 여백 */
        font-size: 14px; /* 입력 필드 글자 크기 */
        border: 1px solid #ddd; /* 입력 필드 테두리 */
        border-radius: 5px; /* 입력 필드 모서리를 둥글게 */
        text-align: left; /* 텍스트를 왼쪽 정렬 */
    }

    /* 핸드폰 및 인증번호 필드 크기 조정 */
    #phone, #verifyCode {
        flex-basis: 75%; /* 핸드폰 및 인증번호 필드 크기 */
    }

    /* 버튼 스타일 */
    .form-group .btn {
        flex-basis: 30%; /* 버튼 크기 */
        margin-left: 10px; /* 버튼과 입력 필드 간 간격 */
        padding: 10px 15px; /* 버튼 내부 여백 */
        font-size: 14px; /* 버튼 글자 크기 */
        background-color: #333; /* 버튼 배경색 */
        color: #fff; /* 버튼 글자 색상 */
        border: none; /* 버튼 테두리 제거 */
        border-radius: 5px; /* 버튼 모서리를 둥글게 */
        cursor: pointer; /* 마우스 커서 */
        text-align: center; /* 버튼 내부 텍스트 중앙 정렬 */
    }

    /* 버튼 호버 효과 */
    .form-group .btn:hover {
        background-color: #555; /* 버튼 호버 시 배경색 변경 */
    }

    /* 제출 버튼 스타일 */
    .submit-btn {
        width: 100%; /* 제출 버튼 전체 너비 */
        padding: 12px;
        font-size: 16px; /* 버튼 글자 크기 */
        background-color: #00bcd4; /* 제출 버튼 배경색 */
        color: #fff; /* 제출 버튼 글자 색상 */
        border: none; /* 제출 버튼 테두리 제거 */
        border-radius: 5px; /* 제출 버튼 모서리를 둥글게 */
        cursor: pointer; /* 제출 버튼에 마우스 올렸을 때 포인터 표시 */
        margin-top: 20px; /* 제출 버튼 상단 간격 */
    }

    /* 제출 버튼 호버 효과 */
    .submit-btn:hover {
        background-color: #019cad; /* 제출 버튼 호버 시 배경색 변경 */
    }
</style>



<script type="text/javascript">
	'use strict';
	
	// 중복체크를 통과한 아이디를 저장하는 변수
	let checkedId = "";
	let checkedNickName = "";
	
    // 아이디 유효성 검사 함수
    function checkId(userId) {
    	
        const idPattern = /^[a-zA-Z0-9]{4,12}$/; // 아이디는 4~12자, 영문과 숫자만 허용

        if (!idPattern.test(userId)) {
            alert("아이디는 4~12자의 영문자와 숫자만 사용할 수 있습니다.");
            return false;
        }
        return true;
    }

    // 비밀번호 유효성 검사 함수
    function checkPwd(userPwd) {
    	
        const pwdPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
        // 비밀번호는 최소 8자, 하나 이상의 영문자, 숫자, 특수문자를 포함해야 함

        if (!pwdPattern.test(userPwd)) {
            alert("비밀번호는 최소 8자 이상, 하나 이상의 영문자, 숫자, 특수문자를 포함해야 합니다.");
            return false;
        }
        return true;
    }
    

	// 아이디 중복여부를 체크한다. 
	function checkIdDuplicate(){
		
		let idToCheck = document.getElementById("mid").value.trim();
		
		if(!checkId(idToCheck)){
			return;
		}
		
		$.ajax({ 
			type:"post",
			
			url:"CheckMemberInfoDuplicate.mem",
			
			data:{"strToCheck":idToCheck,
				"isIdCheck":"true"},    // 이것은 아이디 체크임을 표시
			
			success:function(res){
				
				if(res!=""){ // 해당 아이디를 갖고 있는 회원이 있다면 그 회원의 아이디가 돌아온다.
					
					$("#id_check_result").html(res+"는 사용할 수 없습니다. 다른 아이디를 선택해주세요.");
					document.getElementById("mid").focus();
				}
				else{
					$("#id_check_result").html(idToCheck+"는 사용할 수 있는 아이디입니다.");
					
					// 체크된 아이디에 저장해둠
					checkedId = idToCheck;
					
					document.getElementById("pwd").focus();
				}
			},
			error:function(){
				alert("전송오류!");
			}
			
		});
	}
	
	
	//닉네임 중복여부를 체크한다. 
	function checkNickNameDuplicate(){
		
		let nickNameToCheck = document.getElementById("nick_name").value.trim();
		
		if(nickNameToCheck.length<1){
			alert("닉네임을 입력하세요.");
			document.getElementById("nick_name").focus();
			return;
		}
		
		$.ajax({ 
			type:"post",
			
			url:"CheckMemberInfoDuplicate.mem",
			
			data:{"strToCheck":nickNameToCheck,
				"isIdCheck":"false"},
			
			success:function(res){
				
				if(res!=""){ // 해당 닉네임을 갖고 있는 회원이 있다면 그 회원의 닉네임이 돌아온다.
					
					$("#nick_name_check_result").html(res+"는 사용할 수 없습니다. 다른 닉네임을 선택해주세요.");
					document.getElementById("nick_name").focus();
				}
				else{
					$("#nick_name_check_result").html(nickNameToCheck+"는 사용할 수 있는 닉네임입니다.");
					
					// 체크된 아이디에 저장해둠
					checkedNickName = nickNameToCheck;
					
					document.getElementById("nick_name").focus();
				}
			},
			error:function(){
				alert("전송오류!");
			}
			
		});
	}
	
	

	// 서버로 가입정보를 보내기 전에 마지막으로 입력정보들을 체크한다.
	function finalCheck(){
		
		let mid = document.getElementById("mid").value.trim();
		
		if(!checkId(mid)){
			return;
		}
		
		// 아이디 중복체크를 했는지 여부 체크
		if(checkedId!=mid){ // 현재 폼에 입력된 아이디와 중복체크때 저장한 아이디가 다르다면 다시 중복체크 하도록.
			console.log("mid:",mid);
			console.log("checkedId:",checkedId);
			
			alert("아이디 중복체크를 해주세요.");
			document.getElementById("check_id_duplicate").focus();
			return;
		}
		
		let pwd = document.getElementById("pwd").value.trim();
		
		if(!checkPwd(pwd)){
			return;
		}
				
		let pwdConfirm = document.getElementById("confirm_pwd").value.trim();
		
		if(pwd!=pwdConfirm){
			alert("비밀번호를 다시 입력해주세요.");
			return;
		}
		
		let name = document.getElementById("name").value.trim();	
	
		if(name==""|| name.length<2){
			alert("이름을 입력하세요.");
			return;
		}
		
		let nickName = document.getElementById("nick_name").value.trim();
		
		// 아이디 중복체크를 했는지 여부 체크
		if(checkedNickName!=nickName){ // 현재 폼에 입력된 닉네임과 중복체크때 저장한 닉네임이 다르다면 다시 중복체크 하도록.
			console.log("nickName:", nickName);
			console.log("checkedNickName:", checkedNickName);
			
			alert("닉네임 중복체크를 해주세요.");
			document.getElementById("check_nick_name_duplicate").focus();
			return;
		}

		let email = document.getElementById("email").value.trim();
		
		let tel = document.getElementById("tel").value.trim();
			
		if(email==""|| emial.length<3){
			alert("이메일을 입력하세요.");
			return;
		}
		
		if(tel==""|| tel.length<7){
			alert("전화번호를 입력하세요.");
			return;
		}
		
		document.myform.submit();
		
	}
	
	
	
	
	// 두개의 pwd 입력 텍스트가 서로 같은지 체크
 	function checkTwoPwds(){
		
		let pwd = document.getElementById("pwd").value.trim();
		
		let pwdConfirm = document.getElementById("confirm_pwd").value.trim();
	
		if(pwd!=pwdConfirm){
			document.getElementById("two_pwds_check_result").innerHTML = "두 비밀번호가 일치하지 않습니다.";
		}else{
			document.getElementById("two_pwds_check_result").innerHTML = "";
		}
	} 
	

	

</script>




</head>

<body>

    <div class="container">
        <div class="title">개인회원가입</div>
        <div class="description">회원가입을 하시면 마캉스의 모든 서비스를 이용하실 수 있습니다.<br>
            아래 필수 입력 정보를 상세히 입력해주세요.</div>
            
            
        <form name="myform" action="JoinPrivateOk.mem" method="post">
        
            <div class="form-group">
            
                <label for="mid">아이디 *</label>
                
                <input type="text" id="mid" name="mid" style = "flex-basis: 170%; margin-left:110px" placeholder="아이디 입력" autofocus required>
                
                <input type="button" value="중복확인" id="check_id_duplicate" onclick="checkIdDuplicate()" style = "flex-basis:10%; margin-left:10px">
                  
            </div>
            
            
            <div class="form-group">
            	<!-- 아이디의 중복여부 결과를 출력해줄 div -->            
            	<div id="id_check_result" style = "margin-left:250px;"></div>
            </div>
            
            <div class="form-group">
                <label for="pwd">비밀번호 *</label>
                <input type="password" id="pwd" name="pwd" placeholder="비밀번호 입력" required>
            </div>
            
            <div class="form-group">
                <label for="confirmPwd">비밀번호 확인 *</label>
                <input type="password" id="confirm_pwd" name="confirmPwd" onkeyup="checkTwoPwds()" placeholder="비밀번호 재입력" required>
            </div>
            
            <div class="form-group">
            	<!-- 비밀번호의 일치여부를 출력해줄 div -->            
            	<div id="two_pwds_check_result" style = "margin-left:250px;"></div>
            </div>
            
            <div class="form-group">
                <label for="name">성명 *</label>
                <input type="text" id="name" name="name" placeholder="성명 입력" required>
            </div>
            
             <div class="form-group">
            
                <label for="nick_name">닉네임 *</label>
                
                <input type="text" id="nick_name" name="nickName" style = "flex-basis: 170%; margin-left:110px" placeholder="닉네임 입력" required>
                
                <input type="button" value="중복확인" id="check_nick_name_duplicate" onclick="checkNickNameDuplicate()" style = "flex-basis:10%; margin-left:10px">
                  
            </div>
            
            
            <div class="form-group">
            	<!-- 아이디의 중복여부 결과를 출력해줄 div -->            
            	<div id="nick_name_check_result" style = "margin-left:250px;"></div>
            </div>
            
            
            
            
            
            
            <div class="form-group">
                <label for="email">이메일 *</label>
                <input type="email" id="email" name="email" placeholder="이메일 입력" required>
            </div>
            
            <div class="form-group">
                <label for="tel">핸드폰 *</label>
                <input type="number" id="tel" name="tel" placeholder="핸드폰 입력" required>
            </div>
            
            <button type="submit" class="submit-btn" onclick="finalCheck()">회원가입</button>
            
        </form>
        
        
        
        
    </div>
    <!-- footer 영역 -->
<jsp:include page="/include/footer.jsp" />
</body>
</html>