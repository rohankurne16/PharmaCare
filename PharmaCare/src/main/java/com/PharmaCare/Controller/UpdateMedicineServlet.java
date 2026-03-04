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

import com.PharmaCare.DAO.UpdateMedicineDAO;
import com.PharmaCare.bin.Medicine;

/**
 * Servlet implementation class UpdateMedicineServlet
 */
@WebServlet("/UpdateMedicineServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,  // 1MB
maxFileSize = 1024 * 1024 * 5,    // 5MB
maxRequestSize = 1024 * 1024 * 10) // 10MB
public class UpdateMedicineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMedicineServlet() {
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
		
		int medicine_id = Integer.parseInt(request.getParameter("medicine_id"));

	
		String medicineName = request.getParameter("medicine_name");
		
		String brandName = request.getParameter("brand_name");
		
		String category = request.getParameter("category");
		
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		double price = Double.parseDouble(request.getParameter("price"));
		
		Date mfgDate = Date.valueOf(request.getParameter("manufacture_date"));
		
		Date expDate = Date.valueOf(request.getParameter("expiry_date"));
		
		String rackNo = request.getParameter("rack_no");
		
		String desc = request.getParameter("description");
		
		String dosage_info = request.getParameter("dosage_info");
	
		Part imagePart = request.getPart("image");
		String oldImage = request.getParameter("old_image"); // hidden field from JSP
		String fileName = oldImage; // default = old image

		if (imagePart != null && imagePart.getSize() > 0) {
		    fileName = extractFileName(imagePart);

		    if (!fileName.isEmpty()) {
		        String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
		        File uploadDir = new File(uploadPath);
		        if (!uploadDir.exists()) uploadDir.mkdir();

		        imagePart.write(uploadPath + File.separator + fileName);
		    } else {
		        fileName = oldImage; // fallback if extraction failed
		    }
		}

		
	

	
		
		
		Medicine m =  new Medicine();
		
		m.setMedicine_id(medicine_id);
		m.setMedicine_name(medicineName);
		m.setBrand_name(brandName);
		m.setCategory(category);
		m.setQuantity(quantity);
		m.setPrice(price);
		m.setManufacture_date(mfgDate);
		m.setExpiry_date(expDate);
		m.setRack_no(rackNo);
		m.setDesc(desc);
		m.setDosage_info(dosage_info);
		m.setImage(fileName);
		
		UpdateMedicineDAO umd = new UpdateMedicineDAO();
		
						try {
							
					boolean st = umd.updatemedicine(m);
					
					if(st) {
						response.sendRedirect("ShowMedicineServlet");
					}
					else {
						request.setAttribute("error","unable to update information");
						request.getRequestDispatcher("UpdateMedicine.jsp").forward(request, response);
					}
					
							
						} catch (ClassNotFoundException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}

		
		
		
		
		
		
		
		
	}

	// 1️⃣ Helper method to get the filename safely
	private String extractFileName(Part part) {
	    String contentDisp = part.getHeader("content-disposition");
	    for (String token : contentDisp.split(";")) {
	        if (token.trim().startsWith("filename")) {
	            return token.substring(token.indexOf('=') + 2, token.length() - 1);
	        }
	    }
	    return "";
	}


}
