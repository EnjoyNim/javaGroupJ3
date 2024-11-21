package common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutCommand implements MainInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");		
		
				// 세션 끊기
				HttpSession session = request.getSession();
				
				String nickName = (String)session.getAttribute("sNickName");
				
				session.invalidate();
				
				request.setAttribute("message", nickName+"님 로그아웃 되었습니다.");
				request.setAttribute("url", "Login.main");
	}

}
