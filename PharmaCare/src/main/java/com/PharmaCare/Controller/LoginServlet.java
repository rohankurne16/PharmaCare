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

import com.PharmaCare.DAO.LoginDAO;
import com.PharmaCare.bin.Register;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		
		String email = request.getParameter("email");
		
		String pass = request.getParameter("password");
		
		LoginDAO ld = new LoginDAO();
		
					try {
						
					ArrayList<Register> st = ld.login(email, pass);
					
					
						
						if(st == null || st.isEmpty()) {
							
							request.setAttribute("error", "Email not registered");
							request.getRequestDispatcher("Login.jsp").forward(request, response);
							
						}
						else {
							
							
							
								
								HttpSession session = request.getSession();
								
								session.setAttribute("loggeduser", st);	
								
								response.sendRedirect("ShowMedicineServlet");
								
							}
						
					
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	
	}

}
