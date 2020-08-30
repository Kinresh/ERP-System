package InterFace.UserManagement;

import java.util.List;

import Model.UserManagement.UserModel;
import Model.UserManagement.assignPriByRole_model;

public interface UpdateDao 
{
	public void deleteitem(int idd,int value);
	public List<UserModel> updateitem(int id);
	public void updatefinal(int id1,UserModel u1,int rid);
	public void updatefinalcomp(int pri,String str,String newstr);
	public void updateAssignedStatus(int uid,int value);
	public void blockUnblock(UserModel mst);
	public List<assignPriByRole_model> updateprivilage(int id);
	public void updatefinalprivilage(int pri,String str,String newstr);
	public boolean updateUser(UserModel mst);
	

}
