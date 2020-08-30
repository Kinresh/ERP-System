package Model.UserManagement;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="usermaster")
public class UserModel{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int userid;
	private int roleid;
	private String username;
	private String password;
	private String firstname;
	private String lastname;
	 private String address;
	 private String gender;
	 private String faxno;
	 private String emailaddress;
	 private String contactno;
	 private int createdby;
	 private Date createddate;
	 private int updatedby;
	 private Date updateddate;
	 private Date lastlogindate;
	 private String birthdate;
	 private int cid;
		private int sid;
		private int cityid;
		private String uplodimg;
		private int assignedright;
		private int status;
		private String active_flag;
		private String description;
		
		
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public String getActive_flag() {
			return active_flag;
		}
		public void setActive_flag(String active_flag) {
			this.active_flag = active_flag;
		}
		public int getStatus() {
			return status;
		}
		public void setStatus(int status) {
			this.status = status;
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
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getFirstname() {
			return firstname;
		}
		public void setFirstname(String firstname) {
			this.firstname = firstname;
		}
		public String getLastname() {
			return lastname;
		}
		public void setLastname(String lastname) {
			this.lastname = lastname;
		}
		
		public int getAssignedright() {
			return assignedright;
		}
		public void setAssignedright(int assignedright) {
			this.assignedright = assignedright;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getGender() {
			return gender;
		}
		public void setGender(String gender) {
			this.gender = gender;
		}
		public String getFaxno() {
			return faxno;
		}
		public void setFaxno(String faxno) {
			this.faxno = faxno;
		}
		public String getEmailaddress() {
			return emailaddress;
		}
		public void setEmailaddress(String emailaddress) {
			this.emailaddress = emailaddress;
		}
		public String getContactno() {
			return contactno;
		}
		public void setContactno(String contactno) {
			this.contactno = contactno;
		}
		public int getCreatedby() {
			return createdby;
		}
		public void setCreatedby(int createdby) {
			this.createdby = createdby;
		}
		public Date getCreateddate() {
			return createddate;
		}
		public void setCreateddate(Date createddate) {
			this.createddate = createddate;
		}
		public int getUpdatedby() {
			return updatedby;
		}
		public void setUpdatedby(int updatedby) {
			this.updatedby = updatedby;
		}
		public Date getUpdateddate() {
			return updateddate;
		}
		public void setUpdateddate(Date updateddate) {
			this.updateddate = updateddate;
		}
		public Date getLastlogindate() {
			return lastlogindate;
		}
		public void setLastlogindate(Date lastlogindate) {
			this.lastlogindate = lastlogindate;
		}
		public String getBirthdate() {
			return birthdate;
		}
		public void setBirthdate(String birthdate) {
			this.birthdate = birthdate;
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
		public String getUplodimg() {
			return uplodimg;
		}
		public void setUplodimg(String uplodimg) {
			this.uplodimg = uplodimg;
		}
	
	

}
