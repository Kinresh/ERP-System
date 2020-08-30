package InterFace.UserManagement;

import java.util.ArrayList;
import java.util.List;

import Model.UserManagement.UserModel;
import Model.UserManagement.assignPriByRole_model;
import Model.UserManagement.assignPriByUser_model;
import Model.UserManagement.privilage_component_model;
import Model.UserManagement.privilage_model;

public interface UserRightsDao
{
	
	
	public void addFunctionality(privilage_component_model rmodel);
	public void assignprivilagebyrole(assignPriByRole_model rmodel);
	public  int viewPriByArray(String array);
	public ArrayList<assignPriByUser_model> viewUserPrivilageByid(UserModel u); 
	public String getPrivilegeName(int p_id) ;
	public String getComponent(int p_id);
	public List<privilage_model> viewprivilage();
	public List<assignPriByRole_model> viewPrivilage(int deptid1);
	

}
