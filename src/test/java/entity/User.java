package entity;

import java.sql.Date;

public class User {
	private int userId;
	private String firstName;
	private String lastName;
	private Date birthDay;
	private boolean gender;
	private String address;
	private String email;
	private int phone;
	private Account account;

	public User(int userId, String firstName, String lastName, Date birthDay, boolean gender, String address,
			String email, int phone, Account account) {
		this.userId = userId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.birthDay = birthDay;
		this.gender = gender;
		this.address = address;
		this.email = email;
		this.phone = phone;
		this.account = account;
	}
	public User(int userId, String lastName,String address,String email) {
		this.userId = userId;
		this.lastName = lastName;
		this.address = address;
		this.email = email;
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

	public boolean isGender() {
		return gender;
	}

	public String getGender() {
		if (isGender()) {
			return "Female";
		} else {
			return "Male";
		}
	}

	public void setGender(boolean gender) {
		this.gender = gender;
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

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", firstName=" + firstName + ", lastName=" + lastName + ", birthDay="
				+ birthDay + ", gender=" + gender + ", address=" + address + ", email=" + email + ", phone=" + phone
				+ ", account=" + account + "]";
	}

}
