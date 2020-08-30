package Dao.UserManagement;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import javax.persistence.Table;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import InterFace.UserManagement.UserRightsDao;
import Model.UserManagement.UserModel;
import Model.UserManagement.assignPriByRole_model;
import Model.UserManagement.assignPriByUser_model;
import Model.UserManagement.privilage_component_model;
import Model.UserManagement.privilage_model;
import Util.checkTableExit;
import Util.hibernateUtil;

public class UserRightsDaoImp  implements UserRightsDao
{
	Transaction tx=null;
	Session session;
	

	
	@Override
	public void addFunctionality(privilage_component_model rmodel) {
session = hibernateUtil.openSession();
		
		Class<?> c = privilage_component_model.class;
		Table t = c.getAnnotation(Table.class);
		String tableName = t.name();
		//complete Reflection API work
		System.out.println("table annoatat name :" + tableName);
		session.beginTransaction();
		 	checkTableExit table=new checkTableExit();
		 	try {
				boolean res=table.getCheck(tableName);
				if(res)
				{
					System.out.println("table exits");
					
					
					
		Query q1=session.createQuery("from privilage_component_model where pri_id='"+rmodel.getPri_id()+"'");
	   List<privilage_component_model> list5=q1.list();
	   if(!list5.isEmpty())
	   {
		   System.out.print("Not null");
			privilage_component_model rname=(privilage_component_model) list5.get(0);
			String rightname=new String();
			rightname=rname.getComponentname();
			String[] com=rightname.split(",");
			System.out.print("iiiiiiiiiiii"+rightname);
			boolean check=false;
			for(int i=0;i<com.length;i++)
			{
				if(com[i].equalsIgnoreCase(rmodel.getComponentname())){
					check=true;
					break;
				}
			}
			if(!check)
			{
				rightname=rightname + "," +rmodel.getComponentname();
				System.out.println(rightname);
				String query = "update privilage_component_master SET componentname='"+rightname+"' where pri_id="+rmodel.getPri_id();
				SQLQuery sqlQuery = session.createSQLQuery(query);
				sqlQuery.executeUpdate();
				
				rightname=null;
			}
			
			
					 			
		}
	   else
	   {
		   session.save(rmodel);
			
			
			
	   }
		}
			else
			{
				System.out.println("table not exits");
				session.save(rmodel);
			}
			session.getTransaction().commit();
		} catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
	}

	@Override
	public void assignprivilagebyrole(assignPriByRole_model rmodel)
	{
		session = hibernateUtil.openSession();
		
		Class<?> c = privilage_component_model.class;
		Table t = c.getAnnotation(Table.class);
		String tableName = t.name();
		//complete Reflection API work
		System.out.println("table annoatat name :" + tableName);
		session.beginTransaction();
		 	checkTableExit table=new checkTableExit();
		 	try {
				boolean res=table.getCheck(tableName);
				if(res)
				{
					System.out.println("table exits");
					
					
					
		Query q1=session.createQuery("from assignPriByRole_model where roleid='"+rmodel.getRoleid()+"'");
	   List<assignPriByRole_model> list5=q1.list();
	   if(!list5.isEmpty())
	   {
		   System.out.print("Not null");
			assignPriByRole_model rname=(assignPriByRole_model)list5.get(0);
			String rightname=new String();
			String priid=new String();
			rightname=rname.getPrivilagename();
			priid=rname.getPri_id();
			
			System.out.print("-----privilagename-----------"+rightname);
			rightname=rightname + "," +rmodel.getPrivilagename();
			priid=priid+","+rmodel.getPri_id();
			System.out.println(rightname);
			String query = "update assignpribyrole_master  SET privilagename='"+rightname+"', pri_id='"+priid+"' where roleid="+rmodel.getRoleid();
			SQLQuery sqlQuery = session.createSQLQuery(query);
			sqlQuery.executeUpdate();
			
			rightname=null;
					 			
		}
	   else
	   {
		   session.save(rmodel);
			
			
			
	   }
		}
			else
			{
				System.out.println("table not exits");
				session.save(rmodel);
			}
			session.getTransaction().commit();
		} catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 	
	
		

		
	}

	@Override
	public int viewPriByArray(String priname) 
	{
		System.out.println("%%%%%%%%%%%%%%%%%");
		session = hibernateUtil.openSession();
		
		session.beginTransaction();

	 	SQLQuery q= session.createSQLQuery("select * from privilage where privilagename='"+priname+"'");
	 	q.addEntity(privilage_model.class);
	 	privilage_model r=(privilage_model) q.uniqueResult();
	 	int pri;
	 	if(r == null)
	 	{
	 		System.out.println("null");
	 		return 0;
	 	}
	 	else
	 	{
	 		System.out.println("value");
	 		pri=r.getPri_id();	
	 	}
		return pri;
		}

	@Override
	public ArrayList<assignPriByUser_model> viewUserPrivilageByid(UserModel u) {
		ArrayList<assignPriByUser_model> list= new ArrayList<assignPriByUser_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q =session.createQuery("from assignPriByUser_model where userid="+u.getUserid());
			list=(ArrayList<assignPriByUser_model>) q.list();
			System.out.println("list"+list);
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
	public String getPrivilegeName(int p_id) 
	{
		String p_name=new String();
		ArrayList<privilage_model> pr= new ArrayList<privilage_model>();
		try{
				session=hibernateUtil.openSession();
				tx=session.beginTransaction();
				Query q = session.createQuery("from privilage_model where pri_id="+p_id);
				pr=(ArrayList<privilage_model>) q.list();
				p_name=pr.get(0).getPrivilagename().toString();
				tx.commit();
			
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return p_name;

	}

	@Override
	public String getComponent(int p_id) {
		String co_name=new String();
		ArrayList<privilage_component_model> list= new ArrayList<privilage_component_model>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q= session.createQuery("from privilage_component_model where pri_id="+p_id);
			list=(ArrayList<privilage_component_model>) q.list();
			co_name=list.get(0).getComponentname().toString();
			tx.commit();
			
			
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return co_name;
	
	}

	@Override
	public List<privilage_model> viewprivilage() {
		session = hibernateUtil.openSession();
		session.beginTransaction();
Query q1=session.createQuery("from privilage_model");
	   List list5=q1.list();
	   session.getTransaction().commit();
		session.close();
		
		return list5;	
		}

	@Override
	public List<assignPriByRole_model> viewPrivilage(int deptid1) {
		session = hibernateUtil.openSession();
		session.beginTransaction();
Query q1=session.createQuery("from assignPriByRole_model  where roleid='"+deptid1+"'");
	   List list5=q1.list();
	   session.getTransaction().commit();
		session.close();
		
		return list5;	
	}

}
