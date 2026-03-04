package com.PharmaCare.bin;

import java.sql.Date;
import java.sql.Timestamp;

public class Orders {

    private int orderId;
    private String medicineName;
    private String brand;
    private int quantity;
    private Date orderDate;

   
    public int getOrderId() {
        return orderId;
    }
    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getMedicineName() {
        return medicineName;
    }
    public void setMedicineName(String medicineName) {
        this.medicineName = medicineName;
    }

    public String getBrand() {
        return brand;
    }
    public void setBrand(String brand) {
        this.brand = brand;
    }

    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getOrderDate() {
        return orderDate;
    }
    public void setOrderDate(Date date) {
        this.orderDate = date;
    }
}
