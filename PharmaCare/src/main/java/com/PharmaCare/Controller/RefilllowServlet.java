package com.PharmaCare.Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.PharmaCare.DAO.AddToCartDAO;

/**
 * Servlet implementation class RefilllowServlet
 */
@WebServlet("/RefilllowServlet")
public class RefilllowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RefilllowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String medicine_name = request.getParameter("medicine_name");
		
		String brand = request.getParameter("brand");
		
		String category = request.getParameter("category");
		
		AddToCartDAO sc = new AddToCartDAO();
		
		
					try {
						
						boolean gt =  sc.checkcart(medicine_name);
						
						if(gt) {
							request.setAttribute("error", "Medicine already added to cart");
							request.getRequestDispatcher("ShowLowStock.jsp").forward(request, response);
						}
						else{
							boolean bt = sc.addtocart(medicine_name,brand,category);
							
							if(bt) {
								response.sendRedirect("ShowCartServlet");
							}
							else {
								request.setAttribute("error", "please try again");
								request.getRequestDispatcher("ShowLowStock.jsp").forward(request, response);
							}
						}
								
							} catch (ClassNotFoundException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
				
						
						
					
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
