package InterFace.UserManagement;

import java.util.List;

public interface Generics<E>

{
	
	public void insertData(E e);
	public List<E> viewData(E e);
	
}
