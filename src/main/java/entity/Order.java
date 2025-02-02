package entity;

import java.util.Date;

public class Order {
		private int id;
		private Date orderDate;
		private User user;
		private String deliveryStatus;
		private int progress;

		public Order(int id, Date orderDate, User user, String deliveryStatus, int progress) {
			super();
			this.id = id;
			this.orderDate = orderDate;
			this.user = user;
			this.deliveryStatus = deliveryStatus;
			this.progress = progress;
		}

		public int getId() {
			return id;
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

		public int getProgress() {
			return progress;
		}

		public void setProgress(int progress) {
			this.progress = progress;
		}

}
