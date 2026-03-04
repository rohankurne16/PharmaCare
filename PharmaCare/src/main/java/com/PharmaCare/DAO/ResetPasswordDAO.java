package com.PharmaCare.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ResetPasswordDAO {
	
	public boolean resetpass(String email, String pass) throws ClassNotFoundException, SQLException {
		
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare","root","root");
		
		PreparedStatement ps = con.prepareStatement("update `users` set password = ? where email = ?");
		
		ps.setString(2, email);
		
		ps.setString(1, pass);
		
		int re = ps.executeUpdate();
		
		if(re>0) {
			return true;
		}
		return false;
		
	}

	 

}
