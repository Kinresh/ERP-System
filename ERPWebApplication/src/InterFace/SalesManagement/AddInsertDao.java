package InterFace.SalesManagement;

import java.util.List;
import java.util.ArrayList;




import Model.SalesManagement.Lead_model;
import Model.SalesManagement.Meeting_model;
import Model.SalesManagement.company_model;
import Model.SalesManagement.customer_model;
import Model.UserManagement.UserModel;
import Model.UserManagement.citybean;
import Model.UserManagement.statebean;
import Model.SalesManagement.ScheduleCall_model;

public interface AddInsertDao 
{
	
	
	//---Customer--
	public List<company_model> viewcompanydetail(int compid);
	public List<customer_model> viewCustomerDetail(String id1);
	public List<customer_model> viewCustomerDetailBycompid(String id1);
	
	public List<customer_model> viewCustomerByid(int id1);
	public String getCity(int c_id);
	public String getState(int s_id);
	public String getCountry(int c_id);
	public String getTitle(int t_id);
	public List<statebean> viewstate(int s);
	public List<citybean>  viewcity(int c);
	
	public List<customer_model> viewCustomerBycustid(int id1);
	public List<UserModel> viewUserData(int id1,int status);
	
	public ArrayList<Lead_model> viewleads(int l_id);
	public ArrayList<Lead_model> LeadInfo(int l_id);
	public String getCategory(int c_id);
	public List<Meeting_model> viewMeetingByid(int id1);
	public ArrayList<Meeting_model> MeetingInfo(int l_id);
	//------------//
	
}
