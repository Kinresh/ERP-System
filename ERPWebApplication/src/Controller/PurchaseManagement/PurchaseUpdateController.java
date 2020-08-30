package Controller.PurchaseManagement;

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
import Dao.Salesmanagement.GenericsImp;
import Dao.Salesmanagement.UpdateInsertDaoImp;
import InterFace.PurchaseManagement.PurchaseDao;
import InterFace.PurchaseManagement.PurchaseUpdateDao;
import InterFace.SalesManagement.GenericsDao;
import InterFace.SalesManagement.UpdateInsertDao;
import Model.PurchaseManagement.Item_Size_model;
import Model.PurchaseManagement.Item_model;
import Model.PurchaseManagement.Product_model;
import Model.PurchaseManagement.QuatationDetail_model;
import Model.PurchaseManagement.Quatation_model;
import Model.PurchaseManagement.Supplier_model;
import Util.DeleteItem;
import Util.DeleteProduct;
import Util.Deletetable;

/**
 * Servlet implementation class PurchaseUpdateController
 */
public class PurchaseUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseUpdateController() {
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
		String action=request.getParameter("hid");
		String action2=request.getParameter("hid2");
		
		HttpSession ses=request.getSession();
		int userid=(Integer) ses.getAttribute("id1");
		String pid=request.getParameter("prodid");
		if(action.equalsIgnoreCase("EditProduct"))
		{
			System.out.print("hiiiiiii");
			
			System.out.print("hiiiiiiiiiiiiiiiiii");
			 String pcategory=request.getParameter("prodcategory");
				String product=request.getParameter("product");
				String ptype=request.getParameter("prodtype");
				System.out.print("7777777777"+ptype);
				String description=request.getParameter("description");
				Product_model sc= new Product_model();
				sc.setProductCategory(pcategory);
				PurchaseDao pp=new PurchaseDaoImp();
				int pcid=pp.getProductCategoryid(pcategory);
				sc.setProd_categoryid(pcid);
				sc.setProduct(product);
				sc.setProductType(ptype);
				sc.setDescription(description);
				sc.setUpdated_by(userid);
				sc.setProductid(Integer.parseInt(pid));
				PurchaseUpdateDao upsc=new PurchaseUpdateDaoImp();
				boolean flg=upsc.updateProductData(sc);
				if(flg)
				{
					System.out.print("SuccessFully Updated");
					
					
				}
				else
				{
					System.out.print("SuccessFully not Updated");
				}
				response.sendRedirect("UserController?action=ViewProduct&id="+pid);
		}
		if(action.equalsIgnoreCase("D"))
		{
			System.out.print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&Enter");
		 	String id=request.getParameter("cid");
			System.out.print("id----------------------------------"+id);
			PurchaseUpdateDao a=new PurchaseUpdateDaoImp();
			a.updateActiveFlag(Integer.parseInt(id));
			DeleteProduct d=new DeleteProduct();
			
			d.deleteprod(Integer.parseInt(id));
			response.sendRedirect("UserController?action=Products");
			
			
		}
		if(action.equalsIgnoreCase("Add"))
		{
			System.out.print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&Enter");
			Item_Size_model is=new Item_Size_model();
			String id=request.getParameter("iid");
			String itemid=request.getParameter("itemid");
			String size=request.getParameter("size");
			is.setItemid(Integer.parseInt(itemid));
			is.setSize(size);
			
			PurchaseUpdateDao upsc=new PurchaseUpdateDaoImp();
			boolean flg=upsc.updateItemSize(is);
			if(flg)
			{
				System.out.print("SuccessFully Updated");
				
				
			}
			else
			{
				System.out.print("SuccessFully not Updated");
			}
			response.sendRedirect("NewHome.jsp?p=EditItem&id="+id);
		}
		if(action.equalsIgnoreCase("EditItem"))
		{
			System.out.print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&Enter");
			String id=request.getParameter("iid");
			 String pcategory=request.getParameter("prodcategory");
				String product=request.getParameter("product");
				String ptype=request.getParameter("prodtype");
				String item=request.getParameter("item");
				System.out.print("7777777777"+ptype);
				String description=request.getParameter("description");
				Item_model sc= new Item_model();
				sc.setProductType(ptype);
				PurchaseDao pp=new PurchaseDaoImp();
				int pcid=pp.getProductCategoryid(pcategory);
				sc.setProd_categoryid(pcid);
				sc.setProductCategory(pcategory);
				List<Product_model> pl=pp.viewProductInfo(Integer.parseInt(product));
				sc.setProductid(Integer.parseInt(product));
				sc.setProduct(pl.get(0).getProduct());
				sc.setItem(item);
				sc.setItemid(Integer.parseInt(id));
				sc.setDescription(description);
				sc.setUpdated_by(userid);
				
				PurchaseUpdateDao upsc=new PurchaseUpdateDaoImp();
				boolean flg=upsc.updateItemData(sc);
				if(flg)
				{
					System.out.print("SuccessFully Updated");
					
					
				}
				else
				{
					System.out.print("SuccessFully not Updated");
				}
				response.sendRedirect("NewHome.jsp?p=ViewItem&id="+id);
		}
		if(action.equalsIgnoreCase("DeleteItem"))
		{
			System.out.print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&Enter");
		 	String id=request.getParameter("cid");
			System.out.print("id----------------------------------"+id);
			PurchaseUpdateDao a=new PurchaseUpdateDaoImp();
			a.updateActiveFlagItem(Integer.parseInt(id));
			DeleteItem d=new DeleteItem();
			d.deleteItem(Integer.parseInt(id));
			response.sendRedirect("UserController?action=Items");
			
			
		}
		if(action.equalsIgnoreCase("EditSupplier"))
		{
			System.out.print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&Enter");
			String sup_name=request.getParameter("sup_name");
			String e_name=request.getParameter("e_name");
			String website=request.getParameter("website");
			String phn_no=request.getParameter("phn_no");
			String fax=request.getParameter("fax");
			String m_no1=request.getParameter("m_no1");
			String m_no2=request.getParameter("m_no2");
			
			String address=request.getParameter("address");
			String country=request.getParameter("country");
			String state=request.getParameter("state");
			String city=request.getParameter("city");
			String title_field=request.getParameter("title_field");
			
			
			String description=request.getParameter("description");
			String edit_id=request.getParameter("edit_id");
			Supplier_model cu=new Supplier_model();
			cu.setUpdated_by(userid);
			cu.setSuppliername(sup_name);
			cu.setEmailid(e_name);
			cu.setWebsite(website);
			cu.setPhone(phn_no);
			cu.setFaxno(fax);
			cu.setMobile1(m_no1);
			cu.setMobile2(m_no2);
			cu.setSupptitleid(Integer.parseInt(title_field));
			cu.setUpdated_by(userid);
			cu.setAddress(address);
			cu.setCid(Integer.parseInt(country));
			cu.setSid(Integer.parseInt(state));
			cu.setCityid(Integer.parseInt(city));
			cu.setSupplierid(Integer.parseInt(edit_id));
			cu.setDescription(description);
			PurchaseDao pd=new PurchaseDaoImp();
			ArrayList<Supplier_model> old_lst=pd.viewSupplierInfo(Integer.parseInt(edit_id));
			String iscompany=old_lst.get(0).getIs_company();
			if(iscompany.equalsIgnoreCase("Y")){
				String company_field=request.getParameter("company_field");
				String job_position=request.getParameter("job_position");
				
				cu.setSuppcompanyid(Integer.parseInt(company_field));
				cu.setJobposition(job_position);
				
				
			}else{
				cu.setSuppcompanyid(0);
				cu.setJobposition(" ");
			
				
			}
			PurchaseUpdateDao pdo=new PurchaseUpdateDaoImp();
			boolean flag=pdo.updateSupplier(cu);
			if(flag)
				response.sendRedirect("UserController?action=ViewSupplier&id="+edit_id);
			
		}
		if(action.equalsIgnoreCase("DeleteSupplier"))
		{
			System.out.print("-------------------------Enter");
		 	String id=request.getParameter("cid");
			System.out.print("id----------------------------------"+id);
			PurchaseUpdateDao a=new PurchaseUpdateDaoImp();
			
			a.updateActiveFlagSupplier(Integer.parseInt(id));
			response.sendRedirect("UserController?action=Suppliers");
			
			
		}
		
		if(action.equalsIgnoreCase("Update Quotation"))
		{
			String supplier=request.getParameter("supplier");
			String sref=request.getParameter("sref");
			String odate=request.getParameter("odate");
			String edate=request.getParameter("edate");
			String status=request.getParameter("status");
			String t_c=request.getParameter("t_c");
			String rowC=request.getParameter("rowC");
			String e_id=request.getParameter("e_id");
			double u_tax_total=0.00;
			double total_tax=0.00;
			double total=0.00;
			PurchaseDao pd=new PurchaseDaoImp();
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
			//insert data to quotation
			Quatation_model pq=new Quatation_model();
			pq.setSupplier(Integer.parseInt(supplier));
			pq.setSupplier_ref(sref);
			pq.setOrder_dt(odate);
			pq.setExpected_dt(edate);
			pq.setStatus(status);
			pq.setT_c(t_c);
			pq.setUpdated_by(userid);
			pq.setUntaxted_amount(u_tax_total);
			pq.setTaxes(total_tax);
			pq.setTotal(total);
			pq.setQuotation_id(Integer.parseInt(e_id));
			PurchaseUpdateDao pdu=new PurchaseUpdateDaoImp();
			boolean f_flag=pdu.updateQuotation(pq);
			if(f_flag){
				ArrayList<QuatationDetail_model> qd_list=pd.viewQuatationDetailInfo(Integer.parseInt(e_id));
				if(!qd_list.isEmpty()){
					boolean flg=pdu.deleteQ_Detail(Integer.parseInt(e_id));
					
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
				
				ArrayList<QuatationDetail_model> list=new ArrayList<QuatationDetail_model>();
				
				for(int i=0;i<product.length;i++){
					System.out.println("size"+size[i]);
					QuatationDetail_model qd=new QuatationDetail_model();
					qd.setProduct(Integer.parseInt(product[i]));
					qd.setItem(Integer.parseInt(item[i]));
					qd.setItemsizeid(Integer.parseInt(size[i]));
					qd.setDescription(desc[i]);
					qd.setSchedule_dt(s_date[i]);
					qd.setQuantity(Double.parseDouble(qnty[i]));
					qd.setUnit_price(Double.parseDouble(u_price[i]));
					qd.setTaxs(Double.parseDouble(tax[i]));
					qd.setQuotation_id(Integer.parseInt(e_id));
					qd.setUpdatedby(userid);
					qd.setActiveflag("Y");
					qd.setSubtotal((Double.parseDouble(qnty[i]))*(Double.parseDouble(u_price[i])));
					list.add(qd);
				}
				boolean flag=pd.InsQ_Detail(list);
			
					
				}
				response.sendRedirect("UserController?action=ViewQuatation&id="+e_id);
			}
			
		}
		
	}
	
}
