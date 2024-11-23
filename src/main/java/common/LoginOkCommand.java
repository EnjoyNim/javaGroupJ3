package common;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDAO;
import member.MemberVO;
import store.StoreDAO;
import store.StoreVO;

public class LoginOkCommand implements MainInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// 현재 개인회원과 제휴신청업체 둘 다 여기에서 처리하고 있기에 두 번 검색해야한다.
		
		String id = request.getParameter("id") == null ? "" : request.getParameter("id");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");

		MemberDAO mDao = new MemberDAO();
		
		// 해당 아이디를 가진 회원이 존재하는지 체크, 있다면 해당 아이디를 가진 회원의 정보를 vo 에 담아서 리턴
		VOInterface vo = mDao.getMemberByIdOrNickName(id, true);
		
		if (vo == null || vo.getPwd() == null) { // 개인회원 테이블에 정보가 없다는 것.
			vo = new StoreDAO().getStoreByIdOrStoreName(id, true);
				if(vo == null || vo.getPwd() == null) { // 업체회원 테이블에도 정보가 없으면
					request.setAttribute("message", "회원정보가 없습니다.\\n 확인하고 다시 로그인하세요.");
					// 로그인 창을 다시 보여준다.
					request.setAttribute("url", "Login.main");
					return;
				}
		}
			
		// 저장된 비밀번호에서 salt 키를 분리시켜서 다시 암호화후 비교처리해야한다.
		String salt = vo.getPwd().substring(0, 3);

		System.out.println("salt:" + salt);

		SecurityUtil security = new SecurityUtil();

		pwd = security.encryptSHA256(salt + pwd);

		

		// 동일한 아이디가 검색되었다면 비밀번호가 맞는지 확인한다.
		// 입력받는 비밀번호를 암호화 시켜서 DB에 이미 암호화되어 저정되어있던 비밀번호와 비교한다.

		if (!vo.getPwd().equals(salt + pwd)) {
			request.setAttribute("message", "비밀번호가 틀립니다.\\n 확인하고 다시 로그인하세요.");
			// 로그인 창을 다시 보여준다.
			request.setAttribute("url", "Login.main");
			return;
		}

	
		/*
		 * // 쿠키에 아이디를 저장/해제 처리한다. String idSave = request.getParameter("idSave") ==
		 * null ? "off" : "on"; Cookie cookieMid = new Cookie("cMid", mid);
		 * cookieMid.setPath("/");
		 * 
		 * // 아이디저장을 체크한 경우에만 쿠키를 생성한다. // 체크하는 페이지에서는 쿠키가 있으면 아이디 저장을 체크한 것이므로 cMid로 값을
		 * 얻어와서 아이디창에 넣어주면 된다. if (idSave.equals("on")) {
		 * System.out.println("cookie 생성"); cookieMid.setMaxAge(60 * 60 * 24 * 7); //
		 * 쿠키의 만료시간은 1주일로 한다. } else { System.out.println("cookie 만료");
		 * cookieMid.setMaxAge(0); } // 쿠키를 삭제(만료)시킬때도 setMaxAge(0) 후에 response 에
		 * 넣어줘야한다. response.addCookie(cookieMid);
		 */

		
		// 세션에 저장할 항목 : mid, nickName
		HttpSession session = request.getSession();
		session.setAttribute("sId", id);
		session.setAttribute("sNickName", vo instanceof MemberVO?((MemberVO)vo).getNickName():"");
		session.setAttribute("sStoreName", vo instanceof StoreVO?((StoreVO)vo).getStoreName():"");
		session.setAttribute("sLevel", vo.getLevel());

		session.setAttribute("sStrLevel", vo.getLevel());

		request.setAttribute("message", id + "님 로그인 되었습니다.");
		request.setAttribute("url", "MainPage.main"); // 메인 페이지를 보여준다.

	}
	/*
	 * private Object strLevelProcess(int level) { // 회원등급별 등급명칭을 strLevel 변수에 저장한다.
	 * String strLevel = ""; if (level == 0) strLevel = "관리자"; else if (level == 1)
	 * strLevel = "준회원"; else if (level == 2) strLevel = "정회원"; else if (level == 3)
	 * strLevel = "우수회원"; return strLevel; }
	 */
		
		
}


