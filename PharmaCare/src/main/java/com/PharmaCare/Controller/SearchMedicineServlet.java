package com.PharmaCare.Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.PharmaCare.DAO.MedicineDAO;
import com.PharmaCare.bin.Medicine;

@WebServlet("/SearchMedicineServlet")
public class SearchMedicineServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        String query = request.getParameter("query");

        MedicineDAO dao = new MedicineDAO();
        
        ArrayList<Medicine> medicines = new ArrayList<>();

        try {
        	
            medicines = dao.searchMedicines(query);
            
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("medicines", medicines);
        request.getRequestDispatcher("ShowMedicine.jsp").forward(request, response);
    }
}
