package Controller.SalesManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.PurchaseManagement.PurchaseDaoImp;
import Dao.PurchaseManagement.PurchaseUpdateDaoImp;
import Dao.Salesmanagement.GenericsImp;
import Dao.Salesmanagement.SalesDaoImp;
import Dao.Salesmanagement.UpdateInsertDaoImp;
import InterFace.PurchaseManagement.PurchaseDao;
import InterFace.PurchaseManagement.PurchaseUpdateDao;
import InterFace.SalesManagement.GenericsDao;
import InterFace.SalesManagement.SalesDao;
import InterFace.SalesManagement.UpdateInsertDao;
import Model.PurchaseManagement.IncomingProduct_model;
import Model.PurchaseManagement.IncomingShippment_model;
import Model.PurchaseManagement.PurchaseOrder_model;
import Model.PurchaseManagement.QuatationDetail_model;
import Model.PurchaseManagement.Quatation_model;
import Model.SalesManagement.QuatationSaleDetail_model;
import Model.SalesManagement.QuatationSale_model;
import Model.SalesManagement.SalesOrder_model;
import Model.Warehouse.delivaryorders_model;
import Model.Warehouse.delivaryproducts_model;

/**
 * Servlet implementation class EditSaleQuatation
 */
public class EditSaleQuatation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditSaleQuatation() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession ses=request.getSession();
		int userid=(Integer) ses.getAttribute("id1");
		String action=request.getParameter("btnClick");
		System.out.println("--------------------------"+action);
		UpdateInsertDao pu=new UpdateInsertDaoImp();
		SalesDao p1=new SalesDaoImp();
		
		SalesOrder_model po=new SalesOrder_model();
		QuatationSale_model q=new QuatationSale_model();
		
		int qqid=Integer.parseInt(request.getParameter("qid"));
		System.out.println("iddddddddd="+qqid+"============="+action);
		if(action.equalsIgnoreCase("Confirm Order"))
		{
			System.out.print("hiiiiiiiiiiii----------------");
			
			List<QuatationSaleDetail_model> lqd=p1.viewQuatationSaleDetailInfo(qqid);
			if(lqd.isEmpty())
			{
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();  
				  
				out.println("<html><head></head><body onload=\"alert('hello')\"></body></html>"); 
			
			}
			else
			{
				
				pu.updateActiveFlagQuatation(qqid);
				
				
				
				q.setStatus("Sale to Invoice");
				q.setQuotationsale_id(qqid);
				q.setUpdated_by(userid);
				pu.updateStatusSaleQuatation(q);
				
				
				List<QuatationSale_model> lq=p1.viewQuatationInfo(qqid);
			
				po.setQuotationsale_id(qqid);
				po.setCustomer(lq.get(0).getCustomer());
				po.setCustomer_ref(lq.get(0).getCustomer_ref());
				po.setOrder_dt(lq.get(0).getOrder_dt());
			
				po.setActiveflag("Y");
				po.setCreated_by(userid);
				po.setResponsible(lq.get(0).getResponsible());
				po.setPaymentterm(lq.get(0).getPaymentterm());
				po.setShippingmethod(lq.get(0).getShippingmethod());
				po.setCreateinvoice(lq.get(0).getCreateinvoice());
				po.setTaxes(lq.get(0).getTaxes());
				po.setUntaxted_amount(lq.get(0).getUntaxted_amount());
				po.setTotal(lq.get(0).getTotal());
				po.setStatus(lq.get(0).getStatus());
				po.setPrefix(lq.get(0).getPrefix());
				po.setFlag("Y");
				GenericsDao<SalesOrder_model> gen_po=new GenericsImp<SalesOrder_model>();
				gen_po.insertData(po);
				
				
				delivaryorders_model ins=new delivaryorders_model();
				delivaryproducts_model inp=new delivaryproducts_model();
				GenericsDao<delivaryorders_model> gi=new GenericsImp<delivaryorders_model>();
		
				ins.setDeliverymethod("Partial");
				ins.setSalesorder_id(qqid);
				ins.setCusomer(lq.get(0).getCustomer());
				ins.setCustomer_ref(lq.get(0).getCustomer_ref());
				ins.setOrder_dt(lq.get(0).getOrder_dt());
				ins.setExpected_dt(lq.get(0).getExpected_dt());
				ins.setActiveflag("Y");
				ins.setCreated_by(userid);
				
				ins.setPaymentterm(lq.get(0).getPaymentterm());
				ins.setTaxes(lq.get(0).getTaxes());
				ins.setUntaxted_amount(lq.get(0).getUntaxted_amount());
				ins.setTotal(lq.get(0).getTotal());
				ins.setStatus(lq.get(0).getStatus());
				ins.setUpdated_by(userid);
				ins.setCreated_by(userid);
				ins.setPrefix("OUT/000");
				ins.setDescription(lq.get(0).getDescription());
				ins.setExpected_dt(lq.get(0).getExpected_dt());
				ins.setStatus("Waiting Availability");
				gi.insertData(ins);
				//insert into incoming Product
				List<QuatationSaleDetail_model> qd=p1.viewQuatationSaleDetailInfo(lq.get(0).getQuotationsale_id());
				
				GenericsDao<delivaryproducts_model> gp=new GenericsImp<delivaryproducts_model>();
				int sid=p1.lastIncdelivarorder_Id();
				for(int i=0;i<qd.size();i++)
				{
				
				inp.setDelivaryorder_id(sid);
				inp.setProduct(qd.get(i).getProduct());
				inp.setItem(qd.get(i).getItem());
				inp.setItemsizeid(qd.get(i).getItemsizeid());
				inp.setDescription(qd.get(i).getDescription());
				inp.setSchedule_dt(qd.get(i).getSchedule_dt());
				inp.setQuantity(qd.get(i).getQuantity());
				inp.setUnit_price(qd.get(i).getUnit_price());
				inp.setTaxs(qd.get(i).getTaxs());
				inp.setSubtotal(qd.get(i).getSubtotal());
				inp.setUpdated_by(userid);
				inp.setCreated_by(lq.get(0).getCreated_by());
				inp.setActiveflag("Y");
				inp.setStatus("Waiting Availability");
				
				gp.insertData(inp);
				}

			
			response.sendRedirect("UserController?action=ViewSalesOrder&id="+qqid);
			}
			
		}
		if(action.equalsIgnoreCase("Set to Draft"))
		{
			System.out.println("---------Set Value");
			q.setStatus("Draft PO");
			q.setQuotationsale_id(qqid);
			q.setUpdated_by(userid);
			boolean flag=pu.updateStatusSaleQuatation(q);
			if(flag)
			response.sendRedirect("UserController?action=EditQuatations&id="+qqid);;
		}
		if(action.equalsIgnoreCase("Send by Email"))
		{
		
			QuatationSale_model pq=new QuatationSale_model();
			pq.setStatus("RFQ Sent");
			pq.setQuotationsale_id(qqid);
			pq.setUpdated_by(userid);
			boolean flag=pu.updateStatusSaleQuatation(pq);
			if(flag)
				response.sendRedirect("UserController?action=ViewQuatation&id="+qqid);
		}
		if(action.equalsIgnoreCase("Print"))
		{
			
			QuatationSale_model pq=new QuatationSale_model();
			pq.setStatus("RFQ Sent");
			pq.setQuotationsale_id(qqid);
			pq.setUpdated_by(userid);
			boolean flag=pu.updateStatusSaleQuatation(pq);
			if(flag)
				response.sendRedirect("UserController?action=ViewQuatation&id="+qqid);
		}
		if(action.equalsIgnoreCase("Cancel"))
		{
			System.out.print("Hiii");
			QuatationSale_model pq=new QuatationSale_model();
			pq.setStatus("Cancelled");
			pq.setQuotationsale_id(qqid);
			pq.setUpdated_by(userid);
			boolean flag=pu.updateStatusSaleQuatation(pq);
			if(flag)
				response.sendRedirect("UserController?action=ViewSaleQuatation&id="+qqid);
		}
	
		
		
	}

}
