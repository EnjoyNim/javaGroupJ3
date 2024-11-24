package store;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ShowStoreDetailCommand implements StoreInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		
		
		String storeId = request.getParameter("storeId");
		System.out.println("storeId:"+storeId);
		
		StorePageResourceVO sprVo = new StorePageResourceDAO().getStorePageResourceByIdOrStoreName(storeId, true);
		

		request.setAttribute("sprVo", sprVo);

		
		
		
		
	}

}
