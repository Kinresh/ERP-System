package Controller.UserManagement;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.UserManagement.UpdateDaoImp;
import InterFace.UserManagement.UpdateDao;
import Model.UserManagement.UserModel;

/**
 * Servlet implementation class BlockUnblock
 */
public class BlockUnblock extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlockUnblock() {
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
		String block_id=request.getParameter("hid");
		System.out.println("blockid------------------------"+block_id);
		UserModel master=new UserModel();
		master.setUserid(Integer.parseInt(block_id));
		UpdateDao u_obj= new UpdateDaoImp();
	u_obj.blockUnblock(master);
		
		
			response.sendRedirect("UserController?action=Users");
	
	}
}
