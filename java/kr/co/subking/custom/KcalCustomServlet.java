package kr.co.subking.custom;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/custom/kcal")
public class KcalCustomServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String userId = (String) req.getSession().getAttribute("user_id");
		if (userId != null) {
			req.getRequestDispatcher("/WEB-INF/views/custom/kcalCustom.jsp").forward(req, resp);
		} else {
			resp.sendRedirect("http://localhost:8080/240930subKingProject/api/v1/tempLogIn");
		}

	}

}
