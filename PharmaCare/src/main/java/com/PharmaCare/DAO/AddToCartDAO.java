package com.PharmaCare.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AddToCartDAO {
	
	public boolean checkcart(String medicine_name) throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
	    
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare", "root", "root");
	    
	    PreparedStatement ps = con.prepareStatement("select * from cart where medicine_name = ?");
	    
	    ps.setString(1, medicine_name);
	    
	    ResultSet rs = ps.executeQuery();
	    
	    
	    while(rs.next()) {
	    	return true;
	    }
	    return false;
	    
		
	}
	

	public boolean addtocart(String medicine_name, String brand, String category) throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
	    
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare", "root", "root");
	    
	    PreparedStatement ps = con.prepareStatement("insert into cart(medicine_name,brand,category,quantity)values(?,?,?,?)");
	    
	    
	    
	    ps.setString(1, medicine_name);
	    ps.setString(2, brand);
	    ps.setString(3, category);
	    int qty = 1;
		ps.setInt(4, qty );
	    
	    int re = ps.executeUpdate();
	    
	    if(re>0) {
	    	return true;
	    }
	    return false;
		
	}
	
	
	
}
