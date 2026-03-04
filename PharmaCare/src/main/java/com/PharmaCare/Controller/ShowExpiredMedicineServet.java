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



import com.PharmaCare.DAO.CheckExpiryDateDAO;
import com.PharmaCare.bin.Medicine;

/**
 * Servlet implementation class ShowExpiredMedicineServet
 */
@WebServlet("/ShowExpiredMedicineServet")
public class ShowExpiredMedicineServet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowExpiredMedicineServet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CheckExpiryDateDAO ed = new CheckExpiryDateDAO();
		
				try {
					
					ArrayList<Medicine> expiredmedlist =  ed.expiredmedicine();
					
					
						HttpSession session = request.getSession();
						session.setAttribute("expiredmedlist", expiredmedlist);
						request.getRequestDispatcher("ShowExpiredMedicines.jsp").forward(request, response);
						
					
					
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
