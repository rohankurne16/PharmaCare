package com.PharmaCare.Controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.PharmaCare.DAO.AddSaleDAO;
import com.PharmaCare.DAO.ShowMedicineDAO;
import com.PharmaCare.DAO.UpdateMedicineDAO;
import com.PharmaCare.bin.Medicine;
import com.PharmaCare.bin.Register;
import com.PharmaCare.bin.Sale;
import com.PharmaCare.util.Email;
import com.mysql.cj.x.protobuf.MysqlxCrud.Update;

/**
 * Servlet implementation class AddSaleServlet
 */
@WebServlet("/AddSaleServlet")
public class AddSaleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSaleServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    int medicine_id = Integer.parseInt(request.getParameter("medicine_id"));
	    int quantitySold = Integer.parseInt(request.getParameter("quantity_sold"));
	    String customerName = request.getParameter("customer_name");
	    Date saleDate = Date.valueOf(request.getParameter("sale_date"));

	  ShowMedicineDAO um = new ShowMedicineDAO();
	    AddSaleDAO as = new AddSaleDAO();

	    try {
	      
	        Medicine med = um.getMedicineById(medicine_id);

	        if (med == null) {
	            request.setAttribute("error", "Invalid medicine selected");
	            request.getRequestDispatcher("AddSale.jsp").forward(request, response);
	            return;
	        }

	       
	        Date today = new Date(System.currentTimeMillis());
	        if (med.getExpiry_date().before(today)) {
	            request.setAttribute("error", "Cannot sell expired medicine");
	            request.getRequestDispatcher("AddSale.jsp").forward(request, response);
	            return;
	        }

	       
	        if (quantitySold > med.getQuantity()) {
	            request.setAttribute("error", "Insufficient stock available");
	            request.getRequestDispatcher("AddSale.jsp").forward(request, response);
	            return;
	        }

	     
	        double price = med.getPrice();
	        double totalRevenue = price * quantitySold;

	        
	        Sale s = new Sale();
	        s.setMedicine_id(medicine_id);
	        s.setQuantity_sold(quantitySold);
	        s.setPrice(price);
	        s.setCustomer_name(customerName);
	        s.setSale_date(saleDate);
	        s.setTotal_revenue(totalRevenue);

	        boolean saleSuccess = as.sale(s);
	        
	        UpdateMedicineDAO ud = new UpdateMedicineDAO();

	        if (saleSuccess) {
	            boolean stockUpdated = ud.updateQuantity(medicine_id, quantitySold);

	            if (stockUpdated) {

	                HttpSession session = request.getSession();
	                ArrayList<Register> users =
	                        (ArrayList<Register>) session.getAttribute("loggeduser");

	                for (Register r : users) {
	                    String email = r.getEmail();
	                    String name = r.getFull_name();

	                    ArrayList<Medicine> zeroQty = ud.zeroquantity(medicine_id);
	                    if (zeroQty != null && !zeroQty.isEmpty()) {
	                        Email.sendOutOfStockAlert(email, name, zeroQty);
	                    } else {
	                        ArrayList<Medicine> lowQty = ud.checkquantity(medicine_id);
	                        if (lowQty != null && !lowQty.isEmpty()) {
	                            Email.sendLowStockAlert(email, name, lowQty);
	                        }
	                    }
	                }

	                response.sendRedirect("SuccessSale.jsp");
	            } else {
	                request.setAttribute("error", "Stock update failed");
	                request.getRequestDispatcher("AddSale.jsp").forward(request, response);
	            }
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("error", "Something went wrong");
	        request.getRequestDispatcher("AddSale.jsp").forward(request, response);
	    }
	}


}
