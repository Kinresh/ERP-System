package Model.PurchaseManagement;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="purchaseorder_master")
public class PurchaseOrder_model{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int purchaseorder_id;
	private int quotation_id;
	public int getQuotation_id() {
		return quotation_id;
	}
	public void setQuotation_id(int quotation_id) {
		this.quotation_id = quotation_id;
	}
	private int supplier;
	private String supplier_ref;
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
	private Date creationdate;
	private String flag;
	
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public Date getCreationdate() {
		return creationdate;
	}
	public void setCreationdate(Date creationdate) {
		this.creationdate = creationdate;
	}
	private String invoicecontrol;
	private String paymentterm;
	private String activeflag;
	private String prefix;
	
	
	public String getPrefix() {
		return prefix;
	}
	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}
	public int getPurchaseorder_id() {
		return purchaseorder_id;
	}
	public void setPurchaseorder_id(int purchaseorder_id) {
		this.purchaseorder_id = purchaseorder_id;
	}
	public int getSupplier() {
		return supplier;
	}
	public void setSupplier(int supplier) {
		this.supplier = supplier;
	}
	public String getSupplier_ref() {
		return supplier_ref;
	}
	public void setSupplier_ref(String supplier_ref) {
		this.supplier_ref = supplier_ref;
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
	
}
