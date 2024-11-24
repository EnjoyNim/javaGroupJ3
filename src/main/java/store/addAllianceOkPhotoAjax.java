package store;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;



@SuppressWarnings("serial")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 2,	// 메모리에 저장되는 임시파일크기 설정, 이건 안해줘도 되지만 그냥 해줘본다.
		maxFileSize = 1024 * 1024 * 5,		// 1개 파일 업로드시의 최대용량
		maxRequestSize = 1024 * 1024 * 20	// 한번에 전송할수 있는 최대용량
)
@WebServlet("/PhotoViewAjax")
	public class addAllianceOkPhotoAjax extends HttpServlet {
		@Override
		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String res = "";
			String realPath = request.getServletContext().getRealPath("/images/photoView/");
			
			
			String storeId = request.getParameter("storeId");
			
			System.out.println("storeId:"+storeId);
			
			Part filePart = request.getPart("mainPhoto");
			
			if(filePart!=null) {
				
			String fileName = filePart.getSubmittedFileName();
			
			if(fileName != null && !fileName.isEmpty()) {
				InputStream fis = filePart.getInputStream();
				
				// 파일명 중복방지처리(UUID활용)
				String uid = UUID.randomUUID().toString().substring(0,8);
				
				// 중복방지를 위한 파일명 조합하기(파일형식: 파일명_중복방지코드.확장자)
				fileName = fileName.substring(0, fileName.lastIndexOf(".")) + "_" + uid + fileName.substring(fileName.lastIndexOf("."));
				
				FileOutputStream fos = new FileOutputStream(realPath + fileName);
				
				// 생성된 객체에 파일의 내용을 2048Byte씩 보내어준다.
				byte[] buffer = new byte[2048];
				int size = 0;
				while((size=fis.read(buffer)) != -1) {
					fos.write(buffer, 0, size);
				}
				fos.flush();
				fos.close();
				fis.close();
				
				res += fileName+"/";
				
				System.out.println("mainPhto:"+res);
			}
			
			}
			
			//System.out.println("getPartsSize:"+request.getParts().size());
			
			int totalPartCount = request.getParts().size();
			
			// 개수만큼 반복하도록, 하나는 위의 mainPhoto 였고 하나는 storeId 였으니 여기서는 2개 빼고 한다.
		  for(int i=0; i<totalPartCount-2; i++) {
			  
			filePart = request.getPart("photos"+i);
			
			if(filePart != null) {
				
				String fileName = filePart.getSubmittedFileName();
				
				if(fileName != null && !fileName.isEmpty()) {
				
				
			
				InputStream fis = filePart.getInputStream();
				
				// 파일명 중복방지처리(UUID활용)
				String uid = UUID.randomUUID().toString().substring(0,8);
				
				// 중복방지를 위한 파일명 조합하기(파일형식: 파일명_중복방지코드.확장자)
				fileName = fileName.substring(0, fileName.lastIndexOf(".")) + "_" + uid + fileName.substring(fileName.lastIndexOf("."));
				
				FileOutputStream fos = new FileOutputStream(realPath + fileName);
				
				// 생성된 객체에 파일의 내용을 2048Byte씩 보내어준다.
				byte[] buffer = new byte[2048];
				int size = 0;
				while((size=fis.read(buffer)) != -1) {
					fos.write(buffer, 0, size);
				}
				fos.flush();
				fos.close();
				fis.close();
				
				res += fileName+"/";
				System.out.println("photos:"+fileName);
				}
			}
		  }
		  
		  			// fileName을 디비에 저장해야한다. 여러개가 오는 photos 는 ^ 로 이어붙여서 저장하고 나중에 분리하자. 
		  			// 기타사진들은 그냥 두고 업로드한 이미지들은 jsp 에 보여질때는 ${ctp}/images/photoView/fileName 으로
		  			// 처리해야한다. 
		  			// 메인페이지와 상세페이지가 호출될때 메인페이지에는 vos 를 상세페이지에는 vo 를 전달하고 해당 페이지에서 jstl 로 보여지는 부분을 처리해야한다.
		  			// 메인페이지 내주변을 최신입점샵으로 바꾸자. 그리고 미리 데이터를 넣어놓을것, 대략적인 흐름의 ppt 를 스샷과 도표로 작성할것. 디비도 워크벤치스샷해서 ppt에 넣을것.
		  
		  
			
			response.getWriter().write(res);
		}
}
