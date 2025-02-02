package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import context.DBContext;
import entity.Account;
import entity.Category;
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
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5),
						 rs.getDouble(6), rs.getDouble(7),new Category(rs.getInt(8), null),rs.getBlob(9)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Product> getProductsByPage(int currentPage, int productsPerPage) throws ClassNotFoundException {
	    List<Product> products = new ArrayList<>();
	    
	    // Câu SQL đã được sửa lại sử dụng LIMIT và OFFSET
	    String sql = "SELECT * FROM products LIMIT ?, ?";

	    try (Connection conn = new DBContext().getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {
	        
	        // Tính toán offset và limit
	        int offset = (currentPage - 1) * productsPerPage;
	        stmt.setInt(1, offset); // Đặt giá trị OFFSET
	        stmt.setInt(2, productsPerPage); // Đặt giá trị LIMIT
	        
	        try (ResultSet rs = stmt.executeQuery()) {
	            while (rs.next()) {
	                Product product = new Product();
	                // Gán các giá trị vào đối tượng product
	                product.setId(rs.getInt("id"));
	                product.setName(rs.getString("name"));
	                product.setPrice(rs.getDouble("price"));
	                product.setImage(rs.getBlob("image"));
	                products.add(product);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
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

	public List<Category> getAllCategory() {
		List<Category> list = new ArrayList<Category>();
		String query = "select * from categories";

		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Category(rs.getInt(1), rs.getBoolean(2),rs.getString(3)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
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
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5),
						 rs.getDouble(6), rs.getDouble(7),new Category(rs.getInt(8), null),rs.getBlob(9)));
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
				return new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5),
						 rs.getDouble(6), rs.getDouble(7),new Category(rs.getInt(8), null),rs.getBlob(9));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public Account login(String username, String password) {
		String query = "select * from account\n" + "where username = ? and password = ?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password);
			rs = ps.executeQuery();

			while (rs.next()) {
				return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4));
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
				return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4));
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

	public void insertProduct(String name, String imageUrl, String price, String sale, String cateId, String content,
			String weight) {
		String query = "insert into products ([name], [imageUrl], [price], [sale], [cateId], [content], [weight])\n"
				+ "values (?,?,?,?,?,?,?)";
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
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
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

	public User getUserByAccId(int accId) {
		String query = "select * from [user]\n" + "where accId = ?";

		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, accId);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getBoolean(5),
						rs.getString(6), rs.getString(7), rs.getInt(8), new Account(rs.getInt(9), null, null, false));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void updateUser(String firstName, String lastName, String birthDay, boolean gender, String address,
			String email, int phone, String userId) {
		String query = "UPDATE [user] " + "SET [firstName] = ?, " + "[lastName] = ?, " + "[birthDay] = ?, "
				+ "[gender] = ?, " + "[address] = ?, " + "[email] = ?, " + "[phone] = ? " + "WHERE [user].userId = ?";
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
			ps.setString(8, userId);
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

	public void inserUserByAccId(String firstName, String lastName, String birthDay, boolean gender, String address,
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
	
	public List<Product> getProductByName(String name) {
		List<Product> list = new ArrayList<Product>();
		String query = "select * from product\n" + "where name like ?";

		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, "%"+name+"%");
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5),
						 rs.getDouble(6), rs.getDouble(7),new Category(rs.getInt(8), null),rs.getBlob(9)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}


	public List<Order> getOrderByAccId(int accId) {
		List<Order> list = new ArrayList<Order>();
		String query = "select * from order\n" + "where userId = ?";

		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, "accId");
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Order(rs.getInt(1), new Date(rs.getString(2)), 
						new User(rs.getInt(3), rs.getString(4), rs.getString(5),rs.getString(6)), rs.getString(7), rs.getInt(8)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	public static void main(String[] args) {
		DAO dao = new DAO();
//		dao.inserUserByAccId("123", "123", "05-11-2000", true, "ahjxcbjz", "123gmail.com", 97086574, 2019);
//		System.out.println(dao.getAccIdByUserName("345"));
	}
}
