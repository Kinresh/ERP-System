package Dao.Salesmanagement;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import InterFace.SalesManagement.SalesDao;
import Model.PurchaseManagement.QuatationDetail_model;
import Model.PurchaseManagement.Quatation_model;
import Model.PurchaseManagement.Supplier_model;
import Model.SalesManagement.QuatationSaleDetail_model;
import Model.SalesManagement.QuatationSale_model;
import Model.SalesManagement.SalesOrder_model;
import Model.SalesManagement.customer_model;
import Model.UserManagement.UserModel;
import Model.Warehouse.delivaryorders_model;
import Model.Warehouse.delivaryproducts_model;
import Util.hibernateUtil;

public class SalesDaoImp implements SalesDao
{
	Session session=null;
	Transaction tx=null;

	@Override
	public List<QuatationSale_model> viewQuatationByid(int id) 
	{
		session = hibernateUtil.openSession();
		session.beginTransaction();
		String act="Y";
		Query q1=session.createQuery("from QuatationSale_model where created_by="+id+" and activeflag='"+act+"'");
	   List list5=q1.list();
	   session.getTransaction().commit();
		session.close();
		return list5;
	}

	@Override
	public int lastInc_Id()
	{
		int id=0;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			SQLQuery query=session.createSQLQuery("SELECT max(quotationsale_id)as last_id from quatationsale_master");
			query.addScalar("last_id", Hibernate.STRING);
			List<String> lst=query.list();
			if(!lst.isEmpty()){
			id=Integer.parseInt(lst.get(0));
			}
			tx.commit();
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return id;
	}

	@Override
	public ArrayList<QuatationSale_model> viewSalesQuatationInfo(int qid) 
	{
		ArrayList<QuatationSale_model> list=new ArrayList<QuatationSale_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from QuatationSale_model where quotationsale_id="+qid);
			list=(ArrayList<QuatationSale_model>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return list;
	}

	@Override
	public ArrayList<QuatationSaleDetail_model> viewQuatationSaleDetailInfo(
			int qid) {
		ArrayList<QuatationSaleDetail_model> list=new ArrayList<QuatationSaleDetail_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from QuatationSaleDetail_model where quotationsale_id="+qid);
			list=(ArrayList<QuatationSaleDetail_model>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return list;
	}

	@Override
	public List<UserModel> viewUserDataByUserid(int id1) {
		session = hibernateUtil.openSession();
		session.beginTransaction();
		int v=0;
		Query q=session.createQuery("from  UserModel where userid="+id1+" and status="+v);
	   List list=q.list();
	   session.getTransaction().commit();
		session.close();
		
		return list;
	}

	@Override
	public ArrayList<QuatationSale_model> viewQuatationInfo(int qid) {
		ArrayList<QuatationSale_model> list=new ArrayList<QuatationSale_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from QuatationSale_model where quotationsale_id="+qid);
			list=(ArrayList<QuatationSale_model>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return list;
	}

	@Override
	public boolean insQuotationDetail(ArrayList<QuatationSaleDetail_model> lst) {
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			for(int i=0;i<lst.size();i++){
				boolean i_flag=true;
				QuatationSaleDetail_model sd=lst.get(i);
				int j=(Integer) session.save(sd);
				if(j>0){
					sd=null;
				}
				else
					i_flag=false;
				if(i_flag)
					flag=true;
				else
					break;
			}
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return flag;
	}

	@Override
	public ArrayList<SalesOrder_model> viewSalesOrderInfo(int qid) {
		ArrayList<SalesOrder_model> list=new ArrayList<SalesOrder_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from SalesOrder_model where quotationsale_id="+qid);
			list=(ArrayList<SalesOrder_model>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return list;
	}

	@Override
	public List<SalesOrder_model> viewSalesOrderByid(int id) {
		ArrayList<SalesOrder_model> list=new ArrayList<SalesOrder_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from SalesOrder_model where (status='Sales Order' or status='Done' or status='Sale to Invoice') and created_by="+id);
			list=(ArrayList<SalesOrder_model>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return list;
	}

	@Override
	public int lastIncdelivarorder_Id() {
		int id=0;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			SQLQuery query=session.createSQLQuery("SELECT max(delivaryorder_id)as last_id from delivaryorder_master");
			query.addScalar("last_id", Hibernate.STRING);
			List<String> lst=query.list();
			if(!lst.isEmpty()){
			id=Integer.parseInt(lst.get(0));
			}
			tx.commit();
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return id;
	}

	@Override
	public List<delivaryorders_model> viewDelivaryOrderByid(int id) {
		ArrayList<delivaryorders_model> list=new ArrayList<delivaryorders_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			String act="Y";
			Query q=session.createQuery("from delivaryorders_model where created_by="+id+" and activeflag='"+act+"'");
			list=(ArrayList<delivaryorders_model>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return list;
	}

	@Override
	public List<customer_model> viewcustomerycid(int sid) {
		ArrayList<customer_model> list= new ArrayList<customer_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from customer_model where customerid="+sid);
			list=(ArrayList<customer_model>) q.list();
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
	public List<delivaryproducts_model> viewDelivaryProductByid(int id) {
		ArrayList<delivaryproducts_model> list=new ArrayList<delivaryproducts_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			String act="Y";
			String ss="Waiting Availability";
			Query q=session.createQuery("from delivaryproducts_model where  status='"+ss+"' and  created_by="+id+" and activeflag='"+act+"'");
			list=(ArrayList<delivaryproducts_model>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return list;
	}

	@Override
	public List<delivaryorders_model> viewDelivaryOrderInfo(int id) {
		ArrayList<delivaryorders_model> list=new ArrayList<delivaryorders_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			String act="Y";
			Query q=session.createQuery("from delivaryorders_model where salesorder_id="+id+" and activeflag='"+act+"'");
			list=(ArrayList<delivaryorders_model>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return list;
	}

	@Override
	public List<delivaryproducts_model> viewDelivaryProductInfo(int id)
	{
		ArrayList<delivaryproducts_model> list=new ArrayList<delivaryproducts_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			String act="Y";
			
			Query q=session.createQuery("from delivaryproducts_model  where delivaryorder_id="+id+" and activeflag='"+act+"'");
			list=(ArrayList<delivaryproducts_model>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return list;
	}

	@Override
	public List<delivaryorders_model> viewDelivaryOrderInfobyoid(int id) {
		ArrayList<delivaryorders_model> list=new ArrayList<delivaryorders_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			String act="Y";
			Query q=session.createQuery("from delivaryorders_model where delivaryorder_id="+id+" and activeflag='"+act+"'");
			list=(ArrayList<delivaryorders_model>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return list;
	}

}
