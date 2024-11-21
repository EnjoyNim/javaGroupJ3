package common;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@SuppressWarnings("serial")
@WebServlet("*.main")
public class MainController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		MainInterface command = null;
		
		String viewPage = "/WEB-INF/main";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		System.out.println("MainController com:"+com);
		
		if(com.equals("/MainPage")) {
			viewPage += "/main.jsp";
		}
		
		// 로그인 링크를 클릭했을때
		else if(com.equals("/Login")) {
			viewPage += "/login.jsp";
		}
		
		// 로그인 폼에서 아이디와 비번을 넣고 ok 누른경우
		else if(com.equals("/LoginOk")) {
			command = new LoginOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
	
		}
		
		else if(com.equals("/Logout")) {
			command = new LogoutCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
			
		// 회원가입 링크를 클릭했을때
		else if(com.equals("/MemberJoin")) {
			viewPage += "/joinType.jsp";
		}
		
		// 메인페이지에서 제휴입점신청 클릭했을때
		else if(com.equals("/ContractApply")) {
			viewPage += "/allianceApply.jsp";
		}
		// 메인페이지에서 광고상품안내 클릭했을때
		else if(com.equals("/ShowAd")) {
			viewPage += "/showAd.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}


}
