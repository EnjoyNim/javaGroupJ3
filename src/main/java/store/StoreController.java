package store;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.JoinPrivateOkCommand;

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
	
		
			// 업체회원가입을 선택했을때
		if(com.equals("/JoinFormStore")) {
			viewPage += "/joinFormStore.jsp";
		
		}
		else if(com.equals("/JoinStoreOk")) {
			command = new JoinStoreOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		// 샵을 선택해서 클릭했을때 보여줄 샵 상세페이지
		else if(com.equals("/ShowStoreDetail")) {
			// 상세페이지가 보여질때는 헤더페이지의 검색창을 보이지 않고 그자리에 해당 업소 상호명을 보여주도록
			request.setAttribute("headerForStoreDetail", "true");
			viewPage += "/storeDetail.jsp";
		}
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}


}
