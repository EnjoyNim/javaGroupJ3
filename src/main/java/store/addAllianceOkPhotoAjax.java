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
			
			String mainPhotoName = "noimage.jpg";
			String photoName = "";
			
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
					
					
					mainPhotoName = fileName;
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
				
				photoName +=  fileName+"^";
					
				}
			}
		  }
		  

		  // 마지막 ^ 는 제거
		  photoName = photoName.substring(0, photoName.length()-1);
		  
		  System.out.println("mainPhto:"+mainPhotoName);
		  System.out.println("photos:"+photoName);
		  
		  new StorePageResourceDAO().updatePhoto(storeId, mainPhotoName, photoName);
			
			response.getWriter().write(res);
		}
}
