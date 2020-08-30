package Controller.UserManagement;



import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.UserManagement.GenericsDaoImp;
import InterFace.UserManagement.Generics;
import Model.UserManagement.citybean;
import Model.UserManagement.countrybean;
import Model.UserManagement.statebean;

/**
 * Servlet implementation class Area
 */
public class Area extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Area() {
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
		String action1=request.getParameter("action"); 
		if(action1.equalsIgnoreCase("country")){
			String coname=request.getParameter("countryname");
			countrybean c1=new countrybean();
			c1.setCname(coname);
			Generics<countrybean> gen=new GenericsDaoImp<countrybean>();
			gen.insertData(c1);
			response.sendRedirect("homepage.jsp?p=AddUser");
		}
		else if(action1.equalsIgnoreCase("state1")){
			String name=request.getParameter("statenametext");
			String cid=request.getParameter("countryid");
			int coid=Integer.parseInt(cid);
			statebean s1=new statebean();
			s1.setCid(coid);
			s1.setStatename(name);
			Generics<statebean> gen=new GenericsDaoImp<statebean>();
			gen.insertData(s1);
			response.sendRedirect("homepage.jsp?p=AddUser");
		}
		else if(action1.equalsIgnoreCase("city")){
			String name=request.getParameter("cityname");
			String cid1=request.getParameter("countryid");
			String sid1=request.getParameter("stateid");
			int cid=Integer.parseInt(cid1);
			int sid=Integer.parseInt(sid1);
			citybean cc=new citybean();
			cc.setCityname(name);
			cc.setSid(sid);
			cc.setCid(cid);
			Generics<citybean> gen=new GenericsDaoImp<citybean>();
			gen.insertData(cc);
			response.sendRedirect("homepage.jsp?p=AddUser");
		}
		
		
	}

}
