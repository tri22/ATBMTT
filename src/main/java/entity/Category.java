package entity;


public class Category {
	private int cateId;
	private boolean deleted;
	private String cateName;

	public Category(int cateId,boolean deleted, String cateName) {
		this.cateId = cateId;
		this.deleted = deleted;
		this.cateName = cateName;
	}
	
	public Category(int cateId, String cateName) {
		this.cateId = cateId;
		this.cateName = cateName;
	}


	public int getCateId() {
		return cateId;
	}


	public void setCateId(int cateId) {
		this.cateId = cateId;
	}


	public boolean isDeleted() {
		return deleted;
	}


	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}


	public String getCateName() {
		return cateName;
	}


	public void setCateName(String cateName) {
		this.cateName = cateName;
	}


	@Override
	public String toString() {
		return "Category [cateId=" + cateId + ", cateName=" + cateName + "]";
	}

}
