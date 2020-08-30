package InterFace.SalesManagement;

import java.util.List;

public interface GenericsDao<E>
{

	public void insertData(E e);
	public List<E> viewData(E e);
	public boolean insertdetail(E e);
}
