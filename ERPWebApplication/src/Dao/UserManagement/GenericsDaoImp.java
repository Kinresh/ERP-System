package Dao.UserManagement;

import java.util.ArrayList;
import java.util.List;



import org.hibernate.Query;
import org.hibernate.Session;

import InterFace.UserManagement.Generics;
import Util.hibernateUtil;

public class GenericsDaoImp<E> implements Generics<E>
{
	Session s;

	@Override
	public void insertData(E e) {
		hibernateUtil h=new hibernateUtil();
		 s=h.openSession();
		s.beginTransaction();
		s.save(e);
		s.getTransaction().commit();
		s.close();
		
		
	}

	@Override
	public List<E> viewData(E e) {
		Session session=hibernateUtil.openSession();
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

	
}
