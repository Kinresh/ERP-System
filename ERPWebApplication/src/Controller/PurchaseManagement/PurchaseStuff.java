package Controller.PurchaseManagement;
import java.util.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.mapping.Array;

import Dao.PurchaseManagement.PurchaseDaoImp;
import Dao.PurchaseManagement.PurchaseUpdateDaoImp;
import Dao.Salesmanagement.GenericsImp;
import Dao.UserManagement.GenericsDaoImp;
import InterFace.PurchaseManagement.PurchaseDao;
import InterFace.PurchaseManagement.PurchaseUpdateDao;
import InterFace.SalesManagement.GenericsDao;
import Model.PurchaseManagement.QuatationDetail_model;
import Model.PurchaseManagement.Quatation_model;

/**
 * Servlet implementation class PurchaseStuff
 */
public class PurchaseStuff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseStuff() {
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
	
		QuatationDetail_model qd=new QuatationDetail_model();
		PurchaseDao pp=new PurchaseDaoImp();
		PurchaseUpdateDao pu=new PurchaseUpdateDaoImp();
		String action=request.getParameter("btnClick");
		System.out.println("--------------------------"+action);
		String tc=request.getParameter("t_c");
		boolean flg=false;
	
	
		String supplier=request.getParameter("supplier");
		String odate=request.getParameter("odate");
		String sref=request.getParameter("sref");
		String eda=request.getParameter("edate");
		
	//	System.out.println("Status===="+status+"========edate"+eda);
		String invoicemethod=request.getParameter("invoice_method");
		String paymentmethod=request.getParameter("payment_method");
		
		System.out.print("===="+supplier+"======="+odate+"====="+sref+"==date=="+eda);
		Quatation_model qm=new Quatation_model();
		GenericsDao<Quatation_model> gdm=new GenericsImp<Quatation_model>();
		GenericsDao<QuatationDetail_model> gd=new GenericsImp<QuatationDetail_model>();
		qm.setSupplier(Integer.parseInt(supplier));
		qm.setOrder_dt(odate);
		
		qm.setSupplier_ref(sref);
		qm.setCreated_by(userid);
		qm.setActiveflag("Y");
		qm.setExpected_dt(eda);
		qm.setPrefix("PO000");
		qm.setT_c(tc);
		qm.setInvoicecontrol(invoicemethod);
		qm.setPaymentterm(paymentmethod);
		
	
		if(!(null==request.getParameter("product[]")))
		{
			String[] pro =request.getParameterValues("product[]");
			String[] item=request.getParameterValues("item[]");
			String[] desc=request.getParameterValues("description[]");
			String[] sdate=request.getParameterValues("s_date[]");
			String[] qty=request.getParameterValues("qnty[]");
			String[] uprice=request.getParameterValues("u_price[]");
			String[] taxes=request.getParameterValues("tax[]");
		
		Double untaxed=0.0;
		Double tax=0.0;
		for(int i=0;i<pro.length;i++)
		{
			Double maintotal=Double.parseDouble(qty[i])* Double.parseDouble(uprice[i]);
			
			untaxed=untaxed+maintotal;
			Double taxcount=((maintotal*Double.parseDouble(taxes[i]))/100);
			tax=tax+taxcount;
		}
		System.out.println("untaxed=========---------"+untaxed);
		System.out.println("taxed=========---------------"+tax);
		
		qm.setUntaxted_amount(untaxed);
		qm.setTaxes(tax);
		Double totalfinal=untaxed+tax;
		
		qm.setTotal(totalfinal);
		}
		

		
		if(action.equalsIgnoreCase("Save"))
		{
			String[] pro =request.getParameterValues("product[]");
		String[] item=request.getParameterValues("item");
		String[] desc=request.getParameterValues("description[]");
		String[] sdate=request.getParameterValues("s_date[]");
		String[] qty=request.getParameterValues("qnty[]");
		String[] uprice=request.getParameterValues("u_price[]");
		String[] taxes=request.getParameterValues("tax[]");
		String[] size=request.getParameterValues("size");

	String status=request.getParameter("status");
			qm.setStatus(status);
			gdm.insertData(qm);
			int laste=pp.lastInc_Id();
			qd.setQuotation_id(laste);
		
			session.setAttribute("qid", laste);
		
			if(!(null==request.getParameter("product[]")))
			{
				for(int i=0;i<pro.length;i++)
				{
					System.out.println("Product====="+pro[i]);
					qd.setProduct(Integer.parseInt(pro[i]));
					System.out.println("Item====="+item[i]);
					qd.setItem(Integer.parseInt(item[i]));
					System.out.println("Description====="+desc[i]);
					qd.setDescription(desc[i]);
					System.out.println("Schedule Date====="+sdate[i]);
					qd.setSchedule_dt(sdate[i]);
					System.out.println("Quantity====="+qty[i]);
					qd.setQuantity(Double.parseDouble(qty[i]));
					System.out.println("Unit Price====="+uprice[i]);
					qd.setUnit_price(Double.parseDouble(uprice[i]));
					System.out.println("Taxes====="+taxes[i]);
					qd.setTaxs(Double.parseDouble(taxes[i]));
		Double maintotal=Double.parseDouble(qty[i])* Double.parseDouble(uprice[i]);
					qd.setSubtotal(maintotal);
					System.out.println("====="+maintotal);
					Double total=maintotal+Integer.parseInt(taxes[i]);
					System.out.println("====="+total);
					qd.setItemsizeid(Integer.parseInt(size[i]));
					
					
					qd.setActiveflag("Y");
			gd.insertData(qd);
				}
				response.sendRedirect("UserController?action=EditQuatations&id="+laste);	
			}
			

		
		
		}
		else if(action.equalsIgnoreCase("Send By Email"))
		{
			String[] pro =request.getParameterValues("product[]");
			String[] item=request.getParameterValues("item");
			String[] desc=request.getParameterValues("description[]");
			String[] sdate=request.getParameterValues("s_date[]");
			String[] qty=request.getParameterValues("qnty[]");
			String[] uprice=request.getParameterValues("u_price[]");
			String[] taxes=request.getParameterValues("tax[]");
			String[] size=request.getParameterValues("size");

			String s="RFQ Sent";
			qm.setStatus(s);
			qm.setCreated_by(userid);
			gdm.insertData(qm);
			int laste=pp.lastInc_Id();
			qd.setQuotation_id(laste);
			
			
		
			if(!(null==request.getParameter("product[]")))
			{
				for(int i=0;i<pro.length;i++)
				{
					System.out.println("Product====="+pro[i]);
					qd.setProduct(Integer.parseInt(pro[i]));
					System.out.println("Item====="+item[i]);
					qd.setItem(Integer.parseInt(item[i]));
					System.out.println("Description====="+desc[i]);
					qd.setDescription(desc[i]);
					System.out.println("Schedule Date====="+sdate[i]);
					qd.setSchedule_dt(sdate[i]);
					System.out.println("Quantity====="+qty[i]);
					qd.setQuantity(Double.parseDouble(qty[i]));
					System.out.println("Unit Price====="+uprice[i]);
					qd.setUnit_price(Double.parseDouble(uprice[i]));
					System.out.println("Taxes====="+taxes[i]);
					qd.setTaxs(Double.parseDouble(taxes[i]));
		Double maintotal=Double.parseDouble(qty[i])* Double.parseDouble(uprice[i]);
					qd.setSubtotal(maintotal);
					System.out.println("====="+maintotal);
					Double total=maintotal+Integer.parseInt(taxes[i]);
					System.out.println("====="+total);
					qd.setItemsizeid(Integer.parseInt(size[i]));
					qd.setActiveflag("Y");
					
			gd.insertData(qd);
				}
			}
			

		response.sendRedirect("UserController?action=EditQuatations&id="+laste);
			
		}
		else if(action.equalsIgnoreCase("Cancel"))
		{
			String[] pro =request.getParameterValues("product[]");
			String[] item=request.getParameterValues("item");
			String[] desc=request.getParameterValues("description[]");
			String[] sdate=request.getParameterValues("s_date[]");
			String[] qty=request.getParameterValues("qnty[]");
			String[] uprice=request.getParameterValues("u_price[]");
			String[] taxes=request.getParameterValues("tax[]");
			String[] size=request.getParameterValues("size");

			String s="Cancelled";
			qm.setStatus(s);
			qm.setCreated_by(userid);
			gdm.insertData(qm);
			int laste=pp.lastInc_Id();
			qd.setQuotation_id(laste);
			qd.setUpdatedby(userid);
			session.setAttribute("qid", laste);
		
			if(!(null==request.getParameter("product[]")))
			{
				for(int i=0;i<pro.length;i++)
				{
					System.out.println("Product====="+pro[i]);
					qd.setProduct(Integer.parseInt(pro[i]));
					System.out.println("Item====="+item[i]);
					qd.setItem(Integer.parseInt(item[i]));
					System.out.println("Description====="+desc[i]);
					qd.setDescription(desc[i]);
					System.out.println("Schedule Date====="+sdate[i]);
					qd.setSchedule_dt(sdate[i]);
					System.out.println("Quantity====="+qty[i]);
					qd.setQuantity(Double.parseDouble(qty[i]));
					System.out.println("Unit Price====="+uprice[i]);
					qd.setUnit_price(Double.parseDouble(uprice[i]));
					System.out.println("Taxes====="+taxes[i]);
					qd.setTaxs(Double.parseDouble(taxes[i]));
		Double maintotal=Double.parseDouble(qty[i])* Double.parseDouble(uprice[i]);
					qd.setSubtotal(maintotal);
					System.out.println("====="+maintotal);
					Double total=maintotal+Integer.parseInt(taxes[i]);
					System.out.println("====="+total);
					qd.setItemsizeid(Integer.parseInt(size[i]));
					qd.setActiveflag("Y");
			gd.insertData(qd);
				}
			}
			response.sendRedirect("UserController?action=EditQuatations&id="+laste);
		}
		else if(action.equalsIgnoreCase("Print"))
		{

			String[] pro =request.getParameterValues("product[]");
			String[] item=request.getParameterValues("item");
			String[] desc=request.getParameterValues("description[]");
			String[] sdate=request.getParameterValues("s_date[]");
			String[] qty=request.getParameterValues("qnty[]");
			String[] uprice=request.getParameterValues("u_price[]");
			String[] taxes=request.getParameterValues("tax[]");
			String[] size=request.getParameterValues("size");

			String s="RFQ Sent";
			qm.setStatus(s);
			qm.setCreated_by(userid);
			gdm.insertData(qm);
			int laste=pp.lastInc_Id();
			qd.setQuotation_id(laste);
			qd.setUpdatedby(userid);
			session.setAttribute("qid", laste);
		
			if(!(null==request.getParameter("product[]")))
			{
				for(int i=0;i<pro.length;i++)
				{
					System.out.println("Product====="+pro[i]);
					qd.setProduct(Integer.parseInt(pro[i]));
					System.out.println("Item====="+item[i]);
					qd.setItem(Integer.parseInt(item[i]));
					System.out.println("Description====="+desc[i]);
					qd.setDescription(desc[i]);
					System.out.println("Schedule Date====="+sdate[i]);
					qd.setSchedule_dt(sdate[i]);
					System.out.println("Quantity====="+qty[i]);
					qd.setQuantity(Double.parseDouble(qty[i]));
					System.out.println("Unit Price====="+uprice[i]);
					qd.setUnit_price(Double.parseDouble(uprice[i]));
					System.out.println("Taxes====="+taxes[i]);
					qd.setTaxs(Double.parseDouble(taxes[i]));
		Double maintotal=Double.parseDouble(qty[i])* Double.parseDouble(uprice[i]);
					qd.setSubtotal(maintotal);
					System.out.println("====="+maintotal);
					Double total=maintotal+Integer.parseInt(taxes[i]);
					System.out.println("====="+total);
					qd.setItemsizeid(Integer.parseInt(size[i]));
					qd.setActiveflag("Y");
			gd.insertData(qd);
				}
			}
			response.sendRedirect("UserController?action=EditQuatations&id="+laste);
		}
		
	}

}
