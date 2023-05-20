package hotel.model;

public class Transport {
	public int id;
	public String name;
	public String facilities;
	public int cost;
	public String type;

	public String filename;
	public String path;
	
	

	public Transport(int id, String name, String facilities, int cost, String type) {
		super();
		this.id = id;
		this.name = name;
		this.facilities = facilities;
		this.cost = cost;
		this.type = type;
	}

	public Transport(String name, String facilities, int cost, String type, String filename, String path) {
		super();
		this.name = name;
		this.facilities = facilities;
		this.cost = cost;
		this.type = type;
		this.filename = filename;
		this.path = path;
	}

	public Transport(int id, String name, String facilities, int cost, String type, String filename, String path) {
		super();
		this.id = id;
		this.name = name;
		this.facilities = facilities;
		this.cost = cost;
		this.type = type;
		this.filename = filename;
		this.path = path;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFacilities() {
		return facilities;
	}

	public void setFacilities(String facilities) {
		this.facilities = facilities;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
