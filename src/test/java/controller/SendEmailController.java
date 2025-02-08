package controller;

import java.io.IOException;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import entity.Account;
import entity.Product;
import entity.User;

public class SendEmailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final String email = "fttrat2003@gmail.com";
		final String password = "fqdwajjejmakrhli";

		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");

		Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(email, password);
			}
		});

		String toEmail = request.getParameter("email");
		String subject = "Xác nhận đơn hàng thành công";
		String userId = request.getParameter("userId");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String address = request.getParameter("address");
		String birthDay = request.getParameter("birthDay");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");

		HttpSession sess = request.getSession();
		List<Product> listProduct = (List<Product>) sess.getAttribute("cart");
		Account account = (Account) sess.getAttribute("account");
		int accId = account.getAccId();

		DAO dao = new DAO();
		User user = dao.getUserByAccId(accId);

		request.setAttribute("totalPrice", calculateTotalPrice(listProduct));
		request.setAttribute("user", user);
		request.setAttribute("account", account);
		request.setAttribute("listProduct", listProduct);

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(email));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
			message.setSubject(subject);
			String emailContent = buildEmailContent(user, listProduct);
			message.setText(emailContent);
			Transport.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		request.getRequestDispatcher("Successfull.jsp").forward(request, response);
	}

	private String buildEmailContent(User user, List<Product> listProduct) {
		StringBuilder content = new StringBuilder();
		content.append(String.format(
				"User ID: %s%nFirst name: %s%nLast name: %s%nAddress: %s%nBirthday: %s%nGender: %s%nPhone: %s%n",
				user.getUserId(), user.getFirstName(), user.getLastName(), user.getAddress(), user.getBirthDay(),
				user.getGender(), user.getPhone()));

		content.append("Products:\n");
		for (Product product : listProduct) {
			content.append(String.format("- %s: %.2f%n", product.getName(), product.cost(product.getWeight())));
		}

		double totalPrice = calculateTotalPrice(listProduct);
		content.append(String.format("Total Price: %.2f%n", totalPrice));

		return content.toString();
	}

	private double calculateTotalPrice(List<Product> listProduct) {
		double totalPrice = 0;
		for (Product product : listProduct) {
			totalPrice += product.cost(product.getWeight());
		}
		return totalPrice;
	}

}
