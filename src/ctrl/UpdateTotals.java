package ctrl;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Account;
import bean.UserInfo;
import bean.CartBook;

/**
 * Servlet implementation class UpdateTotals
 */
@WebServlet("/UpdateTotals")
public class UpdateTotals extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 System.out.println("Entered Update Totals Servlet");
		 if((request.getParameter("PAYMENT")) != null){
			 
			 //Payment was clicked  . Store cart details in database
			 
			 HttpSession session = request.getSession();
			 User  user = (User)session.getAttribute("user");
			 
			 ArrayList<CartBook> cart = new ArrayList();
			 cart = (ArrayList)session.getAttribute("cart");
			 
			 if(user != null){
				 System.out.println("Entered Update Totals: User is NOT Null");
			      int grandtotal = (Integer)session.getAttribute("grandtotal");
			 
			      Account ac = new Account();
			 
			      ac.setOrderDetails(user,grandtotal,cart);
			      
			      RequestDispatcher requestDispatcher = request
			                .getRequestDispatcher("Checkout.jsp");
			        requestDispatcher.forward(request, response);
				 
			 
			 
			 }
			 else{
				 System.out.println("Entered Update Totals Servlet: USER is NULL");
				 // user has not logged in , so show the login screen
				 RequestDispatcher requestDispatcher = request
			                .getRequestDispatcher("PaymentLogin.jsp");
			        requestDispatcher.forward(request, response);
			 }
			   
			 
			 
			
			 
			 
		 }
		 
		 if((request.getParameter("UPDATE")) != null){
			 
		
		   int qty=0;
		   int total = 0;
		   int price = 0;
		   int grandtotal = 0;
	        ArrayList<CartBook> cart;
	        ArrayList<CartBook> tempcart=new ArrayList<CartBook>();
	        
			
			HttpSession session=request.getSession();  
			cart = (ArrayList)session.getAttribute("cart");
			int i = 0;
	        for(CartBook b1: cart){
	        	System.out.println(b1.getBid());
	        	String s1 = "qty"+i;
	        	String s2 = "total"+i;
	        	
	        	qty = Integer.parseInt(request.getParameter(s1));
	        	price = b1.getPrice();
	        	total = qty * price;
	        	 System.out.println("Total:"+total);
	        	b1.setQty(qty);
	        	b1.setTotal(total);
	        	System.out.println("QTY:TOTAL:"+ request.getParameter(s1) + ' ' + request.getParameter(s2));
	        	tempcart.add(b1);
	        	grandtotal = grandtotal + total;
	        	
	        	i++;
	        }
	    
	        session.setAttribute("cart",tempcart);
	        session.setAttribute("grandtotal", grandtotal);
			      
			RequestDispatcher requestDispatcher = request
	                .getRequestDispatcher("AddToCart.jsp");
	        requestDispatcher.forward(request, response);
			
		
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
