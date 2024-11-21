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
		
		System.out.println("MemberController com:"+com);
	
			// 개인회원가입을 선택했을때
		if(com.equals("/JoinFormPrivate")) {
			viewPage += "/joinFormPrivate.jsp";
		
		}
		// 회원가입 폼에서 아이디 중복체크를 클릭했을때
		else if(com.equals("/CheckMemberInfoDuplicate")) {
			command = new CheckMemberInfoDuplicateCommand();
			command.execute(request, response);
			return;
		}
			
		else if(com.equals("/JoinPrivateOk")) {
			command = new JoinPrivateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}


}
