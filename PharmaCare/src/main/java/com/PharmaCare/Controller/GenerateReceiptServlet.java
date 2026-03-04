package com.PharmaCare.Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.PharmaCare.DAO.ShowCartDAO;
import com.PharmaCare.DAO.ClearCartDAO;
import com.PharmaCare.DAO.OrdersDAO;
import com.PharmaCare.bin.Cart;
import com.PharmaCare.util.Email;
import com.PharmaCare.util.Email; // utility class to send emails

@WebServlet("/GenerateReceiptServlet")

public class GenerateReceiptServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    HttpSession session = request.getSession();
	    
	    ArrayList<Cart> cart = (ArrayList<Cart>) session.getAttribute("cart");
	    
	    
	    if (cart != null && !cart.isEmpty()) {
	    	
	        OrdersDAO ordersDAO = new OrdersDAO();

	        try {
	            for (Cart c : cart) {
	               
	                ordersDAO.insertOrder(c.getMedicineName(), c.getBrand(), c.getQuantity());
	            }

	           
	            Email.sendOrderReceipt("9146556657abc@gmail.com", "Tejas", cart);

	            
	           ClearCartDAO d = new ClearCartDAO();
	           
	           			d.clearcart();

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    response.sendRedirect("ShowCartServlet");
	}

}
