package kr.co.subking.login;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.json.JsonMapper;

import kr.co.subking.user.User;
import kr.co.subking.user.UserServiceImple;
import subking.config.WebUtil;

@WebServlet("/api/v1/tempFindId")
public class TempFindId extends HttpServlet {
	private static final String formURL = "http://localhost:8080/240930subKingProject/static/jsp/findid.jsp";

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 사용자 입력 정보 받기

		req.setCharacterEncoding("UTF-8");
		WebUtil webUtil = new WebUtil();
		String json = webUtil.readBody(req);
		JsonMapper jsonMapper = new JsonMapper();

		System.out.println(json);
		Temp temp = jsonMapper.readValue(json, Temp.class);
		String user_name = temp.getUser_name();
		String user_phone = temp.getUser_phone();
		System.out.println(user_name);
		System.out.println(user_phone);

		UserServiceImple userServiceimple = new UserServiceImple();
		User user = userServiceimple.findIdByNameAndPhone(user_name, user_phone); // 사용자 정보를 찾는 메서드 호출
		System.out.println("User: " + user.getUser_id()); // User 객체 출력

		resp.setContentType("application/json; charset=UTF-8");

//		PrintWriter out = resp.getWriter();
		try (PrintWriter out = resp.getWriter()) {
			if (user_name == null || user_name.isEmpty() || user_phone == null || user_phone.isEmpty()) {
			    out.println("{\"success\": false, \"message\": \"이름과 전화번호를 입력해 주세요.\"}");
			    resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			    return;
			}
			if (user.getUser_id() != null) {
				out.println("{\"success\": true, \"message\": \"아이디를 찾았습니다: " + user.getUser_id() + "\"}");
				resp.setStatus(HttpServletResponse.SC_OK);
				HttpSession session = req.getSession();
				session.setAttribute("asdf", user_name);
			} else {
				out.println("{\"success\": false, \"message\": \"아이디를 찾을 수 없습니다. 정보를 확인하세요.\"}");
				resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			}
			out.close();
		}
	}

}

