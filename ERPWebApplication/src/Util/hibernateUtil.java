package Util;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
//import org.hibernate.cfg.Configuration;


public class hibernateUtil 

{
	private static final SessionFactory sessionFactory;
	static {
        try {
        	System.out.println("sf");
        	// Create the SessionFactory from standard (hibernate.cfg.xml) 
            // config file.
            sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
            System.out.println("sf created:"+sessionFactory);
        } catch (Throwable ex) {
            // Log the exception. 
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }
    
    public static Session openSession() {
    	System.out.println("sf in util:"+sessionFactory);
        return sessionFactory.openSession();
    }

	
}
