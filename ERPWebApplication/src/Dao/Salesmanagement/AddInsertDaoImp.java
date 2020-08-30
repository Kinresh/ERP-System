package Dao.Salesmanagement;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import InterFace.SalesManagement.AddInsertDao;

import Model.SalesManagement.Categories_model;
import Model.SalesManagement.Lead_model;
import Model.SalesManagement.Meeting_model;
import Model.SalesManagement.ScheduleCall_model;
import Model.SalesManagement.Title_model;

import Model.SalesManagement.company_model;
import Model.SalesManagement.customer_model;
import Model.UserManagement.UserModel;
import Model.UserManagement.statebean;
import Model.UserManagement.citybean;
import Model.UserManagement.countrybean;
import Util.hibernateUtil;


public class AddInsertDaoImp implements AddInsertDao
{
	Transaction tx=null;
	Session session;
			@Override
		public List<customer_model> viewCustomerDetail(String id1) {
			session = hibernateUtil.openSession();
			session.beginTransaction();
			Query q1=session.createQuery("from customer_model where customerid='"+id1+"'");
		   List list5=q1.list();
		   session.getTransaction().commit();
			session.close();
			return list5;
		}
		@Override
		public List<customer_model> viewCustomerDetailBycompid(String id1) {
			session = hibernateUtil.openSession();
			session.beginTransaction();
			Query q1=session.createQuery("from customer_model where companyid='"+id1+"'");
		   List list5=q1.list();
		   session.getTransaction().commit();
			session.close();
			return list5;
		
		}
		@Override
		public List<company_model> viewcompanydetail(int compid) {
			// TODO Auto-generated method stub
			session = hibernateUtil.openSession();
			session.beginTransaction();
			Query q1=session.createQuery("from company_model where companyid='"+compid+"'");
		   List list5=q1.list();
		   session.getTransaction().commit();
			session.close();
			return list5;
				}
	
		@Override
		public List<customer_model> viewCustomerByid(int id1) {
			session = hibernateUtil.openSession();
			session.beginTransaction();
			int j=0;
			String act="y";
			Query q1=session.createQuery("from customer_model where created_by='"+id1+"' and status="+j+" and active_flag='"+act+"'");
		   List list5=q1.list();
		   session.getTransaction().commit();
			session.close();
			return list5;
		}
		@Override
		public String getCity(int c_id) {
			String city=new String();
			try{
				session=hibernateUtil.openSession();
				tx=session.beginTransaction();
				Query q= session.createQuery("from citybean where cityid="+c_id);
				ArrayList<citybean> lst=(ArrayList<citybean>) q.list();
				city=lst.get(0).getCityname();
				
			}catch(Throwable ex){
				if(tx != null)
					tx.rollback();
				ex.printStackTrace();
			}
			finally{
				session.close();
			}
			return city;
		}
		@Override
		public String getState(int s_id) {
			String state=new String();
			try{
				session=hibernateUtil.openSession();
				tx=session.beginTransaction();
				Query q= session.createQuery("from statebean where sid="+s_id);
				ArrayList<statebean> lst=(ArrayList<statebean>) q.list();
				state=lst.get(0).getStatename();
			}catch(Throwable ex){
				if(tx != null)
					tx.rollback();
				ex.printStackTrace();
			}
			finally{
				session.close();
			}
			return state;
		}
		@Override
		public String getCountry(int c_id) {
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
		@Override
		public String getTitle(int t_id) 
		{
			String title=new String();
			try{
				session=hibernateUtil.openSession();
				tx=session.beginTransaction();
				Query q=session.createQuery("from Title_model where titleid="+t_id);
				ArrayList<Title_model> lst=(ArrayList<Title_model>) q.list();
				title=lst.get(0).getTitle();
				tx.commit();
				
			}catch(Throwable ex){
				if(tx !=null)
					tx.rollback();
				ex.printStackTrace();
			}
			finally{
				session.close();
			}
			return title;
		}
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
		public List<citybean> viewcity(int c) {
			session = hibernateUtil.openSession();
			session.beginTransaction();
			Query q=session.createQuery("from citybean where sid="+c);
		   List list2=q.list();
		   session.getTransaction().commit();
			session.close();
			
			return list2;
		}
		
		@Override
		public List<customer_model> viewCustomerBycustid(int id1) {
			session = hibernateUtil.openSession();
			session.beginTransaction();
			Query q1=session.createQuery("from customer_model where customerid="+id1);
		   List list5=q1.list();
		   session.getTransaction().commit();
			session.close();
			return list5;
		}
		@Override
		public List<UserModel> viewUserData(int id1, int status) {
			session = hibernateUtil.openSession();
			session.beginTransaction();
			
			Query q=session.createQuery("from  UserModel where createdby="+id1+" and status="+status);
		   List list=q.list();
		   session.getTransaction().commit();
			session.close();
			
			return list;
		}
		@Override
		public ArrayList<Lead_model> viewleads(int l_id) {
			ArrayList<Lead_model> lst=new ArrayList<Lead_model>();
			try{
				session=hibernateUtil.openSession();
				tx=session.beginTransaction();
				String s="Y";
				Query q = session.createQuery("from Lead_model where created_by="+l_id+" and active_flag='"+s+"'");
				lst=(ArrayList<Lead_model>) q.list();
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
		public ArrayList<Lead_model> LeadInfo(int l_id)
		{
			ArrayList<Lead_model> lst=new ArrayList<Lead_model>();
			try{
				session=hibernateUtil.openSession();
				tx=session.beginTransaction();
				Query q = session.createQuery("from Lead_model where lead_id="+l_id);
				lst=(ArrayList<Lead_model>) q.list();
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
		public String getCategory(int c_id) {
			String category=new String();
			try{
				session=hibernateUtil.openSession();
				tx=session.beginTransaction();
				Query q=session.createQuery("from Categories_model where categoryid="+c_id);
				ArrayList<Categories_model> lst=(ArrayList<Categories_model>) q.list();
				category=lst.get(0).getCategory();
				tx.commit();
				
			}catch(Throwable ex){
				if(tx != null)
					tx.rollback();
				ex.printStackTrace();
			}
			finally{
				session.close();
			}
			return category;
		}
		@Override
		public List<Meeting_model> viewMeetingByid(int id1) 
		{
			ArrayList<Meeting_model> lst=new ArrayList<Meeting_model>();
			try{
				session=hibernateUtil.openSession();
				tx=session.beginTransaction();
				String s="Y";
				Query q = session.createQuery("from Meeting_model where created_by="+id1+" and active_flag='"+s+"'");
				lst=(ArrayList<Meeting_model>) q.list();
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
		public ArrayList<Meeting_model> MeetingInfo(int l_id) {
			ArrayList<Meeting_model> lst=new ArrayList<Meeting_model>();
			try{
				session=hibernateUtil.openSession();
				tx=session.beginTransaction();
				Query q = session.createQuery("from Meeting_model where meeting_id="+l_id);
				lst=(ArrayList<Meeting_model>) q.list();
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
		
	
	}
	


