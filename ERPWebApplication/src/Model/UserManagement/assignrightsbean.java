package Model.UserManagement;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="assignrights_master")
public class assignrightsbean{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int ass_id;
	private String username;
	private String rights;
	public int getAss_id() {
		return ass_id;
	}
	public void setAss_id(int ass_id) {
		this.ass_id = ass_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRights() {
		return rights;
	}
	public void setRights(String rights) {
		this.rights = rights;
	}
		
}
