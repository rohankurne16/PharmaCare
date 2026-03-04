package com.PharmaCare.Controller;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.PharmaCare.bin.Orders;

@WebServlet("/FilterOrdersServlet")
public class FilterOrdersServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String orderDate = request.getParameter("orderDate");
    	
    	String medicine = request.getParameter("medicine");
    	
    	String brand = request.getParameter("brand");

    	if (medicine != null) medicine = medicine.trim();
    	if (brand != null) brand = brand.trim();

        ArrayList<Orders> ordersList = new ArrayList<>();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/pharmacare","root","root");

           

            String sql = "SELECT * FROM orders WHERE 1=1";

            if (orderDate != null && !orderDate.isEmpty()) {
                sql += " AND DATE(order_date) = ?";
            }
            if (medicine != null && !medicine.isEmpty()) {
                sql += " AND TRIM(LOWER(medicine_name)) LIKE ?";
            }
            if (brand != null && !brand.isEmpty()) {
                sql += " AND TRIM(LOWER(brand)) LIKE ?";
            }

            PreparedStatement ps = con.prepareStatement(sql);
            int index = 1;

            if (orderDate != null && !orderDate.isEmpty()) {
                ps.setDate(index++, Date.valueOf(orderDate));
            }
            if (medicine != null && !medicine.isEmpty()) {
                ps.setString(index++, "%" + medicine.trim().toLowerCase() + "%");
            }
            if (brand != null && !brand.isEmpty()) {
                ps.setString(index++, "%" + brand.trim().toLowerCase() + "%");
            }


            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                Orders o = new Orders();
                o.setOrderDate(rs.getDate("order_date"));
                o.setMedicineName(rs.getString("medicine_name"));
                o.setBrand(rs.getString("brand"));

                o.setQuantity(rs.getInt("quantity"));
                ordersList.add(o);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("orders", ordersList);
        request.getRequestDispatcher("ShowOrders.jsp").forward(request, response);
    }
}


