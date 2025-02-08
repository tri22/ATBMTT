package controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import dao.DAO;
import entity.Category;
import entity.Product;
import javax.servlet.http.Part;

import javax.servlet.annotation.MultipartConfig;


@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
@WebServlet("/AddProductController")
public class AddProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DAO dao = new DAO();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Category> cateList = dao.getAllCategory();
		request.setAttribute("cateList", cateList);
		request.getRequestDispatcher("AddProduct.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    String name = request.getParameter("productName");
	    String description = request.getParameter("description");    
	    double price = Double.parseDouble(request.getParameter("price"));
	    int weight = Integer.parseInt(request.getParameter("weight"));
	    double sale = Double.parseDouble(request.getParameter("sale"));
	    int categoryId = Integer.parseInt(request.getParameter("categoryId"));

	    // Lấy ảnh từ form
	    Part filePart = request.getPart("productImg");
	    InputStream imageStream = null;

	    if (filePart != null && filePart.getSize() > 0) {
	        imageStream = filePart.getInputStream();
	        System.out.println("File Name: " + filePart.getSubmittedFileName());
	        System.out.println("File Size: " + filePart.getSize());
	        System.out.println("File Type: " + filePart.getContentType());
	    }

	    try {
	        dao.insertProduct(description, name, price, weight, sale, categoryId, imageStream);
	        response.sendRedirect("AddProduct.jsp?status=success");
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	        response.sendRedirect("AddProduct.jsp?status=error");
	    }

	}

}
