package com.PharmaCare.Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.PharmaCare.DAO.ForgotPasswordDAO;
import com.PharmaCare.util.Email;

/**
 * Servlet implementation class ForgotPasswordServlet
 */
@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		
		ForgotPasswordDAO fd = new ForgotPasswordDAO();
				try {
					
			String name = fd.exists(email);
			
			
			if(name != null) {
				
								
				String otp =  Email.sendForgotPasswordOTP(email, name);
				
				HttpSession session = request.getSession();
						
							session.setAttribute("name", name);
							
							session.setAttribute("email", email);
							
							session.setAttribute("otp", otp);
							
							request.getRequestDispatcher("VerifyForgotPassword.jsp").forward(request, response);
				
			}
			else {
				request.setAttribute("error", "Email is not registered please register");
				request.getRequestDispatcher("ForgotPassword.jsp").forward(request, response);
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
