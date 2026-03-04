package com.PharmaCare.Controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.PharmaCare.DAO.AddMedicineDAO;
import com.PharmaCare.bin.Medicine;

/**
 * Servlet implementation class AddMedicineServlet
 */
@WebServlet("/AddMedicineServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,  // 1MB
maxFileSize = 1024 * 1024 * 5,    // 5MB
maxRequestSize = 1024 * 1024 * 10) // 10MB
public class AddMedicineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMedicineServlet() {
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
		
		String medicine_name = request.getParameter("medicine_name");
		
		String brand_name = request.getParameter("brand_name");
		
		String category = request.getParameter("category");
		
		int quantity = Integer.parseInt(request.getParameter("qty"));
		
		double price = Double.parseDouble(request.getParameter("price"));
		
		String manufactureDateStr = request.getParameter("manufacture_date");
		
		String expiryDateStr = request.getParameter("expiry_date");
		
		String rackNo = request.getParameter("rack_no");
		
		String description = request.getParameter("description");
		
		String dosage = request.getParameter("dosage");

		
		
		Date manufactureDate = null;
		Date expiryDate = null;

		if (manufactureDateStr != null && !manufactureDateStr.isEmpty()) {
		    manufactureDate = Date.valueOf(manufactureDateStr);
		}

		if (expiryDateStr != null && !expiryDateStr.isEmpty()) {
		    expiryDate = Date.valueOf(expiryDateStr);
		}

		 Part imagePart = request.getPart("image");

		    String header = imagePart.getHeader("content-disposition");
		    
		    String fileName = header.substring(
		            header.indexOf("filename=\"") + 10,
		            header.length() - 1
		    );

		   
		    String uploadPath = getServletContext().getRealPath("/images"); // correct path
		    File uploadDir = new File(uploadPath);
		    if (!uploadDir.exists()) uploadDir.mkdir();

		    imagePart.write(uploadPath + File.separator + fileName);

		
		Medicine m = new Medicine();
		
			m.setMedicine_name(medicine_name);
			m.setBrand_name(brand_name);
			m.setCategory(category);
			m.setQuantity(quantity);
			m.setPrice(price);
			m.setManufacture_date(manufactureDate);
			m.setExpiry_date(expiryDate);
			m.setRack_no(rackNo);
			m.setImage(fileName);
			m.setDesc(description);
			m.setDosage_info(dosage);
			
			
			AddMedicineDAO ad = new AddMedicineDAO();
	
						try {
							
							int b = ad.checkoccupancy(rackNo);
							
							if(b > 0) {
								 request.setAttribute("error", 
									        "Rack " + rackNo + " is already occupied. Please empty it before adding new medicine.");
								 
									    request.getRequestDispatcher("AddMedicine.jsp").forward(request, response);
							}
							else {
								
								Boolean bt = ad.add(m);
								
								if(bt) {
									response.sendRedirect("GetCountServlet");
								}
									
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
