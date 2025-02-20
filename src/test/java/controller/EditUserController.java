package controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.DAO;
import entity.Account;
import entity.User;
@WebServlet("/EditUserController")
public class EditUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		System.out.println(user.toString());
		request.setAttribute("user", user);
		request.getRequestDispatcher("EditUser.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		int userId = user.getUserId();
		
		if (ServletFileUpload.isMultipartContent(request)) {
	        try {
	            response.setContentType("text/html;charset=UTF-8");
	            request.setCharacterEncoding("UTF-8");

	            String firstName = "", lastName = "", birthDay = "", address = "", email = "", username = "", password = "";
	            int phone = 0;
	            InputStream avatar = null;

	            // Cấu hình Factory để xử lý file upload
	            DiskFileItemFactory factory = new DiskFileItemFactory();
	            ServletFileUpload upload = new ServletFileUpload(factory);

	            List<FileItem> formItems = upload.parseRequest(request);

	            for (FileItem item : formItems) {
	                if (item.isFormField()) {
	                    // Xử lý các input text
	                    String fieldName = item.getFieldName();
	                    String fieldValue = item.getString("UTF-8");

	                    if ("firstName".equals(fieldName)) {
	                        firstName = fieldValue.isEmpty() ? user.getFirstName() : fieldValue;
	                    } else if ("lastName".equals(fieldName)) {
	                        lastName = fieldValue.isEmpty() ? user.getLastName() : fieldValue;
	                    } else if ("birthDay".equals(fieldName)) {
	                        birthDay = fieldValue.isEmpty() ? user.getBirthDay() + "" : fieldValue;
	                    } else if ("address".equals(fieldName)) {
	                        address = fieldValue.isEmpty() ? user.getAddress() : fieldValue;
	                    } else if ("email".equals(fieldName)) {
	                        email = fieldValue.isEmpty() ? user.getEmail() : fieldValue;
	                    } else if ("phone".equals(fieldName)) {
	                        try {
	                            phone = fieldValue.isEmpty() ? user.getPhone() : Integer.parseInt(fieldValue);
	                        } catch (NumberFormatException e) {
	                            phone = user.getPhone(); // Giữ giá trị cũ nếu nhập sai
	                        }
	                    } else if ("username".equals(fieldName)) {
	                        username = fieldValue.isEmpty() ? user.getUsername() : fieldValue;
	                    } else if ("password".equals(fieldName)) {
	                        password = fieldValue.isEmpty() ? user.getPassword() : fieldValue;
	                    }

	                } else {
	                    // Xử lý file upload (ảnh đại diện)
	                    if ("avatar".equals(item.getFieldName()) && item.getSize() > 0) {
	                        avatar = item.getInputStream();
	                        System.out.println("File Name: " + item.getName());
	                        System.out.println("File Size: " + item.getSize());
	                        System.out.println("File Type: " + item.getContentType());
	                    }
	                }
	            }

	            // Cập nhật dữ liệu vào database
	            DAO dao = new DAO();
	            dao.updateUser(firstName, lastName, birthDay, avatar, address, email, phone, userId, username, password);
	            
	         // Sau khi cập nhật, lấy lại thông tin user từ database
	            User updatedUser = dao.getUserById(userId); // Viết phương thức này trong DAO

	            // Lưu user mới vào session

	            session.setAttribute("user", updatedUser);

	            // Chuyển hướng về trang chi tiết
	            response.sendRedirect("DetailUserController");


	        } catch (FileUploadException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	}
}
