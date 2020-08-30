package InterFace.SalesManagement;

import java.util.ArrayList;
import java.util.List;

import Model.SalesManagement.ScheduleCall_model;
import Model.SalesManagement.logged_call_model;
import Model.UserManagement.UserModel;



public interface ScheduleCallDao 
{
	public ArrayList<ScheduleCall_model> viewScheduleCalls(ScheduleCall_model sc);
	public List<ScheduleCall_model> viewScheduleCallByid(int id1);
	public ArrayList<ScheduleCall_model> viewScheduleInfo(int sc_id);
	public List<UserModel> viewUserbyRespid(int id1);
	public List<logged_call_model> ViewLoggedCallByid(int id1);
	public ArrayList<logged_call_model> viewloggedInfo(int sc_id);
}
