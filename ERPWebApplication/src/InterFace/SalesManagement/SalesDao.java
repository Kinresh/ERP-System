package InterFace.SalesManagement;

import java.util.ArrayList;
import java.util.List;

import Model.PurchaseManagement.QuatationDetail_model;
import Model.PurchaseManagement.Quatation_model;
import Model.PurchaseManagement.Supplier_model;
import Model.SalesManagement.QuatationSaleDetail_model;
import Model.SalesManagement.QuatationSale_model;
import Model.SalesManagement.SalesOrder_model;
import Model.SalesManagement.customer_model;
import Model.UserManagement.UserModel;
import Model.Warehouse.delivaryorders_model;
import Model.Warehouse.delivaryproducts_model;

public interface SalesDao {
	public List<QuatationSale_model> viewQuatationByid(int id);
	public int lastInc_Id();
	public ArrayList<QuatationSale_model> viewSalesQuatationInfo(int qid);
	public ArrayList<QuatationSaleDetail_model> viewQuatationSaleDetailInfo(int qid);
	public List<UserModel> viewUserDataByUserid(int id1);
	public ArrayList<QuatationSale_model> viewQuatationInfo(int qid);
	public boolean insQuotationDetail(ArrayList<QuatationSaleDetail_model> lst);
	public ArrayList<SalesOrder_model> viewSalesOrderInfo(int qid);
	public List<SalesOrder_model> viewSalesOrderByid(int id);
	public List<delivaryorders_model> viewDelivaryOrderByid(int id);
	public List<delivaryproducts_model> viewDelivaryProductByid(int id);
	public int lastIncdelivarorder_Id();
	public List<customer_model> viewcustomerycid(int sid);
	public List<delivaryorders_model> viewDelivaryOrderInfo(int id);
	public List<delivaryorders_model> viewDelivaryOrderInfobyoid(int id);
	public List<delivaryproducts_model> viewDelivaryProductInfo(int id);
}
