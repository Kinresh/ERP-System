package Model.SalesManagement;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Meeting_master")
public class Meeting_model{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int meeting_id;
	private String subject;
	private String date;
	private String duration;
	private String attendies;
	private int responsible;
	private String location;
	private String description;
	private int created_by;
	private int updated_by;
	private String attendees_names;
	private String active_flag;
	public int getMeeting_id() {
		return meeting_id;
	}
	public void setMeeting_id(int meeting_id) {
		this.meeting_id = meeting_id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getAttendies() {
		return attendies;
	}
	public void setAttendies(String attendies) {
		this.attendies = attendies;
	}
	public int getResponsible() {
		return responsible;
	}
	public void setResponsible(int responsible) {
		this.responsible = responsible;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
	public String getAttendees_names() {
		return attendees_names;
	}
	public void setAttendees_names(String attendees_names) {
		this.attendees_names = attendees_names;
	}
	public String getActive_flag() {
		return active_flag;
	}
	public void setActive_flag(String active_flag) {
		this.active_flag = active_flag;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
