package com.PharmaCare.Controller;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.PharmaCare.bin.Sale;

@WebServlet("/FilterSaleServlet")
public class FilterSaleServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String saleDate = request.getParameter("saleDate");
        String medicine = request.getParameter("medicine");
        String customer = request.getParameter("customer");

        if (medicine != null) medicine = medicine.trim();
        if (customer != null) customer = customer.trim();

        ArrayList<Sale> saleList = new ArrayList<>();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/pharmacare", "root", "root");

            String sql =
                "SELECT s.*, m.medicine_name " +
                "FROM sale s " +
                "JOIN medicine m ON s.medicine_id = m.medicine_id " +
                "WHERE 1=1";

            if (saleDate != null && !saleDate.isEmpty()) {
                sql += " AND DATE(s.sale_date) = ?";
            }
            if (medicine != null && !medicine.isEmpty()) {
                sql += " AND LOWER(TRIM(m.medicine_name)) LIKE ?";
            }
            if (customer != null && !customer.isEmpty()) {
                sql += " AND LOWER(TRIM(s.customer_name)) LIKE ?";
            }

            PreparedStatement ps = con.prepareStatement(sql);
            int index = 1;

            if (saleDate != null && !saleDate.isEmpty()) {
                ps.setDate(index++, Date.valueOf(saleDate));
            }
            if (medicine != null && !medicine.isEmpty()) {
                ps.setString(index++, "%" + medicine.toLowerCase() + "%");
            }
            if (customer != null && !customer.isEmpty()) {
                ps.setString(index++, "%" + customer.toLowerCase() + "%");
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Sale s = new Sale();
                s.setSale_id(rs.getInt("sale_id"));
                s.setMedicine_id(rs.getInt("medicine_id"));
                s.setMedicine_name(rs.getString("medicine_name"));
                s.setQuantity_sold(rs.getInt("quantity_sold"));
                s.setPrice(rs.getDouble("price"));
                s.setCustomer_name(rs.getString("customer_name"));
                s.setSale_date(rs.getDate("sale_date"));
                s.setTotal_revenue(rs.getDouble("total_revenue"));

                saleList.add(s);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("sales", saleList);
        request.getRequestDispatcher("ShowSales.jsp").forward(request, response);
    }
}
