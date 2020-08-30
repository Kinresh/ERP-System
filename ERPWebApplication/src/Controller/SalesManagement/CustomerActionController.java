package Controller.SalesManagement;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.Salesmanagement.GenericsDaoImp;
import Dao.Salesmanagement.GenericsImp;
import InterFace.SalesManagement.GenericsDao;


import Model.PurchaseManagement.SuppCompany_model;
import Model.SalesManagement.Title_model;

import Model.SalesManagement.Categories_model;
import Model.SalesManagement.company_model;
import Model.SalesManagement.customer_model;
import Model.UserManagement.statebean;

/**
 * Servlet implementation class CustomerActionController
 */
public class CustomerActionController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerActionController() {
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
		HttpSession session=request.getSession();
		int userid=(Integer) session.getAttribute("id1");
		 if(action.equalsIgnoreCase("customerSave"))
		{
			 System.out.print("Hiiiiiiiiii");
				
				customer_model com1=new customer_model();
							
							customer_model com2=new customer_model();
							String checkvalue=request.getParameter("check");
							if(checkvalue==null){
								String title=request.getParameter("ti");
								System.out.print("not checked");
								com2.setCompanyid(0);
							
								com2.setTitleid(Integer.parseInt(title));
								com2.setIs_company("N");
								com2.setJobposition("");
							
								
							}			
							else{
								String job_position=request.getParameter("jobposition");
								String company=request.getParameter("company");
								String title_field=request.getParameter("ti");
								int ti=Integer.parseInt(title_field);
								int comp=Integer.parseInt(company);
								com2.setCompanyid(comp);
								com2.setJobposition(job_position);
								com2.setTitleid(ti);
								com2.setIs_company("Y");
							}
							GenericsDao<customer_model> gen=new GenericsImp<customer_model>();
							String customer=request.getParameter("customer");
							
							String email=request.getParameter("email");
							String address=request.getParameter("address");
							
							String country=request.getParameter("country");
							String zip=request.getParameter("zip");
							String faxno=request.getParameter("fax");
							String state=request.getParameter("state");
							String city=request.getParameter("city");
							String mobile1=request.getParameter("mobile1");
							String phn=request.getParameter("phn");
							String mobile2=request.getParameter("mobile2");
							String website=request.getParameter("website");
							String description=request.getParameter("description");
							com2.setCustomername(customer);
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
							List<customer_model> ll=gen.viewData(com1);
							
							if(!ll.isEmpty())
							{
							
						
							for(customer_model c:ll)
							{
								System.out.print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"+c.getCustomername());
								
									if(c.getCustomername().equalsIgnoreCase(customer))
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
							response.sendRedirect("UserController?action=Customers");
							
							
			
		}	
		else if(action.equalsIgnoreCase("CompanySave"))
		{
System.out.print("Hiiiiiiiiii");
			
			company_model com1=new company_model();
						
			company_model com2=new company_model();
						GenericsDao<company_model> gen=new GenericsImp<company_model>();
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
						List<company_model> ll=gen.viewData(com1);
						
						if(!ll.isEmpty())
						{
						
					
						

					
						for(company_model c:ll)
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
		else if(action.equalsIgnoreCase("title"))
		{
			Title_model t1=new Title_model();
			String titlename=request.getParameter("title");
			GenericsDao<Title_model> gg=new GenericsImp<Title_model>();
			t1.setTitle(titlename);
			gg.insertData(t1);
		}
		else if(action.equalsIgnoreCase("Category"))
		{
			String c_name=request.getParameter("category");
			boolean check=false;
			Categories_model cat= new Categories_model();
			GenericsDao<Categories_model> g_obj= new GenericsImp<Categories_model>();
			List<Categories_model> cat_list=g_obj.viewData(cat);
			for(int i=0;i<cat_list.size();i++)
			{
				if(cat_list.get(i).getCategory().equalsIgnoreCase(c_name))
				{
					check=true;
					break;
				}
			}
			if(!check)
			{
				cat.setCategory(c_name);
				cat.setCreated_by(userid);
				cat.setActive_flag("Y");
				boolean flag=g_obj.insertdetail(cat);
				if(flag){
					System.out.println("Data Inserted");
			}
			
			}	
			
		}
		
		
	}
		
}	
