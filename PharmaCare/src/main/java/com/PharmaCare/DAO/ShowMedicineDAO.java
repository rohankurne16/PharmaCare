package com.PharmaCare.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.PharmaCare.bin.Medicine;

public class ShowMedicineDAO {
	
	public ArrayList<Medicine> showmedicine() throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare","root","root");
		
		Statement stmt = con.createStatement();
		
		ResultSet rs = stmt.executeQuery("select * from medicine");
		
		ArrayList<Medicine> arr = new ArrayList<Medicine>();
		
		while(rs.next()) {
			
			Medicine m = new Medicine();
				m.setMedicine_id(rs.getInt(1));
				m.setMedicine_name(rs.getString(2));
				m.setBrand_name(rs.getString(3));
				m.setCategory(rs.getString(4));
				m.setQuantity(rs.getInt(5));
				m.setPrice(rs.getDouble(6));
				m.setManufacture_date(rs.getDate(7));
				m.setExpiry_date(rs.getDate(8));
				m.setRack_no(rs.getString(9));
				m.setImage(rs.getString(11));
				m.setDesc(rs.getString(12));
				m.setDosage_info(rs.getString(13));
				
				arr.add(m);
			
			
			
		}
		return arr;
		
	}
	
	
	public Medicine getMedicineById(int id) throws ClassNotFoundException, SQLException {

	    Medicine m = null;

	    Class.forName("com.mysql.jdbc.Driver");
	    
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare", "root", "root");

	    PreparedStatement ps = con.prepareStatement("select * from medicine where medicine_id = ?");

	    ps.setInt(1, id);
	    
	    ResultSet rs = ps.executeQuery();

	    if (rs.next()) {
	    
	        m = new Medicine();
	        
	        m.setMedicine_id(rs.getInt("medicine_id"));
	        
	        m.setMedicine_name(rs.getString("medicine_name"));
	        
	        m.setBrand_name(rs.getString("brand_name"));
	        
	        m.setCategory(rs.getString("category"));
	        
	        m.setQuantity(rs.getInt("quantity"));
	        
	        m.setPrice(rs.getDouble("price"));
	        
	        m.setManufacture_date(rs.getDate("manufacture_date"));
	        
	        m.setExpiry_date(rs.getDate("expiry_date"));
	        
	        m.setRack_no(rs.getString("rack_no"));
	        
	        m.setDesc(rs.getString("description"));
	        
	        m.setDosage_info(rs.getString("dosage_info"));
	        
	        m.setImage(rs.getString("image"));
	    }

	    return m;
	}

}
