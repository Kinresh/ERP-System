package Controller.PurchaseManagement;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.PurchaseManagement.PurchaseDaoImp;
import Dao.PurchaseManagement.PurchaseUpdateDaoImp;
import Dao.Salesmanagement.GenericsImp;
import InterFace.PurchaseManagement.PurchaseDao;
import InterFace.PurchaseManagement.PurchaseUpdateDao;
import InterFace.SalesManagement.GenericsDao;
import Model.PurchaseManagement.IncomingProduct_model;
import Model.PurchaseManagement.IncomingShippment_model;
import Model.PurchaseManagement.PurchaseOrder_model;
import Model.PurchaseManagement.QuatationDetail_model;

/**
 * Servlet implementation class PurchaseOrderController
 */
public class PurchaseOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PurchaseOrderController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int userid = (Integer) session.getAttribute("id1");
		String action = request.getParameter("btnClick");
		String poi = request.getParameter("poid");
		int poid = Integer.parseInt(poi);
		System.out.println("-----------------poid---------" + poid);
		PurchaseUpdateDao puobj = new PurchaseUpdateDaoImp();
		PurchaseDao pobj = new PurchaseDaoImp();

		List<PurchaseOrder_model> po = pobj.viewPurchaseOrderInfoByPoid(poid);
		List<IncomingShippment_model> is = null;
		List<QuatationDetail_model> qd = pobj.viewQuatationDetailInfo(po.get(0)
				.getQuotation_id());

		GenericsDao<IncomingProduct_model> gp = new GenericsImp<IncomingProduct_model>();
		if (action.equalsIgnoreCase("Receive Products")) {
			System.out
					.println("----------hiiii- Receive Products---------------"
							+ poid);

			System.out.println("------------" + po.get(0).getFlag());
			if (po.get(0).getFlag().equalsIgnoreCase("N")) {

				response.sendRedirect("UserController?action=ViewPurchaseOrder&id="
						+ po.get(0).getQuotation_id());

			} else {
				request.getSession().setAttribute("status", "not");
				puobj.updatePurFlag(po.get(0).getQuotation_id());
				po = pobj.viewPurchaseOrderInfoByPoid(poid);
				is = pobj
						.viewIncomingShippmentInfo(po.get(0).getQuotation_id());
				int purid = is.get(0).getIncomingshippment_id();
				System.out.println("getyourid " + purid);
				response.sendRedirect("UserController?action=IncomingShippments&id="
						+ purid);

			}

		}

	}

}
