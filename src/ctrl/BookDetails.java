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
import bean.Book;

/**
 * Servlet implementation class BookDetails
 */
@WebServlet("/BookDetails")
public class BookDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public BookDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Entered BookDetails Servlet: et method");
		System.out.println(request.getParameter("id"));
	   Book b1;	
       Account ac = new Account();
		
		String bookid = request.getParameter("id");
		
		b1 = ac.getBookDetails(bookid);
		
		HttpSession session=request.getSession();  
        session.setAttribute("book",b1);  
		
		request.setAttribute("book1", b1);
		RequestDispatcher requestDispatcher = request
                .getRequestDispatcher("BookDetails.jsp");
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
