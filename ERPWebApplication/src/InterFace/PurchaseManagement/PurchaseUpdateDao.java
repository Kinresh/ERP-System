package InterFace.PurchaseManagement;

import Model.PurchaseManagement.IncomingProduct_model;
import Model.PurchaseManagement.IncomingShippment_model;
import Model.PurchaseManagement.Item_Size_model;
import Model.PurchaseManagement.Item_model;
import Model.PurchaseManagement.Product_model;
import Model.PurchaseManagement.Quatation_model;
import Model.PurchaseManagement.Supplier_model;
import Model.SalesManagement.customer_model;

public interface PurchaseUpdateDao
{
	public boolean updateProductData(Product_model c);
	public boolean updateActiveFlag(int pid);
	public boolean updateActiveFlagItem(int iid);
	public boolean updateItemSize(Item_Size_model c);
	public boolean updateItemData(Item_model c);
	public boolean updateSupplier(Supplier_model s);
	public boolean updateActiveFlagSupplier(int iid);
	public boolean updateActiveFlagQuatation(int iid);
	public boolean updateActiveFlagQuatationDetail(int iid);
	
	public boolean updateStatusQuatation(Quatation_model pq);
	public boolean updateQuotation(Quatation_model pq);
	public boolean deleteQ_Detail(int q_id);
	public boolean updatePurFlag(int qqid);
	public boolean updateStatusIncomingProduct(IncomingProduct_model pq);
	public boolean updateStatusIncomingShippment(IncomingShippment_model pq);
	public boolean updateStatusIncomingProductQty(int prodid,double qty,double sbtotal);
	public boolean updateStatusIncomingShippment1(IncomingShippment_model pq);
	
	
}
