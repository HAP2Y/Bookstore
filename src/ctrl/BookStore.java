package ctrl;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Account;
import bean.Book;

/**
 * Servlet implementation class BookStore
 */
@WebServlet("/BookStore")
public class BookStore extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public BookStore() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Account ac = new Account();
		
		ArrayList<Book>  books;
		String category = request.getParameter("category");
		
		books = ac.getBookList(category);
		
		request.setAttribute("book", books);
		RequestDispatcher requestDispatcher = request
                .getRequestDispatcher("BookStore.jsp");
        requestDispatcher.forward(request, response);
        
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
