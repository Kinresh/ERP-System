package Model.PurchaseManagement;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="item_size_master")
public class Item_Size_model
{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private	int itemsizeid;
	private int itemid;
	
	private String productType;
	private String size;
	private String active_flag;
	private int created_by;
	private Date created_dt;
	private int updated_by;
	private Date updated_dt;
	private String item;
	
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	
	
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
		this.productType = productType;
	}
	public int getItemsizeid() {
		return itemsizeid;
	}
	public void setItemsizeid(int itemsizeid) {
		this.itemsizeid = itemsizeid;
	}
	public int getItemid() {
		return itemid;
	}
	public void setItemid(int itemid) {
		this.itemid = itemid;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
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
	public Date getUpdated_dt() {
		return updated_dt;
	}
	public void setUpdated_dt(Date updated_dt) {
		this.updated_dt = updated_dt;
	}
	
	
}
