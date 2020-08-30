package Controller.UserManagement;



import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;


import javax.mail.NoSuchProviderException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.UserManagement.AddInsertDaoImp;
import Dao.UserManagement.GenericsDaoImp;
import Dao.UserManagement.UpdateDaoImp;
import InterFace.UserManagement.AddInsertDao;
import InterFace.UserManagement.Generics;
import InterFace.UserManagement.UpdateDao;
import Mail.Mail;
import Model.UserManagement.Role;
import Model.UserManagement.UserModel;
import Model.UserManagement.assignPriByUser_model;
import Model.UserManagement.citybean;
import Model.UserManagement.countrybean;
import Model.UserManagement.statebean;
import Util.Deletetable;

/**
 * Servlet implementation class UserActionController
 */
public class UserActionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserActionController() {
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
		String action1=request.getParameter("btnclick");	
		
		
		System.out.print("-------hiiiiiiiiiiiiiiiiiiiiii-------"+action1);
		HttpSession ses=request.getSession();
		int uid=(Integer) ses.getAttribute("id1");
		if(action1.equalsIgnoreCase("More"))
		{
			System.out.print("(((((9");
			HttpSession session=request.getSession();
			String userid=request.getParameter("cid");
			System.out.print("userId"+userid);
		
		session.setAttribute("user", Integer.parseInt(userid));
			Integer id11 = (Integer) session.getAttribute("id1");
			AddInsertDao a1=new AddInsertDaoImp();
			List<assignPriByUser_model> ll=a1.viewUserAssignRight(Integer.parseInt(userid));
			
			
			
			if(ll.isEmpty())
			{
				response.sendRedirect("Users.jsp");
			}
			else
			{
				response.sendRedirect("UserController?action=Users");
			}
		
		} 
		else if(action1.equalsIgnoreCase("Delete"))
		{
			String id=request.getParameter("cid");
			String v="1";
			int value=Integer.parseInt(v);
			System.out.print("id----------------------------------"+id);
			UpdateDao a=new UpdateDaoImp();
			a.deleteitem(Integer.parseInt(id),value);
				
			response.sendRedirect("UserController?action=Users");
			
		}
	
		else if(action1.equalsIgnoreCase("Update"))
		{
			HttpSession sess=request.getSession();
			System.out.println("*********Update**************");
			Generics<UserModel> gen=new GenericsDaoImp<UserModel>();
			UpdateDao aa=new UpdateDaoImp();
			UserModel u=new UserModel();
			String id1=request.getParameter("hid2");
			int id2=Integer.parseInt(id1);
			Integer roleid= (Integer) sess.getAttribute("id1");
			System.out.println("id="+id2+"");
			System.out.println("rid================="+roleid+"");
			String user=request.getParameter("username");
			String addr=request.getParameter("address");
		String fname=request.getParameter("firstname");
		String str_cno=request.getParameter("contactno");
		String country=request.getParameter("country");
		String state=request.getParameter("state");
		String city=request.getParameter("city");
		
		String email=request.getParameter("emailaddress");
		System.out.print("---------->FirstName<------"+fname);
			String lname=request.getParameter("lastname");
			u.setUsername(user);
			u.setAddress(addr);
			u.setFirstname(fname);
			u.setEmailaddress(email);
			u.setContactno(str_cno);
		u.setLastname(lname);
		u.setCid(Integer.parseInt(country));
		u.setSid(Integer.parseInt(state));
		u.setCid(Integer.parseInt(city));
		u.setUpdatedby(roleid);
			System.out.println(user);
		System.out.println("---add------->"+addr);
		//	gen.updateitem(u);
			aa.updatefinal(id2,u,roleid);
			response.sendRedirect("UserController?action=newviewuser");
			
			
		}
		if(action1.equalsIgnoreCase("AddUser"))
		{
			System.out.println("-----------------------hi");
			
			UserModel u1=new UserModel();
			Generics<UserModel> gen1=new GenericsDaoImp<UserModel>();
			List<UserModel> l=gen1.viewData(u1);
			
			String user=request.getParameter("username");
			String role1=request.getParameter("role");
			
			String emailaddress=request.getParameter("email");
			System.out.print("1111111111"+l.get(0).getUsername());
			for(UserModel u:l)
			{
				
			

				if(u.getUsername().equals(user) && u.getEmailaddress().equals(emailaddress) || u.getEmailaddress().equals(emailaddress))
				{
					System.out.print("Already Exit");
					break;
										
				}
				
				else
				{
			System.out.println("sejal");
			UserModel uu=new UserModel();
			Generics<UserModel> g=new GenericsDaoImp<UserModel>();
			
			
			String a1=request.getParameter("country");
			String a2=request.getParameter("state");
			String a3=request.getParameter("city");
			
			String firtname1=request.getParameter("firstname");
			String lastname1=request.getParameter("lastname");
			
			String bdate=request.getParameter("birth_date");
			String address1=request.getParameter("address");
			String description=request.getParameter("description");
			System.out.println("============="+a3);
			
		
			String contactno1=request.getParameter("contact");
			System.out.println(contactno1);
			String faxno1=request.getParameter("faxno");
			
			String assigned="1";
				int id=(int)ses.getAttribute("id1");
				
				uu.setFirstname(firtname1);
				uu.setLastname(lastname1);
				uu.setCid(Integer.parseInt(a1));
				uu.setSid(Integer.parseInt(a2));
				uu.setCityid(Integer.parseInt(a3));
				uu.setCreatedby(id);
				uu.setEmailaddress(emailaddress);
				uu.setFaxno(faxno1);
				uu.setDescription(description);
				uu.setGender(request.getParameter("gen"));
			uu.setContactno(contactno1);
				uu.setAddress(address1);
				uu.setBirthdate(bdate);
				uu.setAssignedright(Integer.parseInt(assigned));
				uu.setStatus(0);
				uu.setRoleid(Integer.parseInt(role1));
				uu.setUpdatedby(0);
				String value="0";
				uu.setActive_flag(value);
			uu.setUsername(user);
			
			 String algorithm="";
				byte[] unencodedPassword = user.getBytes();
				MessageDigest md = null;
				try {
				md = MessageDigest.getInstance("MD5");
				} catch (Exception e) {}
				md.reset();
				md.update(unencodedPassword);
				byte[] encodedPassword = md.digest();
				StringBuffer buf = new StringBuffer();
				for (int i = 0; i < encodedPassword.length; i++) {
				if (((int) encodedPassword[i] & 0xff) < 0x2) {
				buf.append("0");
				}
				buf.append(Long.toString((int) encodedPassword[i] & 0xff, 16));
				}
				String password=buf.toString(); 
				uu.setPassword(password);
                g.insertData(uu);
			
                try {
				Mail m = new Mail();
				String msg="Your UserName is:"+user+" and Your password is:"+password;
				
					m.sendmail(emailaddress,"Your Account Details",msg);
				} catch (NoSuchProviderException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
				}
				
				
		}
			response.sendRedirect("NewHome.jsp?p=AddUser");
		}
		if(action1.equalsIgnoreCase("Cancel"))
		{
			response.sendRedirect("UserController?action=newviewuser");
		}
		if(action1.equalsIgnoreCase("Add"))
		{
			String role_name=request.getParameter("role");
			String role_desc=request.getParameter("roledesc");
			Role r=new Role();
			Generics<Role> gen_role=new GenericsDaoImp<Role>();
			List<Role> r_list=gen_role.viewData(r);
			boolean check=false;
			for(int i=0;i<r_list.size();i++){
				if(r_list.get(i).getRoleType().equalsIgnoreCase(role_name)){
					check=true;
					break;
				}
			}
			if(!check)
			{
			r.setRoleType(role_name);
			r.setRoledescription(role_desc);
			r.setCreated_by(uid);
			Generics<Role> gr_obj=new GenericsDaoImp<Role>();
			gr_obj.insertData(r);
			
				
			}
			
				
		}
		if(action1.equalsIgnoreCase("country")){
			String name=request.getParameter("countryname");
			countrybean co= new countrybean();
			Generics<countrybean> gen_ctry=new GenericsDaoImp<countrybean>();
			List<countrybean> c_list=gen_ctry.viewData(co);
			boolean check=false;
			for(int i=0;i<c_list.size();i++){
				if(c_list.get(i).getCname().equalsIgnoreCase(name)){
					check=true;
					break;
				}
			}
			if(!check){
				co.setCname(name);
				Generics<countrybean> gen_obj=new GenericsDaoImp<countrybean>();
				gen_obj.insertData(co);
				
			}
			
		}
		else if(action1.equalsIgnoreCase("state")){
			String name=request.getParameter("statename");
			String cid=request.getParameter("countryid");
			int coid=Integer.parseInt(cid);
			statebean s1=new statebean();
			Generics<statebean> gen=new GenericsDaoImp<statebean>();
			List<statebean> st_list=gen.viewData(s1);
			for(statebean ss:st_list)
			{
				if((ss.getStatename().equalsIgnoreCase(name) && ss.getCid()==coid) || (ss.getStatename().equalsIgnoreCase(name)))
				{
					System.out.print("Already Exit");
					break;
					
				}
				else
				{
					statebean sss=new statebean();
					sss.setCid(coid);
					sss.setStatename(name);
					
					gen.insertData(sss);
					
					break;
				}
			}
			
				}
		else if(action1.equalsIgnoreCase("city")){
			String name=request.getParameter("cityname");
			String cid1=request.getParameter("countryid");
			
			String sid1=request.getParameter("state");
			System.out.print("****************"+sid1);
			int cid=Integer.parseInt(cid1);
			int sid=Integer.parseInt(sid1);
			citybean cc=new citybean();
			Generics<citybean> gen=new GenericsDaoImp<citybean>();
			List<citybean> st_list=gen.viewData(cc);
			for(citybean ss:st_list)
			{
				if((ss.getCid()==cid) && ( ss.getSid()==sid) && (ss.getCityname().equalsIgnoreCase(name)))
				{
					System.out.print("Already Exit");
					break;
					
				}
				else
				{
					cc.setCityname(name);
					cc.setSid(sid);
					cc.setCid(cid);
					Generics<citybean> genn=new GenericsDaoImp<citybean>();
					genn.insertData(cc);
					break;
		
				}
			}
		}
		else if(action1.equalsIgnoreCase("EditUser"))
		{
		String role=request.getParameter("s_dep");
		String userName=request.getParameter("user_name");
		String firstname=request.getParameter("firstname");
		String lastname=request.getParameter("lastname");
		String gender=request.getParameter("gen_name");
		String b_dt=request.getParameter("bdate_name");
		String email=request.getParameter("email_name");
		String address=request.getParameter("address");
		String country=request.getParameter("country");
		String state=request.getParameter("state");
		
		
		String city=request.getParameter("city");
		String contact=request.getParameter("contact_name");
		String note=request.getParameter("description");
		String edit_id=request.getParameter("edit_id");
		UserModel mst=new UserModel();
		mst.setRoleid(Integer.parseInt(role));
		mst.setUserid(Integer.parseInt(edit_id));
		mst.setUsername(userName);
		
		mst.setFirstname(firstname);
		mst.setLastname(lastname);
		mst.setGender(gender);
		mst.setBirthdate(b_dt);
		mst.setEmailaddress(email);
		mst.setAddress(address);
		mst.setCid(Integer.parseInt(country));
		mst.setSid(Integer.parseInt(state));
		mst.setCityid(Integer.parseInt(city));
		mst.setContactno(contact);
		mst.setDescription(note);
		mst.setUpdatedby(uid);
		mst.setUserid(Integer.parseInt(edit_id));
		UpdateDao up_obj=new UpdateDaoImp();
		boolean flag=up_obj.updateUser(mst);
		if(flag){
			response.sendRedirect("NewHome.jsp?p=ViewUserDetails&id="+edit_id);
		}
		
		
	}

		}
	}


