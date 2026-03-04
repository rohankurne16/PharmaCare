package com.PharmaCare.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ForgotPasswordDAO {

	public String exists(String email) throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare","root","root");
		
		PreparedStatement ps  = con.prepareStatement("select * from users where email = ?");
		
		ps.setString(1, email);
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			String name =  rs.getString("full_name");
			
			return name;
			
		}
		return null;
		
	}
	
}
