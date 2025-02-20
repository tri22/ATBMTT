package controller;

import java.io.IOException;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import entity.Account;
import entity.User;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        String username = "";
        String token = "";

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("userCookie")) {
                    username = cookie.getValue();
                }
                if (cookie.getName().equals("authToken")) {
                    token = cookie.getValue();
                }
            }
        }

        // Nếu có token, tự động đăng nhập
        if (!token.isEmpty()) {
            String[] credentials = new String(Base64.getDecoder().decode(token)).split(":");
            String savedUsername = credentials[0];
            String savedPassword = credentials[1];

            DAO dao = new DAO();
            User user = dao.login(savedUsername, savedPassword);
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect("HomeController");
                return;
            }
        }

        // Nếu không có token, hiển thị username đã lưu
        request.setAttribute("username", username);
        request.getRequestDispatcher("Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");

        HttpSession session = request.getSession();

        DAO dao = new DAO();
        User user = dao.login(username, password);
        if (user == null) {
            request.setAttribute("loginError", "Wrong username or password");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
        	session.setAttribute("user", user);

            // Lưu username vào cookie
            Cookie userCookie = new Cookie("userCookie", username);
            userCookie.setMaxAge(60 * 60 * 24);  // 1 ngày
            userCookie.setHttpOnly(true);
            userCookie.setSecure(true);
            response.addCookie(userCookie);

            // Nếu chọn "Remember Me", lưu token
            if ("on".equals(remember)) {
                String token = Base64.getEncoder().encodeToString((username + ":" + password).getBytes());
                Cookie authToken = new Cookie("authToken", token);
                authToken.setMaxAge(60 * 60 * 24);  // 1 ngày
                authToken.setHttpOnly(true);
                authToken.setSecure(true);
                response.addCookie(authToken);
            } else {
                // Xóa token nếu không chọn "Remember Me"
                Cookie authToken = new Cookie("authToken", "");
                authToken.setMaxAge(0);  // Xóa ngay lập tức
                response.addCookie(authToken);
            }

            response.sendRedirect("HomeController");
        }
    }
}
