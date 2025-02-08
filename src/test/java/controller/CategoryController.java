package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import entity.Category;
import entity.Product;

public class CategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String cateId = request.getParameter("cateId");
		DAO dao = new DAO();
		List<Product> productList = dao.getProductByCateId(cateId);
		List<Category> cateList = dao.getAllCategory();

		request.setAttribute("cateTag", cateId);
		request.setAttribute("cateList", cateList);
		request.setAttribute("productList", productList);
		request.getRequestDispatcher("Shop.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
