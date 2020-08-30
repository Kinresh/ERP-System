package Controller.SalesManagement;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.PurchaseManagement.PurchaseDaoImp;
import Dao.PurchaseManagement.PurchaseUpdateDaoImp;
import Dao.Salesmanagement.GenericsDaoImp;
import Dao.Salesmanagement.SalesDaoImp;
import Dao.Salesmanagement.UpdateInsertDaoImp;
import InterFace.PurchaseManagement.PurchaseDao;
import InterFace.PurchaseManagement.PurchaseUpdateDao;
import InterFace.SalesManagement.GenericsDao;
import InterFace.SalesManagement.SalesDao;
import InterFace.SalesManagement.UpdateInsertDao;
import Model.PurchaseManagement.IncomingProduct_model;
import Model.PurchaseManagement.IncomingShippment_model;
import Model.PurchaseManagement.QuatationDetail_model;
import Model.PurchaseManagement.Quatation_model;
import Model.SalesManagement.QuatationSaleDetail_model;
import Model.SalesManagement.QuatationSale_model;
import Model.Warehouse.delivaryorders_model;
import Model.Warehouse.delivaryproducts_model;

/**
 * Servlet implementation class SalesUpdateController
 */
public class SalesUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalesUpdateController() {
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
		String action=request.getParameter("hid");
		System.out.println("===================Action"+action);
		HttpSession ses=request.getSession();
		int userid=(Integer) ses.getAttribute("id1");
		if(action.equalsIgnoreCase("Update Quotation"))
		{
			String customer=request.getParameter("customer");
			String cref=request.getParameter("cref");
			String date=request.getParameter("odate");
			String sperson=request.getParameter("sperson");
			String pterm=request.getParameter("pterm");
			String spolicy=request.getParameter("spolicy");
			String cinvoice=request.getParameter("cinvoice");
			String t_c=request.getParameter("t_c");
			String e_id=request.getParameter("e_id");
			double u_tax_total=0.00;
			double total_tax=0.00;
			double total=0.00;
			UpdateInsertDao su=new UpdateInsertDaoImp();
			SalesDao sd=new SalesDaoImp();
			 
			if(!(null==request.getParameter("product")))
			{
				String[] product=request.getParameterValues("product");
				
				String[] qnty=request.getParameterValues("qnty");
				String[] u_price=request.getParameterValues("u_price");
				String[] tax=request.getParameterValues("tax");
				for(int i=0;i<product.length;i++){
					double subtotal=(Double.parseDouble(qnty[i]))*(Double.parseDouble(u_price[i]));
					double item_tax=(subtotal*Double.parseDouble(tax[i]))/100;
					u_tax_total += subtotal;
					total_tax += item_tax;
					
				}
				 total=u_tax_total+total_tax;
			}
			
			QuatationSale_model sq=new QuatationSale_model();
			sq.setCustomer(Integer.parseInt(customer));
			sq.setCustomer_ref(cref);
			sq.setOrder_dt(date);
			sq.setResponsible(Integer.parseInt(sperson));
			sq.setPaymentterm(pterm);
			sq.setShippingmethod(spolicy);
			sq.setCreateinvoice(cinvoice);
			sq.setT_c(t_c);
			sq.setUntaxted_amount(u_tax_total);
			sq.setTaxes(total_tax);
			sq.setTotal(total);
			sq.setUpdated_by(userid);
			sq.setQuotationsale_id(Integer.parseInt(e_id));
			boolean flag=su.updateSalesQuotation(sq);
			if(flag){
				ArrayList<QuatationSaleDetail_model> qd_list=sd.viewQuatationSaleDetailInfo(Integer.parseInt(e_id));
				if(!qd_list.isEmpty()){
					boolean flg=su.deleteQuotationDtail(Integer.parseInt(e_id));
					
				}
				
				if(!(null==request.getParameter("product")))
				{
				
				
				String[] product=request.getParameterValues("product");
				String[] desc=request.getParameterValues("description");
				String[] item=request.getParameterValues("item");
				String[] size=request.getParameterValues("size");
				String[] s_date=request.getParameterValues("s_date");
				String[] qnty=request.getParameterValues("qnty");
				String[] u_price=request.getParameterValues("u_price");
				String[] tax=request.getParameterValues("tax");
				
				ArrayList<QuatationSaleDetail_model> list=new ArrayList<QuatationSaleDetail_model>();
				
				for(int i=0;i<product.length;i++){
					System.out.println("size"+size[i]);
					QuatationSaleDetail_model qd=new QuatationSaleDetail_model();
					qd.setProduct(Integer.parseInt(product[i]));
					qd.setItem(Integer.parseInt(item[i]));
					qd.setItemsizeid(Integer.parseInt(size[i]));
					qd.setDescription(desc[i]);
					qd.setSchedule_dt(s_date[i]);
					qd.setQuantity(Double.parseDouble(qnty[i]));
					qd.setUnit_price(Double.parseDouble(u_price[i]));
					qd.setTaxs(Double.parseDouble(tax[i]));
					qd.setQuotationsale_id(Integer.parseInt(e_id));
					qd.setSubtotal((Double.parseDouble(qnty[i]))*(Double.parseDouble(u_price[i])));
					list.add(qd);
				}
				boolean s_flag=sd.insQuotationDetail(list);
			
					response.sendRedirect("UserController?action=ViewSaleQuatation&id="+e_id);
				
				}
			}
		}

	else if(action.equalsIgnoreCase("Check Availability"))
	{
		System.out.println("hii Check Availability");
		String deloid=request.getParameter("sid");
		String saleid=request.getParameter("s_id");
		System.out.println("SaleId=========================="+saleid);
		UpdateInsertDao pdu=new UpdateInsertDaoImp();
		
		delivaryorders_model  pq=new delivaryorders_model();
		pq.setStatus("Ready to Receive");
		pq.setDelivaryorder_id(Integer.parseInt(deloid));
		pq.setUpdated_by(userid);
		pdu.updateStatusDelivaryOrder(pq);
		delivaryproducts_model  pd=new delivaryproducts_model();
		pd.setStatus("Available");
		pd.setDelivaryorder_id(Integer.parseInt(deloid));
		pd.setUpdated_by(userid);
		pdu.updateStatusDelivaryProduct(pd);
		response.sendRedirect("UserController?action=CheckAvailability&saleid="+saleid);
			
		
	}
	else if(action.equalsIgnoreCase("Deliver"))
	{
		System.out.println("Deliver");
	
		String deloid=request.getParameter("sid");
	String saleid=request.getParameter("sid");
	
		int sale_id=Integer.parseInt(saleid);
		System.out.println("SaleId=========================="+sale_id);
		List<delivaryproducts_model> ipl=(List<delivaryproducts_model>) ses.getAttribute("qtylist");
		UpdateInsertDao pdu=new UpdateInsertDaoImp();
		SalesDao s1=new SalesDaoImp();
		String[] dt=request.getParameterValues("qnty");
		delivaryorders_model  pq=new delivaryorders_model();
		List<delivaryproducts_model> lq=s1.viewDelivaryProductInfo(Integer.parseInt(deloid));
		List<delivaryorders_model> lsl=s1.viewDelivaryOrderInfobyoid(Integer.parseInt(deloid));
		for(int j=0;j<ipl.size();j++)
		{
			int prodid=ipl.get(j).getDelivaryproduct_id();
				
			double qnt=lq.get(j).getQuantity();
			System.out.println("=========OldQty===>>>>"+qnt);
			
			System.out.println("============NewQty===>>>>"+dt[j]);
			if(Double.parseDouble(dt[j])==qnt)
			{
				System.out.println("hiiiiii Equal====");
				delivaryproducts_model  pd=new delivaryproducts_model();
				pd.setStatus("Done");
				pd.setDelivaryorder_id(Integer.parseInt(deloid));
				pd.setUpdated_by(userid);
				pdu.updateStatusDelivaryProduct(pd);
                                pq.setStatus("Delivered");
		pq.setDelivaryorder_id(Integer.parseInt(deloid));
		pq.setUpdated_by(userid);
		pdu.updateStatusDelivaryOrder(pq);
			}
                        else if(Double.parseDouble(dt[j])<qnt){
                            double ans=qnt-Double.parseDouble(dt[j]);
                            System.out.println("hoooooo "+ans+" "+Double.parseDouble(dt[j]));
                            	delivaryproducts_model  pd=new delivaryproducts_model();
                                pd.setQuantity(Double.parseDouble(dt[j]));
				pd.setStatus("Done");
				pd.setDelivaryorder_id(Integer.parseInt(deloid));
				pd.setUpdated_by(userid);
				pd.setQuantity(Double.parseDouble(dt[j]));
                                pdu.updateStatusDelivaryProduct(pd);
                                
                                pd.setQuantity(ans);
                                pd.setStatus("Available");
                                pd.setDelivaryorder_id(Integer.parseInt(deloid));
				pd.setCreated_by(userid);
                                pd.setActiveflag("Y");
                                
                                GenericsDao<delivaryproducts_model> gd=new GenericsDaoImp<>();
                                gd.insertData(pd);
                                
                                pq.setActiveflag("Y");
                                pq.setStatus("Delivered");
		pq.setDelivaryorder_id(Integer.parseInt(deloid));
		pq.setCreated_by(userid);
		                GenericsDao<delivaryorders_model> gd2=new GenericsDaoImp<>();
                                gd2.insertData(pq);
                        }
		}
		
		
		response.sendRedirect("UserController?action=CheckAvailability&saleid="+sale_id);
	}

}
}
