package Controller.UserManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.UserManagement.LoginDaoImp;
import InterFace.UserManagement.LoginDao;
import Model.UserManagement.UserModel;


public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static String InsertData="NewHome.jsp?p=AddUser"; 
	 private static String addcall="NewHome.jsp?p=AddCall";
	    private static String viewData="NewHome.jsp?p=NewViewUser";
	    private static String view="NewHome.jsp?p=Users";
	    private static String details="NewHome.jsp?p=ViewUserDetails";
	    private static String blank="NewHome.jsp?p=Blank";
	    private static String login="login.jsp";
	    private static String logout="logout.jsp";
	    private static String privilages="NewHome.jsp?p=AddPrivilageComponent";
	    private static String asspribyrole="NewHome.jsp?p=AssignPrivilageByRole";
	    private static String asspribyuser="NewHome.jsp?p=AssignPrivilageByUser";
	    private static String privicomp="NewHome.jsp?p=AddPrivilages";
	    private static String addcust="NewHome.jsp?p=AddCust";
	    private static String cust="NewHome.jsp?p=u";
	    private static String custs="NewHome.jsp?p=Customers";
	    private static String addlead="NewHome.jsp?p=Leads";
	    private static String viewcust="NewHome.jsp?p=ViewCustomer";
	    private static String Editcust="NewHome.jsp?p=EditCustomer";
	    private static String loggedcalls="NewHome.jsp?p=LoggedCalls";
	    private static String meeting="NewHome.jsp?p=Meeting";
	    private static String addcountry="NewHome.jsp?p=AddCountry";
	    private static String company="NewHome.jsp?p=Company";
	    private static String schedulecall="NewHome.jsp?p=ScheduleCalls";
	    private static String viewschedulecall="NewHome.jsp?p=ViewScheduleCall";
	    private static String tab1="NewHome.jsp?p=table";
	    private static String eloggedcalls="NewHome.jsp?p=EditLoggedCall";
	    private static String viewloggedcalls="NewHome.jsp?p=ViewLoggedCall";
	    private static String viewlead="NewHome.jsp?p=ViewLead";
	    
	    private static String prodDetail="NewHome.jsp?p=Products";
	    private static String AddCategory="NewHome.jsp?p=AddCategory";
	    private static String viewitems="NewHome.jsp?p=Items";
	    private static String addsize="NewHome.jsp?p=AddSize";
	    private static String viewsuppliers="NewHome.jsp?p=Suppliers";
	    private static String viewsupplier="NewHome.jsp?p=ViewSupplier";
	    private static String view_product="NewHome.jsp?p=ViewProduct";
	    private static String view_item="NewHome.jsp?p=ViewItem";
	    private static String Add_item="NewHome.jsp?p=AddItem";
	    private static String Add_quatation="NewHome.jsp?p=AddQuatation";
	    private static String Add_meeting="NewHome.jsp?p=AddMeeting";
	    private static String meetings="NewHome.jsp?p=Meetings";
	    private static String view_meeting="NewHome.jsp?p=ViewMeeting";
	    private static String editquatation="NewHome.jsp?p=EditQuatation";
	    private static String viewpurchaseorder="NewHome.jsp?p=ViewPurchaseOrder";
	    private static String Quatations="NewHome.jsp?p=Quatations";
	    private static String viewquatation="NewHome.jsp?p=ViewQuatation";
	    private static String editquatations="NewHome.jsp?p=EditQuatations";
	    private static String purchaseorder="NewHome.jsp?p=PurchaseOrders";
	    private static String incomingshippment="NewHome.jsp?p=IncomingShippments";
	    private static String salesquatation="NewHome.jsp?p=SaleQuatations";
	    private static String viewsalequatation="NewHome.jsp?p=ViewSaleQuatation";
	    private static String editsalequatation="NewHome.jsp?p=EditSaleQuatation";
	    private static String viewsaleorder="NewHome.jsp?p=ViewSalesOrder";
	    private static String SalesOrders="NewHome.jsp?p=SalesOrders";
	    private static String IncomingShipment="NewHome.jsp?p=IncomingShippment";
	    private static String IncomingProduct="NewHome.jsp?p=IncomingProduct";
	    private static String delivaryorder="NewHome.jsp?p=Delivary Orders";
	    private static String delivaryproduct="NewHome.jsp?p=Delivary Products";
	    private static String check="NewHome.jsp?p=CheckAvailability";
	    private static String AddIncomingShippment="NewHome.jsp?p=AddIncomingShippment";
	    
	    
	    
	    
    public UserController() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	
	{
		String action=request.getParameter("action");
		String forward="";
		if(action.equalsIgnoreCase("adduser"))
		{
			forward=InsertData;
		}
		else if(action.equalsIgnoreCase("newviewuser"))
		{
			forward=viewData;
			
		}
		else if(action.equalsIgnoreCase("Users"))
		{
			forward=view;
			
		}
		else if(action.equalsIgnoreCase("ViewUserDetails"))
		{
			forward=details;
			
		}
		else if(action.equalsIgnoreCase("addprivilages"))
		{
			forward=privicomp;
			
		}
		else if(action.equalsIgnoreCase("login"))
		{
			forward=login;
			
		}
		
		else if(action.equalsIgnoreCase("blank"))
		{
			forward=blank;
			
		}
	
		else if(action.equalsIgnoreCase("l"))
		{
			forward=logout;
			
		}
		else if(action.equalsIgnoreCase("addprivilagecomponent"))
		{
			forward=privilages;
			
		}
		else if(action.equalsIgnoreCase("assignprivilagebyuser"))
		{
			forward=asspribyuser;
			
		}
		else if(action.equalsIgnoreCase("assignprivilagebyrole"))
		{
			forward=asspribyrole;
			
		}
		else if(action.equalsIgnoreCase("Customers"))
		{
			forward=custs;
			
		}
		else if(action.equalsIgnoreCase("Customer"))
		{
			forward=cust;
			
		}
	
		else if(action.equalsIgnoreCase("AddCust"))
		{
			forward=addcust;
			
		}
		else if(action.equalsIgnoreCase("table"))
		{
			forward=tab1;
			
		}
		else if(action.equalsIgnoreCase("ViewCustomer"))
		{
			forward=viewcust;
			
		}
		else if(action.equalsIgnoreCase("EditCustomer"))
		{
			forward=Editcust;
			
		}
		else if(action.equalsIgnoreCase("AddCall"))
		{
			forward=addcall;
			
		}
	
		else if(action.equalsIgnoreCase("Leads"))
		{
			forward=addlead;
			
		}
		else if(action.equalsIgnoreCase("LoggedCalls"))
		{
			forward=loggedcalls;
			
		}
		else if(action.equalsIgnoreCase("EditLoggedCall"))
		{
			forward=eloggedcalls;
			
		}
		else if(action.equalsIgnoreCase("ViewLoggedCall"))
		{
			forward=viewloggedcalls;
			
		}
		else if(action.equalsIgnoreCase("Meeting"))
		{
			forward=meeting;
			
		}
		else if(action.equalsIgnoreCase("ac"))
		{
			forward=addcountry;
			
		}
		else if(action.equalsIgnoreCase("Company"))
		{
			forward=company;
			
		}

		else if(action.equalsIgnoreCase("ScheduleCalls"))
		{
			forward=schedulecall;
			
		}
		else if(action.equalsIgnoreCase("ViewScheduleCall"))
		{
			forward=viewschedulecall;
			
		}
	
		else if(action.equalsIgnoreCase("Products"))
		{
			forward=prodDetail;
			
		}
		else if(action.equalsIgnoreCase("AddCategory"))
		{
			forward=AddCategory;
			
		}
		else if(action.equalsIgnoreCase("Items"))
		{
			forward=viewitems;
			
		}
		else if(action.equalsIgnoreCase("AddSize"))
		{
			forward=addsize;
			
		}
		else if(action.equalsIgnoreCase("Suppliers"))
		{
			forward=viewsuppliers;
			
		}
		else if(action.equalsIgnoreCase("ViewProduct"))
		{
			forward=view_product;
			
		}
		else if(action.equalsIgnoreCase("ViewItem"))
		{
			forward=view_item;
			
		}
		else if(action.equalsIgnoreCase("AddItem"))
		{
			forward=Add_item;
			
		}
		else if(action.equalsIgnoreCase("AddQuatation"))
		{
			forward=Add_quatation;
			
		}
		else if(action.equalsIgnoreCase("ViewLead"))
		{
			forward=viewlead;
			
		}
		else if(action.equalsIgnoreCase("ViewSupplier"))
		{
			forward=viewsupplier;
			
		}
		else if(action.equalsIgnoreCase("AddMeeting"))
		{
			forward=Add_meeting;
			
		}
		else if(action.equalsIgnoreCase("Meetings"))
		{
			forward=meetings;
			
		}
		else if(action.equalsIgnoreCase("ViewMeeting"))
		{
			forward=view_meeting;
			
		}
		else if(action.equalsIgnoreCase("EditQuatation"))
		{
			forward=editquatation;
			
		}
		else if(action.equalsIgnoreCase("EditQuatations"))
		{
			forward=editquatations;
			
		}
		else if(action.equalsIgnoreCase("ViewPurchaseOrder"))
		{
			forward=viewpurchaseorder;
			
		}
		else if(action.equalsIgnoreCase("Quatations"))
		{
			forward=Quatations;
			
		}
		else if(action.equalsIgnoreCase("ViewQuatation"))
		{
			forward=viewquatation;
			
		}
		else if(action.equalsIgnoreCase("PurchaseOrders"))
		{
			forward=purchaseorder;
			
		}
		else if(action.equalsIgnoreCase("IncomingShippments"))
		{
			forward=incomingshippment;
			
		}
		else if(action.equalsIgnoreCase("SaleQuatations"))
		{
			forward=salesquatation;
			
		}
		else if(action.equalsIgnoreCase("ViewSaleQuatation"))
		{
			forward=viewsalequatation;
			
		}
		else if(action.equalsIgnoreCase("EditSaleQuatation"))
		{
			forward=editsalequatation;
			
		}
		else if(action.equalsIgnoreCase("ViewSalesOrder"))
		{
			forward=viewsaleorder;
			
		}
		else if(action.equalsIgnoreCase("SalesOrders"))
		{
			forward=SalesOrders;
			
		}
		else if(action.equalsIgnoreCase("IncomingShippment"))
		{
			forward=IncomingShipment;
			
		}
		else if(action.equalsIgnoreCase("IncomingProduct"))
		{
			forward=IncomingProduct;
			
		}
		else if(action.equalsIgnoreCase("Delivary Orders"))
		{
			forward=delivaryorder;
			
		}
		else if(action.equalsIgnoreCase("Delivary Products"))
		{
			forward=delivaryproduct;
			
		}
		else if(action.equalsIgnoreCase("CheckAvailability"))
		{
			forward=check;
			
		}
		else if(action.equalsIgnoreCase("AddIncomingShippment"))
		{
			forward=AddIncomingShippment;
		}
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		UserModel u=new UserModel();
		HttpSession ses=request.getSession();
		LoginDao d=new LoginDaoImp();
		
		
		PrintWriter pw=response.getWriter();
		String action1=request.getParameter("action");
		System.out.print(action1);
		if(action1.equalsIgnoreCase("login"))
		{
			response.setHeader("Cache-Control","no-cache");
			response.setHeader("Cache-Control", "no-store");
			response.setHeader("Pragma", "no-cache");
			response.setDateHeader("Expires", 0);
			String uname=request.getParameter("username");
			String pass=request.getParameter("pass");
			String rid=request.getParameter("roleid");
			
			System.out.print("uname="+uname);
			System.out.print("uname***************="+rid);
			boolean flag;
			
			
			
			u.setRoleid(Integer.parseInt(rid));
			u.setUsername(uname);
			u.setPassword(pass);
			
			List<UserModel> l=d.checkAuthentication(u);
			  int ss=0;
				if(l.isEmpty())
				   {
					   flag=false;
					   System.out.println("Invalid User");
				   }
				   else
				   {
					   System.out.println("valid User");
					   flag=true;
				   } 
			if(flag)
			{	
					ss=l.get(0).getUserid();
					ses.setAttribute("id1", ss);
					
				ses.setAttribute("username1",u.getUsername());
				
				
				 RequestDispatcher rd = request.getRequestDispatcher("NewHome.jsp");
               rd.forward(request, response); 
			
				
					
			
		/*	RequestDispatcher rd = request.getRequestDispatcher("Homepage.jsp");
                rd.forward(request, response);  */
			}
			else
			{
				 RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                 rd.forward(request, response);
                 pw.println("Invalid Username");
			}
			
			
			
		}
			
	}

		
	}


