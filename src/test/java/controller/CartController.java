package controller;

import java.io.IOException;
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
		    DAO dao = new DAO();
		    HttpSession session = request.getSession();
		    User user = (User) session.getAttribute("user");
		    System.out.println(user.toString());
		    int productId = Integer.parseInt(request.getParameter("productId"));
		    String quantityParam = request.getParameter("quantity");
		    int quantity = (quantityParam != null && !quantityParam.isEmpty()) ? Integer.parseInt(quantityParam) : 1;

		    
		    // Lấy giỏ hàng 

		
			Cart cart = (Cart) dao.getCartByUserId(user.getUserId());
		    if (cart == null) {
		        cart = dao.createCart(user.getUserId());
		    }
		    // Lấy sản phẩm từ database
		    Product product = dao.getProductById(productId);

		    CartItem cartItem = dao.getCartItem(cart.getId(), productId);

		    if (cartItem != null) {
		        dao.updateCartItem(cart.getId(), productId, cartItem.getWeight() + quantity);
		    } else {
		        dao.addCartItem(cart.getId(), productId, quantity);
		    }

		    List<CartItem> cartItems = dao.getListCartItemByCartId(cart.getId());
		    for (CartItem cartItem2 : cartItems) {
				System.out.println(cartItem2.getProduct());
			}
		    // ✅ Cập nhật giỏ hàng vào session để giữ trạng thái
		    session.setAttribute("cartItems", cartItems);

		    // Chuyển hướng về trang giỏ hàng
		    response.sendRedirect("CartController");
		}

}
