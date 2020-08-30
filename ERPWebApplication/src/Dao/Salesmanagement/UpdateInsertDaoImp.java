package Dao.Salesmanagement;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;


import InterFace.SalesManagement.UpdateInsertDao;
import Model.PurchaseManagement.QuatationDetail_model;
import Model.PurchaseManagement.Quatation_model;
import Model.SalesManagement.Lead_model;
import Model.SalesManagement.Meeting_model;
import Model.SalesManagement.QuatationSale_model;
import Model.SalesManagement.ScheduleCall_model;
import Model.SalesManagement.customer_model;
import Model.SalesManagement.logged_call_model;
import Model.UserManagement.UserModel;
import Model.Warehouse.delivaryorders_model;
import Model.Warehouse.delivaryproducts_model;
import Util.hibernateUtil;

public class UpdateInsertDaoImp implements UpdateInsertDao 
{
	Session session=null;
	Transaction tx=null;
	@Override
	public boolean updateCustomerData(customer_model c)
	{
		boolean flg=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
		SQLQuery q= session.createSQLQuery("update customer_master set customername='"+c.getCustomername()+"',description='"+c.getDescription()+"',emailid='"+c.getEmailid()+"',companyid='"+c.getCompanyid()+"',mobile1='"+c.getMobile1()+"',mobile2='"+c.getMobile2()+"',website='"+c.getWebsite()+"', address='"+c.getAddress()+"', cid="+c.getCid()+", sid="+c.getSid()+ ", cityid='"+c.getCityid()+"',jobposition='"+c.getJobposition()+"',titleid='"+c.getTitleid()+"',faxno='"+c.getFaxno()+"',updated_by='"+c.getUpdated_by()+"' where customerid='"+c.getCustomerid()+"'");
		
			//Query q= session.createQuery("UPDATE customer_master SET customername='"+c.getCustomername()+"' where customerid='"+c.getCustomerid()+"'");
		q.addEntity(customer_model.class);
			int i=q.executeUpdate();
			if(i>0)
				flg=true;
			tx.commit();
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return flg;
	}
	@Override
	public boolean updateStatus(int idd, int value) {
		boolean flg=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
		
		SQLQuery q=session.createSQLQuery("UPDATE customer_master SET status="+value+" WHERE customerid="+idd);
		q.addEntity(customer_model.class);
		int i=q.executeUpdate();
		if(i>0)
			flg=true;
		tx.commit();
	}catch(Throwable ex){
		if(tx != null)
			tx.rollback();
		ex.printStackTrace();
	}
	finally{
		session.close();
	}
	return flg;
	}
	@Override
	public boolean updateScheduledCall(ScheduleCall_model sch) {
		boolean flg=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("update ScheduleCall_model set summary='"+sch.getSummary()+"',scheduledt='"+sch.getScheduledt()+"',customerid='"+sch.getCustomerid()+"',responsible='"+sch.getResponsible()+"',category='"+sch.getCategory()+"',priority='"+sch.getPriority()+"',phone='"+sch.getPhone()+"',mobile1='"+sch.getMobile1()+"',mobile2='"+sch.getMobile2()+"',description='"+sch.getDescription()+"',updated_by='"+sch.getUpdated_by()+"',status='"+sch.getStatus()+"' where schedulecallid="+sch.getSchedulecallid());
			int i=q.executeUpdate();
			if(i>0)
				flg=true;
			tx.commit();
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return flg;
	}
	@Override
	public boolean DeleteScheduleCall(int del_id) {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q= session.createQuery("delete from ScheduleCall_model where schedulecallid="+del_id);
			int i=q.executeUpdate();
			if(i>0)
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
	public boolean updateloggedCall(logged_call_model sch) {
		boolean flg=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("update logged_call_model set summary='"+sch.getSummary()+"',date='"+sch.getDate()+"',contact='"+sch.getContact()+"',responsible='"+sch.getResponsible()+"',mobile='"+sch.getMobile()+"',updated_by='"+sch.getUpdated_by()+"' where loggedcallid="+sch.getLoggedcallid());
			
			int i=q.executeUpdate();
			if(i>0)
				flg=true;
			tx.commit();
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return flg;
	}
	@Override
	public boolean updateLead(Lead_model l) {
		boolean flg=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q =session.createQuery("update Lead_model set subject='"+l.getSubject()+"', leaddt='"+l.getLeaddt()+"', customerid="+l.getCustomerid()+", contactname='"+l.getContactname()+"',titleid="+l.getTitleid()+",categoryid='"+l.getCategoryid()+"', priority='"+l.getPriority()+"', address='"+l.getAddress()+"', email='"+l.getEmail()+"', fax_no='"+l.getFax_no()+"', phone='"+l.getPhone()+"', mobile1='"+l.getMobile1()+"', mobile2='"+l.getMobile2()+"', description='"+l.getDescription()+"', updated_by="+l.getUpdated_by()+", stage='"+l.getStage()+"' where lead_id="+l.getLead_id());
			int i=q.executeUpdate();
			if(i>0)
				flg=true;
			tx.commit();
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return flg;
	}
	@Override
	public boolean updateStatuslead(int idd) 
	{
		boolean flg=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
		String val="N";
		SQLQuery q=session.createSQLQuery("UPDATE lead_master SET active_flag='"+val+"' WHERE lead_id="+idd);
		q.addEntity(Lead_model.class);
		int i=q.executeUpdate();
		if(i>0)
			flg=true;
		tx.commit();
	}catch(Throwable ex){
		if(tx != null)
			tx.rollback();
		ex.printStackTrace();
	}
	finally{
		session.close();
	}
	return flg;
	
	}
	@Override
	public boolean updateMeeting(Meeting_model m) 
	{
		// TODO Auto-generated method stub
				boolean flag=false;
				try{
					session=hibernateUtil.openSession();
					tx=session.beginTransaction();
					Query q=session.createQuery("update Meeting_model set subject='"+m.getSubject()+"',date='"+m.getDate()+"',duration='"+m.getDuration()+"',attendies='"+m.getAttendies()+"',responsible='"+m.getResponsible()+"',location='"+m.getLocation()+"',description='"+m.getDescription()+"',updated_by='"+m.getUpdated_by()+"',attendees_names='"+m.getAttendees_names()+"' where meeting_id="+m.getMeeting_id());
					int i=q.executeUpdate();
					if(i>0)
						flag=true;
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
	public boolean updateMeetingActiveflag(int m) {
		boolean flg=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
		String val="N";
		SQLQuery q=session.createSQLQuery("UPDATE meeting_master SET active_flag='"+val+"' WHERE meeting_id="+m);
		q.addEntity(Meeting_model.class);
		int i=q.executeUpdate();
		if(i>0)
			flg=true;
		tx.commit();
	}catch(Throwable ex){
		if(tx != null)
			tx.rollback();
		ex.printStackTrace();
	}
	finally{
		session.close();
	}
	return flg;
	
	}
	@Override
	public boolean updateStatusSaleQuatation(QuatationSale_model pq) {
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("update QuatationSale_model set status='"+pq.getStatus()+"',updated_by="+pq.getUpdated_by()+" where quotationsale_id="+pq.getQuotationsale_id());
			int i=q.executeUpdate();
			if(i>0)
				flag=true;
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
	public boolean updateActiveFlagQuatationSaleDetail(int iid) {
		boolean flg=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			String a="N";
		SQLQuery q= session.createSQLQuery("update quatationsaledetail_master set activeflag='"+a+"' where quotationsale_id="+iid);
		
			
		q.addEntity(QuatationDetail_model.class);
			int i=q.executeUpdate();
			if(i>0)
				flg=true;
			tx.commit();
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return flg;
	}
	@Override
	public boolean updateActiveFlagQuatation(int iid) {
		boolean flg=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			String a="N";
		SQLQuery q= session.createSQLQuery("update quatationsale_master set activeflag='"+a+"' where quotationsale_id="+iid);
		
			
		q.addEntity(Quatation_model.class);
			int i=q.executeUpdate();
			if(i>0)
				flg=true;
			tx.commit();
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return flg;
	}
	@Override
	public boolean updateSalesQuotation(QuatationSale_model sq) {
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("update QuatationSale_model set customer='"+sq.getCustomer()+"',customer_ref='"+sq.getCustomer_ref()+"',order_dt='"+sq.getOrder_dt()+"',responsible='"+sq.getResponsible()+"',paymentterm='"+sq.getPaymentterm()+"',shippingmethod='"+sq.getShippingmethod()+"',createinvoice='"+sq.getCreateinvoice()+"',t_c='"+sq.getT_c()+"',updated_by='"+sq.getUpdated_by()+"',untaxted_amount='"+sq.getUntaxted_amount()+"',taxes='"+sq.getTaxes()+"',total='"+sq.getTotal()+"' where quotationsale_id="+sq.getQuotationsale_id());
			int i=q.executeUpdate();
			if(i>0)
				flag=true;
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
	public boolean deleteQuotationDtail(int q_id) {
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			
				Query q=session.createQuery("delete from QuatationSaleDetail_model where quotationsale_id="+q_id);
				int i=q.executeUpdate();
				if(i>0)
					flag=true;
			
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
	public boolean updateStatusDelivaryOrder(delivaryorders_model d) {
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("update delivaryorders_model set status='"+d.getStatus()+"',updated_by="+d.getUpdated_by()+" where delivaryorder_id="+d.getDelivaryorder_id());
			int i=q.executeUpdate();
			if(i>0)
				flag=true;
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
	public boolean updateStatusDelivaryProduct(delivaryproducts_model dp) 
	{
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("update delivaryproducts_model set status='"+dp.getStatus()+"',updated_by="+dp.getUpdated_by()+" where delivaryorder_id="+dp.getDelivaryorder_id());
			int i=q.executeUpdate();
			if(i>0)
				flag=true;
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
}
