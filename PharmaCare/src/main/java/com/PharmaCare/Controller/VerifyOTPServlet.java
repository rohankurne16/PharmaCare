package com.PharmaCare.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class VerifyOTPServlet
 */
@WebServlet("/VerifyOTPServlet")
public class VerifyOTPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyOTPServlet() {
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
		
		String inputotp = request.getParameter("otp");
		
		HttpSession session = request.getSession();
		
		
		
		String otp = (String) session.getAttribute("otp");
		
		if(inputotp.equals(otp)) {
			
			 session.removeAttribute("otp");
			 
			 session.setAttribute("otpVerified", true);
			 
			 response.sendRedirect("ResetPassword.jsp");
			
		}
		else {
			request.setAttribute("error", "OTP didnt matched");
			request.getRequestDispatcher("VerifyForgotPassword.jsp").forward(request, response);
		}
		
		
		
	}

}
