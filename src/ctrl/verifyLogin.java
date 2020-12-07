package ctrl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Account;

/**
 * Servlet implementation class verifyLogin
 */
@WebServlet("/verifyLogin")
public class verifyLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Account ac = new Account();
		
		User user = ac.getAccountDetails(username,password);
		
		if(user != null){
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			user.setLoggedin(true);
			session.setAttribute("loggedIn", true);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/MainPage.jspx");
            requestDispatcher.forward(request, response);
		}
		else{
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/LoginFailed.jsp");
            requestDispatcher.forward(request, response);
			
		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
