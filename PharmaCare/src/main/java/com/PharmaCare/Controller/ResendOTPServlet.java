package com.PharmaCare.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.PharmaCare.util.Email;

/**
 * Servlet implementation class ResendOTPServlet
 */
@WebServlet("/ResendOTPServlet")
public class ResendOTPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResendOTPServlet() {
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
		
		
		HttpSession session = request.getSession();
		
		String email = (String) session.getAttribute("email");
		
		String name = (String) session.getAttribute("name");
		
		String resendotp = Email.sendForgotPasswordOTP(email, name);
		 
		session.setAttribute("otp", resendotp);

	        
	        request.setAttribute("error", " new otp is sent to your email");
	       
	        request.getRequestDispatcher("VerifyForgotPassword.jsp").forward(request, response);
		 
		
	}

}
