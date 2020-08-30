package Model.UserManagement;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="privilage")
public class privilage_model{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int pri_id;
	
	private String privilagename;

	public int getPri_id() {
		return pri_id;
	}

	public void setPri_id(int pri_id) {
		this.pri_id = pri_id;
	}

	public String getPrivilagename() {
		return privilagename;
	}

	public void setPrivilagename(String privilagename) {
		this.privilagename = privilagename;
	}
	
}
