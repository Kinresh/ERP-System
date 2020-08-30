package Model.SalesManagement;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="quatationsaledetail_master")
public class QuatationSaleDetail_model{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int detailsale_id;
	private int quotationsale_id;
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
	
	public int getDetailsale_id() {
		return detailsale_id;
	}
	public void setDetailsale_id(int detailsale_id) {
		this.detailsale_id = detailsale_id;
	}
	public int getQuotationsale_id() {
		return quotationsale_id;
	}
	public void setQuotationsale_id(int quotationsale_id) {
		this.quotationsale_id = quotationsale_id;
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
