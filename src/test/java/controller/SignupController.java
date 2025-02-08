package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import entity.Account;

public class SignupController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String rePassword = request.getParameter("rePassword");

		if (!password.equals(rePassword)) {
			request.getRequestDispatcher("LoginController").forward(request, response);
		} else {
			DAO dao = new DAO();
			Account account = dao.checkAccountExist(username);
			if (username != "" && password != "" && account == null) {
				dao.signup(username, rePassword);
				request.getRequestDispatcher("LoginController").forward(request, response);
			} else {
				request.getRequestDispatcher("HomeController").forward(request, response);
			}
		}
	}

}
