package com.PharmaCare.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.PharmaCare.bin.Orders;

public class OrdersDAO {

    public void insertOrder(String medicine, String brand, int quantity) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare", "root", "root");

        String sql = "insert into orders(medicine_name, brand, quantity) VALUES (?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, medicine);
        ps.setString(2, brand);
        ps.setInt(3, quantity);

        ps.executeUpdate();
        ps.close();
        con.close();
    }
    

    public static ArrayList<Orders> getAllOrders()
            throws ClassNotFoundException, SQLException {

        ArrayList<Orders> list = new ArrayList<>();

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/pharmacare",
                "root",
                "root"
        );

        String sql = "SELECT * FROM orders ORDER BY order_date DESC";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Orders o = new Orders();
            o.setOrderId(rs.getInt("order_id"));
            o.setMedicineName(rs.getString("medicine_name"));
            o.setBrand(rs.getString("brand")); // or brand_name (check column)
            o.setQuantity(rs.getInt("quantity"));
            o.setOrderDate(rs.getDate("order_date"));

            list.add(o);
        }

        rs.close();
        ps.close();
        con.close();

        return list;
    }
}

       
       

