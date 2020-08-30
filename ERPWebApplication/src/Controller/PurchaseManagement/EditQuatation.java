package Controller.PurchaseManagement;

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
import InterFace.PurchaseManagement.PurchaseDao;
import InterFace.PurchaseManagement.PurchaseUpdateDao;
import InterFace.SalesManagement.GenericsDao;
import Model.PurchaseManagement.IncomingProduct_model;
import Model.PurchaseManagement.IncomingShippment_model;
import Model.PurchaseManagement.PurchaseOrder_model;
import Model.PurchaseManagement.QuatationDetail_model;
import Model.PurchaseManagement.Quatation_model;

/**
 * Servlet implementation class EditQuatation
 */
public class EditQuatation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditQuatation() {
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
		HttpSession ses=request.getSession();
		int userid=(Integer) ses.getAttribute("id1");
		String action=request.getParameter("btnClick");
		System.out.println("--------------------------"+action);
		PurchaseUpdateDao pp=new PurchaseUpdateDaoImp();
		PurchaseDao p1=new PurchaseDaoImp();
		PurchaseUpdateDao puobj=new PurchaseUpdateDaoImp();
		PurchaseDao pobj=new PurchaseDaoImp();

		PurchaseOrder_model po=new PurchaseOrder_model();
		
		Quatation_model q=new Quatation_model();
		
		int poid=Integer.parseInt(request.getParameter("qid"));
		System.out.println("iddddddddd="+poid+"============="+action);
		if(action.equalsIgnoreCase("Confirm Order"))
		{
			System.out.print("hiiiiiiiiiiii----------------");
			
			List<QuatationDetail_model> lqd=p1.viewQuatationDetailInfo(poid);
			if(lqd.isEmpty())
			{
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();  
				  
				out.println("<html><head></head><body onload=\"alert('hello')\"></body></html>"); 
			
			}
			else
			{
				
				pp.updateActiveFlagQuatation(poid);
				
				
				
				q.setStatus("Purchase Order");
				q.setQuotation_id(poid);
				q.setUpdated_by(userid);
				pp.updateStatusQuatation(q);
				
				
				List<Quatation_model> lq=p1.viewQuatationInfo(poid);
			
				po.setQuotation_id(poid);
				po.setSupplier(lq.get(0).getSupplier());
				po.setSupplier_ref(lq.get(0).getSupplier_ref());
				po.setOrder_dt(lq.get(0).getOrder_dt());
				po.setExpected_dt(lq.get(0).getExpected_dt());
				po.setActiveflag("Y");
				po.setCreated_by(userid);
				po.setInvoicecontrol(lq.get(0).getInvoicecontrol());
				po.setPaymentterm(lq.get(0).getPaymentterm());
				po.setTaxes(lq.get(0).getTaxes());
				po.setUntaxted_amount(lq.get(0).getUntaxted_amount());
				po.setTotal(lq.get(0).getTotal());
				po.setStatus(lq.get(0).getStatus());
				po.setPrefix(lq.get(0).getPrefix());
				po.setFlag("Y");
				
				GenericsDao<PurchaseOrder_model> gen_po=new GenericsImp<PurchaseOrder_model>();
				gen_po.insertData(po);
				
				//insert into incoming shipment
				
				IncomingShippment_model ins=new IncomingShippment_model();
				IncomingProduct_model inp=new IncomingProduct_model();
				GenericsDao<IncomingShippment_model> gi=new GenericsImp<IncomingShippment_model>();
		
				ins.setDeliverymethod("Partial");
				ins.setPurchaseorder_id(poid);
				ins.setSupplier(lq.get(0).getSupplier());
				ins.setSupplier_ref(lq.get(0).getSupplier_ref());
				ins.setOrder_dt(lq.get(0).getOrder_dt());
				ins.setExpected_dt(lq.get(0).getExpected_dt());
				ins.setActiveflag("Y");
				ins.setCreated_by(userid);
				ins.setInvoicecontrol(lq.get(0).getInvoicecontrol());
				ins.setPaymentterm(lq.get(0).getPaymentterm());
				ins.setTaxes(lq.get(0).getTaxes());
				ins.setUntaxted_amount(lq.get(0).getUntaxted_amount());
				ins.setTotal(lq.get(0).getTotal());
				ins.setStatus(lq.get(0).getStatus());
				ins.setUpdated_by(userid);
				ins.setCreated_by(userid);
				ins.setPrefix("IN/000");
				ins.setStatus("Ready to Receive");
				gi.insertData(ins);
				//insert into incoming Product
				List<QuatationDetail_model> qd=pobj.viewQuatationDetailInfo(lq.get(0).getQuotation_id());
				
				GenericsDao<IncomingProduct_model> gp=new GenericsImp<IncomingProduct_model>();
				int sid=p1.lastInc_shipId();
				for(int i=0;i<qd.size();i++)
				{
				
				inp.setIncomingshippment_id(sid);
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
				inp.setStatus("Available");
				
				gp.insertData(inp);
				}

			}
			response.sendRedirect("UserController?action=ViewPurchaseOrder&id="+poid);;	
		}
		if(action.equalsIgnoreCase("Set to Draft"))
		{
			System.out.println("---------Set Value");
			q.setStatus("Draft PO");
			q.setQuotation_id(poid);
			q.setUpdated_by(userid);
			boolean flag=pp.updateStatusQuatation(q);
			if(flag)
			response.sendRedirect("UserController?action=EditQuatations&id="+poid);;
		}
		if(action.equalsIgnoreCase("Send by Email"))
		{
			PurchaseUpdateDao pdu=new PurchaseUpdateDaoImp();
			Quatation_model pq=new Quatation_model();
			pq.setStatus("RFQ Sent");
			pq.setQuotation_id(poid);
			pq.setUpdated_by(userid);
			boolean flag=pdu.updateStatusQuatation(pq);
			if(flag)
				response.sendRedirect("UserController?action=ViewQuatation&id="+poid);
		}
		if(action.equalsIgnoreCase("Print"))
		{
			PurchaseUpdateDao pdu=new PurchaseUpdateDaoImp();
			Quatation_model pq=new Quatation_model();
			pq.setStatus("RFQ Sent");
			pq.setQuotation_id(poid);
			pq.setUpdated_by(userid);
			boolean flag=pdu.updateStatusQuatation(pq);
			if(flag)
				response.sendRedirect("UserController?action=ViewQuatation&id="+poid);
		}
		if(action.equalsIgnoreCase("Cancel"))
		{
			PurchaseUpdateDao pdu=new PurchaseUpdateDaoImp();
			Quatation_model pq=new Quatation_model();
			pq.setStatus("Cancelled");
			pq.setQuotation_id(poid);
			pq.setUpdated_by(userid);
			boolean flag=pdu.updateStatusQuatation(pq);
			if(flag)
				response.sendRedirect("UserController?action=ViewQuatation&id="+poid);
		}
		if(action.equalsIgnoreCase("Cancel"))
		{
			
		}
		
		
	}

}
