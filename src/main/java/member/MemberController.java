package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.mem")
public class MemberController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		MemberInterface command = null;
		
		String viewPage = "/WEB-INF/member";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
			// 로그인 링크를 클릭했을때
		if(com.equals("/Login")) {
			viewPage += "/login.jsp";
		
			// 로그인 폼에서 아이디와 비번을 넣고 ok 누른경우
		}else if(com.equals("/LoginOk")) {
			command = new LoginOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
			
			// 회원가입 링크를 클릭했을때
		}else if(com.equals("/MemberJoin")) {
			viewPage += "/memberJoinType.jsp";
			
			// 개인회원가입을 선택했을때
		}else if(com.equals("/MemberJoinFormPrivate")) {
			viewPage += "/joinFormPrivate.jsp";
		
			// 업체회원가입을 선택했을때
		}else if(com.equals("/MemberJoinFormCompany")) {
			viewPage += "/joinFormCompany.jsp";
		}
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}


}
