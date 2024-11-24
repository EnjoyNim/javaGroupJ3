package admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import store.ProcessAllianceApplyCommand;


@SuppressWarnings("serial")
@WebServlet("*.ad")
public class AdminController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		AdminInterface command = null;
		
		String viewPage = "/WEB-INF/admin";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		System.out.println("AdminController com:"+com);
		
		// admin 메인 페이지로 입점신청 리스트를 보여준다.
		if(com.equals("/AdminMain")) {
			command = new AdminMainCommand();
			command.execute(request, response);
			viewPage += "/adminMain.jsp";
		}
		
		// admin 메인 페이지의 입점신청리스트에서 입점처리 버튼을 ajax 로 여기로 오고 입점처리를 위한 상세정보입력창을 띄워준다.
		else if(com.equals("/AddAlliance")) {
			command = new AddAllianceCommand();
			command.execute(request, response);
			viewPage += "/addAlliance.jsp";
		}
		
		// admin 메인 페이지의 입점처리에서 완료 버튼을 ajax 로 여기로 오고 관련 디비에 정보를 insert 및 업데이트 한다.
		else if(com.equals("/AddAllianceOk")) {
			command = new AddAllianceOkCommand();
			command.execute(request, response);
			return;
		}
		
	
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}


}
