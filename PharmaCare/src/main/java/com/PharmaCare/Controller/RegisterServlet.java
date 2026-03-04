package com.PharmaCare.Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.PharmaCare.DAO.RegisterDAO;
import com.PharmaCare.bin.Register;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		
		String name = request.getParameter("name");
		
		String phone = request.getParameter("phone");
		
		String email = request.getParameter("email");
		
		String password = request.getParameter("password");
		
		String conpass = request.getParameter("confirmPassword");
		
		
		Register r = new Register();
			
				r.setFull_name(name);
				r.setPhone(phone);
				r.setEmail(email);
				
				if(conpass.matches(password)) {
					
					r.setPassword(password);
					
					RegisterDAO rd = new RegisterDAO();
							
								try {
									
									
									boolean stt = rd.register(r);
									
									if(stt) {
										response.sendRedirect("Login.jsp");
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

}
