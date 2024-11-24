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
		
		System.out.println("storeId:"+storeId);
		
		StoreDAO sDao = new StoreDAO();
		StoreVO svo = sDao.getStoreByIdOrStoreName(storeId, true);
		
		System.out.println("svo.getStoreId():"+svo.getStoreId());
		
		StorePageResourceDAO sprDao = new StorePageResourceDAO();
		StorePageResourceVO sprVo = sprDao.getStorePageResourceByIdOrStoreName(storeId, true);
		
		System.out.println("sprVo.getStoreId():"+sprVo.getStoreId());
		
		request.setAttribute("svo", svo);
		request.setAttribute("sprVo", sprVo);
		
		
	}

}
