package Controller.UserManagement;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.UserManagement.GenericsDaoImp;
import InterFace.UserManagement.Generics;
import Model.UserManagement.privilage_model;

/**
 * Servlet implementation class addprivilage
 */
public class addprivilage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addprivilage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pri=request.getParameter("privilage");
		System.out.print("pppppppppppp"+pri);
		privilage_model p=new privilage_model();
		p.setPrivilagename(pri);
		Generics<privilage_model> gen=new GenericsDaoImp<privilage_model>();
		gen.insertData(p);

	}

}
