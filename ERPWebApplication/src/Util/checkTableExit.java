package Util;

import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;


public class checkTableExit {
public boolean getCheck(String tablename) throws SQLException
{
	boolean flag=false; 

	 String url = "jdbc:mysql://localhost:3306/";
     String dbName = "siya";
     String driver = "com.mysql.jdbc.Driver";
     String userName = "root";
     String password = "root";
     Connection conn=null;
   
     try {
		Class.forName(driver).newInstance();
		 conn = (Connection) DriverManager.getConnection(url+dbName,userName,password);
		 DatabaseMetaData md2 = (DatabaseMetaData) conn.getMetaData();
		 ResultSet rsTables = md2.getTables(null, null, tablename, null);
		  if (rsTables.next()) {
		   flag=true;
		     }
		  else
		  {
			  flag=false;
		  }
		   
		 
	} catch (InstantiationException | IllegalAccessException
			| ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    
    
    	 conn.close();
     
     return flag;

}
}
