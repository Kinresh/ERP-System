package InterFace.SalesManagement;

import Model.PurchaseManagement.Quatation_model;
import Model.SalesManagement.Lead_model;
import Model.SalesManagement.Meeting_model;
import Model.SalesManagement.QuatationSale_model;
import Model.SalesManagement.ScheduleCall_model;
import Model.SalesManagement.customer_model;
import Model.SalesManagement.logged_call_model;
import Model.Warehouse.delivaryorders_model;
import Model.Warehouse.delivaryproducts_model;

public interface UpdateInsertDao
{
	public boolean updateCustomerData(customer_model c);
	public boolean updateStatus(int idd,int value);
	public boolean updateScheduledCall(ScheduleCall_model sch);
	public boolean DeleteScheduleCall(int d_id);
	public boolean updateloggedCall(logged_call_model sch);
	public boolean updateLead(Lead_model l);
	public boolean updateStatuslead(int idd);
	public boolean updateMeeting(Meeting_model m);
	public boolean updateMeetingActiveflag(int m);
	public boolean updateStatusSaleQuatation(QuatationSale_model pq);
	public boolean updateActiveFlagQuatation(int iid);
	public boolean updateActiveFlagQuatationSaleDetail(int iid);
	public boolean updateSalesQuotation(QuatationSale_model sq);
	public boolean deleteQuotationDtail(int q_id);
	public boolean updateStatusDelivaryOrder(delivaryorders_model d);
	public boolean updateStatusDelivaryProduct(delivaryproducts_model dp);
}
