package entity;

import java.util.Map;

public class Cart {
	private int id;
	private double totalPrice;
	private User user;
	public Cart(double totalPrice, User user) {


		this.totalPrice = totalPrice;
		this.user = user;

	}
	
	

	public Cart(int id, double totalPrice, User user) {
		super();
		this.id = id;
		this.totalPrice = totalPrice;
		this.user = user;
	}



	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	
	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

}
