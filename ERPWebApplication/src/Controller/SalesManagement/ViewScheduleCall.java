package Controller.SalesManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.Salesmanagement.AddInsertDaoImp;
import InterFace.SalesManagement.AddInsertDao;
import Model.SalesManagement.customer_model;
import Model.UserManagement.UserModel;

/**
 * Servlet implementation class ViewScheduleCall
 */
public class ViewScheduleCall extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewScheduleCall() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession();
		int userid=(Integer) session.getAttribute("id1");
		String cid=request.getParameter("count");
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		AddInsertDao  as=new AddInsertDaoImp();
		List<customer_model> cu_list= as.viewCustomerBycustid(Integer.parseInt(cid));
		out.println("<table style='border-spacing: 100px 100px;' cellpadding='10' cellspacing='10'>");
		out.println("<tr>");
		out.println("<td>Responsible</td>");
		out.println("<td><select name='responsible' class='form-control'><option disabled selected></option>");
		AddInsertDao aa= new AddInsertDaoImp();
		List<UserModel> u=aa.viewUserData(userid, 0);
		for(int i=0;i<u.size();i++){
			out.println("<option value='"+u.get(i).getUserid()+"'>"+u.get(i).getUsername()+"</option>");
		}
		out.println("</select></td>");
		out.println("</tr>");
		out.println("<tr><td>Phone No</td>");
		out.println("<td><input type='text' class='form-control' name='phone' value='"+cu_list.get(0).getMobile1()+"'></td><td></td>");
		out.println("</tr>");
		out.println("<tr><td>Mobile No(1)</td>");
		out.println("<td><input type='text' name='mobile1' class='form-control' value='"+cu_list.get(0).getMobile1()+"'></td><td></td>");
		out.println("</tr>");
		out.println("<tr><td>Mobile No(2)</td>");
		out.println("<td><input type='text' name='mobile2' class='form-control' value='"+cu_list.get(0).getMobile2()+"'></td><td></td>");
		out.println("</tr>");
		out.println("</table>");
	}

}
