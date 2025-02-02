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

public class ShopController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    DAO dao = new DAO();
	    
	    // Lấy danh sách các category
	    List<Category> cateList = dao.getAllCategory();

	    // Mặc định trang hiện tại là 1
	    int currentPage = 1;
	    int productsPerPage = 8;

	    // Kiểm tra xem có tham số "page" trong request không
	    String pageParam = request.getParameter("page");
	    if (pageParam != null) {
	        try {
	            currentPage = Integer.parseInt(pageParam); // Chuyển tham số page thành số nguyên
	        } catch (NumberFormatException e) {
	            currentPage = 1; // Nếu có lỗi khi chuyển, gán trang mặc định là 1
	        }
	    }

	    // Lấy danh sách sản phẩm theo trang
	    List<Product> productList;
		try {
			productList = dao.getProductsByPage(currentPage, productsPerPage);
			request.setAttribute("productList", productList);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	    // Lấy tổng số sản phẩm và tính tổng số trang
	    int totalProducts = dao.getTotalProducts();
	    int totalPages = (int) Math.ceil((double) totalProducts / productsPerPage);

	    // Đặt thuộc tính để chuyển đến JSP
	    request.setAttribute("totalPages", totalPages);
	    request.setAttribute("currentPage", currentPage); // Đưa trang hiện tại vào để làm điều hướng
	    request.setAttribute("cateList", cateList);
	   
	    
	    // Chuyển hướng tới trang Shop.jsp
	    request.getRequestDispatcher("Shop.jsp").forward(request, response);
	}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
