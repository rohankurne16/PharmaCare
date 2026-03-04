package com.PharmaCare.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.PharmaCare.bin.Medicine;

public class AddMedicineDAO {

	public int checkoccupancy(String rackNo) throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare","root","root");
		
		PreparedStatement ps = con.prepareStatement("SELECT COALESCE(SUM(quantity),0) AS total_qty FROM medicine WHERE UPPER(TRIM(rack_no)) = ?");
		
		ps.setString(1, rackNo.trim().toUpperCase());

		
		ResultSet rs = ps.executeQuery();
		
		int qty = 0;
		
		if(rs.next()) {
			
			qty = rs.getInt("total_qty");
			
			
		}
		rs.close();
	    ps.close();
	    con.close();
		return qty;
		
		
	}
	
	
	
	
	public boolean add(Medicine m) throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare","root","root");
		
		PreparedStatement ps = con.prepareStatement("insert into medicine(medicine_name, brand_name, category, quantity, price, manufacture_date, expiry_date, rack_no, image,description,dosage_info) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		
					ps.setString(1, m.getMedicine_name());
					ps.setString(2, m.getBrand_name());
					ps.setString(3, m.getCategory());
					ps.setInt(4, m.getQuantity());
					ps.setDouble(5, m.getPrice());
					ps.setDate(6, m.getManufacture_date()); 
					ps.setDate(7, m.getExpiry_date());    
					ps.setString(8, m.getRack_no());
					ps.setString(9, m.getImage());
					ps.setString(10, m.getDesc());
					ps.setString(11, m.getDosage_info());
					
		int re = ps.executeUpdate();
		
		if(re>0) {
			return true;
		}
		return false;
		
	}
	
	
}
