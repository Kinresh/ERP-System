package Dao.Salesmanagement;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import InterFace.SalesManagement.GenericsDao;
import InterFace.UserManagement.Generics;
import Util.hibernateUtil;

public class GenericsImp<E> implements GenericsDao<E> {

	Session session;
	Transaction tx=null;
	boolean flag=false;
	@Override
	public void insertData(E e) {
		hibernateUtil h=new hibernateUtil();
		 session=h.openSession();
		session.beginTransaction();
		session.save(e);
		session.getTransaction().commit();
		session.close();
		
		
	}

	@Override
	public List<E> viewData(E e) {
		 session=hibernateUtil.openSession();
		List<E> list=new ArrayList<E>();
		session.beginTransaction();
		String classname=e.getClass().getName();
		System.out.println("class Name :" + classname.substring(classname.lastIndexOf(".") + 1));
		Query q=session.createQuery("from "+classname.substring(classname.lastIndexOf(".") + 1));
		list=q.list();
		session.getTransaction().commit();
		session.close();
		return list;
	}

	@Override
	public boolean insertdetail(E e)
	{
		
	
		try{
		session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			int i=(Integer) session.save(e);
			if(i>0)
				flag=true;
			tx.commit();
			}catch(Throwable ex){
				if(tx != null)
					tx.rollback();
				ex.printStackTrace();
			}
			finally
			{
				session.close();
			}
			return flag;

		}
}
