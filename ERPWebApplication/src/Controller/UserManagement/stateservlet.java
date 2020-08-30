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
import Model.UserManagement.statebean;


/**
 * Servlet implementation class stateservlet
 */
public class stateservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public stateservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		
		String country1=request.getParameter("count");  

		statebean b=new statebean();
		AddInsertDao a=new AddInsertDaoImp();

		List<statebean> list=new ArrayList<statebean>();

		list=a.viewstate(Integer.parseInt(country1));
		pw.println(" <div id='state'>");
                                                    
                                                    
                                                   pw.println("<td class='col-md-8'>");
                                                       pw.println("<select class='form-control' name='state' onchange='showCity(this.value)' >");
                                                        pw.println( "   <option>--Select State--</option>");
                                                        for(statebean u:list)
                                                		{
                                                				int s1=u.getSid();
                                                				String s2=u.getStatename();
                                                				
                                                		pw.println("<option value="+s1+">"+s2+"</option>");
                                                	
                                                		}
                                                		
                                                		pw.print("</select></td></tr></table></div>");
                                                                                                
                                                		
                                                		
                                                	
				
		
	}

}
