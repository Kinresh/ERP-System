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
import InterFace.PurchaseManagement.PurchaseDao;
import Model.PurchaseManagement.Item_Size_model;
import Model.PurchaseManagement.Item_model;

/**
 * Servlet implementation class AjaxItem
 */
public class AjaxItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxItem() {
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
		PurchaseDao pdi=new PurchaseDaoImp();
		String stuff=request.getParameter("action");
		if(stuff.equalsIgnoreCase("getItem")){
		String product_id=request.getParameter("value");
		
		ArrayList<Item_model> i_lst=pdi.getItem(Integer.parseInt(product_id));
		out.println("<td>");
		out.println("<select style='width:120px;height:30px;' name='item' id='i_id' onchange='getSize(this.value)'>");
		out.println("<option value='-1' selected></option>");
		for(int i=0;i<i_lst.size();i++){
			out.println("<option value="+i_lst.get(i).getItemid()+">"+i_lst.get(i).getItem()+"</option>");
		}
		out.println("</select></td>");
		}
		else if(stuff.equalsIgnoreCase("getSize")){
			String item_id=request.getParameter("value");
			ArrayList<Item_Size_model> s_list=pdi.getItemSize(Integer.parseInt(item_id));
			ArrayList<Item_model> item_list=pdi.viewItemInfo(Integer.parseInt(item_id));
			String checktype=item_list.get(0).getProductType();
			if(checktype.equals("Stockable")){
			out.println("<td>");
			out.println("<select style='width:120px;height:30px;' name='size' id='s_id'>");
			out.println("<option value='0' selected></option>");
			for(int i=0;i<s_list.size();i++){
				out.println("<option value="+s_list.get(i).getItemsizeid()+">"+s_list.get(i).getSize()+"</option>");
			}
			out.println("</select></td>");
			}
			else{
				out.println("<td><select name='size' style='width:120px;height:30px;' ><option value='0' selected></option></select></td>");
			}
		}
		else if(stuff.equalsIgnoreCase("getItemOld")){
			String product_id=request.getParameter("value");
			String rowId=request.getParameter("rowId");
			ArrayList<Item_model> i_lst=pdi.getItem(Integer.parseInt(product_id));
			out.println("<td>");
			out.println("<select style='width:120px;height:30px;' name='item' id='i_id' onchange='getSizeOld(this.value,"+rowId+")'>");
			out.println("<option value='-1' selected></option>");
			for(int i=0;i<i_lst.size();i++){
				out.println("<option value="+i_lst.get(i).getItemid()+">"+i_lst.get(i).getItem()+"</option>");
			}
			out.println("</select></td>");
		}
			
	}

}
