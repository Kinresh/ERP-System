package Util;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Model.SalesManagement.Lead_model;
import Model.SalesManagement.ScheduleCall_model;
import Model.SalesManagement.customer_model;
import Model.UserManagement.UserModel;

public class Deletetable
{
	Transaction tx=null;
	Session session;
	public void deletename(int idd) 
	{
		session = hibernateUtil.openSession();
		session.beginTransaction();
		String val="n";
		System.out.print("enter--------------------------------------------");
	SQLQuery q=session.createSQLQuery("UPDATE customer_master SET active_flag='"+val+"' WHERE customerid="+idd);
	SQLQuery q1=session.createSQLQuery("UPDATE lead_master SET active_flag='"+val+"' WHERE customerid="+idd);
	SQLQuery q2=session.createSQLQuery("UPDATE schedulecall_mst SET active_flag='"+val+"' WHERE customerid="+idd);
	q.addEntity(customer_model.class);
	q1.addEntity(Lead_model.class);
	q2.addEntity(ScheduleCall_model.class);
	q.executeUpdate();
	q1.executeUpdate();
	q2.executeUpdate();
	
	session.getTransaction().commit();
	session.close();
	}

}
