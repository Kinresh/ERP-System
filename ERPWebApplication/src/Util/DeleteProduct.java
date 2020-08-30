package Util;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Model.PurchaseManagement.Item_model;
import Model.PurchaseManagement.Product_model;
import Model.SalesManagement.Lead_model;
import Model.SalesManagement.ScheduleCall_model;
import Model.SalesManagement.customer_model;
import Model.UserManagement.UserModel;

public class DeleteProduct
{
	Transaction tx=null;
	Session session;
	public void deleteprod(int idd) 
	{
		session = hibernateUtil.openSession();
		session.beginTransaction();
		String val="N";
		System.out.print("enter--------------------------------------------");
	SQLQuery q=session.createSQLQuery("UPDATE item_master SET active_flag='"+val+"' WHERE productid="+idd);
	SQLQuery q1=session.createSQLQuery("UPDATE product_master SET active_flag='"+val+"' WHERE productid="+idd);
	
	q.addEntity(Item_model.class);
	q1.addEntity(Product_model.class);
	
	q.executeUpdate();
	q1.executeUpdate();
	
	
	session.getTransaction().commit();
	session.close();
	}

}
