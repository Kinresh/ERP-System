package Model.Warehouse;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="delivaryorder_master")
public class delivaryorders_model{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int delivaryorder_id;
	private int salesorder_id;
	private int cusomer;
	private String customer_ref;
	private String order_dt;
	private String expected_dt;
	private double untaxted_amount;
	private double taxes;
	private double total;
	private int created_by;
	private int updated_by;
	private String status;
	private String code;
	private String description;
	private String invoicecontrol;
	private String paymentterm;
	private String activeflag;
	private String backorder;
	private String prefix;
	private Date creationdate;
	private String deliverymethod;
	private String autopicking;
	public int getDelivaryorder_id() {
		return delivaryorder_id;
	}
	public void setDelivaryorder_id(int delivaryorder_id) {
		this.delivaryorder_id = delivaryorder_id;
	}
	public int getSalesorder_id() {
		return salesorder_id;
	}
	public void setSalesorder_id(int salesorder_id) {
		this.salesorder_id = salesorder_id;
	}
	public int getCusomer() {
		return cusomer;
	}
	public void setCusomer(int cusomer) {
		this.cusomer = cusomer;
	}
	public String getCustomer_ref() {
		return customer_ref;
	}
	public void setCustomer_ref(String customer_ref) {
		this.customer_ref = customer_ref;
	}
	public String getOrder_dt() {
		return order_dt;
	}
	public void setOrder_dt(String order_dt) {
		this.order_dt = order_dt;
	}
	public String getExpected_dt() {
		return expected_dt;
	}
	public void setExpected_dt(String expected_dt) {
		this.expected_dt = expected_dt;
	}
	public double getUntaxted_amount() {
		return untaxted_amount;
	}
	public void setUntaxted_amount(double untaxted_amount) {
		this.untaxted_amount = untaxted_amount;
	}
	public double getTaxes() {
		return taxes;
	}
	public void setTaxes(double taxes) {
		this.taxes = taxes;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getInvoicecontrol() {
		return invoicecontrol;
	}
	public void setInvoicecontrol(String invoicecontrol) {
		this.invoicecontrol = invoicecontrol;
	}
	public String getPaymentterm() {
		return paymentterm;
	}
	public void setPaymentterm(String paymentterm) {
		this.paymentterm = paymentterm;
	}
	public String getActiveflag() {
		return activeflag;
	}
	public void setActiveflag(String activeflag) {
		this.activeflag = activeflag;
	}
	public String getBackorder() {
		return backorder;
	}
	public void setBackorder(String backorder) {
		this.backorder = backorder;
	}
	public String getPrefix() {
		return prefix;
	}
	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}
	public Date getCreationdate() {
		return creationdate;
	}
	public void setCreationdate(Date creationdate) {
		this.creationdate = creationdate;
	}
	public String getDeliverymethod() {
		return deliverymethod;
	}
	public void setDeliverymethod(String deliverymethod) {
		this.deliverymethod = deliverymethod;
	}
	public String getAutopicking() {
		return autopicking;
	}
	public void setAutopicking(String autopicking) {
		this.autopicking = autopicking;
	}
	
}
