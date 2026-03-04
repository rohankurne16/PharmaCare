package com.PharmaCare.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.PharmaCare.bin.Register;

public class RegisterDAO {

	public boolean register(Register r) throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare","root","root");
		
		PreparedStatement ps = con.prepareStatement("insert into users(full_name,phone,email,password)values(?,?,?,?)");
		
		ps.setString(1, r.getFull_name());
		
		ps.setString(2, r.getPhone());
		
		ps.setString(3, r.getEmail());
		
		ps.setString(4, r.getPassword());
		
		
		int re = ps.executeUpdate();
		
		
		if(re>0) {
			return true;
		}
		return false;
	}
	
	
}
