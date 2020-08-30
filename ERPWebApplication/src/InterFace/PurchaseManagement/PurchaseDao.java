package InterFace.PurchaseManagement;

import java.util.ArrayList;
import java.util.List;

import Model.PurchaseManagement.IncomingProduct_model;
import Model.PurchaseManagement.IncomingShippment_model;
import Model.PurchaseManagement.Item_Size_model;
import Model.PurchaseManagement.Item_model;
import Model.PurchaseManagement.ProductCategory_model;
import Model.PurchaseManagement.Product_model;
import Model.PurchaseManagement.PurchaseOrder_model;
import Model.PurchaseManagement.QuatationDetail_model;
import Model.PurchaseManagement.Quatation_model;
import Model.PurchaseManagement.SuppCompany_model;
import Model.PurchaseManagement.Supplier_model;
import Model.SalesManagement.ScheduleCall_model;
import Model.SalesManagement.customer_model;

public interface PurchaseDao 
{

	public String getProductCategory(int prod_type);
	public List<Product_model> viewProductByid(int uid);
	public String getProductType(int prodc_id);
	public ArrayList<Product_model> viewProductInfo(int p_id);
	public int getProductCategoryid(int prod_id);
	public String getProduct(int prodc_id);
	
	public List<Item_model> viewItemByid(int uid);
	public ArrayList<Item_model> viewItemInfo(int i_id);
	public List<Item_Size_model> viewItemByType(String type,int id);
	public List<Item_Size_model> viewItemSizeBySizeid(int id);
	
	public ArrayList<Item_Size_model> getItemSize(int i_id);
	public int getProductCategoryid(String prod_id);
	public int getProductid(int prod_id);
	public List<Supplier_model> viewSupplierByid(int sid);
	public List<SuppCompany_model> viewcompanybysuppcompid(int cid);
	public ArrayList<Supplier_model> viewSupplierInfo(int s_id);
	public String getTitle(int t_id);
	public ArrayList<Item_model> getItem(int p_id);
	public int lastInc_Id();
	public ArrayList<Quatation_model> viewQuatationId(int supp,String suppRef,String order_dt);
	public ArrayList<Quatation_model> viewQuatationInfo(int qid);
	public ArrayList<QuatationDetail_model> viewQuatationDetailInfo(int qid);
	public ArrayList<PurchaseOrder_model> viewPurchaseOrderInfo(int qid);
	public ArrayList<PurchaseOrder_model> viewPurchaseOrderInfoByPoid(int qid);
	public List<Quatation_model> viewQuatationByid(int id);
	public boolean InsQ_Detail(ArrayList<QuatationDetail_model> lst);
	public List<PurchaseOrder_model> viewPurchseOrderByid(int id);
	public ArrayList<IncomingShippment_model> viewIncomingShippmentInfo(int poid);
	public ArrayList<IncomingProduct_model> viewIncomingProductInfo(int psid);
	public List<IncomingShippment_model> viewIncomingShippmentByid(int id);
	public List<IncomingProduct_model> viewIncomingProductByid(int id);
	public List<IncomingProduct_model> viewIncomingProductByprodid(int prodid);
	public int lastInc_shipId();
	
	
}
