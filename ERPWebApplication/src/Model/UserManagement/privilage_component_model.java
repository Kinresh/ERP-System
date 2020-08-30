package Model.UserManagement;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="privilage_component_master")
public class privilage_component_model{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int pri_comp_id;
	private int pri_id;
	private String componentname;
	public int getPri_comp_id() {
		return pri_comp_id;
	}
	public void setPri_comp_id(int pri_comp_id) {
		this.pri_comp_id = pri_comp_id;
	}
	public int getPri_id() {
		return pri_id;
	}
	public void setPri_id(int pri_id) {
		this.pri_id = pri_id;
	}
	public String getComponentname() {
		return componentname;
	}
	public void setComponentname(String componentname) {
		this.componentname = componentname;
	}
	
	
	
}
