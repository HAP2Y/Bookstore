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
import bean.UserInfo;

/**
 * Servlet implementation class Register
 */
@WebServlet("/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Account account = new Account();

	public Register() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		RequestDispatcher dispatcher = request.getRequestDispatcher("/Register.jspx");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("pass");
		String email = request.getParameter("email");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String street = request.getParameter("street");
		String city = request.getParameter("city");
		String postal = request.getParameter("postal");
		String phone = request.getParameter("phone");
		String role = request.getParameter("role");
		boolean loggedin = false;

		UserInfo userinfo = new UserInfo();
		userinfo.setFirstname(firstname);
		userinfo.setLastname(lastname);
		userinfo.setEmail(email);
		userinfo.setUsername(username);
		userinfo.setPass(password);
		userinfo.setStreet(street);
		userinfo.setCity(city);
		userinfo.setPostal(postal);
		userinfo.setPhone(phone);
		userinfo.setRole(role);
		userinfo.setLoggedIn(loggedin);

		try {
			account.registerUser(userinfo);
			HttpSession session = request.getSession();
			session.setAttribute("accountinfo", userinfo);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("Message", "You have succesfully registered, Please Login to continue!");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/MainPage.jspx");
		dispatcher.forward(request, response);
	}

}
