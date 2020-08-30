package Model.UserManagement;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="assignPriByUser_master")
public class assignPriByUser_model{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int assuserid;
	private int userid;
	private int roleid;
	
	private String pri_id;
	
	private String privilagename;
	

	public String getPrivilagename() {
		return privilagename;
	}


	public void setPrivilagename(String privilagename) {
		this.privilagename = privilagename;
	}


	public String getPri_id() {
		return pri_id;
	}


	public void setPri_id(String pri_id) {
		this.pri_id = pri_id;
	}


	public int getAssuserid() {
		return assuserid;
	}


	public void setAssuserid(int assuserid) {
		this.assuserid = assuserid;
	}


	public int getUserid() {
		return userid;
	}


	public void setUserid(int userid) {
		this.userid = userid;
	}


	public int getRoleid() {
		return roleid;
	}


	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}

	}
