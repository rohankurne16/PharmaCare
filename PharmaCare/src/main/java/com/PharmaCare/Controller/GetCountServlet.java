package com.PharmaCare.Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.PharmaCare.DAO.GetCountDAO;

/**
 * Servlet implementation class GetCountServlet
 */
@WebServlet("/GetCountServlet")
public class GetCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetCountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		GetCountDAO cs = new GetCountDAO();
				
					try {
						
					int count = cs.getmedicinecount();
					
					
						HttpSession session = request.getSession();
						
							session.setAttribute("medcount", count);
							
					
						
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					
		try {
			
			int lowstockcount =  cs.getlowstockcount();
			
			
				HttpSession session = request.getSession();
				
					session.setAttribute("lowstockcount", lowstockcount);
					
					
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		try {
			
		int outofstockcount = 	cs.outofstockcount();
		
		
		
			HttpSession session = request.getSession();
			
				session.setAttribute("outofstockcount", outofstockcount);
		
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		try {
			
		int todaysellcount = cs.gettodayssale();
		
		HttpSession session = request.getSession();
		session.setAttribute("todaysellcount", todaysellcount);
		
		
		
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			
			int getnearexpirycount =  cs.getnearexpirycount();
			
			HttpSession session = request.getSession();
			session.setAttribute("getnearexpirycount", getnearexpirycount);
		
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			
			int getexpiredcount = cs.getexpiredcount();
			
			HttpSession session = request.getSession();
			session.setAttribute("getexpiredcount", getexpiredcount);
			
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		try {
			
		double total_revenue = cs.gettotaalrevenue();
		
		HttpSession session = request.getSession();
		session.setAttribute("total_revenue", total_revenue);
		
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			
			double todaysrevenue = cs.gettodaysrevenue();
			HttpSession session = request.getSession();
			session.setAttribute("todaysrevenue", todaysrevenue);
			request.getRequestDispatcher("HomePage.jsp").forward(request, response);
				
			
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
