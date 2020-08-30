package Controller.SalesManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Salesmanagement.AddInsertDaoImp;
import InterFace.SalesManagement.AddInsertDao;
import Model.SalesManagement.customer_model;
import Model.UserManagement.statebean;

/**
 * Servlet implementation class customerservlet
 */
public class customerservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public customerservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		
		String compid=request.getParameter("count");  

		customer_model b=new customer_model();
		AddInsertDao a=new AddInsertDaoImp();

		List<customer_model> list=new ArrayList<customer_model>();

		list=a.viewCustomerDetailBycompid(compid);
		pw.println(" <div id='customer'>");
                                                    
                                                    
                                                   pw.println("<td class='col-md-8'>");
                                                       pw.println("<select class='form-control' name='customer' style='width: 327px;'onchange='showCity(this.value)'>");
                                                        pw.println( "   <option>--Select Customer--</option>");
                                                        for(customer_model u:list)
                                                		{
                                                				int s1=u.getCustomerid();
                                                				String s2=u.getCustomername();
                                                				
                                                		pw.println("<option value="+s1+">"+s2+"</option>");
                                                	
                                                		}
                                                		
                                                		pw.print("</select></td></tr></table></div>");
                                                                                                

	}

}
