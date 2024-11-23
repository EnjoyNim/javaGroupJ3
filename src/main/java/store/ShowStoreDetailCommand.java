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
		
		// 상세페이지가 보여질때는 헤더페이지의 검색창을 보이지 않고 그자리에 해당 업소 상호명을 보여주도록
		request.setAttribute("headerForStoreDetail", "true");
		
		// 브라우저가 보낸 입점스토어테이블의 스토어idx를 가지고 디비에서 검색후에
		// 입점상점vo 에 담은후 request 에 담아서 다시 브라우저로 보내준다.
		
		//입점신청테이블, 입점상점테이블, 관리자폼, 관리자폼에 입점신청테이블을 표시하고 거기서 입점결정하고 표시될 문구들 설정하고 입점상점테이블에 넣음 
		// 입점 상점 테이블에는  idx, 상점id, 상점name, 상호명(페이지에 표시됨), 상점대표, 연락처, 등등등 storeDetail  페이지를 만드는데 필요한
		// 정보들을 넣어놔야한다.
		// 후기를 위해서 리뷰테이블도 만들어야한다.
	}

}
