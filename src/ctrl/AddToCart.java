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
 * Servlet implementation class AddToCart
 */
@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<CartBook> cart;
		int grandtotal = 0;
		HttpSession session=request.getSession();
		
        Book b1 = (Book)session.getAttribute("book"); 
       
        
 // Create CartBook to add to the cart    
        
        CartBook cartbook = new CartBook();
        cartbook.setBid(b1.getBid());
        cartbook.setCategory(b1.getCategory());
        cartbook.setPrice(b1.getPrice());
        cartbook.setQty(1);
        cartbook.setTitle(b1.getTitle());
        cartbook.setTotal(b1.getPrice());
        
        cart = (ArrayList)session.getAttribute("cart"); 
        
        if(cart != null){
        	 cart.add(cartbook);
             grandtotal = (Integer)session.getAttribute("grandtotal");
             grandtotal = grandtotal + cartbook.getTotal();
           
        }
        else{
        	
        	 cart = new ArrayList<CartBook>();
        	 cart.add(cartbook);
        	  grandtotal = cartbook.getTotal();
        	 
        }
       
        
        session.setAttribute("cart",cart); 
        session.setAttribute("grandtotal",grandtotal); 
		
		
       
		RequestDispatcher requestDispatcher = request
                .getRequestDispatcher("AddToCart.jsp");
        requestDispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
