package InterFace.UserManagement;

import java.util.List;

import Model.UserManagement.UserModel;

public interface LoginDao

{
	
	public List<UserModel> checkAuthentication(UserModel u);

}
