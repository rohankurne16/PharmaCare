package com.PharmaCare.Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.PharmaCare.DAO.ResetPasswordDAO;

/**
 * Servlet implementation class ResetPasswordServlet
 */
@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPasswordServlet() {
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
		
		String pass = request.getParameter("password");
		
		String confirm = request.getParameter("confirm");
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		
		if(pass.matches(confirm)) {
			
			ResetPasswordDAO re = new ResetPasswordDAO();
							
							try {
								
							boolean st = re.resetpass(email,pass);
							
							if(st) {
								response.sendRedirect("Login.jsp");
							}
							else {
								request.setAttribute("error", "failed to update password");
								request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);
							}
								
								
							} catch (ClassNotFoundException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
			
		}
		else {
			request.setAttribute("error", "Pass and Confirm Pass doent matched");
			request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);
		}
		
	}

}
