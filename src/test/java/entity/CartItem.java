package entity;

public class CartItem {
	private int id;
    private Product product;
    private int weight;
    private Cart cart;

    public CartItem(int id, Product product, int weight , Cart cart) {
    	this.id = id;
        this.product = product;
        this.weight = weight;
        this.cart = cart;
    }

    
	public Product getProduct() {
        return product;
    }

    public int getWeight() {
        return weight;
    }

    public void increaseQuantity() {
        this.weight++;
    }
    
    public void decreaseQuantity() {
        this.weight--;
    }
}
