package Controller.UserManagement;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.UserManagement.GenericsDaoImp;
import InterFace.UserManagement.Generics;
import Model.UserManagement.Role;

/**
 * Servlet implementation class addroledata
 */
public class addroledata extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addroledata() {
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
		Role r=new Role();
		String role1=request.getParameter("role");
		String roledesc1=request.getParameter("roledesc");
		r.setRoleType(role1);
		r.setRoledescription(roledesc1);
		Generics<Role> gen=new GenericsDaoImp<Role>();
		gen.insertData(r);
		response.sendRedirect("homepage.jsp?p=adduser");
		
	}

}
