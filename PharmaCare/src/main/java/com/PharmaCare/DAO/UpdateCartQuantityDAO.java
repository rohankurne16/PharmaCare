package com.PharmaCare.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UpdateCartQuantityDAO {
	
	

	    public boolean updateQuantity(int cartId, int quantity) throws SQLException, ClassNotFoundException {
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare", "root", "root");

	        PreparedStatement ps = con.prepareStatement("UPDATE cart SET quantity = ? WHERE id = ?");
	        ps.setInt(1, quantity);
	        ps.setInt(2, cartId);

	        int res = ps.executeUpdate();
	        con.close();
	        return res > 0;
	    }

	    public boolean deleteCartItem(int cartId) throws ClassNotFoundException, SQLException {
	    	
	        Class.forName("com.mysql.jdbc.Driver");
	        
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare", "root", "root");

	        PreparedStatement ps = con.prepareStatement("delete from cart where id = ?");
	        
	        ps.setInt(1, cartId);

	        int re = ps.executeUpdate();
	        
	        if(re>0) {
	        	return true;
	        }
	        return false;
	    }


	    




}
