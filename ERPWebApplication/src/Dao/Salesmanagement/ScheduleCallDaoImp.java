package Dao.Salesmanagement;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import InterFace.SalesManagement.ScheduleCallDao;
import Model.SalesManagement.ScheduleCall_model;
import Model.SalesManagement.logged_call_model;
import Model.UserManagement.UserModel;
import Util.hibernateUtil;

public class ScheduleCallDaoImp implements ScheduleCallDao
{
	Session session=null;
	Transaction tx=null;

	@Override
	public ArrayList<ScheduleCall_model> viewScheduleCalls(ScheduleCall_model sch) {
		ArrayList<ScheduleCall_model> lst= new ArrayList<ScheduleCall_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q= session.createQuery("from ScheduledCall_model where created_by="+sch.getCreated_by());
			lst=(ArrayList<ScheduleCall_model>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return lst;
	}

	@Override
	public List<ScheduleCall_model> viewScheduleCallByid(int id1) {
		
			session = hibernateUtil.openSession();
			session.beginTransaction();
			int j=0;
			String act="y";
			Query q1=session.createQuery("from ScheduleCall_model where created_by='"+id1+"' and active_flag='"+act+"'");
		   List list5=q1.list();
		   session.getTransaction().commit();
			session.close();
			return list5;
		
	}

	@Override
	public ArrayList<ScheduleCall_model> viewScheduleInfo(int scid) {
		// TODO Auto-generated method stub
		ArrayList<ScheduleCall_model> list= new ArrayList<ScheduleCall_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from ScheduleCall_model where schedulecallid="+scid);
			list=(ArrayList<ScheduleCall_model>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return list;
	}

	@Override
	public List<UserModel> viewUserbyRespid(int id1) {
		session = hibernateUtil.openSession();
		session.beginTransaction();
		Query q=session.createQuery("from  UserModel where userid="+id1);
	   List list=q.list();
	   session.getTransaction().commit();
		session.close();
		
		return list;
	}

	@Override
	public List<logged_call_model> ViewLoggedCallByid(int id1) {
		session = hibernateUtil.openSession();
		session.beginTransaction();
		int j=0;
		Query q1=session.createQuery("from logged_call_model where created_by='"+id1+"' ");
	   List list5=q1.list();
	   session.getTransaction().commit();
		session.close();
		return list5;
	}

	@Override
	public ArrayList<logged_call_model> viewloggedInfo(int sc_id)
	{
		ArrayList<logged_call_model> list= new ArrayList<logged_call_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from logged_call_model where loggedcallid="+sc_id);
			list=(ArrayList<logged_call_model>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return list;
	}
}
