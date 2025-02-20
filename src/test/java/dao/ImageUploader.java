package dao;

import java.sql.*;
import java.io.*;

public class ImageUploader {

    // Thông tin kết nối cơ sở dữ liệu
    private static final String DB_URL = "jdbc:mysql://localhost:3306/foodweb";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    public static void main(String[] args) {
        String imagePath = "E:\\New-workspace\\FoodWeb\\src\\main\\webapp\\home-assest\\img\\cooperate-img\\coop-4.png"; // Đường dẫn đến file ảnh

        // Gọi phương thức upload ảnh
        try {
            uploadImage(imagePath);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void uploadImage(String imagePath) throws ClassNotFoundException {
        String query = "INSERT INTO images (page_name, name, data) VALUES (?, ?, ?)";
        
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD); 
             PreparedStatement ps = conn.prepareStatement(query)) {

            // Đọc file ảnh vào InputStream
            File imageFile = new File(imagePath);
            FileInputStream imageStream = new FileInputStream(imageFile);

            // Thiết lập các tham số cho PreparedStatement
            ps.setString(1, "home"); // Ví dụ, page_name là 'home'
            ps.setString(2, "home-partner-4"); // Ví dụ, name là 'slider-img-1'
            ps.setBinaryStream(3, imageStream, (int) imageFile.length()); // Đọc ảnh vào InputStream và set vào cột data

            // Thực hiện câu lệnh insert
            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Ảnh đã được upload thành công!");
            }

        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
    }

}
