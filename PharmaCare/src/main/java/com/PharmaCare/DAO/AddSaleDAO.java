package com.PharmaCare.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.PharmaCare.bin.Sale;

public class AddSaleDAO {
	
	public boolean sale(Sale s) throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare","root","root");
		
		PreparedStatement ps = con.prepareStatement("insert into sale(medicine_id,quantity_sold,price,customer_name,sale_date,total_revenue) values(?,?,?,?,?,?)");
		
		ps.setInt(1, s.getMedicine_id());
		ps.setInt(2, s.getQuantity_sold());
		ps.setDouble(3, s.getPrice());
		ps.setString(4, s.getCustomer_name());
		ps.setDate(5,s.getSale_date());
		ps.setDouble(6, s.getTotal_revenue());
		
		
		int re = ps.executeUpdate();
		
		if(re>0) {
			return true;
		}
		return false;
		
		
	}

	

}
