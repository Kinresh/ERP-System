package Controller.SalesManagement;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.Salesmanagement.GenericsImp;
import Dao.Salesmanagement.ScheduleCallDaoImp;
import Dao.Salesmanagement.UpdateInsertDaoImp;
import InterFace.SalesManagement.GenericsDao;
import InterFace.SalesManagement.ScheduleCallDao;
import InterFace.SalesManagement.UpdateInsertDao;
import Model.SalesManagement.ScheduleCall_model;
import Model.SalesManagement.logged_call_model;

/**
 * Servlet implementation class CustomerCallController
 */
public class CustomerCallController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerCallController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("hid");
		
		System.out.println("----------"+action);
		HttpSession session=request.getSession();
		int userid=(Integer) session.getAttribute("id1");
		if(action.equalsIgnoreCase("Addschedulecall"))
		{
			System.out.print("----------------------------hii");
			String summary=request.getParameter("summary");
			String contact=request.getParameter("contact");
			String phone=request.getParameter("phone");
			String mobile1=request.getParameter("mobile1");
			String mobile2=request.getParameter("mobile2");
			String dt=request.getParameter("scheduledate");
			String responsible=request.getParameter("responsible");
			String category=request.getParameter("category");
			String priority=request.getParameter("priority");
			String description=request.getParameter("description");
			String status=request.getParameter("status");
			ScheduleCall_model sc= new ScheduleCall_model();
			sc.setSummary(summary);
			sc.setCustomerid(Integer.parseInt(contact));
			sc.setPhone(phone);
			sc.setMobile1(mobile1);
			sc.setMobile2(mobile2);
			sc.setScheduledt(dt);
			sc.setResponsible(Integer.parseInt(responsible));
			sc.setCategory(category);
			sc.setPriority(priority);
			sc.setDescription(description);
		sc.setCreated_by(userid);
		sc.setActive_flag("y");
			sc.setUpdated_by(0);
			sc.setStatus(status);
		
			
			GenericsDao<ScheduleCall_model> gg=new GenericsImp<ScheduleCall_model>();
			gg.insertData(sc);
			
				response.sendRedirect("NewHome.jsp?p=ScheduleCalls");
		}
		if(action.equalsIgnoreCase("editschedulecall"))
		{
			System.out.print("---------hiiiiiiiii--------");
			String summary=request.getParameter("summary");
			String contact=request.getParameter("contact");
			String phone=request.getParameter("phone");
			String mobile1=request.getParameter("mobile1");
			String mobile2=request.getParameter("mobile2");
			String sdate=request.getParameter("scheduledate");
			String responsible=request.getParameter("responsible");
			String category=request.getParameter("category");
			String priority=request.getParameter("priority");
			String description=request.getParameter("description");
			String status=request.getParameter("status");
			String scheduleid=request.getParameter("scheduleid");
			ScheduleCall_model sc= new ScheduleCall_model();
			sc.setSummary(summary);
			sc.setCustomerid(Integer.parseInt(contact));
			sc.setPhone(phone);
			sc.setMobile1(mobile1);
			sc.setMobile2(mobile2);
			sc.setScheduledt(sdate);
			sc.setResponsible(Integer.parseInt(responsible));
			sc.setCategory(category);
			sc.setPriority(priority);
			sc.setDescription(description);
			sc.setStatus(status);
			sc.setUpdated_by(userid);
			sc.setSchedulecallid(Integer.parseInt(scheduleid));
			UpdateInsertDao upsc=new UpdateInsertDaoImp();
			boolean flg=upsc.updateScheduledCall(sc);
			if(flg)
			{
				ScheduleCallDao sc_obj=new ScheduleCallDaoImp();
				List<ScheduleCall_model> sc_call=sc_obj.viewScheduleInfo(Integer.parseInt(scheduleid));
				String oldstatus=sc_call.get(0).getStatus();
				String scheduledt=sc_call.get(0).getScheduledt();
				String sch_summary=sc_call.get(0).getSummary();
				int sch_contact=sc_call.get(0).getCustomerid();
				int sch_responsible=sc_call.get(0).getResponsible();
				if(oldstatus.equalsIgnoreCase("Held"))
				{
					boolean flag=upsc.DeleteScheduleCall(Integer.parseInt(scheduleid));
					if(flag)
					{
						logged_call_model lc=new logged_call_model();
						lc.setDate(scheduledt);
						lc.setSummary(sch_summary);
						lc.setContact(sch_contact);
						lc.setResponsible(sch_responsible);
						lc.setCreated_by(userid);
						GenericsDao<logged_call_model> g=new GenericsImp<logged_call_model>();
						g.insertData(lc);
						response.sendRedirect("UserController?action=ScheduleCalls");
					}
				}
				else
				{
					response.sendRedirect("UserController?action=ViewScheduleCall&id="+scheduleid);
				}
			}
			
		}
		if(action.equalsIgnoreCase("ScheduleOtherCall"))
		{
			System.out.print("hiiiiiiiiiiiiiiiiiiiiiii----------------");
			GenericsDao<ScheduleCall_model> gg=new GenericsImp<ScheduleCall_model>();
			String summary=request.getParameter("summary");
			String contact=request.getParameter("abc");
			String sdate=request.getParameter("scheduledate");
			String responsible=request.getParameter("responsible");
			String act=request.getParameter("action");
			String val1=request.getParameter("v1");
			String val2common=request.getParameter("v2");
			String val3=request.getParameter("v3");
			System.out.print("hiiiiiiiiiiiiiiiiiiiiiii----------------"+val1+"---"+val2common+"-----"+val3);
			System.out.print("hiiiiiiiiiiiiiiiiiiiiiii----------------"+summary+"---"+val2common+"-----"+sdate+"------"+responsible+"-----"+act);
			
			ScheduleCall_model sch=new ScheduleCall_model();
			sch.setActive_flag("y");
			sch.setSummary(val1);
			sch.setCustomerid(Integer.parseInt(val2common));
			sch.setResponsible(Integer.parseInt(responsible));
			sch.setCreated_by(userid);
			sch.setStatus("Confirmed");
			gg.insertData(sch);
			
			ScheduleCall_model sch2=new ScheduleCall_model();
			sch2.setSummary(summary);
			sch2.setActive_flag("y");
			sch2.setCreated_by(userid);
			sch2.setStatus("Confirmed");
			sch2.setCustomerid(Integer.parseInt(val2common));
			sch2.setScheduledt(sdate);
		
			sch2.setResponsible(Integer.parseInt(responsible));
			if(act.equals("schedulecall"))
			{
				gg.insertData(sch2);
				
			}
			else if(act.equals("loggedcall"))
			{
				GenericsDao<logged_call_model> gg1=new GenericsImp<logged_call_model>();
				logged_call_model lg=new logged_call_model();
				lg.setContact(Integer.parseInt(val2common));
				lg.setSummary(summary);
				lg.setCreated_by(userid);
				lg.setDate(sdate);
				lg.setActiveflag("y");
				lg.setResponsible(Integer.parseInt(responsible));
				
				gg1.insertData(lg);
				
			}
			
			response.sendRedirect("UserController?action=ScheduleCalls");
			
			
		}
		 else if(action.equalsIgnoreCase("editloggedcall"))
			{
			 System.out.print("hiiiiiiiiiiiiiiiiii");
			 String summary=request.getParameter("summary");
				String contact=request.getParameter("contact");
				String mobile1=request.getParameter("mobile");
				String sdate=request.getParameter("loggeddate");
				String responsible=request.getParameter("responsible");
				
				String lid=request.getParameter("loggedid");
				logged_call_model sc= new logged_call_model();
				sc.setSummary(summary);
				sc.setContact(Integer.parseInt(contact));
				sc.setMobile(mobile1);
				sc.setDate(sdate);
				sc.setResponsible(Integer.parseInt(responsible));
				sc.setUpdated_by(userid);
				
				sc.setLoggedcallid(Integer.parseInt(lid));
				UpdateInsertDao upsc=new UpdateInsertDaoImp();
				boolean flg=upsc.updateloggedCall(sc);
				if(flg)
				{
					System.out.print("SuccessFully Updated");
					response.sendRedirect("UserController?action=ViewLoggedCall&id="+lid);
					
				}
				else
				{
					System.out.print("SuccessFully not Updated");
				}
			 
			}
		 else if(action.equalsIgnoreCase("Addloggedcall"))
			{
			 GenericsDao<logged_call_model> gh=new GenericsImp<logged_call_model>();
			 	System.out.print("Hiiiiiiiiiiiiiiiiiiiiiiiiiiii");
			 	 System.out.print("hiiiiiiiiiiiiiiiiii");
				 String summary=request.getParameter("summary");
					String contact=request.getParameter("contact");
					
					String sdate=request.getParameter("loggeddate");
					String responsible=request.getParameter("responsible");
					
					String lid=request.getParameter("loggedid");
					logged_call_model sc= new logged_call_model();
					sc.setSummary(summary);
					sc.setContact(Integer.parseInt(contact));
					
					sc.setDate(sdate);
					sc.setResponsible(Integer.parseInt(responsible));
					sc.setUpdated_by(userid);
					sc.setCreated_by(userid);
					sc.setActiveflag("y");
					//sc.setLoggedcallid(Integer.parseInt(lid));
					gh.insertData(sc);
					response.sendRedirect("UserController?action=LoggedCalls");
			}
	}
	
}