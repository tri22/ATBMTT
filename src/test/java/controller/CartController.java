package controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import entity.Cart;
import entity.CartItem;
import entity.Images;
import entity.Product;
import entity.User;

@WebServlet("/CartController")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DAO dao = new DAO();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		Cart cart = (Cart) dao.getCartByUserId(user.getUserId());
	    if (cart == null) {
	        cart = dao.createCart(user.getUserId());
	    }
	    
	    List<CartItem> cartItems = dao.getListCartItemByCartId(cart.getId());

	    // ✅ Cập nhật giỏ hàng vào session để giữ trạng thái
	    session.setAttribute("cartItems", cartItems);
	   
	
		try {
			List<Images> sliderImages = dao.getAllImages("slider");
			request.setAttribute("sliderImages", sliderImages);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("cart", cart);
		request.getRequestDispatcher("Cart.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    
	    DAO dao = new DAO();
	    HttpSession session = request.getSession();
	    User user = (User) session.getAttribute("user");

	    PrintWriter out = response.getWriter();
	    try {
	        if (user == null) {
	            out.print("{\"status\": \"error\", \"message\": \"Bạn chưa đăng nhập!\"}");
	            return;
	        }

	        int productId = Integer.parseInt(request.getParameter("productId"));
	        String quantityParam = request.getParameter("quantity");
	        int quantity = Integer.parseInt(quantityParam) ;
	        System.out.println(quantity+"mới");

	        // Lấy giỏ hàng
	        Cart cart = (Cart) dao.getCartByUserId(user.getUserId());
	        if (cart == null) {
	            cart = dao.createCart(user.getUserId());
	        }

	        // Kiểm tra sản phẩm trong giỏ hàng
	        CartItem cartItem = dao.getCartItem(cart.getId(), productId);
	        if (cartItem != null) {
	        	 System.out.println(dao.updateCartItem(cart.getId(), productId,  quantity));
	        } else {
	            dao.addCartItem(cart.getId(), productId, quantity);
	        }

	        // Lấy danh sách giỏ hàng cập nhật
	        List<CartItem> cartItems = dao.getListCartItemByCartId(cart.getId());

	        session.setAttribute("cartItems", cartItems);

	        // ✅ Trả về JSON
	        out.print("{\"status\": \"success\", \"message\": \"Thêm vào giỏ hàng thành công!\", \"cartSize\": " + cartItems.size() + "}");
	    } catch (Exception e) {
	        e.printStackTrace();
	        out.print("{\"status\": \"error\", \"message\": \"Có lỗi xảy ra, vui lòng thử lại!\"}");
	    } finally {
	        out.flush();
	    }
	}

}
