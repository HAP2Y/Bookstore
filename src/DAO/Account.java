package DAO;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import bean.UserInfo;
import bean.Book;
import bean.CartBook;
import ctrl.User;

public class Account {
    public int registerUser(UserInfo userinfo) throws ClassNotFoundException {
        String INSERT = "INSERT INTO Account" +
            "  (firstname, lastname, username, email, pass, street, city, postal, phone,role, loggedin) VALUES " +
            " (?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?);";

        int result = 0;
        Connection con = DataConnect.getConnection();
        //String url       = "jdbc:mysql://127.0.0.1:3306/AccountInfo?serverTimezone=UTC";
        //String user      = "root";
        //String password  = "1234567890";
        //Class.forName("com.mysql.jdbc.Driver");

        try (
           //Connection con = DriverManager.getConnection(url, user, password);

            //Create a statement using connection object
            PreparedStatement ps = con.prepareStatement(INSERT)) {
			ps.setString(1, userinfo.getFirstname());
			ps.setString(2, userinfo.getLastname());
			ps.setString(3, userinfo.getUsername());
			ps.setString(4, userinfo.getEmail());
			ps.setString(5, userinfo.getPass());
			ps.setString(6, userinfo.getStreet());
			ps.setString(7, userinfo.getCity());
			ps.setString(8, userinfo.getPostal());
			ps.setString(9, userinfo.getPhone());
			ps.setString(10,userinfo.getRole());
			ps.setBoolean(11, false);


            //Execute the query or update query
            result = ps.executeUpdate();
            
            
           

        } catch (SQLException e) {
            //process sql exception
            printSQLException(e);
        }
        return result;
    }


    // get Account details and verify username password
        public User getAccountDetails(String username,String password) {
        	
        	User user = new User();
        	int flag = 0;
       //     
            try
	        {
	            String arg;
	            //Connection con;
	            Connection con = DataConnect.getConnection();
	            //Class.forName("com.mysql.jdbc.Driver");
	            //con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/AccountInfo?serverTimezone=UTC","root","1234567890"); 
	            
	            String sql1 = "SELECT * from Account WHERE username = ? and pass = ?";
	            PreparedStatement ps = con.prepareStatement(sql1);
	            ps.setString(1,username);
	            ps.setString(2,password);
	            
	            System.out.println("GetAccount Details Before executeQuery: username:password:"
	                        + username + "  " + password);
	            ResultSet rs  = ps.executeQuery();
	         // Process the result set.
	            while (rs.next())
	            {   System.out.println("GetAccount Details While Loop");
	                flag = 1;
	                user.setFirstName(rs.getString("firstname"));
	                user.setLastName(rs.getString("lastname"));
	                user.setUserName(rs.getString("username"));
	                user.setEmail(rs.getString("email"));
	                user.setStreet(rs.getString("street"));
	                user.setCity(rs.getString("city"));
	                user.setPostal(rs.getString("postal"));
	                user.setPhone(rs.getString("phone"));
	                user.setLoggedin(false);
	            }
	            rs.close();
	            ps.close();
	            con.close();
	            if(flag == 0){
	            	user = null;
	            }
	          return user;
	        }
	        catch (SQLException sqe)
	        {
	            System.out.println("Unexpected exception : " +
	                                sqe.toString() + ", sqlstate = " +
	                                sqe.getSQLState());
	            return null;
	           
	        }
	        catch (Exception e)
	        {
	           e.printStackTrace();
	           return null;
	        }
	        
         
        }
    
    //
        
        // get Account details and verify username password
        public Book getBookDetails(String  bookid) {
        	
        	Book b1 = new Book();
        	
       //     
            try
	        {
	           
	            //Connection con;
	            Connection con = DataConnect.getConnection();
	            //Class.forName("com.mysql.jdbc.Driver");
	            //con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/AccountInfo?serverTimezone=UTC","root","1234567890"); 
	            
	            String sql1 = "SELECT * from Book  WHERE bid = ?";
	            PreparedStatement ps = con.prepareStatement(sql1);
	            ps.setString(1,bookid);
	           ;
	            
	            System.out.println("GetBook Details Before executeQuery");
	                     
	            ResultSet rs  = ps.executeQuery();
	         // Process the result set.
	            while (rs.next())
	            {   System.out.println("GetBook Details While Loop");
	              
	                b1.setBid(rs.getString("bid"));	
	                b1.setTitle(rs.getString("title"));	  
	                b1.setCategory(rs.getString("category"));	  
	                b1.setPrice(rs.getInt("price"));
	                b1.setDescription(rs.getString("description"));
	                
	            }
	            rs.close();
	            ps.close();
	            con.close();
	           
	          
	          return b1;
	        }
	        catch (SQLException sqe)
	        {
	            System.out.println("Unexpected exception : " +
	                                sqe.toString() + ", sqlstate = " +
	                                sqe.getSQLState());
	            return null;
	           
	        }
	        catch (Exception e)
	        {
	           e.printStackTrace();
	           return null;
	        }
	        
         
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
    
        // get Account details and verify username password
        public ArrayList getBookList(String category) {
        	
        	Book book = new Book();
        	ArrayList<Book> ar1 = new ArrayList(); 
        	 PreparedStatement ps=null;
       //     
            try
	        {
	            String arg;
	            String sql1=""; 
	            //Connection con;
	            Connection con = DataConnect.getConnection();
	            //Class.forName("com.mysql.jdbc.Driver");
	            //con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/AccountInfo?serverTimezone=UTC","root","1234567890"); 
	            
	            if(category.equals("all" ) || category.length() <= 0 ){
	            	 
	            	 sql1  = "SELECT * from Book  ";
			         ps = con.prepareStatement(sql1);
	            }
	            else{
	            	sql1  = "SELECT * from Book WHERE category =  ? ";
		            ps = con.prepareStatement(sql1);
		            ps.setString(1,category);
	            	
	            	
			            
	            	
	            }
	           
	           
	            System.out.println("Get list of books from Book Table");
	            ResultSet rs  = ps.executeQuery();
	         // Process the result set.
	            while (rs.next())
	            {   System.out.println("Book List While Loop");
	                Book b1 = new Book();
	                b1.setBid(rs.getString("bid"));
	                b1.setTitle(rs.getString("title"));
	                b1.setCategory(rs.getString("category"));
	                b1.setPrice(rs.getInt("price"));
	                ar1.add(b1);
	            }
	            rs.close();
	            ps.close();
	            con.close();
	          
	          return ar1;
	        }
	        catch (SQLException sqe)
	        {
	            System.out.println("Unexpected exception : " +
	                                sqe.toString() + ", sqlstate = " +
	                                sqe.getSQLState());
	            return null;
	           
	        }
	        catch (Exception e)
	        {
	           e.printStackTrace();
	           return null;
	        }
	        
         
        }
    
    //
   
        public int setOrderDetails(User user,int grandtotal,ArrayList<CartBook>  cart)  {
        	
        	int result3=0;
            String INSERT = "INSERT INTO purchase_order" +
                "  (firstname, lastname, status, address, grandtotal) VALUES " +
                " ( ?, ?, ?, ?, ?);";

            int result = 0;
           
            Connection con = DataConnect.getConnection();
            try {
          //Create a statement using connection object
                PreparedStatement ps = con.prepareStatement(INSERT);
    			ps.setString(1, user.getFirstName());
    			ps.setString(2, user.getLastName());
    			ps.setString(3, "ORDERED");
    		 	ps.setString(4, user.getStreet());
    			ps.setInt(5,grandtotal);
    			

                //Execute the query or update query
                result = ps.executeUpdate();
                
                PreparedStatement ps2 = con.prepareStatement("Select max(poid) as maxpoid from purchase_order");
                
                ResultSet result2 = ps2.executeQuery();
                result2.next();
                int maxpoid = result2.getInt(1);
                
                System.out.println("MAXPOID:"+maxpoid);
                String sql2 = "INSERT INTO po_items values  ( ?, ?, ?, ?, ?);";

                PreparedStatement ps3 = con.prepareStatement(sql2);
                System.out.println("Before entering CART LOop");
                for(CartBook c1: cart){
                	
                	System.out.println("Entered in for LOop");
                	
                	ps3.setInt(1,maxpoid);
                	ps3.setString(2,c1.getBid());
                	ps3.setInt(3,c1.getQty());
                	ps3.setInt(4,c1.getPrice());
                	ps3.setInt(5,c1.getTotal());
                	result3 = ps3.executeUpdate();
                	              
                }
                
                

            } catch (SQLException e) {
                //process sql exception
                printSQLException(e);
            }
            return result;
        }
  
        
        
        
        
   //     
    
    
    
    
    
    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        
        }
    }
}
