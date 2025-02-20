package entity;

import java.sql.Blob;

public class Images {
	private int id;
	private String name;
	private String tableName ;
	private Blob image;
	// Thêm thuộc tính mới để lưu chuỗi Base64
    private String imageBase64;
	
	public Images(int id, String name, String tableName) {
		super();
		this.id = id;
		this.name = name;
		this.tableName = tableName;

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public Blob getImage() {
		return image;
	}

	public void setImage(Blob image) {
		this.image = image;
	}



    // Getter và Setter cho imageBase64
    public String getImageBase64() {
        return imageBase64;
    }

    public void setImageBase64(String imageBase64) {
        this.imageBase64 = imageBase64;
    }

}
