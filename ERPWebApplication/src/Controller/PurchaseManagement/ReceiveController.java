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
import Model.PurchaseManagement.QuatationDetail_model;

/**
 * Servlet implementation class ReceiveController
 */
public class ReceiveController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReceiveController() {
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
		String is_id = request.getParameter("id");
		String status = (String) request.getSession().getAttribute("st");
		HttpSession ses = request.getSession();
		@SuppressWarnings("unchecked")
		List<IncomingProduct_model> ipl = (List<IncomingProduct_model>) ses
				.getAttribute("qtylist");

		PurchaseDao pp = new PurchaseDaoImp();
		PurchaseDaoImp pp1 = new PurchaseDaoImp();
		PurchaseUpdateDao pu = new PurchaseUpdateDaoImp();
		IncomingProduct_model ip = new IncomingProduct_model();
		IncomingProduct_model ip2 = new IncomingProduct_model();
		IncomingShippment_model ins = new IncomingShippment_model();
		 IncomingShippment_model ins1 = new IncomingShippment_model();
		System.out.println("id is " + is_id + "  " + status);
		List<IncomingProduct_model> lq = pp1.viewIncomingProductInfo2(
				Integer.parseInt(is_id), status);
		List<IncomingShippment_model> lsl = pp1
				.viewIncomingShippmentInfo1(Integer.parseInt(is_id));

		String[] dt = request.getParameterValues("qnty");
		System.out.println("--------------------------" + action);
		if (action.equalsIgnoreCase("Receive Products")) {
			System.out.println("hiiiiiiiiiiiiiii");
			// change
			int cnt = 0,c=0,l=0;

			// changed
			
			for (int j = 0; j < ipl.size(); j++) {
				int prodid = ipl.get(j).getIncomingproduct_id();

				double qnt = lq.get(j).getQuantity();
				System.out.println("=========OldQty===>>>>" + qnt);

				System.out.println("============NewQty===>>>>" + dt[j]);

				if (Double.parseDouble(dt[j]) == qnt) {
					cnt++;
					l++;
					System.out.println("hiiiiii Equal====");
					ip.setIncomingproduct_id(prodid);
					System.out.print("+=============+" + prodid);
					ip.setUpdated_by(userid);
					ip.setStatus("Done");
					pu.updateStatusIncomingProduct(ip);
					/*ins.setStatus("Received");
					ins.setIncomingshippment_id(lsl.get(0).getIncomingshippment_id());
				//ins.setPurchaseorder_id(lsl.get(0).getPurchaseorder_id());
					System.out.println("inidis "+lsl.get(0).getIncomingshippment_id());
					ins.setUpdated_by(userid);
					pu.updateStatusIncomingShippment(ins);*/
				} else if (Double.parseDouble(dt[j]) < qnt) {
					double ans = qnt - Double.parseDouble(dt[j]);
					c++;
					System.out.println("hiiiiii UnEqual====" + ans);
					System.out.println("++prodid---------------" + prodid);
					List<IncomingProduct_model> plist = pp
							.viewIncomingProductByprodid(prodid);
					double uprice = plist.get(0).getUnit_price();
					double sbtotal = uprice * ans;

					pu.updateStatusIncomingProductQty(prodid,
							Double.parseDouble(dt[j]), sbtotal);
					ip.setIncomingproduct_id(prodid);
					ip.setUpdated_by(userid);
					ip.setStatus("Done");

					GenericsDao<IncomingProduct_model> gis1 = new GenericsImp<IncomingProduct_model>();

					ip2.setActiveflag("Y");
					ip2.setCreated_by(plist.get(0).getCreated_by());
					ip2.setDescription(plist.get(0).getDescription());
					System.out.println("new id" + plist.size() + "id ins "
							+ plist.get(0).getIncomingshippment_id());
					ip2.setIncomingshippment_id(plist.get(0)
							.getIncomingshippment_id());
					ip2.setItem(plist.get(0).getItem());
					ip2.setItemsizeid(plist.get(0).getItemsizeid());
					ip2.setProduct(plist.get(0).getProduct());

					ip2.setQuantity(ans);
					ip2.setSchedule_dt(plist.get(0).getSchedule_dt());
					ip2.setSourcedocument(plist.get(0).getSourcedocument());
					ip2.setSubtotal(plist.get(0).getSubtotal());
					ip2.setTaxs(plist.get(0).getTaxs());
					ip2.setUnit_price(plist.get(0).getUnit_price());
					ip2.setUpdated_by(plist.get(0).getUpdated_by());
					// System.out.println(ip2.getDescription());
					pu.updateStatusIncomingProduct(ip);

					ip2.setStatus("Available");
					gis1.insertData(ip2);

					System.out.println("rajnikant");
					GenericsDao<IncomingShippment_model> gi = new GenericsImp<IncomingShippment_model>();
					System.out.println("rajnikant1111" + lsl.size());

					ins1.setPurchaseorder_id(lsl.get(0).getPurchaseorder_id());
					ins1.setSupplier(lsl.get(0).getSupplier());
					ins1.setDeliverymethod(lsl.get(0).getDeliverymethod());
					ins1.setCode(lsl.get(0).getCode());
					ins1.setAutopicking(lsl.get(0).getAutopicking());

					ins1.setBackorder(lsl.get(0).getBackorder());
					ins1.setOrder_dt(lsl.get(0).getOrder_dt());
					ins1.setExpected_dt(lsl.get(0).getExpected_dt());
					ins1.setActiveflag("Y");
					ins1.setCreated_by(userid);

					ins1.setInvoicecontrol(lsl.get(0).getInvoicecontrol());
					ins1.setPaymentterm(lsl.get(0).getPaymentterm());
					ins1.setTaxes(lsl.get(0).getTaxes());
					ins1.setUntaxted_amount(lsl.get(0).getUntaxted_amount());
					ins1.setTotal(lsl.get(0).getTotal());

					ins1.setDescription(lsl.get(0).getDescription());
					ins1.setUpdated_by(userid);
					ins1.setCreated_by(userid);
					ins1.setPrefix("IN/000");
					ins1.setStatus("Received");

					ins1.setSupplier_ref(lsl.get(0).getSupplier_ref());
					System.out.println("rajnikant");
					gi.insertData(ins1);
					//pu.updateStatusIncomingShippment(ins1);
					System.out.println("rajnikant");
				}

				if (cnt == ipl.size()) {

					ins.setStatus("Done");
					ins.setPurchaseorder_id(lsl.get(0).getPurchaseorder_id());
					ins.setUpdated_by(userid);
					pu.updateStatusIncomingShippment1(ins);
				}
			}
			System.out.println("llll"+l+" ccc"+c);
			
		}
	}

}
