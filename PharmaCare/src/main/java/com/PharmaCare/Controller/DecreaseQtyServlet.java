package com.PharmaCare.Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.PharmaCare.DAO.UpdateCartQuantityDAO;

/**
 * Servlet implementation class UpdateCartQuantityServlet
 */
@WebServlet("/UpdateCartQuantityServlet")
public class DecreaseQtyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DecreaseQtyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        int cartId = Integer.parseInt(request.getParameter("cart_id"));
	        int quantity = Integer.parseInt(request.getParameter("quantity"));
	        String action = request.getParameter("action"); // plus or minus

	        if ("plus".equals(action)) {
	            quantity += 1;
	        } else if ("minus".equals(action)) {
	            quantity -= 1;
	            if (quantity < 1) quantity = 1;
	        }

	        UpdateCartQuantityDAO dao = new UpdateCartQuantityDAO();
	        try {
	            dao.updateQuantity(cartId, quantity);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        response.sendRedirect("ShowCartServlet");
	    }
	

}
