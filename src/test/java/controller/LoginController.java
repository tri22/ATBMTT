package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import entity.Account;

public class LoginController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Cookie arr[] = request.getCookies();
		if (arr != null) {
			for (Cookie o : arr) {
				if (o.getName().equals("userCookie")) {
					request.setAttribute("username", o.getValue());
				}

				if (o.getName().equals("passCookie")) {
					request.setAttribute("password", o.getValue());
				}
			}
		}
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");

		HttpSession session = request.getSession();

		DAO dao = new DAO();
		Account account = dao.login(username, password);
		if (account == null) {
			request.setAttribute("loginError", "Wrong username or password");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		} else {
			session.setAttribute("account", account);

			// Lưu account lên trên cookie
			Cookie un = new Cookie("userCookie", username);
			Cookie pw = new Cookie("passCookie", password);

			// Đặt thời gian tồn tại của cookie
			un.setMaxAge(60 * 60 * 24);
			if (remember != null) {
				pw.setMaxAge(60 * 60 * 24);
			} else {
				pw.setMaxAge(0);
			}

			// Lưu cookie vào chrome
			response.addCookie(un);
			response.addCookie(pw);
			request.getRequestDispatcher("HomeController").forward(request, response);
		}
	}
}
