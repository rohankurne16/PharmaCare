package com.PharmaCare.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.PharmaCare.bin.Medicine;

public class ShowRackDAO {
	
	public ArrayList<Medicine> showrack() throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare","root","root");
		
		Statement stmt = con.createStatement();
		
		ResultSet rs = stmt.executeQuery("select distinct rack_no from medicine");
		
		ArrayList<Medicine> racklist = new ArrayList<Medicine>();
		
		while(rs.next()) {
			
			Medicine m = new Medicine();
			
			m.setRack_no(rs.getString("rack_no"));
			
			racklist.add(m);
			
		}
		con.close();
		rs.close();
		
		return racklist;
		
		
	}
	
	public ArrayList<Medicine> showrackdetails(String rackname) throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare","root","root");
		
		PreparedStatement ps = con.prepareStatement("select * from medicine where rack_no = ?");
		
		ps.setString(1, rackname);
		
		ResultSet rs = ps.executeQuery();
		
		ArrayList<Medicine> meddetails = new ArrayList<Medicine>();
		
		while(rs.next()) {
			
			Medicine m = new Medicine();
			
			m.setMedicine_name(rs.getString("medicine_name"));
			m.setBrand_name(rs.getString("brand_name"));
			m.setCategory(rs.getString("category"));
			m.setPrice(rs.getDouble("price"));
			
			m.setQuantity(rs.getInt("quantity"));
			
			
			meddetails.add(m);
			
			
			
		}
		
		con.close();
		rs.close();
		ps.close();
		return meddetails;
		
		
		
		
	}

}
