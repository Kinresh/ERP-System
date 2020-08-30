package Model.PurchaseManagement;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Supptitle_master")
public class SuppTitle_model{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	int supptitleid;
	String title;
	
	public int getSupptitleid() {
		return supptitleid;
	}
	public void setSupptitleid(int supptitleid) {
		this.supptitleid = supptitleid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
}
