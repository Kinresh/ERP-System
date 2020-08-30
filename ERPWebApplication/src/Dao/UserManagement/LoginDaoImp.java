package Dao.UserManagement;

import java.util.List;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import InterFace.UserManagement.LoginDao;
import Model.UserManagement.UserModel;
import Util.hibernateUtil;

public class LoginDaoImp implements LoginDao
{
	Transaction tx=null;
	Session session;
	@Override
	public List<UserModel> checkAuthentication(UserModel u) {

			int z=0;
			session= hibernateUtil.openSession();
			session.beginTransaction();
			Query q=session.createQuery("from UserModel where username='"+u.getUsername()+"' and password='"+u.getPassword()+"' and assignedright="+z+" and roleid='"+u.getRoleid()+"' and active_flag='"+z+"'");
		   
			List list=q.list();
		  
		    session.getTransaction().commit();
		    session.close();
		    
		    return list;

	}

}
