package Model.Warehouse;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="delivaryproducts_master")
public class delivaryproducts_model
{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int delivaryproduct_id;
	private int delivaryorder_id;
	private String status;
	private String sourcedocument;
	private int created_by;
	
	
	
	public int getDelivaryproduct_id() {
		return delivaryproduct_id;
	}
	public void setDelivaryproduct_id(int delivaryproduct_id) {
		this.delivaryproduct_id = delivaryproduct_id;
	}
	public int getDelivaryorder_id() {
		return delivaryorder_id;
	}
	public void setDelivaryorder_id(int delivaryorder_id) {
		this.delivaryorder_id = delivaryorder_id;
	}
	public int getCreated_by() {
		return created_by;
	}
	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSourcedocument() {
		return sourcedocument;
	}
	public void setSourcedocument(String sourcedocument) {
		this.sourcedocument = sourcedocument;
	}

	public int getProduct() {
		return product;
	}
	public void setProduct(int product) {
		this.product = product;
	}
	public int getItem() {
		return item;
	}
	public void setItem(int item) {
		this.item = item;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSchedule_dt() {
		return schedule_dt;
	}
	public void setSchedule_dt(String schedule_dt) {
		this.schedule_dt = schedule_dt;
	}
	public double getQuantity() {
		return quantity;
	}
	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}
	public double getUnit_price() {
		return unit_price;
	}
	public void setUnit_price(double unit_price) {
		this.unit_price = unit_price;
	}
	public double getTaxs() {
		return taxs;
	}
	public void setTaxs(double taxs) {
		this.taxs = taxs;
	}
	public int getItemsizeid() {
		return itemsizeid;
	}
	public void setItemsizeid(int itemsizeid) {
		this.itemsizeid = itemsizeid;
	}
	public double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}
	public String getActiveflag() {
		return activeflag;
	}
	public void setActiveflag(String activeflag) {
		this.activeflag = activeflag;
	}
	
	private int product;
	private int item;
	private String description;
	private String schedule_dt;
	private double quantity;
	private double unit_price;
	private double taxs;
	private int itemsizeid;
	private double subtotal;
	private String activeflag;
	private int updated_by;


	public int getUpdated_by() {
		return updated_by;
	}
	public void setUpdated_by(int updated_by) {
		this.updated_by = updated_by;
	}
	

}

	



