package Controller.UserManagement;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;

import Dao.UserManagement.GenericsDaoImp;
import InterFace.UserManagement.Generics;
import Model.UserManagement.image_model;

@WebServlet("/AddImage")
public class AddImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddImage() 
    {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out=response.getWriter();
		try
		{
			String ImageFile="";
			String itemName = "";
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			if (!isMultipart)
			{
			
			}
			else
			{
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List items = null;
				try
				{
					items = upload.parseRequest(request);
				}
				catch (FileUploadException e)
				{
					e.getMessage();
				}
		 
				Iterator itr = items.iterator();
				while (itr.hasNext())
				{
					FileItem item = (FileItem) itr.next();
					if (item.isFormField())
					{
						String name = item.getFieldName();
						String value = item.getString();
						if(name.equals("ImageFile"))
						{
							ImageFile=value;
						} 	
					}
					else
					{
						try
						{
							itemName = item.getName();

							//File savedFile = new File("config.getServletContext().getRealPath("/")+"image//"+itemName);

							//String str1=request.getServletContext().getRealPath("../../WebContent/");

							//ServletContext context = getServletContext();
							String str1=request.getServletContext().getRealPath("/");

							out.println("---------path------"+str1);
							File savedFile= new File(str1+"image/"+itemName);

							item.write(savedFile);
						}
						catch (Exception e)
						{
							out.println("Error"+e.getMessage());
						}
					}
				}
				try
				{
					//st.executeUpdate("insert into test values ('"+itemName+"')");
					image_model b=new image_model();
					Generics<image_model> d=new GenericsDaoImp<image_model>();
					b.setImg_name(itemName);
					d.insertData(b);
					response.sendRedirect("view.jsp");
				}
				catch(Exception el)
				{
					System.out.println("Inserting error"+el.getMessage());
				}
			}	
		}
		catch (Exception e)
		{
			out.println(e.getMessage());
		}
	}
}
