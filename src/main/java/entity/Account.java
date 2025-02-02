package entity;

public class Account {
	private int accId;
	private String username;
	private String password;
	private boolean isAdmin;

	public Account() {
	}

	public Account(int accId, String username, String password, boolean isAdmin) {
		this.accId = accId;
		this.username = username;
		this.password = password;
		this.isAdmin = isAdmin;
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

	public boolean isIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	@Override
	public String toString() {
		return "Account [id=" + accId + ", username=" + username + ", password=" + password + ", isAdmin=" + isAdmin
				+ "]";
	}
}
