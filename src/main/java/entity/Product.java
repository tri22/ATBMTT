package entity;

import java.sql.Blob;
import java.util.Arrays;

public class Product {
	private int id;
	private String description;
	private String name;
	private double price;
	private int weight;
	private double rating;
	private double sale;
	private Category category;
	private Blob image;


	public Product(int id, String description, String name, double price, int weight, double rating, double sale,
			Category category, Blob image) {
		super();
		this.id = id;
		this.description = description;
		this.name = name;
		this.price = price;
		this.weight = weight;
		this.rating = rating;
		this.sale = sale;
		this.category = category;
		this.image = image;
	}

	

	public Product() {
		// TODO Auto-generated constructor stub
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public double getPrice() {
		return price;
	}



	public void setPrice(double price) {
		this.price = price;
	}



	public int getWeight() {
		return weight;
	}



	public void setWeight(int weight) {
		this.weight = weight;
	}



	public double getRating() {
		return rating;
	}



	public void setRating(double rating) {
		this.rating = rating;
	}



	public double getSale() {
		return sale;
	}



	public void setSale(double sale) {
		this.sale = sale;
	}



	public Category getCategory() {
		return category;
	}



	public void setCategory(Category category) {
		this.category = category;
	}



	public Blob getImage() {
		return image;
	}



	public void setImage(Blob blob) {
		this.image = blob;
	}



	@Override
	public String toString() {
		return "Product [id=" + id + ", description=" + description + ", name=" + name + ", price=" + price
				+ ", weight=" + weight + ", rating=" + rating + ", sale=" + sale + ", category=" + category + ", image="
				+ "]";
	}



	public double cost(int weight) {
		return weight * price;
	}
}
