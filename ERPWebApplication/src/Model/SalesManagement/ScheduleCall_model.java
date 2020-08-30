package Model.SalesManagement;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ScheduleCall_mst")
public class ScheduleCall_model{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	int schedulecallid;
	String summary;
	
private	int customerid;
private	int companyid;
private	String phone;

private	String mobile1;

private	String mobile2;

private	String description;

private	String scheduledt;

private	String category;
private int created_by;

private	int updated_by;

private	int responsible;

private	String priority;

private	String status;

private	String active_flag;

public int getSchedulecallid() {
	return schedulecallid;
}

public void setSchedulecallid(int schedulecallid) {
	this.schedulecallid = schedulecallid;
}

public String getSummary() {
	return summary;
}

public void setSummary(String summary) {
	this.summary = summary;
}

public int getCustomerid() {
	return customerid;
}

public void setCustomerid(int customerid) {
	this.customerid = customerid;
}

public int getCompanyid() {
	return companyid;
}

public void setCompanyid(int companyid) {
	this.companyid = companyid;
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

public String getDescription() {
	return description;
}

public void setDescription(String description) {
	this.description = description;
}

public String getScheduledt() {
	return scheduledt;
}

public void setScheduledt(String scheduledt) {
	this.scheduledt = scheduledt;
}

public String getCategory() {
	return category;
}

public void setCategory(String category) {
	this.category = category;
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

public int getResponsible() {
	return responsible;
}

public void setResponsible(int responsible) {
	this.responsible = responsible;
}

public String getPriority() {
	return priority;
}

public void setPriority(String priority) {
	this.priority = priority;
}

public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}

public String getActive_flag() {
	return active_flag;
}

public void setActive_flag(String active_flag) {
	this.active_flag = active_flag;
}
	
	
}
