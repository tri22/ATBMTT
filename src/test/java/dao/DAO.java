package dao;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import context.DBContext;
import entity.Account;
import entity.Category;
import entity.Images;
import entity.Order;
import entity.Product;
import entity.User;

public class DAO {
	Connection conn = null; // Kết nối đến sql server
	PreparedStatement ps = null; // Ném câu lệnh query từ eclipse sang sql server
	ResultSet rs = null; // Nhận kết quả trả về

	public List<Product> getAllProduct() {
		List<Product> list = new ArrayList<Product>();
		String query = "select * from products";

		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setDescription(rs.getString("description"));
				product.setPrice(rs.getDouble("price"));
				product.setSale(rs.getDouble("sale"));
				product.setWeight(rs.getInt("weight"));
				product.setCategory(getCategoryById(rs.getInt("category_Id")));

				Blob imageBlob = rs.getBlob("image");
				if (imageBlob != null) {
					byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
					String base64Image = Base64.getEncoder().encodeToString(imageBytes);
					product.setImageBase64(base64Image);
				}

				list.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Product> getProductsByPage(int currentPage, int productsPerPage)
			throws ClassNotFoundException, SQLException {
		List<Product> products = new ArrayList<>();
		String sql = "SELECT * FROM products LIMIT ? OFFSET ?";
		conn = new DBContext().getConnection();
		try (PreparedStatement ps = conn.prepareStatement(sql)) {

			int offset = (currentPage - 1) * productsPerPage;
			ps.setInt(1, productsPerPage);
			ps.setInt(2, offset);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String description = rs.getString("description");
				double price = rs.getDouble("price");
				int weight = rs.getInt("weight");
				double rating = rs.getDouble("rating");
				double sale = rs.getDouble("sale");
				Category category = getCategoryById(rs.getInt("category_Id"));

				// Xử lý ảnh từ Blob
				Blob imageBlob = rs.getBlob("image");
				String base64Image = "";
				if (imageBlob != null) {
					byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
					base64Image = Base64.getEncoder().encodeToString(imageBytes);
				}

				Product product = new Product(id, description, name, price, weight, rating, sale, category, imageBlob);
				product.setImageBase64(base64Image); // Đặt thêm ảnh base64 để hiển thị

				products.add(product);
			}
		}
		return products;
	}

	public int getTotalProducts() {
		int totalProducts = 0;
		String query = "SELECT COUNT(*) FROM products";

		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();

			if (rs.next()) {
				totalProducts = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalProducts;
	}

	public List<Product> getProductByCateId(String cateId) {
		List<Product> list = new ArrayList<Product>();
		String query = "select * from products\n" + "where cateId = ?";

		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, cateId);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Product(rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getDouble(6),
						rs.getDouble(7), new Category(rs.getInt(8), null), rs.getBlob(9)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Product getProductById(String id) {
		String query = "select * from products\n" + "where id = ?";

		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Product(rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getDouble(6),
						rs.getDouble(7), new Category(rs.getInt(8), null), rs.getBlob(9));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Product> getProductByName(String name) {
		List<Product> list = new ArrayList<Product>();
		String query = "select * from product\n" + "where name like ?";

		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, "%" + name + "%");
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5),
						rs.getDouble(6), rs.getDouble(7), new Category(rs.getInt(8), null), rs.getBlob(9)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void deleteProduct(String id) {
		String query = "delete products\n" + "where id = ?";

		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void insertProduct(String description, String name, double price, int weight, double sale, int categoryId,
			InputStream imageStream) throws ClassNotFoundException {
		String query = "INSERT INTO products (name, description, price, weight, sale, category_id, image) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
			ps.setString(1, name);
			ps.setString(2, description);
			ps.setDouble(3, price);
			ps.setInt(4, weight);
			ps.setDouble(5, sale);
			ps.setInt(6, categoryId);

			if (imageStream != null) {
				ps.setBinaryStream(7, imageStream, imageStream.available());
			} else {
				ps.setNull(7, java.sql.Types.BLOB);
			}

			ps.executeUpdate();
		} catch (Exception e) {
			((Throwable) e).printStackTrace();
		}
	}

	public void updateProduct(String name, String imageUrl, String price, String sale, String cateId, String content,
			String weight, String id) {
		String query = "update products \r\n" + "set [name] = ?, \r\n" + "[imageUrl] = ?,\r\n" + "[price] = ?, \r\n"
				+ "[sale] = ?, \r\n" + "[cateId] = ?, \r\n" + "[content] = ?, \r\n" + "[weight] = ?\r\n"
				+ "where id = ?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, imageUrl);
			ps.setString(3, price);
			ps.setString(4, sale);
			ps.setString(5, cateId);
			ps.setString(6, content);
			ps.setString(7, weight);
			ps.setString(8, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Category> getAllCategory() {
		List<Category> list = new ArrayList<Category>();
		String query = "select * from categories";

		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Category(rs.getInt(1), rs.getBoolean(2), rs.getString(3)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Category getCategoryById(int id) throws ClassNotFoundException {
		String query = "SELECT * FROM categories WHERE id = ?";

		try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

			ps.setInt(1, id);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return new Category(rs.getInt("id"), rs.getString("name"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null; // Trả về null nếu không tìm thấy danh mục
	}

	public User login(String username, String password) {
		String query = "select * from users\n" + "where username = ? and password = ?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password);
			rs = ps.executeQuery();
				
			while (rs.next()) {
				User user = new User(rs.getInt("id"), rs.getString("firstname"), rs.getString("lastname"), rs.getDate("birthday"), rs.getString("address"),
						rs.getString("email"), rs.getInt("phone"), rs.getString("username"), rs.getString("password"),rs.getString("role"));
				Blob imageBlob = rs.getBlob("avatar");
				if (imageBlob != null) {
					byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
					String base64Image = Base64.getEncoder().encodeToString(imageBytes);
					user.setImageBase64(base64Image);
				}
				return user;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public Account checkAccountExist(String username) {
		String query = "select * from account\n" + "where username = ?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			rs = ps.executeQuery();

			while (rs.next()) {
				return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void signup(String username, String password) {
		String query = "insert into Account\n" + "values(?, ?, 0)";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public User getUserById(int Id) {
		String query = "select * from users\n" + "where id = ?";

		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, Id);
			rs = ps.executeQuery();
			while (rs.next()) {
				User user = new User(rs.getInt("id"), rs.getString("firstname"), rs.getString("lastname"), rs.getDate("birthday"), rs.getString("address"),
						rs.getString("email"), rs.getInt("phone"), rs.getString("username"), rs.getString("password"),rs.getString("role"));
				Blob imageBlob = rs.getBlob("avatar");
				if (imageBlob != null) {
					byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
					String base64Image = Base64.getEncoder().encodeToString(imageBytes);
					user.setImageBase64(base64Image);
				}
				return user;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public void updateUser(String firstName, String lastName, String birthDay, InputStream avatar, String address,
	        String email, int phone, int userId, String username, String password) {
	    String query = "UPDATE users " +
	                   "SET firstName = ?, " +
	                   "lastName = ?, " +
	                   "birthDay = ?, " +
	                   "avatar = ?, " +
	                   "address = ?, " +
	                   "email = ?, " +
	                   "phone = ?, " +
	                   "username = ?, " +
	                   "password = ? " +
	                   "WHERE Id = ?";  // Đảm bảo userId là cột trong bảng users

	    try {
	        conn = new DBContext().getConnection();
	        ps = conn.prepareStatement(query);

	        ps.setString(1, firstName);
	        ps.setString(2, lastName);
	        ps.setString(3, birthDay);

	        if (avatar != null) {
	            ps.setBinaryStream(4, avatar, avatar.available());
	        } else {
	            ps.setNull(4, java.sql.Types.BLOB);  // Đặt giá trị NULL nếu không có ảnh
	        }

	        ps.setString(5, address);
	        ps.setString(6, email);
	        ps.setInt(7, phone);
	        ps.setString(8, username);
	        ps.setString(9, password);
	        ps.setInt(10, userId);

	        ps.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}


	public int getAccIdByUserName(String userName) {
		String query = "select accId\r\n" + "from account\r\n" + "where username = ?";
		int accId = 0;
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, userName);
			rs = ps.executeQuery();
			while (rs.next()) {
				accId = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return accId;
	}

	public void insertUserByAccId(String firstName, String lastName, String birthDay, boolean gender, String address,
			String email, int phone, String accId) {
		String query = "INSERT INTO [dbo].[user] ([firstName],[lastName],[birthDay],[gender],[address],[email],[phone],[accId]) VALUES\r\n"
				+ "(?,?,?,?,?,?,?,?)";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, firstName);
			ps.setString(2, lastName);
			ps.setString(3, birthDay);
			ps.setBoolean(4, gender);
			ps.setString(5, address);
			ps.setString(6, email);
			ps.setInt(7, phone);
			ps.setString(8, accId);
			ps.executeUpdate();
			rs = ps.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Order> getOrderByUserId(int Id) {
		List<Order> list = new ArrayList<Order>();
		String query = "select * from order\n" + "where userId = ?";

		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, "Id");
			rs = ps.executeQuery();
			User user =getUserById(Id);
			while (rs.next()) {
				list.add(new Order(rs.getInt(1), rs.getDate(Id),user,rs.getString("status"),rs.getDouble("amount"),rs.getString("payment_method")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Images> getImages(String pageName, String name) throws ClassNotFoundException {
	    List<Images> images = new ArrayList<>();
	    String query = "SELECT * FROM images WHERE page_name = ? AND name LIKE ?";

	    try (Connection conn = new DBContext().getConnection();
	         PreparedStatement ps = conn.prepareStatement(query)) {
	        
	        ps.setString(1, pageName);    // Truyền tham số page_name
	        ps.setString(2, "%" + name + "%");  // Thêm ký tự '%' để tìm tên chứa 'name'

	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            // Giả sử bạn muốn lấy đường dẫn từ tên ảnh hoặc dữ liệu ảnh
	        	int imgId = rs.getInt("Id");
	        	String imgName = rs.getString("name");
	        	Blob imageBlob = rs.getBlob("image");
	        	String base64Image ="";
	        	if (imageBlob != null) {
	        		byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
		        	base64Image = Base64.getEncoder().encodeToString(imageBytes);
		        }
		        Images img = new Images(imgId, imgName, pageName);
		        img.setImageBase64(base64Image);
	            images.add(img);  
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return images;
	}
	public List<Images> getAllImages(String pageName) throws ClassNotFoundException {
	    List<Images> images = new ArrayList<>();
	    String query = "SELECT * FROM images WHERE page_name = ? ";

	    try (Connection conn = new DBContext().getConnection();
	         PreparedStatement ps = conn.prepareStatement(query)) {
	        
	        ps.setString(1, pageName);    // Truyền tham số page_name
	       
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            // Giả sử bạn muốn lấy đường dẫn từ tên ảnh hoặc dữ liệu ảnh
	        	int imgId = rs.getInt("Id");
	        	String imgName = rs.getString("name");
	        	Blob imageBlob = rs.getBlob("data");
	        	String base64Image ="";
	        	if (imageBlob != null) {
	        		byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
		        	base64Image = Base64.getEncoder().encodeToString(imageBytes);
		        }
		        Images img = new Images(imgId, imgName, pageName);
		        img.setImageBase64(base64Image);
	            images.add(img);  
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return images;
	}

	public static void main(String[] args) {
		DAO dao = new DAO();
//		dao.inserUserByAccId("123", "123", "05-11-2000", true, "ahjxcbjz", "123gmail.com", 97086574, 2019);
//		System.out.println(dao.getAccIdByUserName("345"));
	}
}
