package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckMemberInfoDuplicateCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// mid 는 idToCheck 키가 존재 하지 않다면 null 이다.
		String strToCheck = request.getParameter("strToCheck");
		boolean flag = request.getParameter("isIdCheck").equals("true");

		String strRes = "";

		if (strToCheck != null) {
			MemberDAO dao = new MemberDAO();
			MemberVO vo = dao.getMemberByIdOrNickName(strToCheck, flag);
			if (flag && vo.getMid() != null) {
				// 중복 아이디라는 것
				strRes = vo.getMid();
			} else if (!flag && vo.getNickName() != null) {
				// 중복 닉네임이라는 것
				strRes = vo.getNickName();
			}
		}

		
		 System.out.println("strToCheck:"+strToCheck); 
		 System.out.println("flag:"+flag);
		 

		response.getWriter().write(strRes);

	}

}
