package Dao.PurchaseManagement;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import InterFace.PurchaseManagement.PurchaseDao;
import Model.PurchaseManagement.IncomingProduct_model;
import Model.PurchaseManagement.IncomingShippment_model;
import Model.PurchaseManagement.Item_Size_model;
import Model.PurchaseManagement.Item_model;
import Model.PurchaseManagement.ProductCategory_model;
import Model.PurchaseManagement.Product_model;
import Model.PurchaseManagement.PurchaseOrder_model;
import Model.PurchaseManagement.QuatationDetail_model;
import Model.PurchaseManagement.Quatation_model;
import Model.PurchaseManagement.SuppCompany_model;
import Model.PurchaseManagement.SuppTitle_model;
import Model.PurchaseManagement.Supplier_model;
import Model.SalesManagement.ScheduleCall_model;
import Util.hibernateUtil;

public class PurchaseDaoImp implements PurchaseDao
{
	Session session=null;
	Transaction tx=null;
	@Override
	public String getProductCategory(int prodc_id) {
		String ptype=new String();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from ProductCategory_model where prod_categoryid="+prodc_id);
			ArrayList<ProductCategory_model> lst=(ArrayList<ProductCategory_model>) q.list();
			ptype=lst.get(0).getProduct_category();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return ptype;
	}
	@Override
	public List<Product_model> viewProductByid(int uid) {
		session = hibernateUtil.openSession();
		session.beginTransaction();
		String act="Y";
		Query q1=session.createQuery("from Product_model where created_by='"+uid+"' and active_flag='"+act+"'");
	   List list5=q1.list();
	   session.getTransaction().commit();
		session.close();
		return list5;
	}
	@Override
	public String getProductType(int prodc_id) {
		String ptype=new String();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from ProductCategory_model where prod_categoryid="+prodc_id);
			ArrayList<ProductCategory_model> lst=(ArrayList<ProductCategory_model>) q.list();
			ptype=lst.get(0).getProduct_type();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return ptype;
	}
	@Override
	public ArrayList<Product_model> viewProductInfo(int p_id)
	{
		ArrayList<Product_model> list= new ArrayList<Product_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Product_model where productid="+p_id);
			list=(ArrayList<Product_model>) q.list();
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
	public int getProductCategoryid(int prod_id) {
		int ptype=0;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from ProductCategory_model where prod_categoryid="+prod_id);
			ArrayList<ProductCategory_model> lst=(ArrayList<ProductCategory_model>) q.list();
			ptype=lst.get(0).getProd_categoryid();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return ptype;
	}
	@Override
	public String getProduct(int prodc_id) {
		String ptype=new String();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Product_model where productid="+prodc_id);
			ArrayList<Product_model> lst=(ArrayList<Product_model>) q.list();
			ptype=lst.get(0).getProduct();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return ptype;
	}
	@Override
	public List<Item_model> viewItemByid(int uid) {
		session = hibernateUtil.openSession();
		session.beginTransaction();
		String act="Y";
		Query q1=session.createQuery("from Item_model where created_by='"+uid+"' and active_flag='"+act+"'");
	   List list5=q1.list();
	   session.getTransaction().commit();
		session.close();
		return list5;
	}
	@Override
	public ArrayList<Item_model> viewItemInfo(int i_id)
	{
		ArrayList<Item_model> list= new ArrayList<Item_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Item_model where itemid="+i_id);
			list=(ArrayList<Item_model>) q.list();
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
	public List<Item_Size_model> viewItemByType(String type,int id) {
		ArrayList<Item_Size_model> list= new ArrayList<Item_Size_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Item_Size_model where productType='"+type+"' and itemid="+id);
			list=(ArrayList<Item_Size_model>) q.list();
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
	public int getProductCategoryid(String prod_id) {
		int ptype=0;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from ProductCategory_model where product_category='"+prod_id+"'");
			ArrayList<ProductCategory_model> lst=(ArrayList<ProductCategory_model>) q.list();
			ptype=lst.get(0).getProd_categoryid();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return ptype;
	}
	@Override
	public int getProductid(int prod_id) {
		int ptype=0;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Product_model where productid="+prod_id);
			ArrayList<Product_model> lst=(ArrayList<Product_model>) q.list();
			ptype=lst.get(0).getProductid();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return ptype;
	}
	@Override
	public List<Supplier_model> viewSupplierByid(int sid) 
	{
		session = hibernateUtil.openSession();
		session.beginTransaction();
		String act="y";
		Query q1=session.createQuery("from Supplier_model where created_by="+sid+" and active_flag='"+act+"'");
	   List list5=q1.list();
	   session.getTransaction().commit();
		session.close();
		return list5;
	}
	@Override
	public List<SuppCompany_model> viewcompanybysuppcompid(int cid) {
		session = hibernateUtil.openSession();
		session.beginTransaction();
		String act="Y";
		Query q1=session.createQuery("from SuppCompany_model where suppcompanyid='"+cid+"' ");
	   List list5=q1.list();
	   session.getTransaction().commit();
		session.close();
		return list5;
	}
	@Override
	public ArrayList<Supplier_model> viewSupplierInfo(int s_id) {
		ArrayList<Supplier_model> list= new ArrayList<Supplier_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Supplier_model where supplierid="+s_id);
			list=(ArrayList<Supplier_model>) q.list();
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
	public String getTitle(int t_id) {
		String title=new String();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from SuppTitle_model where supptitleid="+t_id);
			ArrayList<SuppTitle_model> lst=(ArrayList<SuppTitle_model>) q.list();
			if(!lst.isEmpty())
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
	public ArrayList<Item_Size_model> getItemSize(int i_id) {
		ArrayList<Item_Size_model> list=new ArrayList<Item_Size_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Item_Size_model where itemid="+i_id);
			list=(ArrayList<Item_Size_model>) q.list();
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
	public ArrayList<Item_model> getItem(int p_id) {
		ArrayList<Item_model> list=new ArrayList<Item_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Item_model where productid="+p_id);
			list=(ArrayList<Item_model>) q.list();
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
	public ArrayList<Quatation_model> viewQuatationId(int supp,String suppRef,String order_dt) {
		ArrayList<Quatation_model> list=new ArrayList<Quatation_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Quatation_model where supplier="+supp+" and supplier_ref='"+suppRef+"' and order_dt='"+order_dt+"'");
			list=(ArrayList<Quatation_model>) q.list();
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
	public ArrayList<Quatation_model> viewQuatationInfo(int qid) {
		ArrayList<Quatation_model> list=new ArrayList<Quatation_model>();
		try{
			System.out.println("qqq"+qid);
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Quatation_model where quotation_id="+qid);
			list=(ArrayList<Quatation_model>) q.list();
			System.out.println("qqq"+list.size());
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
	public ArrayList<QuatationDetail_model> viewQuatationDetailInfo(int qid) {
		ArrayList<QuatationDetail_model> list=new ArrayList<QuatationDetail_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from QuatationDetail_model where quotation_id="+qid);
			list=(ArrayList<QuatationDetail_model>) q.list();
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
	public ArrayList<PurchaseOrder_model> viewPurchaseOrderInfo(int qid) {
		ArrayList<PurchaseOrder_model> list=new ArrayList<PurchaseOrder_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from PurchaseOrder_model where quotation_id="+qid);
			list=(ArrayList<PurchaseOrder_model>) q.list();
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
	public int lastInc_Id() {
		// TODO Auto-generated method stub
				int id=0;
				try{
					session=hibernateUtil.openSession();
					tx=session.beginTransaction();
					SQLQuery query=session.createSQLQuery("SELECT max(quotation_id)as last_id from quatation_master");
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
	public List<Quatation_model> viewQuatationByid(int id) 
	{
		session = hibernateUtil.openSession();
		session.beginTransaction();
		String act="Y";
		Query q1=session.createQuery("from Quatation_model where created_by="+id+" and activeflag='"+act+"'");
	   List list5=q1.list();
	   session.getTransaction().commit();
		session.close();
		return list5;
	}
	@Override
	public List<Item_Size_model> viewItemSizeBySizeid(int id) {
		ArrayList<Item_Size_model> list=new ArrayList<Item_Size_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Item_Size_model where itemsizeid="+id);
			list=(ArrayList<Item_Size_model>) q.list();
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
	public boolean InsQ_Detail(ArrayList<QuatationDetail_model> lst) {
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			for(int i=0;i<lst.size();i++){
				boolean i_flag=true;
				QuatationDetail_model qd=lst.get(i);
				int j=(Integer) session.save(qd);
				if(j>0){
					qd=null;
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
	public List<PurchaseOrder_model> viewPurchseOrderByid(int id)
	{
		session = hibernateUtil.openSession();
		session.beginTransaction();
		String act="Y";
		Query q1=session.createQuery("from PurchaseOrder_model where created_by="+id+" and activeflag='"+act+"'");
	   List list5=q1.list();
	   session.getTransaction().commit();
		session.close();
		return list5;
	}
	@Override
	public ArrayList<IncomingShippment_model> viewIncomingShippmentInfo(int poid) {
		ArrayList<IncomingShippment_model> list=new ArrayList<IncomingShippment_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from IncomingShippment_model where purchaseorder_id="+poid);
			list=(ArrayList<IncomingShippment_model>) q.list();
			
			System.out.println("list size0"+list.size()+ " and sta");
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
	public ArrayList<IncomingShippment_model> viewIncomingShippmentInfo2(int poid) {
		ArrayList<IncomingShippment_model> list=new ArrayList<IncomingShippment_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from IncomingShippment_model where purchaseorder_id="+poid);
			list=(ArrayList<IncomingShippment_model>) q.list();
			
			System.out.println("list size"+list.size()+ " and sta");
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
	
	public ArrayList<IncomingShippment_model> viewIncomingShippmentInfo1(int poid) {
		ArrayList<IncomingShippment_model> list=new ArrayList<IncomingShippment_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from IncomingShippment_model where incomingshippment_id="+poid);
			list=(ArrayList<IncomingShippment_model>) q.list();
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
	public ArrayList<IncomingProduct_model> viewIncomingProductInfo(int psid) {
		ArrayList<IncomingProduct_model> list=new ArrayList<IncomingProduct_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from IncomingProduct_model where incomingshippment_id="+psid+" ");
			list=(ArrayList<IncomingProduct_model>) q.list();
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
	
	public ArrayList<IncomingProduct_model> viewIncomingProductInfo1(int psid,String st) {
		ArrayList<IncomingProduct_model> list=new ArrayList<IncomingProduct_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			if(st.equalsIgnoreCase("Ready to Receive"))
			{
			Query q=session.createQuery("from IncomingProduct_model where incomingshippment_id="+psid+" and status='Available'");
			list=(ArrayList<IncomingProduct_model>) q.list();
			}else{
				Query q=session.createQuery("from IncomingProduct_model where incomingshippment_id="+psid+" and status='Done'");
				list=(ArrayList<IncomingProduct_model>) q.list();
					
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
		return list;
	}
	
	public ArrayList<IncomingProduct_model> viewIncomingProductInfo2(int psid,String st) {
		ArrayList<IncomingProduct_model> list=new ArrayList<IncomingProduct_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			if(st.equalsIgnoreCase("Available"))
			{
			Query q=session.createQuery("from IncomingProduct_model where incomingshippment_id="+psid+" and status='Available'");
			list=(ArrayList<IncomingProduct_model>) q.list();
			System.out.println("list size11 "+list.size());
			}else{
				Query q=session.createQuery("from IncomingProduct_model where incomingshippment_id="+psid+" and status='Done'");
				list=(ArrayList<IncomingProduct_model>) q.list();
				System.out.println("list size2"+list.size());	
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
		return list;
	}
	
	@Override
	public ArrayList<PurchaseOrder_model> viewPurchaseOrderInfoByPoid(int qid) 
	{
		ArrayList<PurchaseOrder_model> list=new ArrayList<PurchaseOrder_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from PurchaseOrder_model where purchaseorder_id="+qid);
			list=(ArrayList<PurchaseOrder_model>) q.list();
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
	public List<IncomingShippment_model> viewIncomingShippmentByid(int id) {
		session = hibernateUtil.openSession();
		session.beginTransaction();
	
		String act="Y";
		Query q1=session.createQuery("from IncomingShippment_model where created_by="+id+" and activeflag='"+act+"'");
	   List list5=q1.list();
	   session.getTransaction().commit();
		session.close();
		return list5;
	}
	@Override
	public List<IncomingProduct_model> viewIncomingProductByid(int id) {
		session = hibernateUtil.openSession();
		session.beginTransaction();
		String act="Y";
		String sts="Available";
		Query q1=session.createQuery("from IncomingProduct_model where created_by="+id+" and status='"+sts+"' and activeflag='"+act+"'");
	   List list5=q1.list();
	   session.getTransaction().commit();
		session.close();
		return list5;
	}
	@Override
	public List<IncomingProduct_model> viewIncomingProductByprodid(int prodid) {
		session = hibernateUtil.openSession();
		session.beginTransaction();
		String act="Y";
		String sts="Available";
		Query q1=session.createQuery("from IncomingProduct_model where incomingproduct_id="+prodid);
		
	   List list5=q1.list();
	   System.out.println("sizenew"+list5.size());
	   session.getTransaction().commit();
		session.close();
		return list5;
	}
	@Override
	public int lastInc_shipId() {
		int id=0;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			SQLQuery query=session.createSQLQuery("SELECT max(incomingshippment_id)as last_id from incomingshippment_master");
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
	public int getPOID(int id){
		ArrayList<IncomingShippment_model> list=null;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from IncomingShippment_model where incomingshippment_id="+id+" ");
			 list=(ArrayList<IncomingShippment_model>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return list.get(0).getPurchaseorder_id();
	}
	
	
}
