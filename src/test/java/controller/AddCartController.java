package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import entity.Product;

public class AddCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DAO dao = new DAO();
		int id = Integer.parseInt( request.getParameter("id"));
		Product product = dao.getProductById(id);

		HttpSession session = request.getSession();

		List<Product> cart = (List<Product>) session.getAttribute("cart");
		if (cart == null) {
			cart = new ArrayList<>();
		}
		int newWeight = Integer.parseInt(request.getParameter("weight"));
		product.setWeight(newWeight);
		boolean productExistsInCart = false;
		for (Product p : cart) {
			if (p.getId() == product.getId()) {
				productExistsInCart = true;
				newWeight += p.getWeight();
				p.setWeight(newWeight);
				break;
			}
		}
		if (!productExistsInCart) {
			cart.add(product);
		}

//		Tính tổng price của cart
		double totalPrice = 0;
		if (cart.size() != 0) {
			for (Product p : cart) {
				totalPrice += p.cost(p.getWeight());
			}
		}
		request.setAttribute("totalPrice", totalPrice);
		session.setAttribute("cart", cart);
		request.getRequestDispatcher("CartController").forward(request, response);
	}
}
