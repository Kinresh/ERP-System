package Controller.SalesManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Salesmanagement.AddInsertDaoImp;
import Dao.Salesmanagement.GenericsImp;
import Dao.Salesmanagement.ScheduleCallDaoImp;
import InterFace.SalesManagement.AddInsertDao;
import InterFace.SalesManagement.GenericsDao;
import InterFace.SalesManagement.ScheduleCallDao;
import Model.SalesManagement.customer_model;
import Model.UserManagement.UserModel;

/**
 * Servlet implementation class tabservlet
 */
public class tabservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public tabservlet() {
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
		PrintWriter pw=response.getWriter();
		
		customer_model cust= new customer_model();
		GenericsDao<customer_model> gg = new GenericsImp<customer_model>();
		List<customer_model> cust_list=gg.viewData(cust);
		UserModel u=new UserModel();
		GenericsDao<UserModel> gg1 = new GenericsImp<UserModel>();
		List<UserModel> u_list=gg1.viewData(u);
		pw.println("<div id='tab'>");
		pw.println("<table class='table table-condensed' ><tr><td>Date</td><td>Summary</td><td>Contact<td></td></td><td>Responsible<td></td><td><input type='button' class='form-control  btn btn-primary text-center' style='width: 45px; height: 33px' value='Add' onClick='f2()'/></td></td></tr>");
		pw.println("<tr><td><input type='date' name='loggeddate' style='width:160px;' class='form-control'></td><td><input type='text' style='width:230px;' name='summary' class='form-control'></td><td><select name='contact' class='form-control'style='width:110px;'>" );
		for(customer_model c:cust_list)
		{
			int s1=c.getCustomerid();
			String s2=c.getCustomername();
			pw.println("<option value="+s1+">"+s2+"</option>");
		}
		pw.print("</select>");
		pw.println("<td> <input type='button' class='form-control text-center' style='width: 36px; height: 33px' value='+' onClick='AddContact()'/></td></td><td class='col-md-8'><select name='responsible' class='form-control' style='width: 110px;'>" );
		for(UserModel u1:u_list)
		{
			int s11=u1.getUserid();
			String s22=u1.getUsername();
			pw.println("<option value="+s11+">"+s22+"</option>");
		}
		pw.print("</select>");
		pw.println(	"</td></tr>");
		pw.println("</table></div>");
		
		
	}

}
