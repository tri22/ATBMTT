package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;


@WebServlet("/LogoutController")
public class LogoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Xóa session
        HttpSession session = (HttpSession) request.getSession();
        session.invalidate();

        // Xóa cookies
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("userCookie") || cookie.getName().equals("authToken")) {
                    cookie.setMaxAge(0); // Xóa cookie ngay lập tức
                    cookie.setValue("");
                    response.addCookie(cookie);
                }
            }
        }

        // Điều hướng đến trang login
        response.sendRedirect("LoginController");
    }
}
