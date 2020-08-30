package Controller.UserManagement;


import java.util.List;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.UserManagement.AddInsertDaoImp;
import Dao.UserManagement.GenericsDaoImp;
import Dao.UserManagement.UpdateDaoImp;
import Dao.UserManagement.UserRightsDaoImp;
import InterFace.UserManagement.AddInsertDao;
import InterFace.UserManagement.Generics;
import InterFace.UserManagement.UpdateDao;
import InterFace.UserManagement.UserRightsDao;
import Model.UserManagement.assignPriByRole_model;
import Model.UserManagement.assignPriByUser_model;
import Model.UserManagement.privilage_component_model;
import Model.UserManagement.privilage_model;

import sun.net.www.content.text.Generic;



/**
 * Servlet implementation class UserPrivilageController
 */
public class UserPrivilageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserPrivilageController() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String action=request.getParameter("btnsubmit");
		System.out.print("btnsubmit------------"+action);
		if(action.equalsIgnoreCase("Add"))
		{
			System.out.print("--privilage-"+request.getParameter("privilage"));
			System.out.print("--componentname-"+request.getParameter("componentname"));
			
			privilage_component_model rmodel=new privilage_component_model();
			rmodel.setPri_id(Integer.parseInt(request.getParameter("privilage")));
			rmodel.setComponentname(request.getParameter("componentname"));
			UserRightsDao right=new UserRightsDaoImp();
			
			right.addFunctionality(rmodel);
			response.sendRedirect("UserController?action=AddPrivilageComponent");
		}
		else if(action.equalsIgnoreCase("Assign Rights"))
		{
			assignPriByUser_model ass=new assignPriByUser_model();
			ass.setUserid(Integer.parseInt(request.getParameter("username")));
			String[] userrights=request.getParameterValues("Userrights");
			
			String right=new String();
			right=userrights[0];
			for(int i=1;i<userrights.length;i++)
			{
			right=right+","+userrights[i];
			
			}
			ass.setPri_id(right);
			ass.setRoleid(Integer.parseInt(request.getParameter("role")));
			
			right=null;
			 
			Generics<assignPriByUser_model> gen=new GenericsDaoImp<assignPriByUser_model>();
			UpdateDao add=new UpdateDaoImp();
			
			gen.insertData(ass);
			//response.sendRedirect("NewHomePage.jsp?p=Blank");
			add.updateAssignedStatus(ass.getUserid(), 0);
		response.sendRedirect("UserController?action=AssignPrivilageByUser");
		}
		else if(action.equalsIgnoreCase("Assign"))
		{
			HttpSession sesi=request.getSession();
			UserRightsDao aa=new UserRightsDaoImp();
			assignPriByRole_model ass1=new assignPriByRole_model();
			String[] userrights=request.getParameterValues("Userrights");
			String right=new String();
			String right2=new String();
			right=userrights[0];
			for(int i=1;i<userrights.length;i++)
			{
			right=right+","+userrights[i];
			
			
			}
			
			String[] rights123=right.split(",");
		
			int pri1=aa.viewPriByArray(rights123[0]);
			
			
			
			for(int i=0;i<rights123.length;i++)
			{
				
				int pri=aa.viewPriByArray(rights123[i]);
				right2=right2+","+pri;
			}
			ass1.setRoleid(Integer.parseInt(request.getParameter("role")));
			ass1.setPrivilagename(right);
			System.out.print("right2---------------------------"+right2);
			String rr=new String();
			String[] right3=right2.split(",");
			rr=right3[1];
			for(int j=2;j<right3.length;j++)
			{
			 rr=rr+","+right3[j];
			}
			System.out.print("-----------------------++++++++++++-----------"+rr);
			ass1.setPri_id(rr);
			right=null;
			 right2=null;
			
			aa.assignprivilagebyrole(ass1);
			response.sendRedirect("UserController?action=AssignPrivilageByRole");
			
		}
		else if(action.equalsIgnoreCase("Add Privilage"))
		{			boolean check=false;
					System.out.print("0000000");
					String pri=request.getParameter("privilage");
					System.out.print("pppppppppppp"+pri);
					privilage_model p=new privilage_model();
					Generics<privilage_model> gen=new GenericsDaoImp<privilage_model>();
					List<privilage_model> ll=gen.viewData(p);
					for(privilage_model pp:ll)
					{
						if(pp.getPrivilagename().equalsIgnoreCase(pri))
						{
							check=true;
							break;
						}
					}
					if(!check)						
					{
					p.setPrivilagename(pri);
					
					gen.insertData(p);
					}
		}
					
		
	}
}
