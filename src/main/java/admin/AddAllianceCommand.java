package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import store.StoreDAO;
import store.StorePageResourceDAO;
import store.StorePageResourceVO;
import store.StoreVO;

public class AddAllianceCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String storeId = request.getParameter("storeId");
		
		StoreDAO sDao = new StoreDAO();
		
		StoreVO svo = sDao.getStoreByIdOrStoreName(storeId, true);
		
		
		
		StorePageResourceDAO srDao = new StorePageResourceDAO();
		
		
		StorePageResourceVO sprVo = srDao.getStoreByIdOrStoreName(storeId, true);
		
		request.setAttribute("storeVo", svo);
		request.setAttribute("sprVo", sprVo);
		
		
	}

}
