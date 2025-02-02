package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;

public class EditUsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String birthDay = request.getParameter("birthDay");
		boolean gender = "Female".equals(request.getParameter("gender"));
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		int phone = Integer.parseInt(request.getParameter("phone"));

		DAO dao = new DAO();
		dao.updateUser(firstName, lastName, birthDay, gender, address, email, phone, userId);
		response.sendRedirect("DetailUserController");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
