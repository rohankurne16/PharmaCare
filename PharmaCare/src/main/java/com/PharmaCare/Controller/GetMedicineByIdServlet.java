package com.PharmaCare.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.PharmaCare.DAO.ShowMedicineDAO;
import com.PharmaCare.bin.Medicine;

/**
 * Servlet implementation class GetMedicineByIdServlet
 */
@WebServlet("/GetMedicineByIdServlet")
public class GetMedicineByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetMedicineByIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int medicineId = Integer.parseInt(request.getParameter("medicine_id"));

        ShowMedicineDAO dao = new ShowMedicineDAO();
        
        try {
        	
            Medicine medicine = dao.getMedicineById(medicineId);

          
            request.setAttribute("medicine", medicine);

            request.getRequestDispatcher("UpdateMedicine.jsp").forward(request, response);

        } catch (Exception e) {
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
