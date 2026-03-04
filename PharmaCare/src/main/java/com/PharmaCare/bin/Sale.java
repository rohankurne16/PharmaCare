package com.PharmaCare.bin;

import java.sql.Date;
import java.sql.Timestamp;

public class Sale {
	
	private int sale_id;
	
    private int medicine_id;
    
    private String medicine_name;
    
    private int quantity_sold;
    
    private double price;
    
    private String customer_name;
    
    private Date sale_date;

    private double total_revenue;
    
	public int getSale_id() {
		return sale_id;
	}

	public void setSale_id(int sale_id) {
		this.sale_id = sale_id;
	}

	public int getMedicine_id() {
		return medicine_id;
	}

	public void setMedicine_id(int medicine_id) {
		this.medicine_id = medicine_id;
	}

	public int getQuantity_sold() {
		return quantity_sold;
	}

	public void setQuantity_sold(int quantity_sold) {
		this.quantity_sold = quantity_sold;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public Date getSale_date() {
		return sale_date;
	}

	public void setSale_date(Date saleDate) {
		this.sale_date = saleDate;
	}

	public double getTotal_revenue() {
		return total_revenue;
	}

	public void setTotal_revenue(double total_revenue) {
		this.total_revenue = total_revenue;
	}

	public String getMedicine_name() {
		return medicine_name;
	}

	public void setMedicine_name(String medicine_name) {
		this.medicine_name = medicine_name;
	}
    
    

}
