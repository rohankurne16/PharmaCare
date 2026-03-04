package com.PharmaCare.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;



import com.PharmaCare.bin.Cart;

public class ShowCartDAO {
	
	
	public ArrayList<Cart> showcarrt() throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
	    
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare", "root", "root");
	    
	    Statement stmt = con.createStatement();
	    
	    ResultSet rs = stmt.executeQuery("select * from cart");
	    
	    ArrayList<Cart> cartList = new ArrayList<Cart>();
	    
	    while (rs.next()) {
            Cart c = new Cart();

            c.setId(rs.getInt("id"));
            c.setMedicineName(rs.getString("medicine_name"));
            c.setBrand(rs.getString("brand"));
            c.setCategory(rs.getString("category"));
            c.setQuantity(rs.getInt("quantity"));

            cartList.add(c);
        }

        rs.close();
       
        con.close();

        return cartList;

		
	}

}
