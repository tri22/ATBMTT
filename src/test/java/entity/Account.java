package entity;

public class Account {
	private int accId;
	private String username;
	private String password;
	private String role; // "admin" hoặc "user"

	public Account() {
	}

	public Account(int accId, String username, String password,String role) {
		this.accId = accId;
		this.username = username;
		this.password = password;
		this.role =role;
	}

	public int getAccId() {
		return accId;
	}

	public void setAccId(int accId) {
		this.accId = accId;
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
		return "Account [id=" + accId + ", username=" + username + ", password=" + password + "]";
	}
}
