package Model.UserManagement;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="assignPriByRole_master")
public class assignPriByRole_model{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int assroleid;
	private	String privilagename;
	
	private int roleid;
	private String pri_id;
	
	public String getPri_id() {
		return pri_id;
	}

	public void setPri_id(String pri_id) {
		this.pri_id = pri_id;
	}

	public int getAssroleid() {
		return assroleid;
	}

	public void setAssroleid(int assroleid) {
		this.assroleid = assroleid;
	}

	public String getPrivilagename() {
		return privilagename;
	}

	public void setPrivilagename(String privilagename) {
		this.privilagename = privilagename;
	}

	public int getRoleid() {
		return roleid;
	}

	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}
	
	
}
