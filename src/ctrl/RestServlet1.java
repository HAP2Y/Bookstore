package ctrl;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.MediaType;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;

/**
 * Servlet implementation class RestServlet1
 */
@WebServlet("/RestServlet1")
public class RestServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String BASE_URI = "http://localhost:8011/BookStoreRest";
	public static final String PATH_NAME = "/RestBooksClass/books/";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		    	
		    	System.out.println("Enter RestServlet1:");
		    	int id=1;
	            String bookid="b001";
	            bookid = request.getParameter("bookid");
		    	ArrayList ar1 = new ArrayList();
		    	System.out.println("RestServlet1: Bookid:"+bookid);
		  	  String mdetails="";  
		  	//Make REST  call to retrieve list of movies   
		  	  ClientConfig config = new DefaultClientConfig();
		  	  Client client = Client.create(config);
		  	  WebResource resource = client.resource(BASE_URI);
		  	  WebResource nameResource = resource.path("rest").path(PATH_NAME + bookid);
		  	  System.out.println("Client Response \n"
		  	  + getClientResponse(nameResource));
		  	  System.out.println("Response \n" + getResponse(nameResource) + "\n\n");
		  	  String str1 = getResponse(nameResource);
		 
		  	    request.setAttribute("bookdetails", str1);
			RequestDispatcher requestDispatcher = request
	                .getRequestDispatcher("BookDetail.jsp");
	        requestDispatcher.forward(request, response);
	        
		  	  
		  	  
		    }
		    
		    private static String getClientResponse(WebResource resource) {
		  	  return resource.accept(MediaType.TEXT_XML).get(ClientResponse.class)
		  	  .toString();
		  	  }

		    private static String getResponse(WebResource resource) {
		  	  return resource.accept(MediaType.TEXT_XML).get(String.class);
		  	  }  
		    
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
