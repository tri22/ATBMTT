package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.DAO;

public class AddController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				response.setContentType("text/html;charset=UTF-8");
				request.setCharacterEncoding("UTF-8");
				String name = request.getParameter("name");
				String imageUrl = request.getParameter("imageUrl");
				String price = request.getParameter("price");
				String sale = request.getParameter("sale");
				String cateId = request.getParameter("cateId");
				String content = request.getParameter("content");
				String weight = request.getParameter("weight");
				List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

				for (FileItem item : items) {
					if (item.isFormField()) {
						// Xử lý các trường thông thường
						String fieldName = item.getFieldName();
						String fieldValue = item.getString("UTF-8");
						if ("name".equals(fieldName)) {
							name = fieldValue;
						} else if ("imageUrl".equals(fieldName)) {
							imageUrl = fieldValue;
						} else if ("price".equals(fieldName)) {
							price = fieldValue;
						} else if ("sale".equals(fieldName)) {
							sale = fieldValue;
						} else if ("cateId".equals(fieldName)) {
							cateId = fieldValue;
						} else if ("content".equals(fieldName)) {
							content = fieldValue;
						} else if ("weight".equals(fieldName)) {
							weight = fieldValue;
						}
						// (xử lý các trường khác)
					} else {
						// Xử lý file tải lên (ảnh)
						String fileName = new File(item.getName()).getName();
						String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
						File uploadDir = new File(uploadPath);
						if (!uploadDir.exists()) {
							uploadDir.mkdir();
						}
						String filePath = uploadPath + File.separator + fileName;
						File storeFile = new File(filePath);
						item.write(storeFile);
						imageUrl = "uploads" + File.separator + fileName;
					}
				}

				DAO dao = new DAO();
				dao.insertProduct(name, imageUrl, price, sale, cateId, content, weight);
				request.getRequestDispatcher("MyProductController").forward(request, response);
			} catch (FileUploadException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
