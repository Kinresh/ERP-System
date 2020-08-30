package Controller.SalesManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Salesmanagement.AddInsertDaoImp;
import InterFace.SalesManagement.AddInsertDao;
import Model.SalesManagement.customer_model;

/**
 * Servlet implementation class Ajaxservlet
 */
public class Ajaxservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ajaxservlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cus_id=request.getParameter("value");
		AddInsertDao  sales = new AddInsertDaoImp();
		List<customer_model> cu_list= sales.viewCustomerBycustid(Integer.parseInt(cus_id));
		response.setContentType("text/html");
		PrintWriter out= response.getWriter();
			out.println("<table  class='table table-condensed' cellpadding='5' cellspacing='5'>");
			out.println("<tr><td>Address</td>");
			out.println("<td><textarea rows='3' class='form-control' cols='20' name='address'>"+cu_list.get(0).getAddress()+"</textarea></td><td></td>");
			out.println("</tr>");
			out.println("<tr><td>Email</td>");
			out.println("<td><input type='text' class='form-control' name='e_name' value='"+cu_list.get(0).getEmailid()+"'></td><td></td>");
			out.println("</tr>");
			out.println("<tr><td>Fax</td>");
			out.println("<td><input type='text' class='form-control' name='fax' value='"+cu_list.get(0).getFaxno()+"'></td><td></td>");
			out.println("</tr>");
			out.println("<tr><td>Phone No</td>");
			out.println("<td><input type='text' class='form-control' name='phn_no' value='"+cu_list.get(0).getPhone()+"'></td><td></td>");
			out.println("</tr>");
			out.println("<tr><td>Mobile No(1)</td>");
			out.println("<td><input type='text' class='form-control' name='m_no1' value='"+cu_list.get(0).getMobile1()+"'></td><td></td>");
			out.println("</tr>");
			out.println("<tr><td>Mobile No(2)</td>");
			out.println("<td><input type='text' class='form-control' name='m_no2' value='"+cu_list.get(0).getMobile2()+"'></td><td></td>");
			out.println("</tr>");
			out.println("</table>");
			
		
	}

}
