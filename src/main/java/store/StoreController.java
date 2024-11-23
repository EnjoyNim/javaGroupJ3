package store;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.st")
public class StoreController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		StoreInterface command = null;
		
		String viewPage = "/WEB-INF/store";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		System.out.println("StoreController com:"+com);
	
		// 제휴신청을 처리한다.
		if(com.equals("/ProcessAllianceApply")) {
			command = new ProcessAllianceApplyCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		// 샵을 선택,클릭했을때 보여줄 샵 상세페이지
		else if(com.equals("/ShowStoreDetail")) {
			command = new ShowStoreDetailCommand();
			command.execute(request, response);
			viewPage += "/storeDetail.jsp";
		}
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}


}
