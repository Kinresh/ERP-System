package Controller.SalesManagement;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.Salesmanagement.AddInsertDaoImp;
import Dao.Salesmanagement.GenericsImp;
import InterFace.SalesManagement.AddInsertDao;
import InterFace.SalesManagement.GenericsDao;
import Model.SalesManagement.Lead_model;
import Model.SalesManagement.Meeting_model;
import Model.SalesManagement.customer_model;

/**
 * Servlet implementation class CustomerController
 */
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static String cust="NewHome.jsp?p=Customers";
	    private static String addlead="NewHome.jsp?p=AddLead";
	    private static String loggedcalls="NewHome.jsp?p=LoggedCalls";
	    private static String meeting="NewHome.jsp?p=Meeting";
	    private static String addcust="NewHome.jsp?p=AddCustomer";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerController() {
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
		System.out.println("----------"+action);
		int userid=(Integer) session.getAttribute("id1");
		if(action.equalsIgnoreCase("createlead"))
		{
			System.out.print("---------------hi----------");
			String subject=request.getParameter("subject");
			String lead_date=request.getParameter("lead_date");
			String customer=request.getParameter("customer");
			String company=request.getParameter("company");
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
			String stage=request.getParameter("stage");
			Lead_model lead= new Lead_model();
			lead.setSubject(subject);
			lead.setLeaddt(lead_date);
			lead.setCompany(company);
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
			lead.setCreated_by(userid);
			lead.setStage(stage);
			String ss="Y";
			lead.setActive_flag(ss);
			GenericsDao<Lead_model> g_obj=new GenericsImp<Lead_model>();
			boolean flg=g_obj.insertdetail(lead);
			if(flg){
				response.sendRedirect("UserController?action=Leads");
			}
			
			
			
		}
		if(action.equalsIgnoreCase("AddMeeting"))
		{
			System.out.print("---------------hi----------");
			String subject=request.getParameter("subject");
			String date_name=request.getParameter("date_name");
			String duration=request.getParameter("duration");
			String[] attendies=request.getParameterValues("attendies");
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
			mt.setResponsible(Integer.parseInt(responsible));
			mt.setLocation(location);
			mt.setDescription(description);
			mt.setCreated_by(userid);
			mt.setAttendees_names(attendees_name);
			mt.setActive_flag("Y");
			GenericsDao<Meeting_model> g_obj=new GenericsImp<Meeting_model>();
			boolean flag=g_obj.insertdetail(mt);
			if(flag)
				response.sendRedirect("NewHome.jsp?p=Meetings");
			
		}
		
	}

}
