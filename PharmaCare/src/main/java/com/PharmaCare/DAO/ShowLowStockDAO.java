package com.PharmaCare.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.PharmaCare.bin.Medicine;

public class ShowLowStockDAO {
	
	public ArrayList<Medicine> showlowstock() throws ClassNotFoundException, SQLException{
		
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare","root","root");
		
		PreparedStatement ps = con.prepareStatement("select * from medicine where quantity<10 and quantity>0");
		
		ResultSet rs = ps.executeQuery();
		
		ArrayList<Medicine> lowmedicine = new ArrayList<Medicine>();
		
		while(rs.next()) {
			
			Medicine m = new Medicine();
			
			m.setBrand_name(rs.getString(3));
			m.setMedicine_name(rs.getString(2));
			m.setQuantity(rs.getInt(5));
			m.setRack_no(rs.getString(9));
			m.setExpiry_date(rs.getDate(8));
			m.setCategory(rs.getString("category"));
			
			lowmedicine.add(m);
			
		}
		rs.close();
		con.close();
		return lowmedicine;
		
		
	}
	
	

}
