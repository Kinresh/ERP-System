package Dao.UserManagement;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import InterFace.UserManagement.AddInsertDao;
import Model.UserManagement.Role;
import Model.UserManagement.UserModel;
import Model.UserManagement.assignPriByUser_model;
import Model.UserManagement.assignrightsbean;
import Model.UserManagement.citybean;
import Model.UserManagement.countrybean;
import Model.UserManagement.statebean;
import Util.hibernateUtil;


public class AddInsertDaoImp implements AddInsertDao
{
	Transaction tx=null;
	Session session;
	@Override
	public List<statebean> viewstate(int s) {
		session = hibernateUtil.openSession();
		session.beginTransaction();
		Query q=session.createQuery("from  statebean where cid="+s);
	   List list=q.list();
	   session.getTransaction().commit();
		session.close();
		
		return list;
	
	}
	@Override
	public List<citybean> viewcity(int c)
	{
		session = hibernateUtil.openSession();
		session.beginTransaction();
		Query q=session.createQuery("from citybean where sid="+c);
	   List list2=q.list();
	   session.getTransaction().commit();
		session.close();
		
		return list2;
		
	}
	@Override
	public void adddetail(statebean s1) {
		Session s;
		hibernateUtil h=new hibernateUtil();
		 s=h.openSession();
		s.beginTransaction();
		s.save(s1);
		s.getTransaction().commit();
		s.close();
	
		
	}
	@Override
	public List<UserModel> viewUserData(int id1,int v) 
	{
		session = hibernateUtil.openSession();
		session.beginTransaction();
		
		Query q=session.createQuery("from  UserModel where createdby="+id1+" and status="+v);
	   List list=q.list();
	   session.getTransaction().commit();
		session.close();
		
		return list;
	}
	@Override
	public List<UserModel> viewUserData1(String id1) 
	{
		session = hibernateUtil.openSession();
		session.beginTransaction();
		Query q=session.createQuery("from  UserModel where createdby="+id1);
	   List list=q.list();
	   session.getTransaction().commit();
		session.close();
		
		return list;
	}
		@Override
	public List<UserModel> viewDataByRoleId(int id)
	{
		session = hibernateUtil.openSession();
		session.beginTransaction();
		int i=1;
Query q1=session.createQuery("from UserModel where assignedright="+i+" and roleid='"+id+"'");
	   List list4=q1.list();
	   session.getTransaction().commit();
		session.close();
		
		return list4;
	}
		@Override
	public UserModel getByUsername(int userid) {
		session = hibernateUtil.openSession();
		session.beginTransaction();
	
		SQLQuery q= session.createSQLQuery("select * from usermaster where userid='"+userid+"'");
		q.addEntity(UserModel.class);

		@SuppressWarnings("unchecked")
		UserModel user=new UserModel();
		user=(UserModel) q.uniqueResult();
		return user;
			}
		
		@Override
		public List<Role> viewGetRole(int id1) {
			session = hibernateUtil.openSession();
			session.beginTransaction();
			Query q=session.createQuery("from  Role where roleid="+id1);
		   List list=q.list();
		   session.getTransaction().commit();
			session.close();
			
			return list;}
		@Override
		public boolean deleteUser(int u_id)
		{
			System.out.print("---------------------Delete Function---------------------");
			boolean flag=false;
			try{
				
				session=hibernateUtil.openSession();
				tx=session.beginTransaction();
				int j=1;
				Query q = session.createQuery("update usermaster set status="+j+" where userid="+u_id);
				int result=q.executeUpdate();
				if(result > 0)
					flag=true;
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
		@Override
		public List<UserModel> viewUserDataByUserid(int id1) {
			session = hibernateUtil.openSession();
			session.beginTransaction();
			int v=0;
			Query q=session.createQuery("from  UserModel where createdby="+id1+" and status="+v);
		   List list=q.list();
		   session.getTransaction().commit();
			session.close();
			
			return list;
		}
		@Override
		public List<UserModel> viewUser(int id1) {
			session = hibernateUtil.openSession();
			session.beginTransaction();
			Query q=session.createQuery("from  UserModel where userid="+id1);
		   List list=q.list();
		   session.getTransaction().commit();
			session.close();
			
			return list;
		}
		@Override
		public List<assignPriByUser_model> viewUserAssignRight(int id1) {
			session = hibernateUtil.openSession();
			session.beginTransaction();
			Query q=session.createQuery("from  assignPriByUser_model where userid="+id1);
		   List list=q.list();
		   session.getTransaction().commit();
			session.close();
			
			return list;
		}
		@Override
		public String getRole(int r_id) {
			String role_name=new String();
			ArrayList<Role> list= new ArrayList<Role>();
			try{
				session=hibernateUtil.openSession();
				tx=session.beginTransaction();
				Query q= session.createQuery("from Role where roleid="+r_id);
				list=(ArrayList<Role>) q.list();
				role_name=list.get(0).getRoleType();
				
			}catch(Throwable ex){
				if(tx != null)
					tx.rollback();
			ex.printStackTrace();
			}
			finally{
				session.close();
			}
			return role_name;
		}
		@Override
		public String getCountry(int c_id) 
		{
			String country=new String();
			try{
				session=hibernateUtil.openSession();
				tx=session.beginTransaction();
				Query q= session.createQuery("from countrybean where cid="+c_id);
				ArrayList<countrybean> lst=(ArrayList<countrybean>) q.list();
				country=lst.get(0).getCname();
			}catch(Throwable ex){
				if(tx != null)
					tx.rollback();
				ex.printStackTrace();
			}
			finally{
				session.close();
			}
			return country;
		}
		
	
	}
	


