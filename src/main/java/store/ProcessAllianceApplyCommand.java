package store;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SecurityUtil;

public class ProcessAllianceApplyCommand implements StoreInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String storeId = request.getParameter("storeId")==null? "": request.getParameter("storeId");
		String pwd = request.getParameter("pwd")==null? "": request.getParameter("pwd");
		String storeName = request.getParameter("storeName")==null? "": request.getParameter("storeName");
		String contactName = request.getParameter("contactName")==null? "": request.getParameter("contactName");
		String contactPhone = request.getParameter("contactPhone")==null? "": request.getParameter("contactPhone");
		String contactTime = request.getParameter("contactTime")==null? "": request.getParameter("contactTime");
		String inquiry = request.getParameter("inquiry")==null? "": request.getParameter("inquiry");
		
		
		System.out.println("storeId:"+storeId+", pwd:"+pwd+", storeName:"+storeName+", contactName:"+contactName+
				", contactPhone:"+contactPhone+", contactTime:"+contactTime+", inquiry:"+inquiry);
		
		
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
		
		
		
		// 제휴신청 jsp 에서 온 정보를 vo 에 담아 allianceStores 테이블에 insert한다.
		StoreVO vo = new StoreVO();
		
		vo.setStoreId(storeId);
		vo.setPwd(pwd);
		vo.setStoreName(storeName);
		vo.setContactName(contactName);
		vo.setContactPhone(contactPhone);
		vo.setContactTime(contactTime);
		vo.setInquiry(inquiry);
		
		StoreDAO dao = new StoreDAO();
		int result = dao.insertAllianceAppliedStore(vo);
		
		if (result != 0) { /* 자바에서 자바스크립트의 alert 창에 보낼때는 \\n 으로 보내줘야한다. */
			request.setAttribute("message", "제휴신청이 성공적으로 완료되었습니다.\\n 입력하신 시간에 담당자에게 연락드리겠습니다. 감사합니다."); 
			request.setAttribute("url", "Login.main");
		}
		else {
			request.setAttribute("message", "제휴신청이 실패하였습니다.");
			request.setAttribute("url", "ContractApply.main"); 
		}
	}
		 
}
