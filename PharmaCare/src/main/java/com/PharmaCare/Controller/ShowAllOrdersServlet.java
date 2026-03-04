package com.PharmaCare.Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.PharmaCare.DAO.OrdersDAO;
import com.PharmaCare.bin.Orders;

@WebServlet("/ShowOrdersServlet")
public class ShowAllOrdersServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        OrdersDAO dao = new OrdersDAO();
        ArrayList<Orders> orders = new ArrayList<>();

        try {
            // Simply get all orders
            orders = dao.getAllOrders();

            // Pass to JSP
            request.setAttribute("orders", orders);
            request.getRequestDispatcher("ShowOrders.jsp").forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to fetch orders. Please try again later.");
            request.getRequestDispatcher("ShowOrders.jsp").forward(request, response);
        }
    }
}
