package Controller.PurchaseManagement;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.PurchaseManagement.PurchaseDaoImp;
import Dao.Salesmanagement.GenericsImp;
import Dao.Salesmanagement.UpdateInsertDaoImp;
import InterFace.PurchaseManagement.PurchaseDao;
import InterFace.SalesManagement.GenericsDao;
import InterFace.SalesManagement.UpdateInsertDao;
import Model.PurchaseManagement.Item_Size_model;
import Model.PurchaseManagement.Item_model;
import Model.PurchaseManagement.ProductCategory_model;
import Model.PurchaseManagement.Product_model;
import Model.PurchaseManagement.SuppCompany_model;
import Model.PurchaseManagement.SuppTitle_model;
import Model.PurchaseManagement.Supplier_model;
import Model.SalesManagement.Title_model;
import Model.SalesManagement.company_model;
import Model.SalesManagement.customer_model;
import Model.SalesManagement.logged_call_model;

/**
 * Servlet implementation class PurchaseController
 */
public class PurchaseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseController() {
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
		System.out.print("hiddd---------------------"+action);
		HttpSession ses=request.getSession();
		int userid=(Integer) ses.getAttribute("id1");
		HttpSession session=request.getSession();
		
		if(action.equalsIgnoreCase("Addcategory"))
		{
			
			boolean check=false;
			String type=request.getParameter("producttype");
			String prodcategory=request.getParameter("productcategory");
			String description=request.getParameter("description");
			System.out.println("type="+type+"category"+prodcategory+"description"+description);
			ProductCategory_model co= new ProductCategory_model();
			GenericsDao<ProductCategory_model> gen_ctry=new GenericsImp<ProductCategory_model>();
			List<ProductCategory_model> c_list=gen_ctry.viewData(co);
			if(c_list!=null)
			{
			
			for(int i=0;i<c_list.size();i++){
				if(c_list.get(i).getProduct_category().equalsIgnoreCase(prodcategory)){
					check=true;
					break;
				}
			}
			}
			
			if(!check){
				ProductCategory_model co1= new ProductCategory_model();
				co1.setProduct_type(type);
				co1.setProduct_category(prodcategory);
				co1.setDescription(description);
				co1.setCreated_by(userid);
				co1.setActive_flag("Y");
				GenericsDao<ProductCategory_model> gen=new GenericsImp<ProductCategory_model>();
				boolean flg=gen.insertdetail(co1);
				if(flg)
				{
					System.out.println("Data Inserted");
				
				}
			}
			
			
	}
		else if(action.equalsIgnoreCase("Addproduct"))
		{
			System.out.print("Hiiiiii---------------------");
			boolean checkval=false;
			String categoryid=request.getParameter("prodcategotyid");
			String product=request.getParameter("product");
			String desc=request.getParameter("description");
			System.out.println("id="+categoryid+"category"+product+"description"+desc);
			Product_model p= new Product_model();
			GenericsDao<Product_model> gen=new GenericsImp<Product_model>();
			List<Product_model> p_list=gen.viewData(p);
			if(p_list!=null)
			{
			
			for(int i=0;i<p_list.size();i++)
			{
				if(p_list.get(i).getProduct().equalsIgnoreCase(product))
				{
					checkval=true;
					break;
				}
			}
			}
			
			if(!checkval)
			{
				PurchaseDao v_cat=new PurchaseDaoImp();
				GenericsDao<Product_model> gen2=new GenericsImp<Product_model>();
				Product_model pro= new Product_model();
				pro.setProduct(product);
				pro.setProd_categoryid(Integer.parseInt(categoryid));
				String type=v_cat.getProductType(Integer.parseInt(categoryid));
				pro.setProductType(type);
				pro.setDescription(desc);
				pro.setCreated_by(userid);
				pro.setActive_flag("Y");
				
				String categoryname=v_cat.getProductCategory(Integer.parseInt(categoryid));
				pro.setProductCategory(categoryname);
				boolean flg=gen2.insertdetail(pro);
				if(flg)
					System.out.println("Data Inserted");
			}
			
			response.sendRedirect("UserController?action=ViewProduct&id="+categoryid);
			}
		else if(action.equalsIgnoreCase("AddItem"))
		{
			System.out.println("============AddItem===========");
			boolean checkval=false;
			String product=request.getParameter("productid");
			String item=request.getParameter("item");
			String desc=request.getParameter("description");
			
			Item_model p= new Item_model();
			GenericsDao<Item_model> gen=new GenericsImp<Item_model>();
			List<Item_model> p_list=gen.viewData(p);
			if(p_list!=null)
			{
			
			for(int i=0;i<p_list.size();i++)
			{
				if(p_list.get(i).getItemid()==(Integer.parseInt(product)) && (p_list.get(i).getItem().equalsIgnoreCase(item))  )
				{
					checkval=true;
					break;
				}
			}
			}
			
			if(!checkval)
			{
				PurchaseDao v_cat=new PurchaseDaoImp();
				GenericsDao<Item_model> gen2=new GenericsImp<Item_model>();
				Item_model pro= new Item_model();
				
				pro.setProductid(Integer.parseInt(product));
				pro.setItem(item);
				pro.setDescription(desc);
				String prodcategory=v_cat.getProductCategory(Integer.parseInt(product));
				
				String prodtype=v_cat.getProductType(Integer.parseInt(product));
				String productbyid=v_cat.getProduct(Integer.parseInt(product));
				int prodcategoryid=v_cat.getProductCategoryid(Integer.parseInt(product));
				pro.setProductCategory(prodcategory);
				pro.setProd_categoryid(prodcategoryid);
				pro.setProductType(prodtype);
				pro.setProduct(productbyid);
				pro.setCreated_by(userid);
				pro.setActive_flag("Y");
				
				boolean flg=gen2.insertdetail(pro);
				if(flg)
				{
					System.out.println("Data Inserted");
				}
			}
			
			response.sendRedirect("UserController?action=Items");
			
		
			
		}
		else if(action.equalsIgnoreCase("Add"))
		{
				System.out.print("Hiiiiiiiiii");
				String size=request.getParameter("size");
				String item=request.getParameter("itemid");
				
				Item_Size_model is=new Item_Size_model();
				boolean checkval=false;
				Item_Size_model p= new Item_Size_model();
				GenericsDao<Item_Size_model> gen=new GenericsImp<Item_Size_model>();
				List<Item_Size_model> p_list=gen.viewData(p);
				if(p_list!=null)
				{
				
				for(int i=0;i<p_list.size();i++)
				{
					if(p_list.get(i).getItemid()==(Integer.parseInt(item)) && (p_list.get(i).getSize().equalsIgnoreCase(size)))
					{
						checkval=true;
						break;
					}
				}
				}
				
				if(!checkval)
				{
					PurchaseDao v_cat=new PurchaseDaoImp();
					GenericsDao<Item_Size_model> gen2=new GenericsImp<Item_Size_model>();
					Item_Size_model pro= new Item_Size_model();
					pro.setItemid(Integer.parseInt(item));
					pro.setSize(size);
					PurchaseDao pp=new PurchaseDaoImp();
					List<Item_model> ii=pp.viewItemInfo(Integer.parseInt(item));
					pro.setItem(ii.get(0).getItem());
					pro.setProductType("Stockable");
					pro.setCreated_by(userid);
					pro.setActive_flag("Y");
					boolean flg=gen2.insertdetail(pro);
					if(flg)
						System.out.println("Data Inserted");
				}
				
				response.sendRedirect("UserController?action=Items");
				
		}	
		else if(action.equalsIgnoreCase("AddSupplier"))
		{
			System.out.print("Hiiiiiiiiii");
			
			Supplier_model com1=new Supplier_model();
						
						Supplier_model com2=new Supplier_model();
						String checkvalue=request.getParameter("check");
						if(checkvalue==null){
							String title=request.getParameter("ti");
							System.out.print("not checked");
							com2.setSuppcompanyid(0);
						
							com2.setSupptitleid(Integer.parseInt(title));
							com2.setIs_company("N");
							com2.setJobposition("");
						
							
						}			
						else{
							String job_position=request.getParameter("jobposition");
							String company=request.getParameter("company");
							String title_field=request.getParameter("ti");
							int ti=Integer.parseInt(title_field);
							int comp=Integer.parseInt(company);
							com2.setSuppcompanyid(comp);
							com2.setJobposition(job_position);
							com2.setSupptitleid(ti);
							com2.setIs_company("Y");
						}
						GenericsDao<Supplier_model> gen=new GenericsImp<Supplier_model>();
						String customer=request.getParameter("supplier");
						
						String email=request.getParameter("email");
						String address=request.getParameter("address");
						
						String country=request.getParameter("country");
						String zip=request.getParameter("zip");
						String faxno=request.getParameter("faxno");
						String state=request.getParameter("state");
						String city=request.getParameter("city");
						String mobile1=request.getParameter("mobile1");
						String phn=request.getParameter("phn");
						String mobile2=request.getParameter("mobile2");
						String website=request.getParameter("website");
						String description=request.getParameter("description");
						com2.setSuppliername(customer);
						com2.setCid(Integer.parseInt(country));
						com2.setSid(Integer.parseInt(state));
						com2.setCityid(Integer.parseInt(city));
						com2.setFaxno(faxno);
						com2.setZip(zip);
						com2.setAddress(address);
						com2.setMobile1(mobile1);
						com2.setMobile2(mobile2);
						com2.setDescription(description);
						com2.setEmailid(email);
						com2.setWebsite(website);
						com2.setCreated_by(userid);
						com2.setStatus(0);
						com2.setPhone(phn);
						com2.setActive_flag("y");
						List<Supplier_model> ll=gen.viewData(com1);
						
						if(!ll.isEmpty())
						{
						
					
						for(Supplier_model c:ll)
						{
							System.out.print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"+c.getSuppliername());
							
								if(c.getSuppliername().equalsIgnoreCase(customer))
								{
									if(c.getEmailid().equalsIgnoreCase(email) )
									{
								System.out.println("--------Already Exit-----------");
								break;
									}
								break;
							}
							else
							{
								
								gen.insertData(com2);
								
							break;
							}
						}
						}
						else
						{
						gen.insertData(com2);
					
						}
						
						response.sendRedirect("UserController?action=Suppliers");			
							
		}
		else if(action.equalsIgnoreCase("title"))
		{
			SuppTitle_model t1=new SuppTitle_model();
			String titlename=request.getParameter("title");
			GenericsDao<SuppTitle_model> gg=new GenericsImp<SuppTitle_model>();
			t1.setTitle(titlename);
			gg.insertData(t1);
		}
		else if(action.equalsIgnoreCase("AddSuppCompany"))
		{
System.out.print("Hiiiiiiiiii");
			
			SuppCompany_model com1=new SuppCompany_model();
						
			SuppCompany_model com2=new SuppCompany_model();
						GenericsDao<SuppCompany_model> gen=new GenericsImp<SuppCompany_model>();
						String company=request.getParameter("company");
						String phone=request.getParameter("phn");
						String email=request.getParameter("email");
						String address=request.getParameter("address");
						
						String country=request.getParameter("country");
						String zip=request.getParameter("zip");
						String faxno=request.getParameter("faxno");
						String state=request.getParameter("state");
						String city=request.getParameter("city");
						String mobile1=request.getParameter("mobile1");
						String mobile2=request.getParameter("mobile2");
						String website=request.getParameter("website");
						String description=request.getParameter("description");
						com2.setCompanyname(company);
						
						com2.setPhone(phone);
						com2.setCid(Integer.parseInt(country));
						com2.setSid(Integer.parseInt(state));
						com2.setCityid(Integer.parseInt(city));
						com2.setFax_no(faxno);
						com2.setZip(zip);
						com2.setAddress(address);
						com2.setMobile1(mobile1);
						com2.setMobile2(mobile2);
						com2.setDescription(description);
						com2.setEmailid(email);
						com2.setWebsite(website);
						com2.setCreated_by(userid);
						String acv="y";
						com2.setActive_flag(acv);
						List<SuppCompany_model> ll=gen.viewData(com1);
						
						if(!ll.isEmpty())
						{
						
					
						

					
						for(SuppCompany_model c:ll)
						{
							System.out.print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"+c.getCompanyname());
							if((c.getCompanyname().equals(company) && c.getEmailid().equals(email)) || c.getEmailid().equals(email) )
							{
								
								System.out.print("Already Exit");
								break;
							}
							else
							{
								
								gen.insertData(com2);
								
							break;
							}
						}
						}
						else
						{
						gen.insertData(com2);
					
						}
						response.sendRedirect("UserController?action=Customer");
		}
		
		
		
	}
}
	

