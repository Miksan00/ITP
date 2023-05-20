package hotel.model;

public class Rooms {
	public int id;
	public String roomtype;
	public int nobeds;
	public String selectedFacilitiesStr;
	public String selectedFoodsStr;
	public int cost;
	public String filename;
	public String path;
	public Rooms(int id, String roomtype, int nobeds, String selectedFacilitiesStr,String selectedFoodsStr, int cost, String filename, String path) {
		super();
		this.id = id;
		this.roomtype = roomtype;
		this.nobeds = nobeds;
		this.selectedFacilitiesStr = selectedFacilitiesStr;
		this.selectedFoodsStr = selectedFoodsStr;
		this.cost = cost;
		this.filename = filename;
		this.path = path;
	}
	public Rooms(String roomtype, int nobeds, String selectedFacilitiesStr,String selectedFoodsStr, int cost, String filename, String path) {
		super();
		this.roomtype = roomtype;
		this.nobeds = nobeds;
		this.selectedFacilitiesStr = selectedFacilitiesStr;
		this.selectedFoodsStr = selectedFoodsStr;
		this.cost = cost;
		this.filename = filename;
		this.path = path;
	}
	
	
	public Rooms(int id, String roomtype, int nobeds, String selectedFacilitiesStr,String selectedFoodsStr, int cost) {
		super();
		this.id = id;
		this.roomtype = roomtype;
		this.nobeds = nobeds;
		this.selectedFacilitiesStr = selectedFacilitiesStr;
		this.selectedFoodsStr = selectedFoodsStr;
		this.cost = cost;
		
	}
	public Rooms(int id, String roomtype, int nobeds, String selectedFacilitiesStr,String selectedFoodsStr, int cost, String filename) {
		super();
		this.id = id;
		this.roomtype = roomtype;
		this.nobeds = nobeds;
		this.selectedFacilitiesStr = selectedFacilitiesStr;
		this.selectedFoodsStr = selectedFoodsStr;
		this.cost = cost;
		this.filename = filename;
	}
	public Rooms(String roomtype, int nobeds, String selectedFacilitiesStr,String selectedFoodsStr, int cost, String filename) {
		super();
		this.roomtype = roomtype;
		this.nobeds = nobeds;
		this.selectedFacilitiesStr = selectedFacilitiesStr;
		this.selectedFoodsStr = selectedFoodsStr;
		this.cost = cost;
		this.filename = filename;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRoomtype() {
		return roomtype;
	}
	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype;
	}
	public int getNobeds() {
		return nobeds;
	}
	public void setNobeds(int nobeds) {
		this.nobeds = nobeds;
	}
	public String getFacilities() {
		return selectedFacilitiesStr;
	}
	public void setFacilities(String selectedFacilitiesStr) {
		this.selectedFacilitiesStr = selectedFacilitiesStr;
	}
	public String getFoods() {
		return selectedFoodsStr;
	}
	public void setFoods(String selectedFoodsStr) {
		this.selectedFoodsStr = selectedFoodsStr;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
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

}
