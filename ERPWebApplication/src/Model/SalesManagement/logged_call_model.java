package Model.SalesManagement;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="loggedCall_master")
public class logged_call_model{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private	int loggedcallid;
	private	String summary;
	private String date;
	private int contact;
	private int responsible;
	private int created_by;
	private int updated_by;
	private String activeflag;
	private String mobile;
	private int companyid;
	
	public String getActiveflag() {
		return activeflag;
	}
	public void setActiveflag(String activeflag) {
		this.activeflag = activeflag;
	}
	public int getCompanyid() {
		return companyid;
	}
	public void setCompanyid(int companyid) {
		this.companyid = companyid;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public int getLoggedcallid() {
		return loggedcallid;
	}
	public void setLoggedcallid(int loggedcallid) {
		this.loggedcallid = loggedcallid;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getContact() {
		return contact;
	}
	public void setContact(int contact) {
		this.contact = contact;
	}
	public int getResponsible() {
		return responsible;
	}
	public void setResponsible(int responsible) {
		this.responsible = responsible;
	}
	public int getCreated_by() {
		return created_by;
	}
	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}
	public int getUpdated_by() {
		return updated_by;
	}
	public void setUpdated_by(int updated_by) {
		this.updated_by = updated_by;
	}
	
	
}
