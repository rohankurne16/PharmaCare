package com.PharmaCare.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.PharmaCare.bin.Medicine;

public class CheckExpiryDateDAO {
	
	public ArrayList<Medicine> checkexpirydate() throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare","root","root");
		
		Statement stmt = con.createStatement();
		
		ResultSet rs = stmt.executeQuery("select * from medicine where expiry_date between CURDATE() and CURDATE() + INTERVAL 7 DAY");
		
		ArrayList<Medicine> explist = new ArrayList<Medicine>();
		
		while(rs.next()) {
			
			Medicine m = new Medicine();
			
			m.setBrand_name(rs.getString(3));
			m.setMedicine_name(rs.getString(2));
			m.setQuantity(rs.getInt(5));
			m.setRack_no(rs.getString(9));
			m.setExpiry_date(rs.getDate(8));
			
			explist.add(m);
		}
		return explist;
		
		
	}
	
	public ArrayList<Medicine> expiredmedicine() throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare","root","root");
		
		Statement stmt = con.createStatement();
	
		ResultSet rs = stmt.executeQuery("select * from medicine where expiry_date <= CURDATE()");
		
		ArrayList<Medicine> expiredmed = new ArrayList<Medicine>();
		
		while(rs.next()) {
			
			Medicine m = new Medicine();
			
			m.setBrand_name(rs.getString(3));
			m.setMedicine_name(rs.getString(2));
			m.setRack_no(rs.getString(9));
			m.setQuantity(rs.getInt(5));
			m.setExpiry_date(rs.getDate(8));
			
			expiredmed.add(m);
			
		}
		 rs.close();
		    
		    con.close();
		
		return expiredmed;
		
	 
	}

}
