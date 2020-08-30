package Controller.PurchaseManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.PurchaseManagement.PurchaseDaoImp;
import InterFace.PurchaseManagement.PurchaseDao;
import Model.PurchaseManagement.Item_model;

/**
 * Servlet implementation class PurchaseAjaxSize
 */
public class PurchaseAjaxSize extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseAjaxSize() {
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
		String product_id=request.getParameter("value");
		PurchaseDao pdi=new PurchaseDaoImp();
		ArrayList<Item_model> i_lst=pdi.getItem(Integer.parseInt(product_id));
		out.println("<td>");
		out.println("<select style='width:130px;height:30px;'  name='item[]' id='i_id'>");
		for(int i=0;i<i_lst.size();i++){
			out.println("<option value="+i_lst.get(i).getItemid()+">"+i_lst.get(i).getItem()+"</option>");
		}
		out.println("</select></td>");
	}

}
