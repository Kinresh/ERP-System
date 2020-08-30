package Controller.UserManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.UserManagement.AddInsertDaoImp;
import InterFace.UserManagement.AddInsertDao;
import Model.UserManagement.citybean;


/**
 * Servlet implementation class cityservlet
 */
public class cityservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cityservlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html");
			PrintWriter pw=response.getWriter();
			
		String state=request.getParameter("count");  

		citybean b=new citybean();
		AddInsertDao a=new AddInsertDaoImp();

		List<citybean> list=new ArrayList<citybean>();

		list=a.viewcity(Integer.parseInt(state));
		pw.println(" <div id='city'>");
                                                    
                                                    
                                                   pw.println("<td class='col-md-8'>");
                                                       pw.println("<select class='form-control' name='city' >");
                                                        pw.println( "   <option>--Select City--</option>");
                                                        for(citybean u:list)
                                                		{
                                                				int s1=u.getCityid();
                                                				String s2=u.getCityname();
                                                				
                                                		pw.println("<option value="+s1+">"+s2+"</option>");
                                                	
                                                		}
                                                		
                                                		pw.print("</select></td></tr></table></div>");
                                                                                                
                                                		
                                                		
                                                	
				
		
	}

}
