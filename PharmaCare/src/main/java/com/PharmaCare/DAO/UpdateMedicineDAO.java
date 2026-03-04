package com.PharmaCare.DAO;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.PharmaCare.bin.Medicine;

public class UpdateMedicineDAO {
	
	public boolean updateQuantity(int medicine_id, int quantitySold) throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare","root","root");
		
		PreparedStatement ps = con.prepareStatement("update medicine set quantity = quantity - ? where medicine_id = ? ");
		
		ps.setInt(2, medicine_id);
		ps.setInt(1, quantitySold);
		
		int re = ps.executeUpdate();
		
		if(re>0) {
			return true;
		}
		return false;
		
		
	}
	
	public ArrayList<Medicine> checkquantity(int medicine_id) throws ClassNotFoundException, SQLException{
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare","root","root");
		
		Statement stmt = con.createStatement();
		
		PreparedStatement ps = con.prepareStatement("select medicine_name, quantity from medicine where quantity < 10 and quantity != 0 and medicine_id = ?");
		
		ps.setInt(1, medicine_id);
		
		ResultSet rs =  ps.executeQuery();
		
		ArrayList<Medicine> arrlist = new ArrayList<Medicine>();
		
		while(rs.next()) {
			
			Medicine m = new Medicine();
			
				m.setMedicine_name(rs.getString("medicine_name"));
				
				m.setQuantity( rs.getInt("quantity"));
				
				arrlist.add(m);
			
		}
		return arrlist;
		
		
	}

	
	public ArrayList<Medicine> zeroquantity(int medicine_id) throws ClassNotFoundException, SQLException{
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare","root","root");
		
		Statement stmt = con.createStatement();
		
		PreparedStatement ps = con.prepareStatement("select medicine_name, quantity from medicine where quantity = 0 and medicine_id = ?");
		
		ps.setInt(1, medicine_id);
		
		ResultSet rs =  ps.executeQuery();
		
		ArrayList<Medicine> arrlist = new ArrayList<Medicine>();
		
		while(rs.next()) {
			
			Medicine m = new Medicine();
			
				m.setMedicine_name(rs.getString("medicine_name"));
				
				m.setQuantity( rs.getInt("quantity"));
				
				arrlist.add(m);
			
		}
		return arrlist;
		
		
	}

	public boolean updatemedicine(Medicine m2) throws ClassNotFoundException, SQLException {
		
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare","root","root");
		
		PreparedStatement ps = con.prepareStatement("update medicine set medicine_name = ?, brand_name = ?, category=?, quantity = ?, price = ?, manufacture_date = ?, expiry_date = ?, rack_no = ? , description = ?, dosage_info = ?, image = ? where medicine_id=?");
		
		ps.setString(1, m2.getMedicine_name());
		
		ps.setString(2, m2.getBrand_name());
		
		ps.setString(3, m2.getCategory());
		
		ps.setInt(4, m2.getQuantity());
		
		ps.setDouble(5, m2.getPrice());
		
		ps.setDate(6, m2.getManufacture_date());
		
		ps.setDate(7, m2.getExpiry_date());
		
		ps.setString(8, m2.getRack_no());
		
				
		ps.setString(9, m2.getDesc());
		
		ps.setString(10, m2.getDosage_info());
		
		ps.setString(11, m2.getImage());
		
		ps.setInt(12, m2.getMedicine_id());

		int re = ps.executeUpdate();
		
		if(re>0) {
			return true;
		}
		return false;
		
		

		
		
	}

	
}
