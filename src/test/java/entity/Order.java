package entity;

import java.util.Date;

public class Order {
		private int id;
		private Date orderDate;
		private User user;
		private String deliveryStatus;
		private double totalValue;
		private String paymentMethod;

	

		public Order(int id, Date orderDate, User user, String deliveryStatus, double totalValue,
				String paymentMethod) {
			super();
			this.id = id;
			this.orderDate = orderDate;
			this.user = user;
			this.deliveryStatus = deliveryStatus;
			this.totalValue = totalValue;
			this.paymentMethod = paymentMethod;
		}

		public int getId() {
			return id;
		}

		public double getTotalValue() {
			return totalValue;
		}

		public void setTotalValue(double totalValue) {
			this.totalValue = totalValue;
		}

		public String getPaymentMethod() {
			return paymentMethod;
		}

		public void setPaymentMethod(String paymentMethod) {
			this.paymentMethod = paymentMethod;
		}

		public void setId(int id) {
			this.id = id;
		}

		
		public Date getOrderDate() {
			return orderDate;
		}

		public void setOrderDate(Date orderDate) {
			this.orderDate = orderDate;
		}

		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}

		public String getDeliveryStatus() {
			return deliveryStatus;
		}

		public void setDeliveryStatus(String deliveryStatus) {
			this.deliveryStatus = deliveryStatus;
		}

		@Override
		public String toString() {
			return "Order [id=" + id + ", orderDate=" + orderDate + ", user=" + user + ", deliveryStatus="
					+ deliveryStatus + ", totalValue=" + totalValue + ", paymentMethod=" + paymentMethod + "]";
		}

}
