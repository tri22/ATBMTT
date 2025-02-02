package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import entity.Account;
import entity.Product;
import entity.User;

public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		List<Product> listProduct = (List<Product>) session.getAttribute("cart");
		Account account = (Account) session.getAttribute("account");
		int accId = account.getAccId();

		DAO dao = new DAO();
		User user = dao.getUserByAccId(accId);

		request.setAttribute("Name", "Trung Tri");
		request.getRequestDispatcher("Cart.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
