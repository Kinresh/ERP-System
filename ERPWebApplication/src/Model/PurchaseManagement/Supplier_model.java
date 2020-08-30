package Model.PurchaseManagement;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="supplier_master")
public class Supplier_model{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int supplierid;
	private String suppliername;
	private String description;
	private String emailid;
	private String is_company;
	private int suppcompanyid;
	private String phone;
	private String mobile1;
	private String mobile2;
	private String faxno;
	private String address;
	
	 private int cid;
		private int sid;
		private int cityid;
	private String jobposition;
	private String website;
	private int supptitleid;
	private String zip;
	private String active_flag;
	private int created_by;
	private Date created_dt;
	private Date updated_dt;
	private int updated_by;
	private int status;
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	private String code;
	
	
	public int getSupplierid() {
		return supplierid;
	}
	public void setSupplierid(int supplierid) {
		this.supplierid = supplierid;
	}
	public String getSuppliername() {
		return suppliername;
	}
	public void setSuppliername(String suppliername) {
		this.suppliername = suppliername;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getUpdated_dt() {
		return updated_dt;
	}
	public void setUpdated_dt(Date updated_dt) {
		this.updated_dt = updated_dt;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getIs_company() {
		return is_company;
	}
	public void setIs_company(String is_company) {
		this.is_company = is_company;
	}
	
	
	public int getSuppcompanyid() {
		return suppcompanyid;
	}
	public void setSuppcompanyid(int suppcompanyid) {
		this.suppcompanyid = suppcompanyid;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMobile1() {
		return mobile1;
	}
	public void setMobile1(String mobile1) {
		this.mobile1 = mobile1;
	}
	public String getMobile2() {
		return mobile2;
	}
	public void setMobile2(String mobile2) {
		this.mobile2 = mobile2;
	}
	public String getFaxno() {
		return faxno;
	}
	public void setFaxno(String faxno) {
		this.faxno = faxno;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getCityid() {
		return cityid;
	}
	public void setCityid(int cityid) {
		this.cityid = cityid;
	}
	public String getJobposition() {
		return jobposition;
	}
	public void setJobposition(String jobposition) {
		this.jobposition = jobposition;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public int getSupptitleid() {
		return supptitleid;
	}
	public void setSupptitleid(int supptitleid) {
		this.supptitleid = supptitleid;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getActive_flag() {
		return active_flag;
	}
	public void setActive_flag(String active_flag) {
		this.active_flag = active_flag;
	}
	public int getCreated_by() {
		return created_by;
	}
	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}
	public Date getCreated_dt() {
		return created_dt;
	}
	public void setCreated_dt(Date created_dt) {
		this.created_dt = created_dt;
	}
	public int getUpdated_by() {
		return updated_by;
	}
	public void setUpdated_by(int updated_by) {
		this.updated_by = updated_by;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
		
}
