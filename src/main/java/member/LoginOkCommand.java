package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;

public class LoginOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");

		MemberDAO dao = new MemberDAO();
		
		// 해당 아이디를 가진 회원이 존재하는지 체크, 있다면 해당 아이디를 가진 회원의 정보를 vo 에 담아서 리턴
		MemberVO vo = dao.memberIdOrNickNameCheck(mid, true);

		if (vo == null || vo.getPwd() == null) { // 회원 정보가 없다는 것.
				request.setAttribute("message", "회원정보가 없습니다.\\n 확인하고 다시 로그인하세요.");
				// 로그인 창을 다시 보여준다.
				request.setAttribute("url", "Login.mem");
				return;
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
			request.setAttribute("url", "Login.mem");
			return;
		}

		// 이곳 이후부터는 로그인 처리가 된 회원들이 작업내역들을 입력처리한다.

		// 정상 인증이 완료되었을때 처리할 내용들을 기술한다.
		// 아이디를 쿠키로 저장처리
		// 방문포인트를 5회 미만일경우에 10 point 씩 증가처리한다(오늘 숙제), 방문횟수(총/오늘) 누적, 마지막 방문일자
		// 처리(로그인시각으로)
		// 준회원을 자동으로 등업처리할경우 수행내용등등..==>> DB에 저장...
		// 처리완료된 자료들은 작업수행이 지속되는 동안 꼭 필요한 정보반을 session 에 저장처리한다.

		// 쿠키에 아이디를 저장/해제 처리한다.
		String idSave = request.getParameter("idSave") == null ? "off" : "on";
		Cookie cookieMid = new Cookie("cMid", mid); 
		cookieMid.setPath("/");
		
		// 아이디저장을 체크한 경우에만 쿠키를 생성한다.
		// 체크하는 페이지에서는 쿠키가 있으면 아이디 저장을 체크한 것이므로 cMid로 값을 얻어와서 아이디창에 넣어주면 된다.
		if (idSave.equals("on")) { 
			System.out.println("cookie 생성");
			cookieMid.setMaxAge(60 * 60 * 24 * 7); // 쿠키의 만료시간은 1주일로 한다.
		} else {
			System.out.println("cookie 만료");
			cookieMid.setMaxAge(0);
		}
		// 쿠키를 삭제(만료)시킬때도 setMaxAge(0) 후에 response 에 넣어줘야한다.
		response.addCookie(cookieMid);

		// 세션에 저장할 항목 : mid, nickName
		HttpSession session = request.getSession();
		session.setAttribute("sMid", mid);
		session.setAttribute("sNickName", vo.getNickName());
		session.setAttribute("sLevel", vo.getLevel());
		session.setAttribute("sLastDate", vo.getLastDate());

		session.setAttribute("sStrLevel", strLevelProcess(vo.getLevel()));

		request.setAttribute("message", mid + "님 로그인 되었습니다.");
		request.setAttribute("url", "MainPage.main"); // 메인 페이지를 보여준다.

	}

	private Object strLevelProcess(int level) {
		// 회원등급별 등급명칭을 strLevel 변수에 저장한다.
		String strLevel = "";
		if (level == 0)
			strLevel = "관리자";
		else if (level == 1)
			strLevel = "준회원";
		else if (level == 2)
			strLevel = "정회원";
		else if (level == 3)
			strLevel = "우수회원";
		return strLevel;
	}
		
		
}


