package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import entity.Account;
import entity.Product;
import entity.User;
@WebServlet("/CheckoutController")
public class CheckoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		List<Product> listProduct = (List<Product>) session.getAttribute("cart");
		User user = (User) session.getAttribute("user");


		DAO dao = new DAO();
	

//		Tính tổng price của cart
		double totalPrice = 0;
		if (listProduct.size() != 0) {
			for (Product p : listProduct) {
				totalPrice += p.cost(p.getWeight());
			}
		}
		request.setAttribute("totalPrice", totalPrice);
		request.setAttribute("user", user);
		request.setAttribute("listProduct", listProduct);
		request.getRequestDispatcher("Checkout.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
