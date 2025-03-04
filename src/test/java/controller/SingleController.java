package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import entity.Account;
import entity.Product;

public class SingleController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DAO dao = new DAO();
		int id = Integer.parseInt( request.getParameter("id"));
		Product product = dao.getProductById(id);
		HttpSession session = request.getSession();
		Account account = (Account) request.getAttribute("account");

		request.setAttribute("account", account);
		request.setAttribute("product", product);
		request.getRequestDispatcher("SingleProduct.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
