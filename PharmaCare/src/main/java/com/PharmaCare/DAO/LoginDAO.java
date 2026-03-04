package com.PharmaCare.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.PharmaCare.bin.Register;

public class LoginDAO {
	
	
	
	
	public ArrayList<Register> login(String email, String pass) throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare","root","root");
		
		PreparedStatement ps = con.prepareStatement("select * from users where email=? and password = ?");
		
		ps.setString(1, email);
		ps.setString(2, pass);
		
		ResultSet rs = ps.executeQuery();
		
		ArrayList<Register> arr = new ArrayList<Register>();
		
		
		while(rs.next()){
			
			Register r = new Register();
			
			 r.setFull_name(rs.getString("full_name"));
			 r.setPhone(rs.getString("phone"));
	            r.setEmail(rs.getString("email"));
	            r.setPassword(rs.getString("password")); 
			arr.add(r);
		}
		return arr;
		
		
		
		 
	}
	

}
