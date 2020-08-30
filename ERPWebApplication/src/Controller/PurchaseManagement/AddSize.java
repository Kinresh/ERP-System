package Controller.PurchaseManagement;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.PurchaseManagement.PurchaseDaoImp;
import Dao.Salesmanagement.GenericsImp;
import InterFace.PurchaseManagement.PurchaseDao;
import InterFace.SalesManagement.GenericsDao;
import Model.PurchaseManagement.Item_Size_model;
import Model.PurchaseManagement.Item_model;
import Model.UserManagement.statebean;

/**
 * Servlet implementation class AddSize
 */
public class AddSize extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSize() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String cnt=request.getParameter("count");

		int c=Integer.parseInt(cnt);
			
			 
			 PurchaseDao pp=new PurchaseDaoImp();
			 String s="Stockable";
			 List<Item_Size_model> ll=pp.viewItemByType(s,c);
			 if(ll.isEmpty())
			 { 
				out.println("<tr><td colspan='3'><a href='UserController?action=AddSize'>Plz Add Item Size</a></td></tr>");
				
			 }
			 else
			 {
				 out.println("<tr><td>Item</td><td><select name='itemid' class='form-control'>");
				 out.println( "   <option>--Select Item--</option>");
				 
			
               for(Item_Size_model u:ll)
       		{
       				int s1=u.getItemid();
       				String s2=u.getItem();
       				
       		out.println("<option value="+s1+">"+s2+"</option>");
       	
       		}
               out.println("</select></td></tr>");
			
			out.println("<tr><td>Size</td>");
			out.println("<td><input type='text' class='form-control' name='size' /></td>");
			out.println("<td><input type='submit' style='width:50px; height:30px;' name='hid' value='Add' class='form-control btn btn-primary text-center'></td>");
			out.println("</tr>");
			 }
			
		
	}

}
