package hotel.model;

public class VeichleBooking {
	public int id;
	public String user;
	public String nic;
	public int mobile;
	public String email;
	public String checkin;
	public int km;
	public int cost;
	public VeichleBooking(int id, String user, String nic, int mobile, String email, String checkin, int km, int cost) {
		super();
		this.id = id;
		this.user = user;
		this.nic = nic;
		this.mobile = mobile;
		this.email = email;
		this.checkin = checkin;
		this.km = km;
		this.cost = cost;
	}
	public VeichleBooking(String user, String nic, int mobile, String email, String checkin, int km, int cost) {
		super();
		this.user = user;
		this.nic = nic;
		this.mobile = mobile;
		this.email = email;
		this.checkin = checkin;
		this.km = km;
		this.cost = cost;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getNic() {
		return nic;
	}
	public void setNic(String nic) {
		this.nic = nic;
	}
	public int getMobile() {
		return mobile;
	}
	public void setMobile(int mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public int getKm() {
		return km;
	}
	public void setKm(int km) {
		this.km = km;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	
	
	
}
