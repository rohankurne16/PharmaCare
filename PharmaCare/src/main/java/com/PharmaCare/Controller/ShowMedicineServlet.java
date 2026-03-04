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

import com.PharmaCare.DAO.ShowMedicineDAO;
import com.PharmaCare.bin.Medicine;

/**
 * Servlet implementation class ShowMedicineServlet
 */
@WebServlet("/ShowMedicineServlet")
public class ShowMedicineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowMedicineServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		ShowMedicineDAO sm = new ShowMedicineDAO();
		try {
			
		ArrayList<Medicine> arr = 	sm.showmedicine();
			
			
				
				
				HttpSession session = request.getSession();
				session.setAttribute("medicinedetails", arr);
				request.getRequestDispatcher("MedicinePage.jsp").forward(request, response);
				
			
		
			
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
		
		
		
	}

}
