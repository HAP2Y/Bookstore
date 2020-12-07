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

import bean.Book;
import bean.CartBook;

/**
 * Servlet implementation class RemoveItem
 */
@WebServlet("/RemoveItem")
public class RemoveItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    System.out.println("Entered Remove Item Servlet");
	    
	    String bid = request.getParameter("id");
	    System.out.println("Bookid: "+ bid);
        ArrayList<CartBook> cart;
		
		HttpSession session=request.getSession();  
		cart = (ArrayList)session.getAttribute("cart");
		int i = 0;
        for(CartBook b1: cart){
        	System.out.println(b1.getBid());
        	if(bid.equals(b1.getBid())){
        		break;
        	}
        	i++;
        	 
        	
        }
       
        if(i >= 0 ){
        	cart.remove(i);
        }
        
       
        
        session.setAttribute("cart",cart); 
		
		
       
		RequestDispatcher requestDispatcher = request
                .getRequestDispatcher("AddToCart.jsp");
        requestDispatcher.forward(request, response);
		
	}

		
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
