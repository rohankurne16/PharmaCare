package com.PharmaCare.bin;

import java.sql.Date;

public class Medicine {
	
	private int medicine_id;
	
	private String medicine_name;
	
	private String brand_name;
	
	private String category;
	
	private int quantity;
	
	private double price;
	
	private Date manufacture_date;
	
	private Date expiry_date;
	
	private String rack_no;
	
	private String image;
	
	private String desc;
	
	private String dosage_info;

	public int getMedicine_id() {
		return medicine_id;
	}

	public void setMedicine_id(int medicine_id) {
		this.medicine_id = medicine_id;
	}

	public String getMedicine_name() {
		return medicine_name;
	}

	public void setMedicine_name(String medicine_name) {
		this.medicine_name = medicine_name;
	}

	public String getBrand_name() {
		return brand_name;
	}

	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Date getManufacture_date() {
		return manufacture_date;
	}

	public void setManufacture_date(Date manufacture_date) {
		this.manufacture_date = manufacture_date;
	}

	public Date getExpiry_date() {
		return expiry_date;
	}

	public void setExpiry_date(Date expiry_date) {
		this.expiry_date = expiry_date;
	}

	public String getRack_no() {
		return rack_no;
	}

	public void setRack_no(String rack_no) {
		this.rack_no = rack_no;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getDosage_info() {
		return dosage_info;
	}

	public void setDosage_info(String dosage_info) {
		this.dosage_info = dosage_info;
	}
	
	
	

}
