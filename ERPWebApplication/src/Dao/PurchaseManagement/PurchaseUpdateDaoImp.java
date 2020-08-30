package Dao.PurchaseManagement;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import InterFace.PurchaseManagement.PurchaseUpdateDao;

import Model.PurchaseManagement.IncomingProduct_model;
import Model.PurchaseManagement.IncomingShippment_model;
import Model.PurchaseManagement.Item_Size_model;
import Model.PurchaseManagement.Item_model;
import Model.PurchaseManagement.Product_model;
import Model.PurchaseManagement.PurchaseOrder_model;
import Model.PurchaseManagement.QuatationDetail_model;
import Model.PurchaseManagement.Quatation_model;
import Model.PurchaseManagement.Supplier_model;
import Model.SalesManagement.customer_model;
import Util.hibernateUtil;

public class PurchaseUpdateDaoImp  implements PurchaseUpdateDao
{
	Session session=null;
	Transaction tx=null;
	@Override
	public boolean updateProductData(Product_model c)
	{
		boolean flg=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
		SQLQuery q= session.createSQLQuery("update product_master set productType='"+c.getProductType()+"',description='"+c.getDescription()+"',productCategory='"+c.getProductCategory()+"',prod_categoryid="+c.getProd_categoryid()+",product='"+c.getProduct()+"',updated_by='"+c.getUpdated_by()+"' where productid='"+c.getProductid()+"'");
		
			
		q.addEntity(Product_model.class);
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
	public boolean updateActiveFlag(int pid) {
		boolean flg=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			String a="N";
		SQLQuery q= session.createSQLQuery("update product_master set active_flag='"+a+"' where productid="+pid);
		
			
		q.addEntity(Product_model.class);
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
	public boolean updateItemSize(Item_Size_model c)
	{
		boolean flg=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			String a="N";
		SQLQuery q= session.createSQLQuery("update item_size_master set size='"+c.getSize()+"', updated_by="+c.getUpdated_by()+" where itemid="+c.getItemid());
		
		
		
			
		q.addEntity(Item_Size_model.class);
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
	public boolean updateItemData(Item_model c) {
		boolean flg=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
		SQLQuery q= session.createSQLQuery("update item_master set productType='"+c.getProductType()+"',description='"+c.getDescription()+"', productCategory='"+c.getProductCategory()+"' , prod_categoryid=" +c.getProd_categoryid()+" , product='"+c.getProduct()+"', productid="+c.getProductid()+", item='"+c.getItem()+"', updated_by="+c.getUpdated_by()+" where itemid='"+c.getItemid()+"'");
		SQLQuery q1= session.createSQLQuery("update item_size_master set item='"+c.getItem()+"', updated_by="+c.getUpdated_by()+" where itemid='"+c.getItemid()+"'");
		q.addEntity(Item_model.class);
		q1.addEntity(Item_Size_model.class);
			int i=q.executeUpdate();
			int j=q1.executeUpdate();
			if(i>0 || j>0)
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
	public boolean updateActiveFlagItem(int iid) {
		boolean flg=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			String a="N";
		SQLQuery q= session.createSQLQuery("update item_master set active_flag='"+a+"' where itemid="+iid);
		
			
		q.addEntity(Item_model.class);
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
	public boolean updateSupplier(Supplier_model s) 
	{
		// TODO Auto-generated method stub
				boolean flag=false;
				try{
					session=hibernateUtil.openSession();
					tx=session.beginTransaction();
					Query q=session.createQuery("update Supplier_model set suppliername='"+s.getSuppliername()+"', description='"+s.getDescription()+"', emailid='"+s.getEmailid()+"', suppcompanyid='"+s.getSuppcompanyid()+"', phone='"+s.getPhone()+"', mobile1='"+s.getMobile1()+"', mobile2='"+s.getMobile2()+"', website='"+s.getWebsite()+"', address='"+s.getAddress()+"', cid='"+s.getCid()+"', sid='"+s.getSid()+"', cityid='"+s.getCityid()+"', jobposition='"+s.getJobposition()+"', supptitleid='"+s.getSupptitleid()+"', faxno='"+s.getFaxno()+"', updated_by='"+s.getUpdated_by()+"' where supplierid="+s.getSupplierid());
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
	public boolean updateActiveFlagSupplier(int iid)
	{
		boolean flg=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			String a="N";
		SQLQuery q= session.createSQLQuery("update Supplier_master set active_flag='"+a+"' where supplierid="+iid);
		
			
		q.addEntity(Supplier_model.class);
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
	public boolean updateActiveFlagQuatation(int iid)
	{
		boolean flg=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			String a="N";
		SQLQuery q= session.createSQLQuery("update quatation_master set activeflag='"+a+"' where quotation_id="+iid);
		
			
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
	public boolean updateActiveFlagQuatationDetail(int iid) {
		boolean flg=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			String a="N";
		SQLQuery q= session.createSQLQuery("update quatationdetail_master set activeflag='"+a+"' where quotation_id="+iid);
		
			
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
	public boolean updateQuotation(Quatation_model pq) {
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("update Quatation_model set supplier='"+pq.getSupplier()+"',supplier_ref='"+pq.getSupplier_ref()+"',order_dt='"+pq.getOrder_dt()+"',expected_dt='"+pq.getExpected_dt()+"',untaxted_amount='"+pq.getUntaxted_amount()+"',taxes='"+pq.getTaxes()+"',total='"+pq.getTotal()+"',updated_by='"+pq.getUpdated_by()+"',status='"+pq.getStatus()+"',t_c='"+pq.getT_c()+"' where quotation_id="+pq.getQuotation_id());
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
	public boolean deleteQ_Detail(int q_id) {
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			
				Query q=session.createQuery("delete from QuatationDetail_model where quotation_id="+q_id);
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
	public boolean updateStatusQuatation(Quatation_model pq) {
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("update Quatation_model set status='"+pq.getStatus()+"',updated_by="+pq.getUpdated_by()+" where quotation_id="+pq.getQuotation_id());
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
	public boolean updatePurFlag(int qqid) {
		boolean flg=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			String a="N";
		SQLQuery q= session.createSQLQuery("update purchaseorder_master set flag='"+a+"' where quotation_id="+qqid);
		
			
		q.addEntity(PurchaseOrder_model.class);
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
	public boolean updateStatusIncomingProduct(IncomingProduct_model pq) {
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("update IncomingProduct_model set status='"+pq.getStatus()+"',updated_by="+pq.getUpdated_by()+" where incomingproduct_id="+pq.getIncomingproduct_id());
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
	public boolean updateStatusIncomingShippment(IncomingShippment_model pq) 
	{
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("update IncomingShippment_model set status='"+pq.getStatus()+"',updated_by="+pq.getUpdated_by()+" where incomingshippment_id="+pq.getIncomingshippment_id());
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
	public boolean updateStatusIncomingShippment1(IncomingShippment_model pq) 
	{
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("update IncomingShippment_model set status='"+pq.getStatus()+"',updated_by="+pq.getUpdated_by()+" where purchaseorder_id="+pq.getPurchaseorder_id());
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
	public boolean updateStatusIncomingProductQty(int prodid,double qty,double sbtotal) {
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("update IncomingProduct_model set quantity="+qty+",subtotal="+sbtotal+" where incomingproduct_id="+prodid);
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
