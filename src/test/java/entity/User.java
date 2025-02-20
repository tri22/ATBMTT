package entity;

import java.sql.Blob;
import java.sql.Date;
import java.sql.SQLException;
import java.io.InputStream;
import java.io.IOException;
import java.util.Base64;

public class User {
    private int userId;
    private String firstName;
    private String lastName;
    private Date birthDay;
    private String address;
    private String email;
    private int phone;
    private String username;
    private String password;
    private String role; // "admin" hoặc "user"
    private Blob avatar;
    
    // Thêm thuộc tính mới để lưu chuỗi Base64
    private String imageBase64;

    public User(int userId, String firstName, String lastName, Date birthDay, String address,
                String email, int phone, String username, String password, String role) {
        super();
        this.userId = userId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.birthDay = birthDay;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.username = username;
        this.password = password;
        this.role = role;
    }

    // Các getter và setter khác

    public Blob getAvatar() {
        return avatar;
    }

    public void setAvatar(Blob avatar) {
        this.avatar = avatar;
        // Nếu có avatar, chuyển nó thành base64
        if (avatar != null) {
            this.imageBase64 = convertBlobToBase64(avatar);
        }
    }

    public String getImageBase64() {
        return imageBase64;
    }

    public void setImageBase64(String imageBase64) {
        this.imageBase64 = imageBase64;
    }

    private String convertBlobToBase64(Blob blob) {
        try (InputStream inputStream = blob.getBinaryStream()) {
            byte[] bytes = new byte[(int) blob.length()];
            inputStream.read(bytes);
            return Base64.getEncoder().encodeToString(bytes);
        } catch (IOException | SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Date getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Override
    public String toString() {
        return "User [userId=" + userId + ", firstName=" + firstName + ", lastName=" + lastName + ", birthDay="
                + birthDay + ", address=" + address + ", email=" + email + ", phone=" + phone + ", username=" + username
                + ", password=" + password + ", role=" + role + "]";
    }
}
