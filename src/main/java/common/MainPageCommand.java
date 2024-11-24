package common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import store.StoreDAO;
import store.StorePageResourceDAO;
import store.StorePageResourceVO;
import store.StoreVO;

public class MainPageCommand implements MainInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 최근 입점한 스토어 10개 리스트를 최근순으로 가져온다.
		List<StoreVO> storeVos = new StoreDAO().getListByRecentStore(10);
		
		
		StorePageResourceDAO sprDao = new StorePageResourceDAO();
		
		// 최근 입점한 10개 스토어 리스트를 가지고 다시 디비에서 해당 스토어의 웹페이지 정보를 가져온다.
		// 나중에 subquery 로 대체하자..
		List<StorePageResourceVO> sprVos = new ArrayList<>();
		
		for(int i=0; i<storeVos.size(); i++) {
				
			StorePageResourceVO vo	= sprDao.getStorePageResourceByIdOrStoreName(storeVos.get(i).getStoreId(), true);
			sprVos.add(vo);
		}
		
		request.setAttribute("sprVos", sprVos);
	}

}
