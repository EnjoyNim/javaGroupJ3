package store;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SecurityUtil;

public class JoinStoreOkCommand implements StoreInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String mid = request.getParameter("mid")==null? "": request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null? "": request.getParameter("pwd");
		String name = request.getParameter("name")==null? "": request.getParameter("name");
		String storeName = request.getParameter("storeName")==null? "": request.getParameter("storeName");
		String address = request.getParameter("address")==null? "": request.getParameter("address");
		String email = request.getParameter("email")==null? "": request.getParameter("email");
		String tel = request.getParameter("tel")==null? "": request.getParameter("tel");
		
		
		
		
		// 비밀번호 암호화
		long temp = (int)(Math.random()*(999-100+1))+100;
		String salt = temp + "";
			
		SecurityUtil security = new SecurityUtil();
		// 최초 가입시에는 비번에 salt 를 붙여서 해시값을 얻는다.
		pwd = security.encryptSHA256(salt+pwd);
				
		// 그리고 그 비번에 salt 를 맨 앞에 붙여서 디비에 저장을 한다.
		// 그럼 다음번 로그인시에는 디비에서 해당 유저의 비번을 불러오고
		// 그 비번의 맨앞에 3자리는 salt 이므로 분리해낸다. 분리해낸 salt를 유저가 로그인시에 입력한 비번의 맨앞에
		// 붙여서 해시값을 거쳐서 디비에 있는 비번과 비교를 해서 비번이 맞다 틀리다를 판정한다.
		pwd = salt+pwd; 
		
		
		
		StoreVO vo = new StoreVO();
		vo.setMid(mid);
		
		// pwd sha256처리 해야함
		vo.setPwd(pwd);
		
		vo.setName(name);
		vo.setStoreName(storeName);
		vo.setAddress(address);
		vo.setEmail(email);
		vo.setTel(tel);
		
		
		StoreDAO dao = new StoreDAO();
		
		int result = dao.setStoreJoinOk(vo);
		
		
		if(result !=  0) {
		  	
		  	request.setAttribute("message", "회원가입이 성공적으로 완료되었습니다.");
		  	// 회원가입이 성공적이었으므로 이제 로그인창으로 보냄
		  	request.setAttribute("url", "Login.main"); 
		  	
		  }else {
		  	
		  	request.setAttribute("message", "회원가입에 실패하였습니다.");
		  	request.setAttribute("url", "JoinFormStore.st");
		  }
	}

}
