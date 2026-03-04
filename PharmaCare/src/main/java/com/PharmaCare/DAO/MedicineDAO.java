package com.PharmaCare.DAO;

import java.sql.*;
import java.util.ArrayList;

import com.PharmaCare.bin.Medicine;

public class MedicineDAO {

    public ArrayList<Medicine> searchMedicines(String query) throws ClassNotFoundException, SQLException {
        ArrayList<Medicine> list = new ArrayList<>();

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare","root","root");

        String sql = "select * from medicine where medicine_name like ? OR brand_name like ? OR category like ?";
        
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setString(1, "%" + query + "%");
        ps.setString(2, "%" + query + "%");
        ps.setString(3, "%" + query + "%");

        ResultSet rs = ps.executeQuery();
        
        while(rs.next()) {
        	
            Medicine m = new Medicine();
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

            list.add(m);
        }

        rs.close();
        ps.close();
        con.close();

        return list;
    }
    
    public static ArrayList<Medicine> getExpiringSoon() throws Exception {
        ArrayList<Medicine> list = new ArrayList<>();

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare","root","root");

        String sql =
            "SELECT * FROM medicine " +
            "WHERE expiry_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY)";

        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Medicine m = new Medicine();
            m.setMedicine_id(rs.getInt("medicine_id"));
            m.setMedicine_name(rs.getString("medicine_name"));
            m.setExpiry_date(rs.getDate("expiry_date"));
            list.add(m);
        }
        con.close();
        return list;
    }

    public static ArrayList<Medicine> getExpired() throws Exception {
        ArrayList<Medicine> list = new ArrayList<>();

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacare","root","root");

        String sql =
            "SELECT * FROM medicine WHERE expiry_date < CURDATE()";

        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Medicine m = new Medicine();
            m.setMedicine_id(rs.getInt("medicine_id"));
            m.setMedicine_name(rs.getString("medicine_name"));
            m.setExpiry_date(rs.getDate("expiry_date"));
            list.add(m);
        }
        con.close();
        return list;
    }
}
