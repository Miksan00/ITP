package hotel.model;

public class Inventory {
	protected int id;
	protected String inventoryname;
	protected String suppliername;
	protected int supllierid;
	protected String supplierdate;
	protected int quantity;
	protected int price;
	public String filename;
	public String path;
	public int total;

	public Inventory(String inventoryname, String suppliername, int supllierid, String supplierdate, int quantity,
			int price, String filename, String path,int total) {
		super();
		this.inventoryname = inventoryname;
		this.suppliername = suppliername;
		this.supllierid = supllierid;
		this.supplierdate = supplierdate;
		this.quantity = quantity;
		this.price = price;
		this.filename = filename;
		this.path = path;
		this.total =total;
	}

	public Inventory(int id, String inventoryname, String suppliername, int supllierid, String supplierdate,
			int quantity, int price,int total) {
		super();
		this.id = id;
		this.inventoryname = inventoryname;
		this.suppliername = suppliername;
		this.supllierid = supllierid;
		this.supplierdate = supplierdate;
		this.quantity = quantity;
		this.price = price;
		this.total =total;
	}

	public Inventory(int id, String inventoryname, String suppliername, int supllierid, String supplierdate,
			int quantity, int price, String filename, String path ,int total) {
		super();
		this.id = id;
		this.inventoryname = inventoryname;
		this.suppliername = suppliername;
		this.supllierid = supllierid;
		this.supplierdate = supplierdate;
		this.quantity = quantity;
		this.price = price;
		this.filename = filename;
		this.path = path;
		this.total =total;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getInventoryname() {
		return inventoryname;
	}

	public void setInventoryname(String inventoryname) {
		this.inventoryname = inventoryname;
	}

	public String getSuppliername() {
		return suppliername;
	}

	public void setSuppliername(String suppliername) {
		this.suppliername = suppliername;
	}

	public int getSupllierid() {
		return supllierid;
	}

	public void setSupllierid(int supllierid) {
		this.supllierid = supllierid;
	}

	public String getSupplierdate() {
		return supplierdate;
	}

	public void setSupplierdate(String supplierdate) {
		this.supplierdate = supplierdate;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

}
