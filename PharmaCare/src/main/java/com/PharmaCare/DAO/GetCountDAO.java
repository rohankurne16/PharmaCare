package com.PharmaCare.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.PharmaCare.bin.Medicine;

public class GetCountDAO {
	
	public int getmedicinecount() throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare","root","root");
		
		PreparedStatement ps = con.prepareStatement("select count(*) from medicine");
		
		ResultSet rs = ps.executeQuery();
		
		
		
		int count = 0;
		
		while(rs.next()) {
			count = rs.getInt(1); 
		}
		
		return count;
		
		
	}
	
public int getlowstockcount() throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare","root","root");
		
		PreparedStatement ps = con.prepareStatement("select count(*) from medicine where quantity<10 and quantity>0");
		
		ResultSet rs = ps.executeQuery();
		
		
		
		int count = 0;
		
		while(rs.next()) {
			count = rs.getInt(1); 
		}
		
		return count;
		
		
	}

	public int outofstockcount() throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare","root","root");
		
		PreparedStatement ps = con.prepareStatement("select count(*) from medicine where quantity=0");
		
		ResultSet rs = ps.executeQuery();
		
		
		
		int count = 0;
		
		while(rs.next()) {
			count = rs.getInt(1); 
		}
		
		return count;
		
		
	}
	
	public int gettodayssale() throws ClassNotFoundException, SQLException {
		
		

			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare","root","root");
			
			PreparedStatement ps = con.prepareStatement("select COUNT(*) as today_sales from sale where sale_date >= CURDATE() and sale_date < CURDATE() + INTERVAL 1 DAY");
			
			ResultSet rs = ps.executeQuery();
			
			
			
			int count = 0;
			
			while(rs.next()) {
				count = rs.getInt(1); 
			}
			
			return count;
			
			
		}
	
	public int getnearexpirycount() throws ClassNotFoundException, SQLException {
		
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare","root","root");
		
		PreparedStatement ps = con.prepareStatement("select COUNT(*) as near_expiry_count from medicine where expiry_date between CURDATE() and CURDATE() + INTERVAL 7 DAY");
		
		ResultSet rs = ps.executeQuery();
		
		
		int count = 0;
		
		while(rs.next()) {
			
			count = rs.getInt(1); 
		}
		
		return count;
		
		
	}
	
	
	public int getexpiredcount() throws ClassNotFoundException, SQLException {
		
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare","root","root");
		
		PreparedStatement ps = con.prepareStatement("select COUNT(*) from medicine where expiry_date <= CURDATE()");
		
		ResultSet rs = ps.executeQuery();
		
		
		int count = 0;
		
		while(rs.next()) {
			
			count = rs.getInt(1); 
		}
		
		return count;
		
		
	}
	
	
	
	public double gettotaalrevenue() throws ClassNotFoundException, SQLException {
		
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare","root","root");
		
		PreparedStatement ps = con.prepareStatement("select SUM(total_revenue) as total_revenue_sum from sale");
		
		ResultSet rs = ps.executeQuery();
		
		
		double count = 0;
		
		while(rs.next()) {
			
			count = rs.getDouble("total_revenue_sum");
		}
		
		return count;
		
		
	}
	

	public double gettodaysrevenue() throws ClassNotFoundException, SQLException {
		
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare","root","root");
		
		PreparedStatement ps = con.prepareStatement("select SUM(total_revenue) as today_revenue from sale where sale_date = CURDATE()");
		
		ResultSet rs = ps.executeQuery();
		
		
		double todaycount = 0;
		
		while(rs.next()) {
			
			todaycount = rs.getDouble("today_revenue");
		}
		
		return todaycount;
		
		
	}
	
	
	
	


}
