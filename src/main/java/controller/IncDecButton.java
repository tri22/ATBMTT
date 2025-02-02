package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IncDecButton extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int currentQuantity = Integer.parseInt(request.getParameter("currentQuantity"));

		String action = request.getParameter("action");

		if ("inc".equals(action)) {
			currentQuantity++;
		} else if ("dec".equals(action)) {
			currentQuantity = Math.max(1, currentQuantity - 1);
		}

		// Prepare the response
		response.setContentType("text/plain");
		response.getWriter().write(String.valueOf(currentQuantity));
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
