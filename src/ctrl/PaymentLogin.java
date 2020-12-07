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
import bean.CartBook;

/**
 * Servlet implementation class PaymentLogin
 */
@WebServlet("/PaymentLogin")
public class PaymentLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
        Account ac = new Account();
		
		User user = ac.getAccountDetails(username,password);
		
		if(user != null){
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
					 
			 ArrayList<CartBook> cart = new ArrayList();
			 cart = (ArrayList)session.getAttribute("cart");
		     int grandtotal = (Integer)session.getAttribute("grandtotal");
			 ac.setOrderDetails(user,grandtotal,cart);
			 RequestDispatcher requestDispatcher = request.getRequestDispatcher("Checkout.jsp");
			 requestDispatcher.forward(request, response);
            
		}
		else{
			RequestDispatcher requestDispatcher = request
                    .getRequestDispatcher("/LoginFailed.jsp");
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
