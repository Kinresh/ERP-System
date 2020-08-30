package Model.PurchaseManagement;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="quatationdetail_master")
public class QuatationDetail_model{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int detail_id;
	private int quotation_id;
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
	private int updatedby;
	
	public int getUpdatedby() {
		return updatedby;
	}
	public void setUpdatedby(int updatedby) {
		this.updatedby = updatedby;
	}
	public int getItemsizeid() {
		return itemsizeid;
	}
	public void setItemsizeid(int itemsizeid) {
		this.itemsizeid = itemsizeid;
	}
	public String getActiveflag() {
		return activeflag;
	}
	public void setActiveflag(String activeflag) {
		this.activeflag = activeflag;
	}
	public int getDetail_id() {
		return detail_id;
	}
	public void setDetail_id(int detail_id) {
		this.detail_id = detail_id;
	}
	public int getQuotation_id() {
		return quotation_id;
	}
	public void setQuotation_id(int quotation_id) {
		this.quotation_id = quotation_id;
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
	public double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}

}
