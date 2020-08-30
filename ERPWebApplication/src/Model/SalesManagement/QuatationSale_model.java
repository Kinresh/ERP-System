package Model.SalesManagement;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="quatationsale_master")
public class QuatationSale_model{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int quotationsale_id;
	private int customer;
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
	private String shippingmethod;
	private int responsible;
	private String paymentterm;
	private String createinvoice;
	private String activeflag;
	private String t_c;
	private String prefix;
	
	public String getT_c() {
		return t_c;
	}
	public void setT_c(String t_c) {
		this.t_c = t_c;
	}
	public String getPrefix() {
		return prefix;
	}
	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}
	public String getActiveflag() {
		return activeflag;
	}
	public void setActiveflag(String activeflag) {
		this.activeflag = activeflag;
	}
	public String getPaymentterm() {
		return paymentterm;
	}
	
	public String getCreateinvoice() {
		return createinvoice;
	}
	public void setCreateinvoice(String createinvoice) {
		this.createinvoice = createinvoice;
	}
	public void setPaymentterm(String paymentterm) {
		this.paymentterm = paymentterm;
	}
	
	public String getShippingmethod() {
		return shippingmethod;
	}
	public void setShippingmethod(String shippingmethod) {
		this.shippingmethod = shippingmethod;
	}
	public int getResponsible() {
		return responsible;
	}
	public void setResponsible(int responsible) {
		this.responsible = responsible;
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
	
	public int getQuotationsale_id() {
		return quotationsale_id;
	}
	public void setQuotationsale_id(int quotationsale_id) {
		this.quotationsale_id = quotationsale_id;
	}
	
	public int getCustomer() {
		return customer;
	}
	public void setCustomer(int customer) {
		this.customer = customer;
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

}
