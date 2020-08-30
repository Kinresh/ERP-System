package InterFace.UserManagement;

import java.util.List;
import java.util.ArrayList;

import Model.UserManagement.UserModel;

import Model.UserManagement.assignPriByUser_model;
import Model.UserManagement.citybean;
import Model.UserManagement.statebean;
import Model.UserManagement.Role;


public interface AddInsertDao 
{
	
	
	public List<statebean> viewstate(int s);
	public String getCountry(int c_id);
	public List<citybean>  viewcity(int c);
	public void adddetail(statebean s);
	public List<UserModel> viewUserData(int id1,int status);
	public List<UserModel> viewDataByRoleId(int id);
	
	public UserModel getByUsername(int uid);
	public List<UserModel> viewUserData1(String id1);
	public List<assignPriByUser_model> viewUserAssignRight(int id1);
	
	public List<Role> viewGetRole(int id1);
	public boolean deleteUser(int u_id);
	public List<UserModel> viewUserDataByUserid(int id1);
	public List<UserModel> viewUser(int id1);
	public String getRole(int r_id);
	
}
