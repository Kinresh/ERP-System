package Controller.SalesManagement;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.Salesmanagement.SalesDaoImp;

import Dao.Salesmanagement.GenericsImp;
import InterFace.SalesManagement.SalesDao;

import InterFace.SalesManagement.GenericsDao;


import Model.SalesManagement.QuatationSaleDetail_model;
import Model.SalesManagement.QuatationSale_model;

/**
 * Servlet implementation class SalesStuff
 */
public class SalesStuff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalesStuff() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		int userid=(Integer) session.getAttribute("id1");
	
		QuatationSaleDetail_model qd=new QuatationSaleDetail_model();
		SalesDao pp=new SalesDaoImp();
		
		String action=request.getParameter("btnClick");
		System.out.println("--------------------------"+action);
		String tc=request.getParameter("t_c");
		boolean flg=false;
	
	
		String supplier=request.getParameter("supplier");
		String oda=request.getParameter("odate");
		String sref=request.getParameter("sref");
		String eda=request.getParameter("edate");
		
	//	System.out.println("Status===="+status+"========edate"+eda);
		
		String shippingmethod=request.getParameter("shippingmethod");
	String paymentmethod=request.getParameter("payment_method");
		
		String createinvoice=request.getParameter("createinvoice");
		
		System.out.println("=ssds==="+shippingmethod+"====sfsdf==="+paymentmethod+"=dfd===="+createinvoice+"==date=="+eda);
		
		QuatationSale_model qm=new QuatationSale_model();
		GenericsDao<QuatationSale_model> gdm=new GenericsImp<QuatationSale_model>();
		GenericsDao<QuatationSaleDetail_model> gd=new GenericsImp<QuatationSaleDetail_model>();
		qm.setCustomer(Integer.parseInt(supplier));
		qm.setOrder_dt(oda);
		qm.setCreateinvoice(createinvoice);
		qm.setCustomer_ref(sref);
		qm.setCreated_by(userid);
		qm.setActiveflag("Y");
		qm.setExpected_dt(eda);
		qm.setPrefix("SO000");
		qm.setT_c(tc);
		qm.setShippingmethod(shippingmethod);
		
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
			int res=Integer.parseInt(request.getParameter("responsible"));
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
			qm.setResponsible(res);
			gdm.insertData(qm);
			int laste=pp.lastInc_Id();
			qd.setQuotationsale_id(laste);
		
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
			response.sendRedirect("UserController?action=EditSaleQuatation&id="+laste);

		
		
		}
		else if(action.equalsIgnoreCase("Send By Email"))
		{
			System.out.println("sfsdgsdgsg");
			

			String s="RFQ Sent";
			qm.setStatus(s);
			gdm.insertData(qm);
			String[] pro =request.getParameterValues("product[]");
			String[] item=request.getParameterValues("item");
			String[] desc=request.getParameterValues("description[]");
			String[] sdate=request.getParameterValues("s_date[]");
			String[] qty=request.getParameterValues("qnty[]");
			String[] uprice=request.getParameterValues("u_price[]");
			String[] taxes=request.getParameterValues("tax[]");
			String[] size=request.getParameterValues("size");
			int laste=pp.lastInc_Id();
			qd.setQuotationsale_id(laste);
			
			
		
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
			

		response.sendRedirect("UserController?action=EditSaleQuatation&id="+laste);
			
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
			gdm.insertData(qm);
			int laste=pp.lastInc_Id();
			qd.setQuotationsale_id(laste);
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
			response.sendRedirect("UserController?action=EditSaleQuatation&id="+laste);
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
			gdm.insertData(qm);
			int laste=pp.lastInc_Id();
			qd.setQuotationsale_id(laste);
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
			response.sendRedirect("UserController?action=EditSaleQuatation&id="+laste);
		}
		
	}

}
