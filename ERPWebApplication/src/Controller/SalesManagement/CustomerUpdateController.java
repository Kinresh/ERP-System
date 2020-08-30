package Controller.SalesManagement;

import java.util.List;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.Salesmanagement.AddInsertDaoImp;

import Dao.Salesmanagement.UpdateInsertDaoImp;
import Dao.UserManagement.UpdateDaoImp;
import InterFace.SalesManagement.UpdateInsertDao;
import InterFace.SalesManagement.AddInsertDao;
import InterFace.UserManagement.UpdateDao;
import Model.SalesManagement.Lead_model;
import Model.SalesManagement.Meeting_model;
import Model.SalesManagement.customer_model;
import Util.Deletetable;

/**
 * Servlet implementation class CustomerUpdateController
 */
public class CustomerUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerUpdateController() {
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
		HttpSession session=request.getSession();
		int userid=(Integer) session.getAttribute("id1");
		
		 System.out.print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"+action);
		
		
		  if(action.equalsIgnoreCase("D"))
			{
			 System.out.print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&Enter");
			 	String id=request.getParameter("cid");
				String v="1";
				int value=Integer.parseInt(v);
				System.out.print("id----------------------------------"+id);
				UpdateInsertDao a=new UpdateInsertDaoImp();
				a.updateStatus(Integer.parseInt(id),value);
				Deletetable d=new Deletetable();
				
				d.deletename(Integer.parseInt(id));
				response.sendRedirect("UserController?action=Customers");
				
			}
		  else if(action.equalsIgnoreCase("exit"))
			 {
				 response.sendRedirect("UserController?action=Customers");
			 }
	 
		  else if(action.equalsIgnoreCase("editlead"))
			{
			 
			 System.out.print("---------Hi-----------");
			 
			 String subject=request.getParameter("subject");
				String lead_date=request.getParameter("lead_date");
				String customer=request.getParameter("customer");
				String contact_name=request.getParameter("con_name");
				String title_field=request.getParameter("title_field");
				String category=request.getParameter("category");
				String priority=request.getParameter("priority");
				String address=request.getParameter("address");
				String fax=request.getParameter("fax");
				String phn_no=request.getParameter("phn_no");
				String m_no1=request.getParameter("m_no1");
				String m_no2=request.getParameter("m_no2");
				String e_name=request.getParameter("e_name");
				String description=request.getParameter("description");
				String edit_id=request.getParameter("edit_id");
				String stage=request.getParameter("stage");
				Lead_model lead= new Lead_model();
				lead.setSubject(subject);
				lead.setLeaddt(lead_date);
				lead.setCustomerid(Integer.parseInt(customer));
				lead.setContactname(contact_name);
				lead.setEmail(e_name);
				lead.setTitleid(Integer.parseInt(title_field));
				lead.setCategoryid(Integer.parseInt(category));
				lead.setPriority(priority);
				lead.setAddress(address);
				lead.setFax_no(fax);
				lead.setPhone(phn_no);
				lead.setMobile1(m_no1);
				lead.setMobile2(m_no2);
				lead.setDescription(description);
				lead.setLead_id(Integer.parseInt(edit_id));
				lead.setUpdated_by(userid);
				lead.setStage(stage);
				UpdateInsertDao s=new UpdateInsertDaoImp();
				boolean flag=s.updateLead(lead);
				if(flag)
				{
					response.sendRedirect("NewHome.jsp?p=ViewLead&id="+edit_id);
				}
			}
		
		  else if(action.equalsIgnoreCase("deletelead"))
			{
			 System.out.print("---------Hi-----------");
			 System.out.print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&Enter");
			 	String id=request.getParameter("cid");
				String v="N";
				System.out.print("id----------------------------------"+id);
				UpdateInsertDao a=new UpdateInsertDaoImp();
				a.updateStatuslead(Integer.parseInt(id));
				
				response.sendRedirect("UserController?action=Leads");
			}
		  else if(action.equalsIgnoreCase("DeleteMeeting"))
			{
			  System.out.print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&Enter");
			  String id=request.getParameter("cid");
				String v="N";
				System.out.print("id----------------------------------"+id);
				UpdateInsertDao a=new UpdateInsertDaoImp();
				a.updateMeetingActiveflag(Integer.parseInt(id));
				
				response.sendRedirect("UserController?action=Meetings");
			}
		 else if(action.equalsIgnoreCase("editcustomer"))
			{
			 String customer=request.getParameter("customer");
				String emailid=request.getParameter("email");
				String website=request.getParameter("website");
				
				String faxno=request.getParameter("faxno");
				String mno1=request.getParameter("mobile1");
				String mno2=request.getParameter("mobile2");
				String title=request.getParameter("title");
				String address=request.getParameter("address");
				String country=request.getParameter("country");
				String state=request.getParameter("state");
				String city=request.getParameter("city");
				String title_field=request.getParameter("title");
				String description=request.getParameter("description");
				String cust_id=request.getParameter("custid");
				
				customer_model cust=new customer_model();
				cust.setUpdated_by(userid);
				cust.setCustomername(customer);
				cust.setEmailid(emailid);
				cust.setWebsite(website);
				cust.setFaxno(faxno);
				cust.setMobile1(mno1);
				cust.setMobile2(mno2);
				cust.setAddress(address);
				cust.setCid(Integer.parseInt(country));
				cust.setSid(Integer.parseInt(state));
				cust.setCityid(Integer.parseInt(city));
				cust.setCustomerid(Integer.parseInt(cust_id));
				cust.setDescription(description);
				cust.setTitleid(Integer.parseInt(title));
				AddInsertDao aa=new AddInsertDaoImp();
				
				List<customer_model> oldlist=aa.viewCustomerDetail(cust_id);
				String iscompany=oldlist.get(0).getIs_company();
				if(iscompany.equalsIgnoreCase("Y")){
					String company=request.getParameter("company");
					String jobposition=request.getParameter("jobposition");
					
					cust.setCompanyid(Integer.parseInt(company));
					cust.setJobposition(jobposition);
					
					
				}else{
					cust.setCompanyid(0);
					cust.setJobposition(" ");
				
					
				}
				
				UpdateInsertDao up= new UpdateInsertDaoImp();
				boolean flag=up.updateCustomerData(cust);
				if(flag)
				{
					response.sendRedirect("UserController?action=ViewCustomer&id="+cust_id);
				}
			}
		  if(action.equalsIgnoreCase("EditMeeting"))
			{
			  System.out.print("----------------------hiiiii----------------");
				String subject=request.getParameter("subject");
				String date_name=request.getParameter("date_name");
				String duration=request.getParameter("duration");
				String[] attendies=request.getParameterValues("attendies");
				String edit_id=request.getParameter("edit_id");
				String values=attendies[0];
				for(int i=1;i<attendies.length;i++){
					values+=","+attendies[i];
				}
				String a_id=values;
				AddInsertDao sd_obj=new AddInsertDaoImp();
					String[] a_ids=a_id.split(",");
					String attendees_name="";
					for(int i=0;i<a_ids.length;i++){
						List<customer_model> c_lst=sd_obj.viewCustomerBycustid(Integer.parseInt(a_ids[i]));
						if(i==a_ids.length-1)
							attendees_name+=c_lst.get(0).getCustomername();
						else
							attendees_name+=c_lst.get(0).getCustomername()+",";
					}
				String responsible=request.getParameter("responsible");
				String location=request.getParameter("location");
				String description=request.getParameter("description");
				Meeting_model mt=new Meeting_model();
				mt.setSubject(subject);
				mt.setDate(date_name);
				mt.setDuration(duration);
				mt.setAttendies(values);
				mt.setAttendees_names(attendees_name);
				mt.setResponsible(Integer.parseInt(responsible));
				mt.setLocation(location);
				mt.setDescription(description);
				mt.setUpdated_by(userid);
				mt.setMeeting_id(Integer.parseInt(edit_id));
				UpdateInsertDao sup=new UpdateInsertDaoImp();
				boolean flg=sup.updateMeeting(mt);
				if(flg)
					response.sendRedirect("NewHome.jsp?p=ViewMeeting&id="+edit_id);
				
			}
		
	}

}
