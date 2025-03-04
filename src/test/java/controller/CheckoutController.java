package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import entity.Account;
import entity.CartItem;
import entity.Product;
import entity.User;
@WebServlet("/CheckoutController")
public class CheckoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		DAO dao = new DAO();
	
		double totalPrice = 0;
		Map<Integer,CartItem> cart = (Map<Integer,CartItem>) session.getAttribute("cart");

	
	
		    for (CartItem item : cart.values()) {
		        int weight = item.getWeight();
		        Product product = item.getProduct();
		        double price = product.getPrice();

		        totalPrice+= weight*price;
		    }
		

		// Gửi danh sách sản phẩm có trong giỏ hàng sang JSP
		request.setAttribute("cart", cart);
		request.setAttribute("totalPrice", totalPrice);
		request.setAttribute("user", user);
		request.getRequestDispatcher("Checkout.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
