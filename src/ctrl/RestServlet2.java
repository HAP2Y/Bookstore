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
 * Servlet implementation class RestServlet2
 */
@WebServlet("/RestServlet2")
public class RestServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String BASE_URI = "http://localhost:8011/BookStoreRest"; //Original 9090
	public static final String PATH_NAME = "/RestBooksClass/orderdetails/";  
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Enter RestServlet2:");
    	int id=1;
        int orderno = 1;
    	
    	System.out.println("Enter ResrServlet2 orders");
  	  String mdetails="";  
  	//Make REST  call to retrieve order Details   
  	  ClientConfig config = new DefaultClientConfig();
  	  Client client = Client.create(config);
  	  WebResource resource = client.resource(BASE_URI);
  	  WebResource nameResource = resource.path("rest").path(PATH_NAME + orderno);
  	  System.out.println("Client Response \n" + getClientResponse(nameResource));
  	  System.out.println("Response \n" + getResponse(nameResource) + "\n\n");
  	  String str1 = getResponse(nameResource);
 
  	    request.setAttribute("orderdetails", str1);
	   RequestDispatcher requestDispatcher = request
            .getRequestDispatcher("OrderDetail.jsp");
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
