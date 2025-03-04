package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import entity.Product;

public class DeleteCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DAO dao = new DAO();
		int id = Integer.parseInt( request.getParameter("id"));
		Product product = dao.getProductById(id);

		HttpSession session = request.getSession();
		List<Product> listProduct = (List<Product>) session.getAttribute("cart");

		for (Product p : listProduct) {
			if (p.getId() == product.getId()) {
				listProduct.remove(p);
				break;
			}
		}
		request.getRequestDispatcher("CartController").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
