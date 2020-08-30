package Dao.UserManagement;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import InterFace.UserManagement.AddInsertDao;
import InterFace.UserManagement.UpdateDao;
import Model.UserManagement.UserModel;
import Model.UserManagement.assignPriByRole_model;
import Util.hibernateUtil;

public class UpdateDaoImp implements UpdateDao
{
	Transaction tx=null;
	Session session;
	
	@Override
	public void deleteitem(int idd,int value) {
		session = hibernateUtil.openSession();
		session.beginTransaction();
		
		SQLQuery q=session.createSQLQuery("UPDATE usermaster SET status="+value+" WHERE userid="+idd);
		q.addEntity(UserModel.class);
		q.executeUpdate();
		session.getTransaction().commit();
		session.close();
		
		
	}

	@Override
	public List<UserModel> updateitem(int id) {
		session = hibernateUtil.openSession();
		session.beginTransaction();
Query q1=session.createQuery("from UserModel where Userid='"+id+"'");
	   List list7=q1.list();
	   session.getTransaction().commit();
		session.close();
		
		return list7;	
		}

	@Override
	public void updatefinal(int id,UserModel u,int rid)
	{
		session = hibernateUtil.openSession();
		session.beginTransaction();
		
		SQLQuery q=session.createSQLQuery("update usermaster set username='"+u.getUsername()+"', firstname='"+u.getFirstname()+"', lastname='"+u.getLastname()+"', contactno="+u.getContactno()+", address='"+u.getAddress()+"', emailaddress='"+u.getEmailaddress()+"', updatedby="+rid+" where userid='"+id+"'");
		q.addEntity(UserModel.class);
		q.executeUpdate();
		session.getTransaction().commit();
	
	}
	
	@Override
	public void updatefinalcomp(int pri, String str, String newstr) {
		session = hibernateUtil.openSession();
		session.beginTransaction();
		SQLQuery q=session.createSQLQuery("update privilage_component_master set componentname='"+str+","+newstr+"'  where pri_id='"+pri+"'");
		q.addEntity(UserModel.class);
		q.executeUpdate();
		session.getTransaction().commit();
	
		
	}

	@Override
	public void updateAssignedStatus(int uid, int value) {
		session = hibernateUtil.openSession();
		session.beginTransaction();
		SQLQuery q=session.createSQLQuery("UPDATE usermaster SET assignedright="+value+" WHERE userid="+uid);
		q.addEntity(UserModel.class);
		q.executeUpdate();
		session.getTransaction().commit();
		session.close();
		
		
	}

	@Override
	public void blockUnblock(UserModel mst) {
		boolean flag=false;
		System.out.print("**********************Enter------------+"+mst.getUserid());
		AddInsertDao d_obj= new AddInsertDaoImp();
		List<UserModel> lst=d_obj.viewUser(mst.getUserid());
		String status=lst.get(0).getActive_flag();
		System.out.print("**********************Enter--status----------+"+status);
		String modify;
		if(status.equals("0"))
			modify="1";
		else
			modify="0";
		
		session = hibernateUtil.openSession();
		session.beginTransaction();
		SQLQuery q=session.createSQLQuery("UPDATE usermaster SET active_flag='"+modify+"' WHERE userid="+mst.getUserid());
		q.addEntity(UserModel.class);
		q.executeUpdate();
		
		session.getTransaction().commit();
		session.close();
		}

	@Override
	public List<assignPriByRole_model> updateprivilage(int id) {
		session = hibernateUtil.openSession();
		session.beginTransaction();
Query q1=session.createQuery("from assignPriByRole_model where roleid='"+id+"'");
	   List list7=q1.list();
	   session.getTransaction().commit();
		session.close();
		
		return list7;
	}

	
	@Override
	public void updatefinalprivilage(int rdi, String str, String newstr) {
		session = hibernateUtil.openSession();
		session.beginTransaction();
		SQLQuery q=session.createSQLQuery("update assignpribyrole_master set privilagename='"+str+","+newstr+"'  where roleid='"+rdi+"'");
		q.addEntity(UserModel.class);
		q.executeUpdate();
		session.getTransaction().commit();
	
		
	}

	@Override
	public boolean updateUser(UserModel mst) {
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q= session.createQuery("update UserModel set username='"+mst.getUsername()+"',firstname='"+mst.getFirstname()+"', lastname='"+mst.getLastname()+"', roleid='"+mst.getRoleid()+"',gender='"+mst.getGender()+"',birthdate='"+mst.getBirthdate()+"',emailaddress='"+mst.getEmailaddress()+"',address='"+mst.getAddress()+"', description='"+mst.getDescription()+"',cid='"+mst.getCid()+"',cid='"+mst.getSid()+"',cityid='"+mst.getCityid()+"',contactno='"+mst.getContactno()+"',description='"+mst.getDescription()+"',updatedby='"+mst.getUpdatedby()+"' where userid="+mst.getUserid());
			int i=q.executeUpdate();
			if(i>0){
				flag=true;
			}
			tx.commit();
			
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return flag;
	}

}
